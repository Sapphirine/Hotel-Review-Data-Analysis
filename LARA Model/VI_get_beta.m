function [ beta ] = VI_get_beta( X,Y )
    [n,d] = size(X);
    %Step1: Set initial parameters
    e=n/2+1;
    a=1/2+10^(-16);
    var =eye(d);  
    u=randn(d,1);

    %Step2: for iteration  t=1,..., T
    b=zeros(1,d);
    Ea=zeros(1,d);
    L=zeros(1,500);
    lnb=zeros(1,d);

    % pre_calculate for data 
    E1=zeros(d,d);
    E11=zeros(d,d);
    E2=zeros(n,d);
    E3=zeros(n,1);
    for i=1:n
            E11=transpose(X(i,:))*X(i,:); % for var(xixi^T)
            E1=E1+E11; % for sum var(xixi^T)
            E2(i,:)=Y(i)*X(i,:); %for u(yixi)
    end
    E2=sum(E2);

    for t=1:500
        % precalculate_2 for data
        for i=1:n
            E3(i)=(Y(i)-X(i,:)*u)^2+X(i,:)*var*transpose(X(i,:)); %for E[(yi-xi^T ω)^2]
        end 
        E3=sum(E3);

        % -Update q(λ)
        f=1/2*E3+1;
        En=e/f;

        % -Update q(beta), for iteration k=1,�?d
        for k=1:d
            b(k)=(u(k)*u(k)+var(k,k))/2+1e-10;
            Ea(k)=a/b(k);
            lnb(k)=log(b(k));
        end
        % Update q(ω)
        var=inv(diag(Ea)+En*E1);
        u=En*var*transpose(E2);

        % Calculate beta  
%         E4=prod(diag(chol(var)));
%         L(t)=log(E4)-e*log(f)-a*sum(lnb);
    end
    
    % Calculate beta 
    beta= u; 

end

