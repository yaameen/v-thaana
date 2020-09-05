# V-Thaana

[![N|Solid](https://cldup.com/dTxpPi9lDf.thumb.png)](https://nodesource.com/products/nsolid)

[![Build Status](https://travis-ci.org/joemccann/dillinger.svg?branch=master)](https://travis-ci.org/joemccann/dillinger)

V-Thaana is a generic library with a directive for Vue.
Exports are
  - Thaana (standalone library with thaana transpilation)
  - `v-thaana` directive (default export)
 

# Features!

  - Import a HTML file and watch it magically convert to Markdown
  - Drag and drop images (requires your Dropbox account be linked)


### Installation

V-thaana requires nothing in particular as a dependancy.

Install the dependencies and devDependencies and start the server.

```sh
$ npm -i v-thaana
```

### Usage with Vue
```javascript
import thaana from 'v-thaana';
Vue.use(thaana);
```

### Usage Otherwise
```javascript
import { thaana } from 'v-thaana';

thaana(el, (v) => {
    // Handle app logic
}, options)

```

### Todos

 - Write Tests
 - Better doc

License
----
MIT


**Free Software, Hell Yeah!**
