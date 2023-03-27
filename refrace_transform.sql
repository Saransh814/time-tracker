/*
#-----------------------------------------------------------------------------------

# Name:     refrace_transform.sql

# Purpose:  To create refrace table in transform schema -Monthly refresh table

# parameters:target_schema-transform
             source_schema-raw

# Author:   knarmada

# Version: initial version  06-28-22

#------------------------------------------------------------------------------------ */
  

create or replace table &{target_schema}.refrace as 
  select 
  to_timestamp(createdate) as createdate , 
  to_number(isactive,20,0) as isactive , 
  to_number(racecode,20,0) as racecode , 
  to_varchar(racedescription) as racedescription , 
  to_number(racekey,20,0) as racekey , 
  to_number(sortorder,20,0) as sortorder ,
  to_timestamp(updatedate) as updatedate 
from &{source_schema}.refrace;