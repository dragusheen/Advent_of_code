#!/bin/bash

YEAR=$(date +%Y)
DAY=$(date +%d)

if [ ! -z "$1" ]; then
    if [[ $1 =~ ^[0-9]{4}$ ]]; then
        YEAR=$1
    else
        echo "Invalid year"
        exit 1
    fi
fi

if [ ! -z "$2" ]; then
    if [[ $2 =~ ^[0-9]{1,2}$ ]]; then
        DAY=$2
    else
        echo "Invalid day"
        exit 1
    fi
fi

if [ ! -d "./src/$YEAR" ]; then
    mkdir ./src/$YEAR
fi

if [ ! -d "./data/$YEAR" ]; then
    mkdir ./data/$YEAR
fi

if [ ! -f "./src/$YEAR/$DAY" ]; then
    touch ./src/$YEAR/day_$DAY

    echo "#!/usr/bin/python3" >> ./src/$YEAR/day_$DAY
    echo "" >> ./src/$YEAR/day_$DAY
    echo "DATA_PATH = \"./data/$YEAR/day_$DAY.txt\"" >> ./src/$YEAR/day_$DAY
    echo "" >> ./src/$YEAR/day_$DAY
    echo "def get_file_content(filepath):" >> ./src/$YEAR/day_$DAY
    echo "    with open(filepath, 'r') as file:" >> ./src/$YEAR/day_$DAY
    echo "        return file.read()" >> ./src/$YEAR/day_$DAY
    echo "" >> ./src/$YEAR/day_$DAY
    echo "def part_1(content):" >> ./src/$YEAR/day_$DAY
    echo "    pass" >> ./src/$YEAR/day_$DAY
    echo "" >> ./src/$YEAR/day_$DAY
    echo "def part_2(content):" >> ./src/$YEAR/day_$DAY
    echo "    pass" >> ./src/$YEAR/day_$DAY
    echo "" >> ./src/$YEAR/day_$DAY
    echo "if __name__ == \"__main__\":" >> ./src/$YEAR/day_$DAY
    echo "    content = [row for row in get_file_content(DATA_PATH).split(\"\n\") if row]" >> ./src/$YEAR/day_$DAY
    echo "    print(f\"Part 1: {part_1(content)}\")" >> ./src/$YEAR/day_$DAY
    echo "    print(f\"Part 2: {part_2(content)}\")" >> ./src/$YEAR/day_$DAY

    chmod 777 ./src/$YEAR/day_$DAY

    touch ./data/$YEAR/day_$DAY.txt

    echo "Created ./src/$YEAR/day_$DAY"
    echo "Created ./data/$YEAR/day_$DAY"
else
    echo "File ./src/$YEAR/day_$DAY already exists"
fi
