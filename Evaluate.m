file_path = 'Images\GoodImages\CCD4\';
images_path = dir([file_path,'*.bmp']);

addpath(genpath('.'))

for i=1:numel(images_path)
    try
        im = imread([file_path,images_path(i).name]);
        im = im(50:end-50,200:end-200);
        [c1(i), c2(i), c3(i)] = concentricity_measurement_methods(im);
    catch
        exceptions(i) = 1;
    end
end

