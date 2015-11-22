---
title: "Getting and Cleaning Data: Course Project Codebook"
author: "Philip Seidel"
date: "11/22/15"
output:
  html_document:
    keep_md: yes
---

## Project Description
The goal of this project is to prepare tidy data from raw data that can be used for later analysis.

## Study design and data processing
This study takes acceler


### Collection of the raw data
The data was collected from the accelerometers and gyroscopes from the Samsung Galaxy S smartphone. 
The sensor signals were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.


### Notes on the original (raw) data 
See http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones for more information.

## Creating the tidy datafile


### Guide to create the tidy data file
First download and extract the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Use the runAnalysis function to create the tidy data by passing in the path to the root directory of the data set. I found that I had to rename the folder to remove spaces, as the spaces causes issues. An example usage follows:

- tidy <- runAnalysis("/Users/Philip/Downloads/UCIHARDataset")

### Cleaning of the data
To clean the data, this script removes unneeded columns, gives the columns human readable names, and groups the data by subject id and activity.
See the [readme](README.md) for more information.

## Description of the variables in the tiny_data.txt file
General description of the file including:
 - The tidy data set has 168 observations for 68 variables.
 - The first column represents the subject ID
 - The second column represent the activity the subject was performing

The rest of the columns represent sensor data and are numeric

- Time Body Acceleration Mean X Axis                                
- Time Body Acceleration Mean Y Axis                                
- Time Body Acceleration Mean Z Axis                                
- Time Body Acceleration Standard Deviation X Axis                  
- Time Body Acceleration Standard Deviation Y Axis                  
- Time Body Acceleration Standard Deviation Z Axis                  
- Time Gravity Acceleration Mean X Axis                             
- Time Gravity Acceleration Mean Y Axis                             
- Time Gravity Acceleration Mean Z Axis                             
- Time Gravity Acceleration Standard Deviation X Axis               
- Time Gravity Acceleration Standard Deviation Y Axis               
- Time Gravity Acceleration Standard Deviation Z Axis               
- Time Body Acceleration Jerk Mean X Axis                           
- Time Body Acceleration Jerk Mean Y Axis                           
- Time Body Acceleration Jerk Mean Z Axis                           
- Time Body Acceleration Jerk Standard Deviation X Axis             
- Time Body Acceleration Jerk Standard Deviation Y Axis             
- Time Body Acceleration Jerk Standard Deviation Z Axis             
- Time Body Gyro Mean X Axis                                        
- Time Body Gyro Mean Y Axis                                        
- Time Body Gyro Mean Z Axis                                        
- Time Body Gyro Standard Deviation X Axis                          
- Time Body Gyro Standard Deviation Y Axis                          
- Time Body Gyro Standard Deviation Z Axis                          
- Time Body Gyro Jerk Mean X Axis                                   
- Time Body Gyro Jerk Mean Y Axis                                   
- Time Body Gyro Jerk Mean Z Axis                                   
- Time Body Gyro Jerk Standard Deviation X Axis                     
- Time Body Gyro Jerk Standard Deviation Y Axis                     
- Time Body Gyro Jerk Standard Deviation Z Axis                     
- Time Body Acceleration Magnitude Mean                             
- Time Body Acceleration Magnitude Standard Deviation               
- Time Gravity Acceleration Magnitude Mean                          
- Time Gravity Acceleration Magnitude Standard Deviation            
- Time Body Acceleration Jerk Magnitude Mean                        
- Time Body Acceleration Jerk Magnitude Standard Deviation          
- Time Body Gyro Magnitude Mean                                     
- Time Body Gyro Magnitude Standard Deviation                       
- Time Body Gyro Jerk Magnitude Mean                                
- Time Body Gyro Jerk Magnitude Standard Deviation                  
- Frequency Body Acceleration Mean X Axis                           
- Frequency Body Acceleration Mean Y Axis                           
- Frequency Body Acceleration Mean Z Axis                           
- Frequency Body Acceleration Standard Deviation X Axis             
- Frequency Body Acceleration Standard Deviation Y Axis             
- Frequency Body Acceleration Standard Deviation Z Axis             
- Frequency Body Acceleration Jerk Mean X Axis                      
- Frequency Body Acceleration Jerk Mean Y Axis                      
- Frequency Body AccelerationJerk Mean Z Axis                       
- Frequency Body AccelerationJerk Standard Deviation X Axis         
- Frequency Body AccelerationJerk Standard Deviation Y Axis         
- Frequency Body AccelerationJerk Standard Deviation Z Axis         
- Frequency Body Gyro Mean X Axis                                   
- Frequency Body Gyro Mean Y Axis                                   
- Frequency Body Gyro Mean Z Axis                                   
- Frequency Body Gyro Standard Deviation X Axis                     
- Frequency Body Gyro Standard Deviation Y Axis                     
- Frequency Body Gyro Standard Deviation Z Axis                     
- Frequency Body Acceleration Magnitude Mean                        
- Frequency Body Acceleration Magnitude Standard Deviation          
- Frequency Body Body Acceleration Jerk Magnitude Mean              
- Frequency Body Body Acceleration Jerk Magnitude Standard Deviation
- Frequency Body Body Gyro Magnitude Mean                           
- Frequency Body Body Gyro Magnitude Standard Deviation             
- Frequency Body Body Gyro Jerk Magnitude Mean                      
- Frequency Body Body Gyro Jerk Magnitude Standard Deviation        