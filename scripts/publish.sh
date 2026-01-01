#!/bin/bash

# Semantic versioning and publish script for v-thaana
# Usage: ./scripts/publish.sh [patch|minor|major]

set -e

VERSION_TYPE=${1:-patch}

if [[ ! "$VERSION_TYPE" =~ ^(patch|minor|major)$ ]]; then
  echo "Error: Version type must be 'patch', 'minor', or 'major'"
  echo "Usage: ./scripts/publish.sh [patch|minor|major]"
  exit 1
fi

echo "🚀 Publishing v-thaana ($VERSION_TYPE version bump)"

# Check if working directory is clean
if [[ -n $(git status --porcelain) ]]; then
  echo "⚠️  Warning: Working directory has uncommitted changes"
  read -p "Continue anyway? (y/N) " -n 1 -r
  echo
  if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    exit 1
  fi
fi

# Check if we're on main/master branch
CURRENT_BRANCH=$(git branch --show-current)
if [[ "$CURRENT_BRANCH" != "main" && "$CURRENT_BRANCH" != "master" ]]; then
  echo "⚠️  Warning: Not on main/master branch (currently on $CURRENT_BRANCH)"
  read -p "Continue anyway? (y/N) " -n 1 -r
  echo
  if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    exit 1
  fi
fi

# Build the package
echo "📦 Building package..."
npm run build

# Get current version
CURRENT_VERSION=$(node -p "require('./package.json').version")
echo "Current version: $CURRENT_VERSION"

# Bump version
echo "⬆️  Bumping $VERSION_TYPE version..."
npm version $VERSION_TYPE --no-git-tag-version

# Get new version
NEW_VERSION=$(node -p "require('./package.json').version")
echo "New version: $NEW_VERSION"

# Publish to npm
echo "📤 Publishing to npm..."
npm publish

# Create git tag and commit
echo "🏷️  Creating git tag..."
git add package.json package-lock.json 2>/dev/null || true
git commit -m "chore: bump version to $NEW_VERSION" || true
git tag "v$NEW_VERSION"

# Push to remote
echo "📡 Pushing to remote..."
git push
git push --tags

echo "✅ Successfully published v-thaana@$NEW_VERSION"

