package org.myorg;

import java.io.IOException;
import java.util.StringTokenizer;
import java.lang.Math;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.*;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.FloatWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapred.JobConf;
import org.apache.hadoop.mapreduce.*;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.Mapper;
import org.apache.hadoop.mapreduce.Reducer;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.input.FileSplit;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;
import org.apache.hadoop.util.GenericOptionsParser;

public class WordCount
{

    public static class HistogramsMapper 
    extends Mapper<Object, Text, Text, IntWritable>
    {

        private final static IntWritable one = new IntWritable(1);
        private Text word = new Text();

        public void map(Object key, Text value, Context context
                       ) throws IOException, InterruptedException {
            StringTokenizer itr = new StringTokenizer(value.toString());
            while (itr.hasMoreTokens())
            {
                String str = ((FileSplit) context.getInputSplit()).getPath().getName();
                word.set(str + "--" + itr.nextToken().length());
                context.write(word, one);
            }
        }
    }

    public static class CorpusHistogramMapper 
    extends Mapper<Object, Text, Text, IntWritable>
    {

        private final static IntWritable one = new IntWritable(1);
        private Text word = new Text();

        public void map(Object key, Text value, Context context
                       ) throws IOException, InterruptedException {
            StringTokenizer itr = new StringTokenizer(value.toString());
            while (itr.hasMoreTokens())
            {
                word.set("" + itr.nextToken().length());
                context.write(word, one);
            }
        }
    }

    public static class Mapper3 
    extends Mapper<Object, Text, Text, IntWritable>
    {

        private static IntWritable one = new IntWritable(0);
        private Text word = new Text();

        public void map(Object key, Text value, Context context
                       ) throws IOException, InterruptedException {
	
			String line = value.toString();
			System.out.println(line + "\n");
			String delimiter = "\t";
			String[] temp;
 			temp = line.split(delimiter);
			
			String str = ((FileSplit) context.getInputSplit()).getPath().getName();
			
			// if the name of the file is corpus then emit 5 versions of the file			
			one = new IntWritable(Integer.parseInt(temp[1]));
			if (str.equals("corpusHisto")) {
				word.set("file1.txt--" + temp[0]);
				context.write(word, one);
				word.set("file2.txt--" + temp[0]);
				context.write(word, one);				
			}
			else
			{
				word.set(temp[0] + "");
				context.write(word, one);
			}
        }
    }

    public static class Mapper4 
    extends Mapper<Object, Text, Text, IntWritable>
    {

        // private static IntWritable one = new IntWritable(0);
        private Text word = new Text();

        public void map(Object key, Text value, Context context
                       ) throws IOException, InterruptedException {
	
			String line = value.toString();
			System.out.println(line + "\n");
			String delimiter = "\t";
			String[] parts;
 			parts = line.split(delimiter);

			String filename = ((FileSplit) context.getInputSplit()).getPath().getName();
			
			
			if (filename.equals("corpusHisto")) {
				word.set(filename + "--" + "corpus");
				context.write(word, new IntWritable(Integer.parseInt(parts[1])));
			}
			else
			{
				String[] temp;
				temp = parts[0].split("--"); // removing wordlength, temp[0] is filename
				word.set(filename + "--" + temp[0]);
				context.write(word, new IntWritable(Integer.parseInt(parts[1])));						
			}

        }
    }

    public static class Mapper5 
    extends Mapper<Object, Text, Text, Text>
    {
        private Text keyval = new Text();
        private Text word = new Text();

        public void map(Object key, Text value, Context context
                       ) throws IOException, InterruptedException {
	
			String line = value.toString();
            String[] elements = line.split("\t");
            String[] hdr = elements[0].split("--");

            if (hdr[0].equals("corpusHisto"))
            {
				word.set("file1.txt");
				keyval.set(hdr[0] + "--" + elements[1]);
				context.write(word, keyval);
				word.set("file2.txt");
				keyval.set(hdr[0] + "--" + elements[1]);
				context.write(word, keyval);

                System.out.println("file1.txt" + "\t" + hdr[0] + "--" + elements[1]);
                System.out.println("file2.txt" + "\t" + hdr[0] + "--" + elements[1]);
            }
            else
            {
				word.set(hdr[1]);
				keyval.set(hdr[0] + "--" + elements[1]);
				
				System.out.println(hdr[1] + "\t" + hdr[0] + "--" + elements[1]);
                context.write(word, keyval);
            }
        }
    }

