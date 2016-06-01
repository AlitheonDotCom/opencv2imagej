/*
 * txt2png.ijm
 * ImageJ macro to convert Text Images to PNG
 */

inputDir = getDirectory("Input Directory");
outputDir = getDirectory("Output Directory");

inputFiles = getFileList(inputDir);

for (i = 0; i < inputFiles.length; i++) {
  // Assume text files in the input directory are valid Text Images
  if (endsWith(inputFiles[i], ".txt")) {
    convert(inputDir, outputDir, inputFiles[i]);
  }
}

function convert(inputDir, outputDir, infile) {
  run("Text Image... ", "open=[" + inputDir + infile + "]");
  outfile = replace(infile, ".txt", ".png");
  saveAs("PNG", outputDir + outfile);
  close();
}
