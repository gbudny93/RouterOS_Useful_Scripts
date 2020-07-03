# RouterOS Fucntion 
# Copyright (c) Grzegorz Budny
# Version 1.0 
# Last update: 2020-04-19 19:02:12
# Array append value wrapper 

:global ArrayAppend do={

    :set ($array->([:len $array])) $value; 

}
