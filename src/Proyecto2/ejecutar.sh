#!/bin/bash
#-*- ENCODING: UTG-8 -*-

nasm Proyecto2.asm -fbin -o proyecto.com
dosbox ./proyecto.com -exit
exit
