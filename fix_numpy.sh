#!/bin/bash

echo "🔧 Fixing NumPy compatibility issue..."
echo ""

# Uninstall NumPy 2.x
echo "Removing NumPy 2.x..."
python3 -m pip uninstall -y numpy

# Install NumPy 1.x
echo "Installing NumPy 1.x (compatible with ChromaDB)..."
python3 -m pip install "numpy<2.0"

echo ""
echo "✅ NumPy downgraded successfully!"
echo ""
echo "Now you can run: python3 benchmarks/benchmark_suite.py"
