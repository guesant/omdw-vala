## Building

### Build requirements

- valac
- meson >= 0.55

### Build

```sh
git clone https://github.com/guesant/omdw.git
cd omdw
```

In order to simplify our workflow, all the scripts we need to setup-build-start are already defined.

- load scripts into the current shell session

  ```sh
  . scripts.sh
  ```

- `s:setup`

  ```sh
  s:setup # setup builddir
  ```

- `s:build`

  ```sh
  s:build # build the source code
  ```

> Check out all the scripts [here](../scripts.sh).

Now we can start our app with:

```sh
s:start omdw-gui app
```

If you've made a change to the source code, you can enjoy quick incremental build (thanks to [ninja build system](https://ninja-build.org/)!).

```sh
s:build-start omdw-gui app # (quick, cached from the previous build)
```
