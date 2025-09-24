The Convolutional Neural Network (CNN) designed for this project consists of two main layers, each performing feature extraction and down sampling:<br />
(1)Layer 1: <br />
Convolutional Layer: Applies 10 filters of size 5×5 to extract low-level features. <br />
Max Pooling: A 2×2 pooling operation reduces spatial dimensions, preserving important features. <br />
Activation: ReLU is applied to introduce non-linearity. <br />
(2)Layer 2:<br />
Convolutional Layer: Applies 5 filters of size 3×3 for deeper feature extraction.<br />
Max Pooling: Again, 2×2 pooling reduces dimensionality.<br />
Activation: ReLU is used to maintain non-linearity.<br />

 Verified the output using MATLAB

 
 
 - Input is fed directly through a .txt file. 
 - Input can also be fed sequentially to an array. That was implemented initially. That part of FSM is commented in conv_unroll and conv1.

__Layer 1 before applying ReLu__

<img width="1049" height="593" alt="Layer 1 before applying ReLu" src="https://github.com/user-attachments/assets/1069aeb3-6797-4a26-9379-e14ab5447d4f" />


__MATLAB output of Layer 1__

<img width="804" height="587" alt="Layer 1 MATLAB ouput" src="https://github.com/user-attachments/assets/86372eea-64c7-49a7-bada-e20034c9ea86" />


__Layer 1 after applying ReLu__

<img width="933" height="518" alt="Layer 1 after applying ReLu" src="https://github.com/user-attachments/assets/8742e8f3-4ad9-4b02-936f-eac921dc91dc" />


__Layer 2(Final output)__

<img width="1911" height="959" alt="image" src="https://github.com/user-attachments/assets/8df9ffbf-f4cd-4a2e-b38e-a2fa1e86839e" />


- Obtained output can be falttened and pass them through fully conncted layer and through a activation function like sigmoid to classify the input.
- Sigmoid implementation was done, but it worked only for very short range of inputs.
- Thus part can be added later.


__Post-Synthesis Functional Simulation__

<img width="1918" height="866" alt="image" src="https://github.com/user-attachments/assets/42ee164e-c790-4e36-bf4b-28f9a8d0a2c9" />

