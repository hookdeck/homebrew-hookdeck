# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Hookdeck < Formula
  desc "Hookdeck CLI utility"
  homepage "https://hookdeck.com"
  version "0.9.5"
  depends_on :macos

  if Hardware::CPU.intel?
    url "https://github.com/hookdeck/hookdeck-cli/releases/download/v0.9.5/hookdeck_0.9.5_darwin_amd64.tar.gz"
    sha256 "0aa0bdea51706ebc6a8cfb11eda1104f245f43e1c2b62ed1ad5b42b084079c94"

    def install
      bin.install "hookdeck"
      rm Dir["#{bin}/{hookdeck-completion.bash,hookdeck-completion.zsh}"]
      system bin/"hookdeck", "completion", "--shell", "bash"
      system bin/"hookdeck", "completion", "--shell", "zsh"
      bash_completion.install "hookdeck-completion.bash"
      zsh_completion.install "hookdeck-completion.zsh"
      (zsh_completion/"_hookdeck").write <<~EOS
        #compdef hookdeck
        _hookdeck () {
          local e
          e=$(dirname ${funcsourcetrace[1]%:*})/hookdeck-completion.zsh
          if [[ -f $e ]]; then source $e; fi
        }
      EOS
    end
  end
  if Hardware::CPU.arm?
    url "https://github.com/hookdeck/hookdeck-cli/releases/download/v0.9.5/hookdeck_0.9.5_darwin_arm64.tar.gz"
    sha256 "755493e4af7c0045b3e4453f78bf701b10ddbc6684e7f16cec935206b09da0f5"

    def install
      bin.install "hookdeck"
      rm Dir["#{bin}/{hookdeck-completion.bash,hookdeck-completion.zsh}"]
      system bin/"hookdeck", "completion", "--shell", "bash"
      system bin/"hookdeck", "completion", "--shell", "zsh"
      bash_completion.install "hookdeck-completion.bash"
      zsh_completion.install "hookdeck-completion.zsh"
      (zsh_completion/"_hookdeck").write <<~EOS
        #compdef hookdeck
        _hookdeck () {
          local e
          e=$(dirname ${funcsourcetrace[1]%:*})/hookdeck-completion.zsh
          if [[ -f $e ]]; then source $e; fi
        }
      EOS
    end
  end

  def caveats
    <<~EOS
      ❤ Thanks for installing the Hookdeck CLI! If this is your first time using the CLI, be sure to run `hookdeck login` first.
    EOS
  end
end
