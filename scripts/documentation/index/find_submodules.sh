#!/usr/bin/env bash

find . -name .gitmodules -exec cat {} \; > index/submodules.txt