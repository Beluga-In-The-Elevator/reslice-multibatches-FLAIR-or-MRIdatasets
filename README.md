# reslice-multibatches-FLAIR-or-MRIdatasets

README: Reorder interleaved MRI slices (ImageJ macro)
This macro reorders interleaved multi‑slice MRI data acquired as 3 batches of 8 slices (e.g., from a 7T MR Solutions system). The DICOMs are loaded as a 24‑slice stack, but the acquisition order is:

How to use this macro
This macro is designed to work with ImageJ or Fiji and will reorder interleaved 24‑slice MRI stacks (e.g., FLAIR, T2‑weighted, etc.).

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
