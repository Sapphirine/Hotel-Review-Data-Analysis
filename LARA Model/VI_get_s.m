function [ s,r ] = VI_get_s( f,beta )
    %f = csvread('C:\Users\joy28\Documents\Fall 2017 Study\Big Data Analysics\Project\M_LARA\LARA Model\TryData\f_set2_10e5.csv');
    %r = csvread('C:\Users\joy28\Documents\BDA\Hotel\r.csv');
    [k,n] = size(f); %k=5
    const=350;
    
    for i=1:k
        s(i)=f(i,:)*beta;
    end
    %predicted average rating
    s=const*s;
    %predicted average rating with equal weight
    r=sum(s)/k;
    
% def get_cri():
	% if (len(aspectV)==1:
		% return LRR.K
	% else:
		% return len(aspectV)
	
	
% def set_ct( i,  features):
	% aspectV[i] = new SpaVector(features)
	
	
% def normalize():
	% norm = getDocLength(), aSize
	% rand =  Random()
	% for i in len(aspectV):
		% SpaVector vct = aspectV[i]
		% aSize = vct.L1Norm()
		% vct.normalize(aSize)
		% alpha_hat[i] = rand.nextDouble() + Math.log(aSize / norm)
end
