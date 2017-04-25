Fs = 12000;
fp = 450;

M1 = [12];
M2 = [6, 2];
M3 = [4, 3];
M4 = [3, 2, 2];

C = {M1, M2, M3, M4};


for i=1:length(C)
    M = C{i};
    N = 0;
    MPS = 0;
    blockFs = Fs;
    for j=1:length(M)
        blockN = ceil(3.3/ ( (1/(2*M(j))) - (fp/Fs) ));
        MPS = MPS + blockN*blockFs;
        N = N + blockN;
        blockFs = blockFs/M(j);
    end
    disp('-------------------------------');
    disp(['Kertoimia vaiheille ' num2str(M) ': ' num2str(N)]);
    disp(['MPS: ' num2str(MPS)]);
end


