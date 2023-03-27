/*
#-----------------------------------------------------------------------------------

# Name:     refstate_transform.sql

# Purpose:  To create refstate table in transform schema -Monthly refresh table

# parameters:target_schema-transform
             source_schema-raw

# Author:   knarmada

# Version: initial version  06-28-22

#------------------------------------------------------------------------------------ */


create or replace table &{target_schema}.refstate as 
  select 
  to_varchar(cmsstatecode) as cmsstatecode , 
  to_timestamp(createdate) as createdate , 
  to_varchar(fipsstatecode) as fipsstatecode , 
  to_number(isactive,20,0) as isactive , 
  to_varchar(regioncode) as regioncode , 
  to_number(regionkey,20,0) as regionkey , 
  to_number(sortorder,20,0) as sortorder , 
  to_varchar(statecode) as statecode , 
  to_number(statekey,20,0) as statekey , 
  to_varchar(statename) as statename , 
  to_varchar(statesizecategory) as statesizecategory ,
  to_timestamp(updatedate) as updatedate 
  from &{source_schema}.refstate;