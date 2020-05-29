clear
clc
im=imread('C:\Users\Alkesh Thakur\Desktop\EntryNumber_2017EE30526\Archive2\image(20).tif');
bw_mask=imread('Retina_drive_1_mask.gif');
bw_mask=logical(bw_mask);

im=im(:,:,2);
im=mat2gray(im).*mat2gray(bw_mask);
im=imcomplement(im);
im=im2double(im);

DEG_NUM=12;
LEN_c=11;
LEN_o=11;
LEN_diff=7;

ic1=reconstruction_by_dilation(im,LEN_c,DEG_NUM);
io1=min_openings(im,LEN_o,DEG_NUM);
iv=mat2gray(ic1-io1);
imDiff=smooth_cross_section(iv,LEN_diff,LEN_c);
imL=reconstruction_by_dilation(imDiff,LEN_c,DEG_NUM);
imF=reconstruction_by_erosion(imL,LEN_c,DEG_NUM);

figure,imshow(imF);title('imF');

TH_LOW=30;
TH_HIGH=40;
min_obj=180;
min_hole=10;

mask=im2bw(imF,TH_LOW/255);
marker=im2bw(imF,TH_HIGH/255);
bw_result=imreconstruct(marker,mask);

bw_result=bw_result& bw_mask;
bw_result = clear_bw(bw_result, min_obj, min_hole);

figure,imshow(bw_result);title('result');
