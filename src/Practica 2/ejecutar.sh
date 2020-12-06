#!/bin/bash
#-*- ENCODING: UTG-8 -*-

nasm Practica2.asm -fbin -o Practica.com
dosbox ./Practica.com -exit
exit
