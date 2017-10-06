@echo off
:: IMPORTANT PREREQUSITE: You must setup an environment variable by the name BATCHLOCATION pointing to the 
:: directory that contains these batch files

:: General setup
:: In order for that file not to be called twice we set this to true (Don't change this unless you know what you're doing)
SET isSetupCalled=true

:: To pause or not after running a batch file
SET isPause=false

:: The base directory where your source code is located
SET frontend_directory=D
SET backend_directory=C

:: The folders where your primary & secondary source code is located
:: I like to have two source code folders, if you don't then just have them pointing to the same folder
SET frontend_primary_source_code=\Dev\App
SET frontend_secondary_source_code=\Dev\App2
SET backend_primary_source_code=\xampp7\htdocs\php-teacher
SET backend_secondary_source_code=\xampp7\htdocs\php-teacher

:: Frameworks used. We use these as prefixes in some batch files
SET frontend_framework=angular
SET backend_framework=slim

:: Location of the downloadable url of the apps you use and where they get downloaded
:: Set this up if you're using DownloadMyApps.bat
SET my_apps=..\config\myapps.txt
SET downloads=C:\Users\n.ihab\Downloads

:: Path to your log file
:: Set this up if you're using LogEveryHour.bat
SET log_file=C:\Users\n.ihab\Google Drive\Productivity\energy levels.csv

:::::::::::::::::::::::::::::::::::::::::::: XAMPP :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: If you're using XAMPP then set these up
:: Your destination folder
SET base_destination=C:\xampp7\htdocs

:: The base url that is pointing to your destination folder (in most cases it's localhost)
SET base_url=http://10.0.2.65


:::::::::::::::::::::::::::::::::::::::::: Angular :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: If you're using angular set these up
:: The folder where you built code is copied
SET build_folder=dist


:::::::::::::::::::::::::::::::::::::::::: AWS :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: If you're using AWS and have the CLI installed then set these up
:: Make sure that your AWS CLI is setup with your IAM access credentials

::::::: S3 ::::::::
:: dev_s3_bucket is considered the default bucket in all batch files
SET dev_s3_bucket=dev.edquire.com
SET stg_s3_bucket=staging.edquire.com
SET prod_s3_bucket=dashboard.edquire.com

::::::: Cloud Front ::::::
set dev_cf_distribution_id=E24K1KWDFJPC0K
set stg_cf_distribution_id=EKO145NU9NIFP
set prod_cf_distribution_id=E362A9I7LUW959

::::::: RDS ::::::
set rds_list=rds-instance-1 rds-instance-2

:::::::::::::::::::::::::::::::::::::::::: Deployments :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: List of urls to open after deploying
:: Use this if you need a few web links to open after you deploy for any documentation
set post_deploy_urls="http://powerhouse.fic:7990/projects/SLM/repos/schoolviewerfrontend/commits?until=refs%2Fheads%2Fproduction"
set post_deploy_urls="%post_deploy_urls%;http://powerhouse.fic:8090/pages/editpage.action?pageId=29950143"