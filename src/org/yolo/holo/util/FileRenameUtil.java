package org.yolo.holo.util;

import java.io.File;
import java.io.IOException;

public class FileRenameUtil {
	// This method does not need to be synchronized because createNewFile()
	  // is atomic and used here to mark when a file name is chosen
	  public File rename(File f) {
	    if (createNewFile(f)) {
	      return f;
	    }
	    String name = f.getName();
	    String body = null;
	    String ext = null;

	    int dot = name.lastIndexOf(".");
	    if (dot != -1) {
	      body = name.substring(0, dot);
	      ext = name.substring(dot);  // includes "."
	    }
	    else {
	      body = name;
	      ext = "";
	    }

	    // Increase the count until an empty spot is found.
	    // Max out at 9999 to avoid an infinite loop caused by a persistent
	    // IOException, like when the destination dir becomes non-writable.
	    // We don't pass the exception up because our job is just to rename,
	    // and the caller will hit any IOException in normal processing.
	    int count = 0;
	    while (!createNewFile(f) && count < 9999) {
	      count++;
	      String newName = body + count + ext;
	      f = new File(f.getParent(), newName);
	    }

	    return f;
	  }

	  private boolean createNewFile(File f) {
	    try {
	      return f.createNewFile();
	    }
	    catch (IOException ignored) {
	      return false;
	    }
	  }
}
