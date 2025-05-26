function [x1,y1] = calculation_center_inner(BW,upper_th,bottom_th)

BW(BW<bottom_th) = bottom_th;
BW(BW>upper_th) = upper_th;

normalizasyon = (single(BW)-bottom_th)/(upper_th-bottom_th);

% 2. Koordinat matrisleri oluştur
[rows, cols] = size(normalizasyon);
[x, y] = meshgrid(1:cols, 1:rows);  % x: sütun, y: satır

% 3. Ağırlıklı toplamları hesapla
total_weight = sum(normalizasyon(:));
x1 = sum(x(:) .* normalizasyon(:)) / total_weight;
y1 = sum(y(:) .* normalizasyon(:)) / total_weight;

% 4. Sonuç
fprintf('Ağırlıklı ağırlık merkezi: (%.2f, %.2f)\n', x1, y1);
end