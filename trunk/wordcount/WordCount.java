package org.myorg;

import java.io.IOException;
import java.util.StringTokenizer;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.*;
import org.apache.hadoop.io.IntWritable;
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
                word.set(itr.nextToken().length() + "");
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
        Configuration conf;
        Job job;

        // String[] otherArgs = new GenericOptionsParser(conf, args).getRemainingArgs();
        // if (otherArgs.length != 2) {
        //   System.err.println("Usage: wordcount <in> <out>");
        //   System.exit(2);
        // }
/*
// Run job 1
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
        boolean isRenamed = hdfs.rename(fromPath, toPath);
        if (isRenamed)
        {
            System.out.println("Renamed to /user/hadoop/histos/corpusHisto!");
        }
        else
        {
            System.out.println("Not Renamed!");
        }

// Run job 2
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
*/

// Run job 3
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

        System.exit(job.waitForCompletion(true) ? 0 : 1);
    }
}