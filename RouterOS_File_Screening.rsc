# RouterOS Function
# Copyright (c) Grzegorz Budny 
# Removes files by specific name or file extansion 

:global FileScreening do={

    :local systemName [/system identity get name];
    :local filesNumber [/file print count-only];

    :local fileName;

    :for i from=0 to=$filesNumber step=1 do= \
    {

        :set fileName [/file get value-name=name number=$i];

        :if ($fileName ~ $keyWord) do={

            /file remove $fileName;

            :log warning ("...:::".$fileName." removed. Matched ".$keyWord.":::...");
            :set fileName;

        }
    }
}

$FileScreening keyWord=".txt";
