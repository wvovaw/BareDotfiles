#!/usr/bin/env bash

# Cleaning package cache
sudo xbps-remove -yO

# Removing orphaned packages
sudo xbps-remove -yo

# Purging old kernels...
sudo vkpurge rm all
