The Convolutional Neural Network (CNN) designed for this project consists of two main layers, each performing feature extraction and down sampling:<br />
(1)Layer 1: <br />
Convolutional Layer: Applies 10 filters of size 5×5 to extract low-level features. <br />
Max Pooling: A 2×2 pooling operation reduces spatial dimensions, preserving important features. <br />
Activation: ReLU is applied to introduce non-linearity. <br />
(2)Layer 2:<br />
Convolutional Layer: Applies 5 filters of size 3×3 for deeper feature extraction.<br />
Max Pooling: Again, 2×2 pooling reduces dimensionality.<br />
Activation: ReLU is used to maintain non-linearity.<br />
(3)Output Layer:<br />
The resulting feature maps are flattened into a vector.<br />
A Sigmoid activation function is applied to generate the final output.<br />
![image](https://github.com/user-attachments/assets/445fa9a8-1ce3-455a-a141-4175336c4071)
