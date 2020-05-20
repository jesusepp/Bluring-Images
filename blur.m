function output = blur(img,w)
%  BLUR returns a blured version of an input imagen.
%
%	C = BLUR(img,w) returns a matrix that contains a blured version
%	of img, depending on the value of w, that represents the level of blur
%	to be applyed (1 being the lowes).
%
%   C = BLUR(img) returns a matrix that contains a blured version
%	of img, with a default value of 1 for w.

%% If the user only wants a smooth blur, it can be done by only inputing the image
if nargin == 1
    w = 1;
end
%% Prints the current picture
close all
output = img;
image(img)
axis off
%% Starts the process for creating a second matrix
[rows,columns,heigth] = size(img);
tic
for k = 1:heigth
    for i = 1:columns
        for j = 1:rows
            r1 = j-w;
            r2 = j+w;
            c1 = i-w;
            c2 = i+w;
            % Verification process for cells close to the borders
            if i-w < 1
                c1 = 1;
            end
            if j-w < 1
                r1 = 1;
            end
            if i+w > columns
                c2 = columns;
            end
            if j+w > rows
                r2 = rows;
            end
            % Definition of the the elements based of the mean of the previous ones
            summa = img(r1:r2,c1:c2,k);
            [rows2, columns2] = size(summa);
            result = rows2*columns2;
            prom = sum(sum(sum(summa)))/result;
            output(j,i,k) = uint8(prom);
        end
    end
end
toc
%% Prints the new picture
figure
image(output)
axis off
%% Saving the blured image as a new image
% Uncomment if you want to save the blured image
% file_name = 'test_blured.jpg';
% imwrite(output,file_name)
