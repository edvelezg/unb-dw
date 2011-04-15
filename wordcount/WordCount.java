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

    public static void main(String[] args) throws Exception {
        Configuration conf = new Configuration();
        // String[] otherArgs = new GenericOptionsParser(conf, args).getRemainingArgs();
        // if (otherArgs.length != 2) {
        //   System.err.println("Usage: wordcount <in> <out>");
        //   System.exit(2);
        // }
        Job job = new Job(conf, "CorpusHisto");
        job.setJarByClass(WordCount.class);
        job.setMapperClass(CorpusHistogramMapper.class);
        job.setCombinerClass(IntSumReducer.class);
        job.setReducerClass(IntSumReducer.class);
        job.setOutputKeyClass(Text.class);
        job.setOutputValueClass(IntWritable.class);
        FileInputFormat.addInputPath(job, new Path(args[0]));
        FileOutputFormat.setOutputPath(job, "/user/hadoop/histos");

        job.waitForCompletion(true);

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

//      hdfs.delete(new Path("/user/hadoop/output"), true);

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


        System.exit( job.waitForCompletion(true) ? 0 : 1);
// 
//      job.waitForCompletion(true);
//      Job job2 = new Job(conf, "word count");
//      job2.setJarByClass(WordCount.class);
//      job.setMapperClass(CorpusHistogramMapper.class);
//      job2.setCombinerClass(IntSumReducer.class);
//      job2.setReducerClass(IntSumReducer.class);
//      job2.setOutputKeyClass(Text.class);
//      job2.setOutputValueClass(IntWritable.class);
//      FileInputFormat.addInputPath(job2, new Path(args[0]));
//      FileOutputFormat.setOutputPath(job2, new Path(args[1]));
    }
}