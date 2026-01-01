# V-Thaana

[![N|Solid](https://cldup.com/dTxpPi9lDf.thumb.png)](https://nodesource.com/products/nsolid)

[![Build Status](https://travis-ci.org/joemccann/dillinger.svg?branch=master)](https://travis-ci.org/joemccann/dillinger)

V-Thaana is a Vue directive and standalone library for Thaana (Maldivian script) input with full TypeScript support.

## Features

- ✅ **Vue 2 & Vue 3 Compatible** - Works with both Vue 2 and Vue 3
- ✅ **TypeScript Support** - Fully typed with TypeScript definitions
- ✅ **Two Keyboard Layouts** - Phonetic and Typewriter layouts
- ✅ **Input & Textarea Support** - Works with both input and textarea elements
- ✅ **Standalone Function** - Can be used without Vue
- ✅ **Modern Package Structure** - Proper ES modules and CommonJS support

## Installation

```bash
npm install v-thaana
```

## Usage

### As a Vue Plugin

```javascript
import Vue from 'vue';
import vThaana from 'v-thaana';

Vue.use(vThaana, {
  keyboard: 'phonetic' // or 'typewriter'
});

// In your template
<input v-thaana v-model="text" type="text" />
<textarea v-thaana v-model="text"></textarea>
```

### TypeScript Usage

```typescript
import Vue from "vue";
import vThaana, { ThaanaOptions } from "v-thaana";

const options: ThaanaOptions = {
  keyboard: "phonetic",
};

Vue.use(vThaana, options);
```

### Standalone Function

```javascript
import { thaana } from "v-thaana";

const input = document.querySelector("#my-input");
thaana(
  input,
  (value) => {
    console.log("Updated value:", value);
  },
  {
    keyboard: "phonetic",
  }
);
```

### TypeScript Standalone Usage

```typescript
import { thaana, ThaanaOptions } from "v-thaana";

const input = document.querySelector("#my-input") as HTMLInputElement;
const options: ThaanaOptions = {
  keyboard: "phonetic",
};

thaana(
  input,
  (value: string) => {
    console.log("Updated value:", value);
  },
  options
);
```

## API

### Types

```typescript
type KeyboardType = "phonetic" | "typewriter";

interface ThaanaOptions {
  keyboard?: KeyboardType;
}

interface ThaanaUpdateCallback {
  (value: string): void;
}
```

### Functions

#### `thaana(el, updateCallback, options?)`

Standalone function to enable Thaana input on an element.

- `el`: `HTMLInputElement | HTMLTextAreaElement` - The input element
- `updateCallback`: `ThaanaUpdateCallback` - Callback function called when value changes
- `options`: `ThaanaOptions` - Optional configuration

## Keyboard Layouts

### Phonetic Layout

The phonetic layout maps English QWERTY keys to Thaana characters based on phonetic similarity.

### Typewriter Layout

The typewriter layout uses the traditional Thaana typewriter keyboard mapping.

## Sample Project

A complete sample project is included in the `sample/` directory. To run it:

```bash
cd sample
npm install
npm run dev
```

## Development

### Building

```bash
npm run build
```

This will:

- Compile TypeScript to JavaScript
- Generate type definitions (`.d.ts` files)
- Create both CommonJS and ES module builds

### Development Mode

```bash
npm run dev
```

Runs TypeScript compiler in watch mode.

### Publishing

The package includes scripts for semantic versioning and publishing:

**Quick publish (recommended):**

```bash
# Using the shell script (handles everything)
./scripts/publish.sh [patch|minor|major]
```

**Using npm scripts:**

```bash
# Patch version (1.0.2 -> 1.0.3) - bug fixes
npm run release:patch

# Minor version (1.0.2 -> 1.1.0) - new features
npm run release:minor

# Major version (1.0.2 -> 2.0.0) - breaking changes
npm run release:major
```

**Manual version bump (without publishing):**

```bash
npm run version:patch  # or version:minor, version:major
```

**Publish without git operations:**

```bash
npm run publish:patch  # or publish:minor, publish:major
```

The release scripts will:

1. Build the package
2. Bump the version in `package.json`
3. Publish to npm
4. Create a git tag
5. Push to remote repository

## Project Structure

```
v-thaana/
├── src/
│   └── index.ts          # Main source code
├── dist/                 # Built files (generated)
├── sample/               # Sample/demo project
│   ├── src/
│   │   ├── App.vue
│   │   └── main.js
│   └── ...
├── package.json
├── tsconfig.json
└── README.md
```

## License

MIT

**Free Software, Hell Yeah!**
