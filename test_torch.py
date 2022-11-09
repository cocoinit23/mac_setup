import shutil

import torch
from torchvision import datasets, transforms

epochs = 5
image_size = 28 * 28

device = 'mps'

transform = transforms.Compose([
    transforms.ToTensor()
])

train_dataset = datasets.MNIST(
    'temp',
    train=True,
    download=True,
    transform=transform
)

test_dataset = datasets.MNIST(
    'temp',
    train=False,
    transform=transform
)

train_dataloader = torch.utils.data.DataLoader(
    train_dataset,
    batch_size=128,
    shuffle=True)

test_dataloader = torch.utils.data.DataLoader(
    test_dataset,
    batch_size=128,
    shuffle=True)


class Net(torch.nn.Module):
    def __init__(self, input_size, output_size):
        super(Net, self).__init__()
        self.fc1 = torch.nn.Linear(input_size, 128)
        self.fc2 = torch.nn.Linear(128, output_size)

    def forward(self, x):
        x = self.fc1(x)
        x = torch.relu(x)
        x = self.fc2(x)
        return torch.nn.functional.log_softmax(x, dim=1)


model = Net(image_size, 10).to(device)

criterion = torch.nn.CrossEntropyLoss()
optimizer = torch.optim.Adam(model.parameters(), lr=0.001)

model.train()

for epoch in range(epochs):
    loss_sum = 0

    for inputs, labels in train_dataloader:
        inputs = inputs.to(device)
        labels = labels.to(device)

        optimizer.zero_grad()

        inputs = inputs.view(-1, image_size)
        outputs = model(inputs)

        loss = criterion(outputs, labels)
        loss_sum += loss

        loss.backward()

        optimizer.step()

    print(f"Epoch: {epoch + 1}/{epochs}, Loss: {loss_sum.item() / len(train_dataloader)}")

model.eval()

loss_sum = 0
correct = 0

with torch.no_grad():
    for inputs, labels in test_dataloader:
        inputs = inputs.to(device)
        labels = labels.to(device)

        inputs = inputs.view(-1, image_size)
        outputs = model(inputs)

        loss_sum += criterion(outputs, labels)

        pred = outputs.argmax(1)
        correct += pred.eq(labels.view_as(pred)).sum().item()

print(f"Loss: {loss_sum.item() / len(test_dataloader)}")
print(f"Accuracy: {100 * correct / len(test_dataset)}%")

shutil.rmtree("temp")