    public static class IntSumReducer
    extends Reducer<Text,IntWritable,Text,IntWritable>
    {
        private IntWritable result = new IntWritable();

        public void reduce(Text key, Iterable<IntWritable> values, 
                           Context context
                          ) throws IOException, InterruptedException {
            int sum = 0;
            for (IntWritable val : values)
            {
                sum += val.get();
            }
            result.set(sum);
            context.write(key, result);
        }
    }

    public static class IntSumReducer3 
    extends Reducer<Text,Text,Text,FloatWritable>
    {
        private FloatWritable result = new FloatWritable();

        public void reduce(Text key, Iterable<Text> values, 
                           Context context
                          ) throws IOException, InterruptedException {
	
	        float[] order = new float[]{0.0f,0.0f,0.0f};
	
            for (Text val : values)
            {
				String valStr = val.toString();
				String[] pair = valStr.split("--");

			    if (pair[0].equals("Dots"))
			    {
			        order[0] = Float.parseFloat(pair[1]);
			    }
			    else if(pair[0].equals("Histos"))
			    {
			        order[1] = Float.parseFloat(pair[1]);
			    }
			    else if(pair[0].equals("corpusHisto"))
			    {
			        order[2] = Float.parseFloat(pair[1]);
			    }
			    else
			    {
			        System.out.println("Something evil happened");
			    }				
            }

	        // String resStr = String.valueOf(res/(sqrt1*sqrt2));

			float sqrt1 = (float) Math.sqrt(order[1]);
	        float sqrt2 = (float) Math.sqrt(order[2]);
	        float res = (float) order[0]/(sqrt1*sqrt2);

            result.set(res);
            context.write(key, result);
        }
    }

    public static class IntSumReducer2 
    extends Reducer<Text,IntWritable,Text,IntWritable>
    {
        private IntWritable result = new IntWritable();

        public void reduce(Text key, Iterable<IntWritable> values, 
                           Context context
                          ) throws IOException, InterruptedException {

            int sum = 0;
			String keyStr = key.toString();
			String fourChars = keyStr.substring(0, Math.min(keyStr.length(), 4));
			
			if (fourChars.equals("Dots")) 
			{
				System.out.println("HasHitDots");
				
				for (IntWritable val : values)
	            {
	                sum += val.get();
	            }
	            result.set(sum);
	            context.write(key, result);
			}
			else
			{
				for (IntWritable val : values)
	            {
	                sum += Math.pow(val.get(), 2);
	            }
	            result.set(sum);
	            context.write(key, result);
			}
        }
    }

    public static class MultReducer 
    extends Reducer<Text,IntWritable,Text,IntWritable>
    {
        private IntWritable result = new IntWritable();

        public void reduce(Text key, Iterable<IntWritable> values, 
                           Context context
                          ) throws IOException, InterruptedException {
            int sum = 1;
			int count = 0;
            for (IntWritable val : values)
            {
                sum *= val.get();
				count++;
            }
			if (count < 2) {
				sum = 0;
			}
            result.set(sum);
            context.write(key, result);
        }
    }

