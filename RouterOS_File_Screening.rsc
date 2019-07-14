:global n [file get value-name=name number=2]
:if ($n ~ ".txt") do={/file remove $n} else={:put "No"}