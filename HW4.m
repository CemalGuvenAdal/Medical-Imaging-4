% b--------------
P=load("brainT2_mri.mat");
im1=P.image1;
im2=P.image2;
im1noisy=P.image1_noisy;
im2noisy=P.image2_noisy;
TE1=P.TE(1);
TE2=P.TE(2);
res1=T2(TE2,TE1,im1,im2);
imshow(abs(res1),[0 350])
title('T2 Map for not noisy Images')
figure;

res2=T2(TE2,TE1,im1noisy,im2noisy);
imshow(abs(res2),[0 350])
title('T2 Map for noisy images')
figure;

% c--------------
imshow(res1,[0 350])
mask = roiellipse; % type "help roiellipse" to see how to use it
T2_est = mean(res1(mask))
figure;
%D-----------Noisy
imshow(res2,[0 350])
mask = roiellipse; % type "help roiellipse" to see how to use it
T2_est = mean(res2(mask))
figure;
%e-------------------
%not noisy
imshow(res1,[0 350])
mask = roiellipse; % type "help roiellipse" to see how to use it
T2_est = mean(res1(mask))
figure;
%noisy
imshow(res2,[0 350])
mask = roiellipse; % type "help roiellipse" to see how to use it
T2_est = mean(res2(mask))
figure;
%f------------------------------
%not noisy
imshow(res1,[0 350])
mask = roiellipse; % type "help roiellipse" to see how to use it
T2_est = mean(res1(mask))
figure;
%noisy
imshow(res2,[0 350])
mask = roiellipse; % type "help roiellipse" to see how to use it
T2_est = mean(res2(mask))
figure;

function C=T2(TE2,TE1,ima1,ima2)
C=(TE2-TE1)./(log(ima1./ima2));

end
