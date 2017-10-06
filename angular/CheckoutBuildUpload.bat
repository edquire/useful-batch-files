REM ********************************************************************************
REM								CheckoutBuildUpload.bat
REM This file does everything that CheckoutBuild does then it calls UploadToS3 to upload it
REM
REM prerequisits: git, bower, grunt, aws cli & access, CheckoutBuild.bat
REM ********************************************************************************

::setup
if "%isSetupCalled%" equ "" (
call %BATCHLOCATION%/SetupEnv.bat
)
set _human_or_batch=%1
set _isPause=%isPause%

::inputs
if "%_human_or_batch%" equ "" (
set /P _branch_name=Branch:
set /P _s3_bucket=Bucket. leave empty for default: 
set /P _cf_distribution_id=Cloud Front Distribution ID. leave empty for default: 

goto defaults
)
:: else, get the inputs from the parameters
set _branch_name=%1
set _s3_bucket=%2
set _cf_distribution_id=%3
set _isPause=false

::defaults
:defaults
if "_s3_bucket" equ "" (
set _s3_bucket=%dev_s3_bucket%
)
if "_cf_distribution_id" equ "" (
set _cf_distribution_id=%dev_cf_distribution_id%
)

::operations
set _source=%base_destination%\%_branch_name%
::call %BATCHLOCATION%\angular\CheckoutBuild.bat %_branch_name%
::call %BATCHLOCATION%\aws\UploadToS3.bat %_source% %_s3_bucket% %_cf_distribution_id%

for %%a in (%post_deploy_urls%) do (
	echo %%a
	start "" %%a
)

if %_isPause% equ true pause