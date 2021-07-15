# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Hookdeck < Formula
  desc "Hookdeck CLI utility"
  homepage "https://hookdeck.com"
  version "0.4.1"
  bottle :unneeded

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/hookdeck/hookdeck-cli/releases/download/v0.4.1/hookdeck_0.4.1_mac-os_x86_64.tar.gz"
    sha256 "3fbf9098e78b91148e29e9b3f9128c38035a09e3297c4a184cd0cf85db16a58e"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/hookdeck/hookdeck-cli/releases/download/v0.4.1/hookdeck_0.4.1_mac-os_arm64.tar.gz"
    sha256 "2c3d2e2689074967805957340672520dd44822bc88a536b18b68070c09351f07"
  end

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

  def caveats; <<~EOS
    ❤ Thanks for installing the Hookdeck CLI! If this is your first time using the CLI, be sure to run `hookdeck login` first.
  EOS
  end
end
