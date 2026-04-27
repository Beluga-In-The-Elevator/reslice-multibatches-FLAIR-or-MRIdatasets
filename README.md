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
