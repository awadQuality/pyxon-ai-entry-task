#!/bin/bash

# Quick fix for macOS SSL certificate issue with NLTK
echo "🔧 Fixing SSL certificate issue..."

# Run benchmark with SSL fix
python3 -c "
import ssl
ssl._create_default_https_context = ssl._create_unverified_context
import nltk
nltk.download('punkt', quiet=True)
print('✅ NLTK data downloaded successfully')
"

echo ""
echo "🚀 Running benchmark suite..."
python3 benchmarks/benchmark_suite.py
