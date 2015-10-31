function getData()
    imagedirs = ['../mountain/  ';'../insidecity/';'../highway/   '];
    ext = '*.jpg_color_edh_entropy';
    fspec = '%f';
    
    for i=1:3
        s = strcat(imagedirs(i,:),ext);
        fmaes = dir(s);
        numfids = length(fmaes);
        mans = zeros( 828 , numfids);
        genin = int16(0.7*numfids);
        for k=1:numfids
            t = strcat(imagedirs(i,:),fmaes(k).name);
            fileId = fopen(t,'r');
            mans(:,k) = fscanf(fileId, fspec);
        end
        if i == 1
            moun_train(:,:) = mans(:,1:genin);
            moun_test(:,:) = mans(:,genin+1:numfids);
        elseif i == 2
            insci_train(:,:) = mans(:,1:genin);
            insci_test(:,:) = mans(:,genin+1:numfids);
        elseif i == 3
            high_train(:,:) = mans(:,1:genin);
            high_test(:,:) = mans(:,genin+1:numfids);
        end
    end
    test = horzcat(moun_test, insci_test ,high_test);
    save('dataset1.mat','moun_train','insci_train','high_train','test');
end