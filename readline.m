%% Copyright (C) 2014 Hui Chen
%% 
%% This program is free software; you can redistribute it and/or modify it
%% under the terms of the GNU General Public License as published by
%% the Free Software Foundation; either version 3 of the License, or
%% (at your option) any later version.
%% 
%% This program is distributed in the hope that it will be useful,
%% but WITHOUT ANY WARRANTY; without even the implied warranty of
%% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%% GNU General Public License for more details.
%% 
%% You should have received a copy of the GNU General Public License
%% along with this program.  If not, see <http://www.gnu.org/licenses/>.

%% -*- texinfo -*- 
%% @deftypefn {Function File} {@var{retval} =} readline (@var{filename})
%%
%% read a from the given file in @var{filename}
%%
%% @seealso{}
%% @end deftypefn

%% Author: Hui Chen <huichen (AT) ieee (DOT) org>
%% Created: 2014-10-13

function [retval] = readline (filename)
    fid = fopen(filename, 'r');
    if fid == -1
        error(['readline(): cannot open ' filename]);
    end

    retval = fgetl(fid);
    fclose(fid);
end
