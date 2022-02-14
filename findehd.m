%Function to get EHD vector
function ehd = findehd(img)
[r, c, m] = size(img);
if m==3
    img = rgb2gray(img); %Convert image to grayscale if RGB
end

M=4*ceil(r/4); N=4*ceil(c/4);
img=imresize(img, [M,N]); %Making image dim. divisible completely by 4
AllBins = zeros(17,5); %Initializing bins

p=1;
L=0;

for i=1:4
    K=0;
    for j=1:4
        block=img(K+1:K+(M/4), L+1:L+(N/4)); %Extracting (M/4, N/4) block
        AllBins(p, :) = getbins(double(block));
        K=K+(M/4);
        p=p+1;
    end
    L=L+(N/4);
end
GlobalBin=mean(AllBins); %Getting global bin
AllBins(17, :)=round(GlobalBin);
ehd=reshape(AllBins', [1,85]);
