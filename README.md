# vigenere
Attacking vigenere cipher using index of conincidence

The programs are tested in Octave 3.8.1

Example:

```
% Assume cipherex.txt is a cipher enciphered using Vigenre cipher
octave> ciphertext= readline('cipherex.txt');
octave> computeletterfreq(ciphertext);

% Use 1st 1000 characters in the ciphertext to speed up
octave> [idx1st, idx2nd, lensubstr, gaps] = findcommonsubstrings(ciphertext(1:1000), 'v');

% Found many common substring that has length greater than 6. Yours may vary
octave> gaps(lensubstr > 6)

% Provided that the output of the above is as follows, 
%
% ans =
% 216 48 78 138 60 12
%
% Since 6 is longer enough and the greatest common divisor among the above is 6
% we guess the period of the cipher is 6

% To confirm the guess, we compute the index of coincidence of the cipher
octave> computeic(ciphertext)

% Provided that the answer is
% ans= 0.041854
%
% We become more confident that the period is 6, then we start guess key

octave> guesskey(ciphertext(1:6:end), 'v');
octave> guesskey(ciphertext(2:6:end), 'v');
octave> guesskey(ciphertext(3:6:end), 'v');
octave> guesskey(ciphertext(4:6:end), 'v');
octave> guesskey(ciphertext(5:6:end), 'v');
octave> guesskey(ciphertext(6:6:end), 'v');

% The above outputs the correlation coefficients between the 1-gram frequencies of 
% the "plaintext" deciphered using each letter as key and the 1-gram frequencies
% of English. The correct guess likely yields high correlations.
%
% Provided the above guess yields the key as "ASIMOV", we then use it to decipher
% the cipher and see if the plaintext is intelligible. 

octave> char(vigenere(ciphertext, 'ASIMOV', 'd'))
```



