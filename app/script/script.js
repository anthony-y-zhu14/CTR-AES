(async() => {
        const response = await fetch('main.wasm');
        const bytes = await response.arrayBuffer();
        const { instance } = await WebAssembly.instantiate(bytes);

        console.log('The answer is: ' + instance.exports.add(1, 2));
      })();