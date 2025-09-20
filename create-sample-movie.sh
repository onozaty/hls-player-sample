#!/bin/bash

# Sample movie creation script
# This script downloads a sample video and converts it to HLS format

set -e  # Exit on any error

echo "Creating sample movie for HLS player..."

# Create sample-movie directory
echo "Creating sample-movie directory..."
mkdir -p sample-movie

# Download sample video
echo "Downloading BigBuckBunny sample video..."
cd sample-movie
if [ ! -f "BigBuckBunny_320x180.mp4" ]; then
    curl -L -o BigBuckBunny_320x180.mp4 "https://download.blender.org/peach/bigbuckbunny_movies/BigBuckBunny_320x180.mp4"
    echo "Download completed."
else
    echo "BigBuckBunny_320x180.mp4 already exists, skipping download."
fi

# Convert to HLS using ffmpeg
echo "Converting video to HLS format..."
if command -v ffmpeg &> /dev/null; then
    # Create HLS segments and playlist
    ffmpeg -i BigBuckBunny_320x180.mp4 \
        -codec: copy \
        -start_number 0 \
        -hls_time 10 \
        -hls_list_size 0 \
        -f hls \
        BigBuckBunny_320x180.m3u8
    echo "HLS conversion completed successfully!"
    echo "Files created:"
    echo "  - BigBuckBunny_320x180.m3u8 (HLS playlist)"
    echo "  - segment files (*.ts)"
else
    echo "Error: ffmpeg is not installed. Please install ffmpeg to convert the video."
    echo "On Ubuntu/Debian: sudo apt update && sudo apt install ffmpeg"
    exit 1
fi

cd ..
echo "Sample movie setup completed in sample-movie/ directory"