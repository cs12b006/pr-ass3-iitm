% each row in data corresponds to an image
% @k number of clusters k=3 for data1
function [] = Gmm(k,data)
    % choose k random datapts as class means
    nrows = size(data,1);
    ncols = size(data,2);
    n = nrows;
    m = ncols;
    temp = randperm(n);
    indexes = temp(1:k);
    %initializing k-means k-cov k-params vals
    mus = [];
    for i = 1:k
        mus{i} = data(indexes(i),:);
    end
    
    
    SIGMA = cov(data);
    disp(SIGMA);
    sigmas = [];
    for i= 1:k
        sigmas{i} = SIGMA;
    end
    pis = 1/k*ones(1,k);
    % repeat till convergence
    for numIter = 1:2    % repeat till convergence
        %%%%%%%%%%% E step %%%%%%%%%%%%
        % calc responsibility values
        resp = ones(n,k);
        dens = zeros(n,1);
        for i = 1:n
            for j=1:k
               dens(i) = dens(i)+ pis(j)*mvnGaussian(data(i,:),mus{j},sigmas{j}); 
               disp(data(1,:));
               disp(mus{j});
               disp(sigmas{j});
               disp(dens(i));
               disp(pis(j));
               disp(mvnGaussian(data(i,:),mus{j},sigmas{j}));
            end
        end

        for i=1:n
            for j = 1:k
               contri = pis(j)*mvnGaussian(data(i,:),mus{j},sigmas{j});
               resp(i,j) =  contri/dens(i);
            end
        end

        %%%%%%%%% M-step %%%%%%%%%%%%%

        % re-estimate mus and sigma and pis

        for i = 1:k
           % n_ks
           nk = sum(resp,2);
           %mus
           new_mu =zeros(1,m);
           for j=1:n
                new_mu = new_mu + resp(j,i)*data(j,:);
           end
           mus{i} = new_mu/nk(i);
           %sigma
           new_sigma = zeros(m,m);
           for j = 1:n
               temp = data(j,:)-mus{i};
               new_sigma = new_sigma + resp(j,i)*(temp')*(temp);
           end
           sigmas{i} = 1/nk(i)*new_sigma;
           %pis
           pis(i) = nk(i)/n;
        end
    end


 end