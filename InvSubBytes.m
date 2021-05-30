function [res] = InvSubBytes(state)
    I = load('inverseSBox.mat');
    res = zeros(size(state));
    
    if numel(res) == 16
        for i = 1:4
            for j = 1:4
                res(i,j) = I.inverseSBox(state(i,j) + 1);
            end
        end
    else
        for k = 1:4
            res(k,:) = S.inverseSBox(state(k,:) + 1);
        end
    end
end