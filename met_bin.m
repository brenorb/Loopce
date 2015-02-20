clear all
%n de bits aproveitáveis
n=8;
%offset
offset=6;

filename = 'C:\Users\Breno\Dropbox\MATLAB\Temp\testImage.bmp';

fid = fopen(filename);

k = 0;
while ~feof(fid)
    curr = fscanf(fid,'%c',1);
    if ~isempty(curr)
       k = k+1;
       benchstr(k) = curr;
    end
end
    
fclose(fid);


resp = uint8(benchstr);
lsb_resp = mod(resp,2);
ind = find(lsb_resp);
frase = '';

for i = 1+offset:n:length(lsb_resp)-n-offset
    letrabin = '';
    for k = 1:n
        bit = lsb_resp(i+k-1);
        letrabit = strtrim(num2str(bit));
        letrabin = [letrabit,letrabin];
    end
%     letrabin = ['01',letrabin];
    letrachar = char(bin2dec(letrabin));
    frase = [frase, letrachar];
end
frase
%%%%%%%%%

