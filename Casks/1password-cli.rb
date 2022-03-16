cask "1password-cli" do
  version "2.0.0"
  sha256 "0c2f6177346343d88d8db7ba3df469317cc37889eae2b61201ada70c740c4d1a"

  if version[0] == 1
    url "https://cache.agilebits.com/dist/1P/op/pkg/v#{version}/op_apple_universal_v#{version}.pkg",
        verified: "cache.agilebits.com/dist/1P/op/pkg/"
    homepage "https://support.1password.com/command-line/"
  else
    url "https://cache.agilebits.com/dist/1P/op#{version[0]}/pkg/v#{version}/op_apple_universal_v#{version}.pkg",
        verified: "cache.agilebits.com/dist/1P/op#{version[0]}/pkg/"
    homepage "https://developer.1password.com/docs/cli"
  end

  name "1Password CLI"
  desc "Command-line helper for the 1Password password manager"

  livecheck do
    if version[0] == 1
      url "https://app-updates.agilebits.com/product_history/CLI"
    else
      url "https://app-updates.agilebits.com/product_history/CLI#{version[0]}"
    end
    regex(%r{href=.*?/op_apple_universal[._-]v?(\d+(?:\.\d+)+)\.pkg}i)
  end

  pkg "op_apple_universal_v#{version}.pkg"

  uninstall pkgutil: "com.1password.op"

  zap trash: "~/.op"

  caveats "Read the upgrading guide when you come from version 1! https://developer.1password.com/docs/cli/upgrade"
end
