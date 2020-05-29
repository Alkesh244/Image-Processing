function imC2=reconstruction_by_dilation(im,LEN,DEG_NUM)

if nargin<3 || isempty(LEN)
    LEN=11;
end
if nargin<3 || isempty(DEG_NUM)
    DEG_NUM=12;
end

imo=cell(DEG_NUM,1);
for i=1:DEG_NUM
    DEG=(i-1)*((360/DEG_NUM)/2);
    se=strel('line',LEN,DEG);
    imo{i}=imopen(im,se);
end

imC=imo{1};
for i=2:length(imo)
    imC=max(imC,imo{i});
end

imC2=imreconstruct(imC,im); 
imC2=mat2gray(imC2);