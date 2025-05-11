# Concentricity_Measurement

This project shares an industrial machine vision dataset for washer-like metal parts and compares subpixel-based methods for measuring the **concentricity** of circular features.

The system calculates **normalized concentricity**, defined as the Euclidean distance between the centers of the inner and outer circles divided by the outer diameter. This approach ensures that the measurement is **scale-invariant** and can be compared across parts of different sizes.

🔗 GitHub Repository: [https://github.com/agpoyraz/Concentricity_Measurement](https://github.com/agpoyraz/Concentricity_Measurement)

---

## 📁 Dataset

This dataset consists of images captured using an industrial machine vision system to inspect circular (washer-type) metal parts.

- A total of **45 grayscale images** were captured from **4 different camera angles**.
- Each part was measured using a **CMM (Coordinate Measuring Machine)** to ensure reference-level accuracy.
- Dimensional ground truth values such as **inner diameter, outer diameter, concentricity, roundness, thickness, maximum and minimum diameters** are provided in an accompanying **Excel file**.

Researchers can use this dataset not only for concentricity analysis (as done in this study), but also for **diameter and thickness measurement algorithms** or general precision metrology applications.

The camera configurations are as follows:

| Camera | Viewpoint     | Details                                       |
|--------|----------------|-----------------------------------------------|
| CCD1   | Top view       | Captured from a separate inspection station   |
| CCD2   | Side view      | Captures the side profile of the part         |
| CCD3   | Bottom view    | Captured from another station                 |
| CCD4   | Bottom view    | Uses **backlight** illumination with a **telecentric lens** |

---

## 🧠 Applied Methods

Three different methods are applied to extract circular edge features and measure concentricity. Each method is preceded by a **connected component-based preprocessing step**, which removes noise and unwanted small dark spots from the image. Additional steps like **binarization**, **inversion**, and **mask generation** help isolate the inner and outer regions more accurately.

### 🔸 1. Devernay Subpixel Edge Detection  
- Detects subpixel-accurate edges using edge gradient interpolation  
- Reference: [https://doi.org/10.5201/ipol.2017.216](https://doi.org/10.5201/ipol.2017.216)

### 🔸 2. Subpixel Edge Detector (SubEdge)  
- Locates edges at subpixel accuracy based on intensity profile fitting  
- Reference: [https://doi.org/10.1016/j.imavis.2012.10.005](https://doi.org/10.1016/j.imavis.2012.10.005)

### 🔸 3. Canny Edge Detection  
- Traditional edge detection method (not subpixel accurate)

---


## ⚙️ How to Use

1. Clone this repository or download the ZIP file.
2. Place your images inside `sample_images/`.
3. Run the following command in MATLAB:

```matlab
im = imread('Images\GoodImages\CCD4\0035.bmp');
[c1, c2, c3] = concentricity_measurement_methods(im);
%c1: Canny based concentricity
%c2: Devernay Algorithm
%c3: Subpixel Edges
The script displays the image with center points and distance visualizations.
```

## 📊 Evaluation Metrics

To evaluate and compare the performance of different image-based concentricity measurement methods against reference measurements obtained from a Coordinate Measuring Machine (CMM), the following metrics were used:

### 🔹 Normalized Concentricity

Normalized concentricity quantifies the alignment between the centers of inner and outer circles as a proportion of the outer diameter:

Concentricity_norm = || C_outer − C_inner || / D_outer

This formulation ensures scale independence, enabling comparisons across parts with varying sizes.

---

### 🔹 Pearson Correlation Coefficient

To assess the statistical agreement between each method and the CMM measurements, the Pearson correlation coefficient was computed:

r = sum((xi - x̄)(yi - ȳ)) / sqrt(sum((xi - x̄)^2) * sum((yi - ȳ)^2))

This value ranges from -1 to 1:
- \( r = 1 \): perfect positive linear relationship
- \( r = 0 \): no linear correlation
- \( r = -1 \): perfect negative linear relationship

---

### 🔹 Mean Absolute Error (MAE)

MAE indicates the average magnitude of deviation between algorithmic outputs and reference CMM values:

MAE = (1/n) * Σ |yᵢ − ŷᵢ|

Lower MAE values correspond to more accurate measurement results.

---

These metrics provide a comprehensive evaluation of each method in terms of both accuracy and consistency, and are especially useful for determining the robustness of each approach in the presence of noise or outliers.

📖 License
MIT License – You may freely use, modify, and distribute this code for academic or industrial purposes. Please cite the work if used in research.

🤝 Contact
For collaboration or questions:

📧 agpoyraz@gmail.com
