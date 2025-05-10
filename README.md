The Convolutional Neural Network (CNN) designed for this project consists of two main layers, each performing feature extraction and down sampling:
Layer 1:
Convolutional Layer: Applies 10 filters of size 5×5 to extract low-level features.
Max Pooling: A 2×2 pooling operation reduces spatial dimensions, preserving important features.
Activation: ReLU is applied to introduce non-linearity.
Layer 2:
Convolutional Layer: Applies 5 filters of size 3×3 for deeper feature extraction.
Max Pooling: Again, 2×2 pooling reduces dimensionality.
Activation: ReLU is used to maintain non-linearity.
Output Layer:
The resulting feature maps are flattened into a vector.
A Sigmoid activation function is applied to generate the final output.
![image](https://github.com/user-attachments/assets/445fa9a8-1ce3-455a-a141-4175336c4071)
