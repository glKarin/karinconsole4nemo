#!/bin/bash

if [ ! -d "./work" ]; then
	mkdir work;
fi

rm -rf ./work/*

cp ./karin-console_d work/konsole
cp -r toolbars/ work/toolbars

cd work

./konsole
