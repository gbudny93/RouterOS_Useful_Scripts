# RouterOS Function
# Copyright (c) Grzegorz Budny 
# Version 1.0 
# Last update: 2/8/2020
# Generates random string based on dictionary of six chars length

:global GenerateString do={

    :global generatedString; 
    
    :local characters q,w,e,r,t,y,u,i,o,p,l,k,j,h,g,f,1,2,3,4,5,6,7,8,9,0,d,s,a,z,x,c,v,b,n,m,M,N,B,V,C,X,Z,A,S,D,F,G,H,J,K,L,P,O,I,U,Y,T,R,E,W,Q;
      
    :local hour [:pick [/system clock get time] 0 2];
    :local minute [:pick [/system clock get time] 3 5];
    :local second [:pick [/system clock get time] 6 8];

    :if ((:pick $hour 0) = 0) do={

        :set $hour [:pick $hour 1]; 

    }
    :if ((:pick $minute 3) = 0) do={

        :set $minute [:pick $minute 4];
        
    }
    :if ((:pick $second 6) = 0) do={

        :set $second [:pick $second 7];
        
    }\
    else={

        :log warning "Something's wrong with system time. Check system time and NTP settings.";

    }

    :set $generatedString ($generatedString.([:pick $characters $hour].[:pick $characters $minute].[:pick $characters $second].\
    [:pick $characters ($hour/2)].[:pick $characters ($minute/2)].[:pick $characters ($second/2)]));
    
    :log info "...:::Random string generated:::..."

    :return ($generatedString);
    
}

$GenerateString;