#!/usr/bin/env bash

CODE_SIGN_IDENTITY="Developer ID Application: Human Person (TEAMIDHERE)"

codesign -f -s "$CODE_SIGN_IDENTITY" -o runtime bin/updater3.app/Contents/Frameworks/Sparkle.framework/Versions/B/XPCServices/Installer.xpc

# For Sparkle versions >= 2.6
codesign -f -s "$CODE_SIGN_IDENTITY" -o runtime --preserve-metadata=entitlements bin/updater3.app/Contents/Frameworks/Sparkle.framework/Versions/B/XPCServices/Downloader.xpc

# For Sparkle versions < 2.6
#codesign -f -s "$CODE_SIGN_IDENTITY" -o runtime --entitlements Entitlements/Downloader.entitlements bin/updater3.app/Contents/Frameworks/Sparkle.framework/Versions/B/XPCServices/Downloader.xpc

codesign -f -s "$CODE_SIGN_IDENTITY" -o runtime bin/updater3.app/Contents/Frameworks/Sparkle.framework/Versions/B/Autoupdate
codesign -f -s "$CODE_SIGN_IDENTITY" -o runtime bin/updater3.app/Contents/Frameworks/Sparkle.framework/Versions/B/Updater.app
codesign -f -s "$CODE_SIGN_IDENTITY" -o runtime bin/updater3.app/Contents/Frameworks/Sparkle.framework

ditto -c -k --sequesterRsrc --keepParent bin/updater3.app bin/updater3.zip

mv bin/updater3.zip static/updater3.zip