#!/bin/bash

# Your git configuration
git config user.name "danialch"
git config user.email "danialchpan@gmail.com"

# Set random seed
RANDOM=$(date +%s)

# Different types of updates to simulate real work
update_types=(
    "docs"
    "refactor"
    "chore"
    "style"
    "test"
    "perf"
    "fix"
    "feat"
)

# Realistic commit messages
commit_messages=(
    "Update documentation"
    "Fix formatting issues"
    "Add comments for clarity"
    "Refactor code structure"
    "Update dependencies"
    "Improve performance"
    "Add unit tests"
    "Clean up code"
    "Update README"
    "Fix minor bugs"
    "Optimize queries"
    "Update configuration"
    "Add error handling"
    "Improve logging"
    "Update API endpoints"
    "Add validation"
    "Remove deprecated code"
    "Update error messages"
)

# Function to get random element
random_element() {
    local arr=("$@")
    echo "${arr[RANDOM % ${#arr[@]}]}"
}

# Function to create a random update
create_random_update() {
    local type=$(random_element "${update_types[@]}")
    local message=$(random_element "${commit_messages[@]}")
    local date=$(date -u '+%Y-%m-%d')
    local time=$(date -u '+%H:%M:%S')
    local random_num=$((RANDOM % 1000 + 1))
    
    case $type in
        "docs")
            mkdir -p docs
            echo "# Documentation Update" > docs/update-$date-$random_num.md
            echo "Last updated: $date $time UTC" >> docs/update-$date-$random_num.md
            echo "Type: $type" >> docs/update-$date-$random_num.md
            echo "Author: danialch" >> docs/update-$date-$random_num.md
            echo "## Changes" >> docs/update-$date-$random_num.md
            echo "- Updated content structure" >> docs/update-$date-$random_num.md
            echo "- Added examples" >> docs/update-$date-$random_num.md
            echo "- Fixed typos" >> docs/update-$date-$random_num.md
            ;;
            
        "refactor")
            mkdir -p .refactor-logs
            echo "[$date $time] Refactored module $(($RANDOM % 10 + 1))" >> .refactor-logs/refactor.log
            echo "Changed lines: $(($RANDOM % 50 + 5))" >> .refactor-logs/refactor.log
            echo "Author: danialch" >> .refactor-logs/refactor.log
            echo "Refactoring type: $(random_element "structural" "algorithmic" "readability")" >> .refactor-logs/refactor.log
            echo "---" >> .refactor-logs/refactor.log
            ;;
            
        "chore")
            mkdir -p .chores
            echo "chore: $message" > .chores/$(date -u '+%Y-%m-%d')-$random_num.txt
            echo "Completed at: $time" >> .chores/$(date -u '+%Y-%m-%d')-$random_num.txt
            echo "User: danialch" >> .chores/$(date -u '+%Y-%m-%d')-$random_num.txt
            echo "Status: $(random_element "completed" "in-progress" "verified")" >> .chores/$(date -u '+%Y-%m-%d')-$random_num.txt
            ;;
            
        "style")
            mkdir -p .style-updates
            echo "Style update: $message" > .style-updates/style-$date-$random_num.txt
            echo "Formatting changes applied" >> .style-updates/style-$date-$random_num.txt
            echo "Updated by: danialch" >> .style-updates/style-$date-$random_num.txt
            echo "Files affected: $(($RANDOM % 5 + 1))" >> .style-updates/style-$date-$random_num.txt
            ;;
            
        "test")
            mkdir -p tests
            echo "Test suite updated" > tests/test-$(date -u '+%Y-%m-%d')-$random_num.txt
            echo "Tests passed: $(($RANDOM % 100 + 50))" >> tests/test-$(date -u '+%Y-%m-%d')-$random_num.txt
            echo "Coverage: $(($RANDOM % 30 + 70))%" >> tests/test-$(date -u '+%Y-%m-%d')-$random_num.txt
            echo "Author: danialch" >> tests/test-$(date -u '+%Y-%m-%d')-$random_num.txt
            echo "Test type: $(random_element "unit" "integration" "e2e")" >> tests/test-$(date -u '+%Y-%m-%d')-$random_num.txt
            ;;
            
        "perf")
            mkdir -p .performance
            echo "Performance improvement: $message" > .performance/perf-$date-$random_num.txt
            echo "Improvement: $(($RANDOM % 20 + 5))%" >> .performance/perf-$date-$random_num.txt
            echo "Optimized by: danialch" >> .performance/perf-$date-$random_num.txt
            echo "Metric: $(random_element "execution-time" "memory-usage" "load-time")" >> .performance/perf-$date-$random_num.txt
            ;;
            
        "fix")
            mkdir -p .fixes
            echo "Bug fix: $message" > .fixes/fix-$date-$random_num.txt
            echo "Fixed by: danialch" >> .fixes/fix-$date-$random_num.txt
            echo "Severity: $(random_element "minor" "major" "critical")" >> .fixes/fix-$date-$random_num.txt
            echo "Status: $(random_element "resolved" "verified" "deployed")" >> .fixes/fix-$date-$random_num.txt
            ;;
            
        "feat")
            mkdir -p .features
            echo "New feature: $message" > .features/feat-$date-$random_num.txt
            echo "Implemented by: danialch" >> .features/feat-$date-$random_num.txt
            echo "Priority: $(random_element "high" "medium" "low")" >> .features/feat-$date-$random_num.txt
            echo "Status: $(random_element "implemented" "tested" "reviewed")" >> .features/feat-$date-$random_num.txt
            ;;
            
        *)
            mkdir -p .updates
            echo "$message - $date $time" >> .updates/daily-log.txt
            echo "User: danialch" >> .updates/daily-log.txt
            ;;
    esac
    
    # Sometimes update multiple files
    if [ $(($RANDOM % 2)) -eq 0 ]; then
        echo "# Additional update $random_num" > .temp-$random_num.md
        echo "Content generated: $date $time" >> .temp-$random_num.md
        echo "Author: danialch" >> .temp-$random_num.md
        echo "Type: $(random_element "documentation" "comment" "config")" >> .temp-$random_num.md
    fi
    
    echo "✅ Created $type update: $message"
}

