% 6x6 Input Matrix

input =[
     1   2   3   4   5   6   7   8   9  10  11  12  13  14  15  16;
    17  18  19  20  21  22  23  24  25  26  27  28  29  30  31   7;
    33  34  35  36  37  38  39  40  41  42  43  44  45  46  47  48;
    49  50  -1  -2  -3  -4  -5  -6  -7  -8  -9 -10 -11 -12 -13 -14;
   -15 -16 -17 -18 -19 -20 -21 -22 -23 -24 -25 -26 -27 -28 -29 -30;
   -31  -32   0  -34  -35  -36  -37  -38  -39  -40  -41  -42  -43  -44  -45  -46;
   -47  -48  -49  -50   51   32   53   54   55   56   57   58   59   60   61   62;
    63   64   65   66    8    5   69   70   71   72   73   74   75   76   77   78;
    79   80   81    9   83   84   85   86   87   88   89   90   91   92    8   94;
    95   96   97   98   99  100    1    2    3    4    5    6    7    8    9   10;
    11    6   13   14   15   16   17   18   19   20   21   22    7   24   25   26;
    27   28   29   30   31   32   33   34   35   36   37   38   39   40   41   42;
    43   44   45   46   47   48   49   50   -1   -2   -3   -4   -5   -6   -7   -8;
    -9  -10  -11  -12  -13  -14  -15  -16  -17  -18  -19  -20  -21  -22  -23  -24;
   -25  -26  -27  -28  -29  -30  -31  -32  -33  -34  -35  -36  -37  -38  -39  -40;
   -41  -42  -43  -44  -45  -46  -47  -48  -49  -50    1    2    3    4    5    6
];


% 3x3 filter
filter = [
   -2  0  1 -1 1;
    0 1 -2 1 -1 ;
    -1 2 0 -1 -1;
    0 -3 1 1 -1;
    1 0 -1 2 1 
];

% Flip the filter for true convolution
filter_flipped = rot90(filter, 2); % 180-degree rotation

% Perform 2D convolution (valid mode)
conv_result = conv2(input, filter_flipped, 'valid'); % Output is 4x4

% 2x2 max pooling (non-overlapping)
pooled_result = zeros(6,6); % since 4/2 = 2

for i = 1:6
    for j = 1:6
        row_start = 2*i - 1;
        col_start = 2*j - 1;
        block = conv_result(row_start:row_start+1, col_start:col_start+1);
        pooled_result(i,j) = max(block(:));
    end
end

% Display results
%disp('Convolution Output (5x5):');
%disp(conv_result);

disp('Max-Pooled Output (2x2):');
disp(pooled_result);
