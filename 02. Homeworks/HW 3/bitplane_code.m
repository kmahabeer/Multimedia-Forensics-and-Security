function [pl1 pl2 pl3 pl4 pl5 pl6 pl7 pl8]=bitplane_code(img)

[row col]=size(img);
b=zeros(row,col,8);

for k=1:8
    for i=1:row
        for j=1:col
            b(i,j,k)=bitget(img(i,j),k);
        end
    end
end
pl1=b(:,:,1);
pl2=b(:,:,2);
pl3=b(:,:,3);
pl4=b(:,:,4);
pl5=b(:,:,5);
pl6=b(:,:,6);
pl7=b(:,:,7);
pl8=b(:,:,8);
end