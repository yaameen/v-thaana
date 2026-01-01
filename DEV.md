# Development Guide

## Running Development Mode

### Option 1: Run Both Package and Sample Together (Recommended)

This runs TypeScript type checking in watch mode and the sample dev server simultaneously:

```bash
npm run dev:all
```

This will:
- Watch and type-check the TypeScript source files
- Run the sample Vite dev server (which uses the source files directly)

### Option 2: Run Individually

**Run TypeScript watch mode only:**
```bash
npm run dev
```

**Run sample project only:**
```bash
npm run dev:sample
```

## How It Works

The sample project's `vite.config.js` is configured to import directly from the source TypeScript files:

```js
alias: {
  '@yaameen/v-thaana': path.resolve(__dirname, '../src/index.ts')
}
```

This means:
- ✅ Changes to `src/index.ts` are immediately reflected in the sample
- ✅ No need to rebuild the package during development
- ✅ Vite handles TypeScript compilation automatically
- ✅ Hot module replacement works seamlessly

## Building for Production

When you're ready to build the package:

```bash
npm run build
```

This compiles TypeScript and generates:
- `dist/index.js` (CommonJS)
- `dist/index.esm.js` (ES Module)
- `dist/index.d.ts` (Type definitions)

