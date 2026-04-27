// Reorder 24-slice FLAIR stack from interleaved to anatomical order
//assumes user already has open dataset(s) that they wish to process
// User selects which open dataset to process

titles = getList("image.titles");
if (titles.length == 0)
    exit("No image windows are open.");

Dialog.create("Choose dataset");
Dialog.addImageChoice("Dataset");
Dialog.show();
origTitle = Dialog.getImageChoice();

selectWindow(origTitle);
run("Select All");        // selects the whole image

if (nSlices != 24) {
    print("ERROR: nSlices = " + nSlices + " (expected 24).");
    exit("Expected 24 slices.");
}
print("? Selected dataset: \"" + origTitle + "\"");

// Make 1–8
selectWindow(origTitle);
run("Make Substack...", "slices=1-8");
rename("Batch1");

// Make 9–16
selectWindow(origTitle);
run("Make Substack...", "slices=9-16");
rename("Batch2");

// Make 17–24
selectWindow(origTitle);
run("Make Substack...", "slices=17-24");
rename("Batch3");

// Create a new 24-slice stack for the reordered data
w = getWidth();
h = getHeight();
newImage("Reordered", "32-bit black", w, h, 24);
print("? Created 24-slice reordered stack.");

// Interleave with logging
print("Begin interleaving 3 × 8 slices; DICOM filenames:");
for (slice = 1; slice <= 8; slice++) {
    for (batch = 1; batch <= 3; batch++) {
        batchName = "Batch" + batch;

        selectWindow(batchName);
        setSlice(slice);
        run("Copy");

        dicomFile = getInfo("image.filename");
        if (dicomFile == "") dicomFile = "(no filename)";
        print("  ? Copy [Slice " + slice + " from " + batchName + " = " + dicomFile + "]");

        selectWindow("Reordered");
        setSlice((slice - 1) * 3 + batch);
        run("Paste");
    }
}
print("? Reordering done; check window 'Reordered'.");
// adjust contrast
selectWindow("Reordered");
mid = floor(nSlices/2) + 1;
setSlice(mid);
run("Enhance Contrast", "saturated=0.35");

// save data prompt
// Ask user for save folder
saveLocation = getDirectory("Where do you want to save the reordered stack?");

// Build filename: Reordered_<origTitle>.tif
outName = "Reordered_" + origTitle + ".tif";
savePath = saveLocation + outName;

selectWindow("Reordered");
saveAs("Tiff", savePath);
print("? Saved to: " + savePath);

//delete or comment out the below section if you would like to troubleshoot a reordering issue and make sure the batches are being split properly
if (isOpen("Batch1")) { selectWindow("Batch1"); close(); }
if (isOpen("Batch2")) { selectWindow("Batch2"); close(); }
if (isOpen("Batch3")) { selectWindow("Batch3"); close(); }
