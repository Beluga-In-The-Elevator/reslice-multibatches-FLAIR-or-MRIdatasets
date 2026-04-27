# reslice-multibatches-FLAIR-or-MRIdatasets

README: Reorder interleaved MRI slices (ImageJ macro)
This macro reorders interleaved multi‑slice MRI data acquired as 3 batches of 8 slices (e.g., from a 7T MR Solutions system). The DICOMs are loaded as a 24‑slice stack, but the acquisition order is:

Batch 1: slices 1–8

Batch 2: slices 9–16

Batch 3: slices 17–24

so the true anatomical order seen in DICOM filenames (e.g., 37932_00001, 37932_00009, 37932_00017, …) is scrambled in ImageJ. This macro:

Processes any 24‑slice stack (not just FLAIR, but also T2‑weighted, T1w, etc.).

Splits the stack into three substacks: Batch1, Batch2, Batch3.

Re‑interleaves them slice‑by‑slice into a new 24‑slice stack Reordered in correct anatomical order.

Logs the DICOM filename (e.g., 37932_00001.dcm) for each slice copied, so you can visually verify the order.

Applies auto‑contrast to the middle slice of Reordered to improve visualization.

Prompts you to choose the dataset and where to save the reordered stack.

Safely ignores small ROIs or selections so the macro always runs on the full image.


------
How to use this macro
This macro is designed to work with ImageJ or Fiji and will reorder interleaved 24‑slice MRI stacks (e.g., FLAIR, T2‑weighted, DTI, etc.).

1. Install ImageJ / Fiji
Install ImageJ or Fiji from the official download page if you do not already have it.

No extra plugins are required; the macro uses only built‑in commands.

2. Load your MRI stack
Open your DICOM or image‑sequence data in ImageJ/Fiji so that it appears as a 24‑slice stack (use File > Import > Image Sequence or your DICOM loader).

Confirm the stack has 24 slices via Image > Show Info (Images: 24).

3. Run the macro
Open the Script Editor:

In Fiji/ImageJ, go to File > New > Script.

In the Script Editor:

Set Language = IJ1 Macro from the dropdown.

Copy and paste the contents of ReorderSlices_24batch.ijm into the editor (or open/drag the .ijm file into the editor).

Click Run.

A dropdown menu will appear listing all open image windows; select the 24‑slice stack you want to reorder (e.g., FLAIR, T2weighted, etc.).

4. What happens next
The macro:

Ensures the full image is selected (ignoring accidental ROIs).

Splits the stack into three 8‑slice substacks Batch1, Batch2, Batch3.

Re‑interleaves them into a new stack Reordered in true anatomical order.

Applies contrast enhancement to the middle slice of Reordered.

Prompts you to choose a folder, then saves the reordered stack as Reordered_<dataset_name>.tif (e.g., Reordered_FLAIR.tif).

Optionally asks whether to close the Batch1/Batch2/Batch3 windows.

5. Academic credit
Please cite this repository and the corresponding protocol or publication when using this macro in published work.
