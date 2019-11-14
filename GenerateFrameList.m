
function framesArray = GenerateFrameList(start, step, frames)
%GENERATEFRAMELIST Generates specified frames
%   Returns a vector with starting value 'start', step size 'step', and
%   number of elements 'frames'. Takes these values as inputs.
framesArray = start:step:start + frames * step - 1;
end

