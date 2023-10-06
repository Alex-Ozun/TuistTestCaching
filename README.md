# Tuist test doesn't use cached targets (3.28.0).

![graph](graph.png)

`App` compiles in ~2 secs
`FeatureA` compiles in 10+ secs 

## Steps to reproduce:

1. Warm cache
```bash
tuist cache warm --xcframeworks
``` 
`FeatureA` should now be cached. 

2. Run tests. Both `App` and `FeatureA` are expected to be compiled and tested.
```bash
tuist test --clean
``` 

3. Modify `App` module, go to `App/Sources/AppDelegate.swift` and uncomment the last line: 
```diff
+ func hello() {}
- //func hello() {}
``` 
This invalidates `App` caches, but `FeatureA` caches are still valid. 

4. Run tests again and measure the time.  
```bash
time tuist test --clean
``` 

## Expected result:
 
Since `FeatureA` was not modified, we expect it to be replaced by the cached `xcframework` from Step 1, thus skipping BOTH compilation and testing.

## Actual result:

`FeatureA` is only skipped for testing, but is STILL compiled. You can observe that the last step takes 15+ seconds to complete and produces compilation logs for `FeatureA`:  
```
FeatureATests has not changed from last successful run, skipping...
Generating project FeatureA
[...]
[FeatureA] Processing FeatureA-Info.plist
[FeatureA] Compiling FeatureA_vers.c
[FeatureA] Touching FeatureA.framework
```
