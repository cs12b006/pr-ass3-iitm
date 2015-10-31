function [mans] = getData()
    mbas = '../mountain/';
    is = '../insidecity/';
    ext = '*.jpg_color_edh_entropy';

    fspec = '%f';
    
    s = strcat(mbas,ext);
    fmaes = dir(s);
    numfids = length(fmaes);
    mans = zeros(numfids, 828);
    for k=1:numfids
        t = strcat(mbas,fmaes(k).name);
        fileId = fopen(t,'r');
        tul = fscanf(fileId, fspec);
        mans(k,:) = tul.';
    end
end