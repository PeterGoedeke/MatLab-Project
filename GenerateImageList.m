function fileNames = GenerateImageList(directoryName, fileType)
%GENERATEIMAGELIST Reads a directory for files of a certain type
%   Takes two inputs: the name of the directory to read (absolute or
%   relative) and the file type desired. Both inputs are strings.
%   Outputs a 1xn cell array containing the filenames of fileType in
%   directoryName.

% Creates a list of all files in the specified directory of specified
% filetype
directory = dir([directoryName '\*.' fileType]);
% Extracts the names of said files to cell array
fileNames = {directory.name};

end

% Link explaining how to use the 'dir' command:
% https://au.mathworks.com/help/matlab/ref/dir.html
% Link explaining the best way to take a slice of a struct array:
% https://stackoverflow.com/questions/8631136/how-to-slice-a-struct-array