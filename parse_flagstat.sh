#!/bin/bash

# Получить имя входного BAM-файла из аргумента
BAM_FILE=$1

# Выполнить samtools flagstat и сохранить результат
flagstat_output=$(samtools flagstat $BAM_FILE)

# Извлечь процент картированных ридов
mapped_percentage=$(echo "$flagstat_output" | grep "mapped (" | head -n 1 | awk '{print $5}' | tr -d '()%')

# Вывести процент картированных ридов
echo "Процент картированных ридов: $mapped_percentage%"
