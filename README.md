
## 📁 Dataset

This dataset consists of images captured using an industrial machine vision system to inspect circular (washer-type) metal parts.

- A total of **45 grayscale images** were captured from **4 different camera angles**.
- Each part was measured using a **CMM (Coordinate Measuring Machine)** to ensure reference-level accuracy.
- Dimensional ground truth values such as **inner diameter, outer diameter, concentricity, roundness, thickness, maximum and minimum diameters** are provided in an accompanying **Excel file**.

Researchers can use this dataset not only for concentricity analysis (as done in this study), but also for **diameter and thickness measurement algorithms** or general precision metrology applications.

---
## 📁 CMM Measurement Data Description

The dataset includes precise dimensional measurements obtained using a Coordinate Measuring Machine (CMM) for washer-type metal parts. These values are provided in the `CMM_measurements.xlsx` file and correspond to the visual data captured from four different camera setups in the industrial machine vision system.

### 🔍 Camera Configuration:

| Camera ID | Viewpoint       | Illumination Type        | 
|-----------|------------------|---------------------------|
| CCD1      | Top View         | Ring Light                |
| CCD2      | Side View        | Direct Lighting           |
| CCD3      | Bottom View      | Ring Light                |
| CCD4      | Bottom View      | Backlight + Telecentric Lens |

---

### 📋 CMM Measurement Columns:

| Column Name                       | Description                                                  |
|----------------------------------|--------------------------------------------------------------|
| `id`                             | Part identifier or measurement index                        |
| `Diameter_Inner`                 | Measured inner diameter (nominal)                           |
| `Diameter_Inner MIN / MAX`       | Minimum and maximum measured inner diameter                 |
| `Roundness_Inner Diameter`       | Roundness deviation of the inner diameter                   |
| `Diameter_Outer`                 | Measured outer diameter (nominal)                           |
| `Diameter_Outer MIN / MAX`       | Minimum and maximum measured outer diameter                 |
| `Roundness_Outer Diameter`       | Roundness deviation of the outer diameter                   |
| `Concentricity1`                 | Absolute concentricity (distance between inner/outer centers) |
| `Normalized Concentricity (%)`   | Concentricity normalized by outer diameter (scale-invariant)  |


> Measurements are provided in millimeters. Concentricity and roundness are computed in accordance with ISO standards. The normalized concentricity is useful for scale-invariant analysis.

---

Each CMM measurement entry is associated with the image-based concentricity estimation methods described in the paper. These include Subpixel Edge Detection, Devernay's algorithm, and standard Canny edge detection, as evaluated in comparison with ground truth.


📖 License
MIT License – You may freely use, modify, and distribute this code for academic or industrial purposes. Please cite the work if used in research.

🤝 Contact
For collaboration or questions:

📧 agpoyraz@gmail.com
