# Build

## Backend

The following instructions allow to build backend incrementally.

* Enter GHC environment, where all dependencies for backend and frontend are configured to use GHC:
```
nix-shell -A shells.ghc
```
* Compile with `cabal new-build`:
```
cd app-back
cabal new-build exe:app-back
```
* Run result with `server.sh` script.

* You can use `ghcid` for hot recompilation:
```
ghcid -c "cabal new-repl lib:app-back"
```
Or for executable:
```
ghcid -c "cabal new-repl exe:app-back"
```

## Frontend

The following instructions allow to build frontend incrementally.

* Enter GHC environment, where all dependencies for backend and frontend are configured to use GHCJS:
```
nix-shell -A shells.ghcjs
```
* Compile with `cabal new-build`:
```
cd app-front
./build.sh
```
* In backend environment run server with `./serve.sh` script in `app-back` folder as current.
* Now open `http://127.0.0.1/index.html` in your browser.
