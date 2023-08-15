@echo off

set CUR_YYYY=%date:~0,4%
set CUR_MM=%date:~5,2%
set CUR_DD=%date:~8,2%

set CUR_HH=%time:~0,2%
set CUR_MIN=%time:~3,2%
set CUR_SS=%time:~6,2%

if %CUR_HH%==0 set CUR_HH=00
if %CUR_HH%==1 set CUR_HH=01
if %CUR_HH%==2 set CUR_HH=02
if %CUR_HH%==3 set CUR_HH=03
if %CUR_HH%==4 set CUR_HH=04
if %CUR_HH%==5 set CUR_HH=05
if %CUR_HH%==6 set CUR_HH=06
if %CUR_HH%==7 set CUR_HH=07
if %CUR_HH%==8 set CUR_HH=08
if %CUR_HH%==9 set CUR_HH=09

set CURRENT_DAY=%CUR_YYYY%%CUR_MM%%CUR_DD%
set CURRENT_DATE=%CUR_YYYY%%CUR_MM%%CUR_DD%-%CUR_HH%%CUR_MIN%%CUR_SS%
set LOG_FILE_NAME=LogStandard%CURRENT_DATE%


cd D:\Stage\amazon
call robot -d results/%LOGPATH%%CURRENT_DATE% tests/test.robot