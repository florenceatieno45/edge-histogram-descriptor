[filename, pathname]=uigetfile('*.*', 'Select your input image');
filewithpath=strcat(pathname, filename);
img1=imread(filewithpath);

[filename2, pathname2]=uigetfile('*.*', 'Select your input image');
filewithpath2=strcat(pathname2, filename2);
img2=imread(filewithpath2);

ehd1 = findehd(img1); %Finding EHD1
ehd2 = findehd(img2); %Finding EHD2

figure(1)

subplot(221); imshow(img1); title('image1')
subplot(222); bar(ehd1(81:85)); title('Global bin of image1')
subplot(223); imshow(img2); title('image2')
subplot(224); bar(ehd2(81:85)); title('Global bin of image2')

figure(2)
plot(ehd1); hold on; plot(ehd2); title('Comparing EHD1 and EHD2')
legend('EHD1', 'EHD2'); %plotting EHD

%L2 distance between EHD1 and EHD2
D2=sqrt(sum((ehd1-ehd2).^2)); %norm(ehd1-ehd2),1);
disp(strcat('L2 Distance=',num2str(D2)))

%L1 distance between EHD1 and EHD2
D1=sum(abs(ehd1-ehd2)); %norm(ehd1-ehd2),1);
disp(strcat('L1 Distance=',num2str(D1)))
