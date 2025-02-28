#!/bin/bash
usage() {
    echo "Usage: $0 [directory] [options]"
    echo "Options:"
    echo "  -n, --name <pattern>  Search by file name (supports regex)."
    echo "  -s, --size <size>     Search by file size (e.g., +1M, -500K)."
    echo "  -m, --mtime <days>    Search by modification time (e.g., -7 for last 7 days)."
    echo "  -h, --help            Show this help message."
    exit 1
}
