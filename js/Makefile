all: Imaging.js Imaging.wasm

Imaging.js: build/libImaging.a prefix.js suffix1.js wrapper.js suffix2.js functions.json runtime_methods.json
	emcc --extern-pre-js prefix.js --extern-post-js suffix1.js --extern-post-js wrapper.js --extern-post-js suffix2.js -s MODULARIZE=1 -s ALLOW_MEMORY_GROWTH=1 -s EXPORTED_FUNCTIONS=@functions.json -s EXPORTED_RUNTIME_METHODS=@runtime_methods.json -O3 $< -o $@

Imaging.wasm: Imaging.js

functions.json: custom_functions.json build/libImaging.a
	printf '#include "%s"\n' ../ios/src/extra.h | emcc -I ../ios/src -I ../ios/src/blurhash -I ../codegen -E - | jq -nR --argfile c $< '[$$c,[inputs | select(test("IMAGING_EXPORT")) | scan("[^ ]+(?=\\()") | "_"+.]] | flatten' > $@

build/lib%.a: build/Makefile FORCE
	$(MAKE) -C build $*

build/Makefile:
	emcmake cmake -DCMAKE_BUILD_TYPE=Release -DJPEG_ENCODE=OFF -S ../ios/src -B build

FORCE:
