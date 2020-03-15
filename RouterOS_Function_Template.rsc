# RouterOS Function/Script 
# Copyright (c) Grzegorz Budny 
# Version 1.0
# Last update: 2/8/2020
# Description of this what script/function does 

# Function definition 
:global RouterOS_Function do={

  # DEFINITIONS
  # Getters section
  # Global variables definition - split out defined and undefined variables during declaring
  :global globalDefinedVariable [/system identity get value-name=name];
  :global globalDefinedVariable2 [/system identity get value-name=name];
  
  :global globalUndefinedVariable;
  :global globalUndefinedVariable2;
  
  # Local variables definition - split out defined and undefined variables during declaring
  :local localDefinedVariable [/system identity get value-name=name];
  :local localDefinedVariable2 [/system identity get value-name=name];
  
  :local localUndefinedVariable;
  :local localUndefinedVariable2;
  
  # Setters section
  :set $globalUndefinedVariable [/system identity get value-name=name];
  :set $localUndefinedVariable [:toarray $localUndefinedVariable];
  
  # MAIN SCRIPT 
  :log info ("This is my script with ".$localDefinedVariable2."\n");
  /system reboot; 
  
}

# Example 
RouterOS_Function functionParameter=parameterDefinition;