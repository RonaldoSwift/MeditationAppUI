#  Aplicacion de Meditación (iOS 15/SwiftUi)
Esta aplicación permite al usuario iniciar sesión, registrarse, verificar saldo, cuentas, transferencias, etc. 

<p align="center">
    <img src="Screenshots/WelcomeScreenshot.png" alt="icon" width="30%"/>
    <img src="Screenshots/LoginScreenshot.png" alt="icon" width="30%"/>
    <img src="Screenshots/ConsultasViewScreenshot.png" alt="icon" width="30%"/>
</p>

#  Arquitectura de la aplicación 
<p align="center">
    <img src="Screenshots/MainLogo.png" alt="icon" width="80%"/>
</p>

## Important!

1. Go to the root and run `chmod +x .git/hooks/pre-commit` if there's a problem when doing commits (`'The '.git/hooks/pre-commit' hook was ignored`)
2. Los miembros del equipo tienen que tener la misma version de cocoapods (`brew upgrade cocoapods`).
3. Por mas que tengas la misma version, aveces no se puede instalar una version especifica (pod 'Alamofire', '~> 5.9’), para eso necesitamos `pod search Alamofire —simple`
4. Finalmente hacemos `pod update`
5. Finalmente pod install 
6. El desarrollador que tiene la computador con la arquitecture chip silicon, debería configurar e instalar las primeras libs en el proyecto.
7. If you get an error message popup `Commit Failed` when commiting, just ignore it (xcode doesn't show a better title when using pre-commit hook).

## Prerequisites

1. Go back to the root folder.
2. Instala Homebrew.
3. Instala SwiftGen

```sh
brew update
brew install swiftgen
```

4. Verifica que tienes instalado swiftgen

```sh
switfgen --version
SwiftGen v6.6.2 (Stencil v0.15.1, StencilSwiftKit v2.10.1, SwiftGenKit v6.6.2)
```

5. Instala SwiftLint

```sh
brew install swiftlint
```

6. Verifica que tienes swiftlint instalado

```sh
swiftlint --version
0.53.0
```

7. Instalar swiftformat
```
brew install swiftformat
```

8. See list of rules
```
swiftformat --ruleinfo
```

9. Instala Sourcery

```sh
brew install sourcery
2.1.2
```

10. Change `User Script Sandboxing` to NO (to avoid problems with swiftlint and non-swift files from cocoapods)


## Libraries

* SwiftGen
* SwiftLint - Installed with homebrew, and used in Build Phases (https://isnihal.medium.com/simple-guide-to-adding-swiftlint-to-your-xcode-project-11d2ed20da26)
* SwiftFormat - https://timothyobeisun.medium.com/installing-swiftformat-in-your-ios-app-6f80135a2ea0
* netfox
* Sourcery
* ShowTime
* Factory
* Github Actions - https://medium.com/adessoturkey/github-actions-with-swift-5b3da0dbad00
* iOS Design Guidelines - https://experience.sap.com/fiori-design-ios/article/colors/#horizon-theme
* SDWebImageSwiftUI (Download images from URL) - https://github.com/SDWebImage/SDWebImageSwiftUI
* Swinject (For dependency Injection) - https://github.com/Swinject/Swinject
* Keychain (Store encrypted data) - https://github.com/kishikawakatsumi/KeychainAccess?tab=readme-ov-file


## Especificaciones

1. Soporte iOS version: 16.0
2. Soporte para plataformas iPhone y iPad

## Common issues

* Avoid using names for colors like `secondaryLabel` because it already exists and you'll get an error in the `GeneratedAssetSymbols` file.
* Remember to setup your `.github/workflow/swift` in a similar way as your local environment (same macos-version, same xcode-version, available emulators, etc) to avoid issues in github actions.
* After adding a new configuration (like QA), there's was a common error `error: Unable to load contents of file list: '/Target Support Files/Pods-`. You can also find errors with firebase libs (init classes).
I could fix it by running:
```
pod deintegrate
pod install
```
