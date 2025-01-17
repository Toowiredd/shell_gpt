#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Define the output file
OUTPUT_FILE="static_analysis_report.md"

# Clear the previous report
echo "# Static Code Analysis Report" > $OUTPUT_FILE
echo "" >> $OUTPUT_FILE

# Run pylint and append the output to the report
echo "## Pylint Report" >> $OUTPUT_FILE
pylint sgpt >> $OUTPUT_FILE || true
echo "" >> $OUTPUT_FILE

# Run flake8 and append the output to the report
echo "## Flake8 Report" >> $OUTPUT_FILE
flake8 sgpt >> $OUTPUT_FILE || true
echo "" >> $OUTPUT_FILE

echo "Static analysis complete. Results are in $OUTPUT_FILE"
