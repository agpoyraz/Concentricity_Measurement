%% Machine Vision Based SubPixel Level Concentricty Measurement Algorithm for Ring Parts
function c4 = proposed_method(im_outer,im_inner)
[bottom_th,upper_th,im_outer] = determine_thresholds(im_outer,'intermediate','mean');
[x1,y1] = calculation_center_outer(im_outer,upper_th,bottom_th);
[diameter] = calculation(im_outer,upper_th,bottom_th);

[bottom_th,upper_th,im_inner] = determine_thresholds(im_inner,'intermediate','mean');
[x2,y2] = calculation_center_inner(im_inner,upper_th,bottom_th);

distance = sqrt((x1 - x2)^2 + (y1 - y2)^2);
c4 = distance/diameter;
end
