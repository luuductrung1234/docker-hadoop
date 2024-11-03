package com.ldt.samples;

import org.apache.hadoop.fs.FsUrlStreamHandlerFactory;
import org.apache.hadoop.io.IOUtils;

import java.io.IOException;
import java.io.InputStream;
import java.net.URL;

public class URLCat {
  static {
    URL.setURLStreamHandlerFactory(new FsUrlStreamHandlerFactory());
  }

  public static void main(String[] args) {
    if (args.length != 1) {
      System.err.println("Usage: urlcat <in>");
      System.exit(2);
    }

    String defaultDir = System.getenv("CORE_CONF_fs_defaultFS");
    System.out.println("Found default FS directory: " + defaultDir);

    String filePath = args[0];
    if (!filePath.startsWith("hdfs://")) {
      if (filePath.startsWith("/"))
        filePath = defaultDir + filePath;
      else
        filePath = defaultDir + "/" + filePath;
      System.out.println("Resolved full file path: " + filePath);
    }

    InputStream in = null;
    try {
      in = new URL(filePath).openStream();
      IOUtils.copyBytes(in, System.out, 4096, false);
    } catch (IOException e) {
      System.err.println("Unable to open URL: " + args[0]);
      e.printStackTrace();
    } finally {
      IOUtils.closeStream(in);
    }

    System.exit(0);
  }
}
