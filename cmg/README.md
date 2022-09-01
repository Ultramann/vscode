# Development
1. Change `src/extension.ts`
2. Update `package.json` with new commands
3. Call `vsce package` in project root. Will yield file `cmg-<version>.vsix`
4. Run `code --install-extension cmg-<version>.vsix`
5. Extension should show up in extensions tab and directory