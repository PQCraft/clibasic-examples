#!/usr/bin/env clibasic
COLOR 10
DO
?PAD$(HEX$(RAND(2^64-1)),16,"0");PAD$(HEX$(RAND(2^64-1)),16,"0");PAD$(HEX$(RAND(2^64-1)),16,"0");PAD$(HEX$(RAND(2^64-1)),16,"0")
LOOP
