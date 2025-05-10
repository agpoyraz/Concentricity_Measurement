%orta çap ölçümü algoritması
%Ahmet Gökhan POYRAZ
%th=150 alabilirsiniz
function [concentricity] = connected_component_based(BW,th)

    bw_th=BW > th;
    bw_filled_outer = imfill(imcomplement(bw_th),"holes");

    bw_filled_inner = imclearborder(bw_th);
    

    stats = regionprops('table',stats2.FilledImage{index(1)},'Centroid','MajorAxisLength','MinorAxisLength','EquivDiameter','Eccentricity');
    %props = regionprops(biggest_ic_cember, 'Centroid', 'WeightedCentroid', 'Eccentricity');
    
    
    % labeledImage = bwlabel(biggest_ic_cember);
    % measurements = regionprops(labeledImage, BW, 'WeightedCentroid')
    % centerOfMass = measurements.WeightedCentroid
    % hold on;
    % plot(centerOfMass(1), centerOfMass(2), 'r*', 'LineWidth', 2, 'MarkerSize', 16);
    
    %centers = stats.Centroid;
    maks = stats.MajorAxisLength;
    minn = stats.MinorAxisLength;
    egiklik = stats.Eccentricity;
    cap = stats.EquivDiameter;
    
   
end