    public static void main(String[] args) throws Exception {
        Configuration conf = new Configuration(); 
        Job job;
		boolean isRenamed;

        // String[] otherArgs = new GenericOptionsParser(conf, args).getRemainingArgs();
        // if (otherArgs.length != 2) {
        //   System.err.println("Usage: wordcount <in> <out>");
        //   System.exit(2);
        // }
/*
		// CorpusHistogram: Run job 1
				conf = new Configuration();
		        job = new Job(conf, "CorpusHisto");
		        job.setJarByClass(WordCount.class);
		        job.setMapperClass(CorpusHistogramMapper.class);
		        job.setCombinerClass(IntSumReducer.class);
		        job.setReducerClass(IntSumReducer.class);
		        job.setOutputKeyClass(Text.class);
		        job.setOutputValueClass(IntWritable.class);
				// job.setInputFormatClass(FileInputFormat.class);
				// job.setOutputFormatClass(FileOutputFormat.class);		
		        FileInputFormat.addInputPath(job, new Path(args[0]));
		        FileOutputFormat.setOutputPath(job, new Path("/user/hadoop/histos"));
		        job.waitForCompletion(true);

		// Rename the file
		        FileSystem hdfs = FileSystem.get(conf);
		        Path fromPath = new Path("/user/hadoop/histos/part-r-00000");
		        Path toPath = new Path("/user/hadoop/histos/corpusHisto");

		        // renaming to corpusHisto
		        isRenamed = hdfs.rename(fromPath, toPath);
		        if (isRenamed)
		        {
		            System.out.println("Renamed to /user/hadoop/histos/corpusHisto!");
		        }
		        else
		        {
		            System.out.println("Not Renamed!");
		        }

		// FileHistograms: Run job 2
				conf = new Configuration(); // Seems like it needs a new configuration object
		        job = new Job(conf, "DSHistos");
		        job.setJarByClass(WordCount.class);
		        job.setMapperClass(HistogramsMapper.class);
		        job.setCombinerClass(IntSumReducer.class);
		        job.setReducerClass(IntSumReducer.class);
		        job.setOutputKeyClass(Text.class);
		        job.setOutputValueClass(IntWritable.class);
		        FileInputFormat.addInputPath(job, new Path(args[0]));
		        FileOutputFormat.setOutputPath(job, new Path(args[1]));
				job.waitForCompletion(true);

		// PreDotProcuct: Run job 3
		        conf = new Configuration(); // Seems like it needs a new configuration object
		        job = new Job(conf, "Mapper3");
		        job.setJarByClass(WordCount.class);
		        job.setMapperClass(Mapper3.class);
		        // job.setCombinerClass(MultReducer.class);
		        job.setReducerClass(MultReducer.class);
		        job.setOutputKeyClass(Text.class);
		        job.setOutputValueClass(IntWritable.class);

				FileInputFormat.addInputPaths(job, new String("/user/hadoop/output,/user/hadoop/histos"));
		        // FileInputFormat.addInputPath(job, new Path("/user/hadoop/histos/"), new Path("/user/hadoop/output"));
		        FileOutputFormat.setOutputPath(job, new Path("/user/hadoop/mapper3"));
				job.waitForCompletion(true);

		// Rename the files
	        hdfs = FileSystem.get(conf);
	        fromPath = new Path("/user/hadoop/output/part-r-00000");
	        toPath = new Path("/user/hadoop/output/Histos");

	    // renaming to Histos
	    isRenamed = hdfs.rename(fromPath, toPath);
	    if (isRenamed)
	    {
	        System.out.println("Renamed to /user/hadoop/output/Histos!");
	    }
	    else
	    {
	        System.out.println("Not Renamed!");
	    }
        
	    // renaming to Dots
	        fromPath = new Path("/user/hadoop/mapper3/part-r-00000");
	        toPath = new Path("/user/hadoop/mapper3/Dots");

	        // renaming to Histos
	        isRenamed = hdfs.rename(fromPath, toPath);
	        if (isRenamed)
	        {
	            System.out.println("Renamed to /user/hadoop/mapper3/Dots!");
	        }
	        else
	        {
	            System.out.println("Not Renamed!");
	        }

		// Sum all the crap obtained: Run job 4
	
	        conf = new Configuration(); // Seems like it needs a new configuration object
	        job = new Job(conf, "Mapper4");
	        job.setJarByClass(WordCount.class);
	        job.setMapperClass(Mapper4.class);
	        job.setReducerClass(IntSumReducer2.class);
	        job.setOutputKeyClass(Text.class);
	        job.setOutputValueClass(IntWritable.class);

			FileInputFormat.addInputPaths(job, new String("/user/hadoop/mapper3,/user/hadoop/output,/user/hadoop/histos"));
	        // FileInputFormat.addInputPath(job, new Path("/user/hadoop/histos/"), new Path("/user/hadoop/output"));
	        FileOutputFormat.setOutputPath(job, new Path("/user/hadoop/mapper4"));
			job.waitForCompletion(true);

*/

		// Final job at last.
	        conf = new Configuration(); // Seems like it needs a new configuration object
	        job = new Job(conf, "Mapper5");
	        job.setJarByClass(WordCount.class);
	        job.setMapperClass(Mapper5.class);
	        job.setReducerClass(IntSumReducer3.class);
	        job.setOutputKeyClass(Text.class);
	        job.setOutputValueClass(Text.class);

			FileInputFormat.addInputPaths(job, new String("/user/hadoop/mapper4"));
	        // FileInputFormat.addInputPath(job, new Path("/user/hadoop/histos/"), new Path("/user/hadoop/output"));
	        FileOutputFormat.setOutputPath(job, new Path("/user/hadoop/mapper5"));
			// job.waitForCompletion(true);
		

        System.exit(job.waitForCompletion(true) ? 0 : 1);
    }
}

// Dots--file1.txt	24
// Dots--file2.txt	19
// Histos--file1.txt	8
// Histos--file2.txt	7
// corpusHisto--corpus	15
// cat: Source must be a file.
