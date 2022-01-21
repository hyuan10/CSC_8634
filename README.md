Welcome to CSC_8634

The aim of this investigation is to see if there is any correlation between the packets received by the Database (Cluster A data), and the time of day they were received. By realising when the peak packets are received, we are able to understand the changes in loads received hourly. This will help with ensuring the data centre can continue to sustain these loads and indicate when the data centre requires to be scaled up to accomodate for more users. 

Please ensure that the project file is saved in the Documents folder in your home directory (<root>\Users\<Username>\Documents)


Navigate to the "src" folder in "CSC_8634" and run the "01-Setup-Script.R" to set up the project
This script will automatically set up the project in RStudio if you have the project folders set up in the correct directory

As the datasets enclosed in this project are quite large, they require decompression before using. Please read the following to decompressed data:

   - Ensure bz2 files are in the data folder (the files should already be in here)
    
   - run the following to decompress the code (replace myfile with the dataset name)
    
     $ bzip2 -d "myfile".bz2   # Decompress a .tsv file
      

A Report pdf is saved in the "reports" folder which documents the process and analysis.


A Structured Abstract is also adding into the "reports" folder