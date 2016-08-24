# vigenere
Attacking vigenere cipher using index of conincidence

The programs are tested in Octave 3.8.1

Example:

```
% Assume ciphertext.txt is a cipher enciphered using a Vigenre cipher. Load the ciphertext.
octave> ciphertext = readline('ciphertext.txt');
octave> computeletterfreq(ciphertext);

% Find common substrings from the ciphertext and determine their gaps
octave> [idx1st, idx2nd, lensubstr, gaps] = findcommonsubstrings(ciphertext, 'v');

% If you ciphertext is very long, you speed it up using a subset of it. The following is to use 
% the 1st 1000 characters in the ciphertext to speed up
octave> [idx1st, idx2nd, lensubstr, gaps] = findcommonsubstrings(ciphertext(1:1000), 'v');

% If you ciphertext is long, you display a subset of common substring information. For instance, 
% the following finds many common substring that has length greater than 3. Yours may vary
octave> gaps(lensubstr > 3)

% Provided that the output of the above is as follows, 
%
% ans =
% 30   72
%
% Exmine all gaps and factors of the gaps, we guess the period of the cipher to be 6

% To confirm the guess, we compute the index of coincidence of the cipher
octave> computeic(ciphertext)

% Provided that the answer is
% ans= 0.043292
%
% Based on the the index of coincidence, we become more confident that the period is 6, 
% we can try to confirm it by checking on each alphabet's index of coincidences, such as,

octave> computeic(ciphertext(1:6:end))
octave> computeic(ciphertext(2:6:end))
octave> computeic(ciphertext(3:6:end))
octave> computeic(ciphertext(4:6:end))
octave> computeic(ciphertext(5:6:end))
octave> computeic(ciphertext(5:6:end))

% Since most of the above indices of conincidences agree with period 6, we can now start 
% guess key

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



