function [state] = DecryptAES(state, key)
    %get every key for each round
    keyRnd = KeySchedule(state, key);
    %initial round
    state = bitxor(state, cell2mat(keyRnd(:,11)));
    %next 10 round
    for round = 10:-1:1
        %inverse shift rows
        state = InvShiftRows(state);
        
        %inverse byte substitution
        state = InvSubBytes(state);
        
        %bitxor with corresponding key
        state = bitxor(state, cell2mat(keyRnd(:,round))); 
        
        %inverse mix columns
        if (round ~= 1)
            state = InvMixColumns(state);
        end    
    end
end