# Main execution
echo "🔄 Starting update process..."
echo "👤 User: danialch"
echo "📅 Date: $(date -u '+%Y-%m-%d %H:%M:%S UTC')"
echo ""

# Check if we already committed today
TODAY=$(date -u '+%Y-%m-%d')
if git log --since="$TODAY 00:00:00 UTC" --oneline | grep -q .; then
    echo "⚠️ Already committed today, creating a micro update..."
    mkdir -p .micro-updates
    echo "$(date -u '+%Y-%m-%d %H:%M:%S') - micro update by danialch" >> .micro-updates/tiny-log.txt
    echo "Micro update type: $(random_element "typo" "comment" "format")" >> .micro-updates/tiny-log.txt
    git add .micro-updates/
    git commit -m "chore: tiny update $(date -u '+%H:%M')" || echo "No changes"
    exit 0
fi

# Create 1-3 random updates
NUM_UPDATES=$((RANDOM % 3 + 1))
echo "📝 Creating $NUM_UPDATES update(s)..."

for i in $(seq 1 $NUM_UPDATES); do
    create_random_update
    sleep $((RANDOM % 3 + 1))
done

# Add all changes
git add .

# Commit if there are changes
if git diff --staged --quiet; then
    echo "⚠️ No changes to commit, creating empty commit"
    git commit --allow-empty -m "chore: keep streak alive - danialch $(date -u '+%Y-%m-%d')"
else
    MSG=$(random_element "${commit_messages[@]}")
    git commit -m "$MSG"
fi

echo ""
echo "✅ Update completed successfully!"
echo "📊 Commit created:"
git log -1 --oneline
