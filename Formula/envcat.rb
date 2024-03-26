class Envcat < Formula
  VERSION = "1.1.1"
  SHA256 = "917e901f74174ab3fff6f9e9029241476544b09a0cdcd633a46b0645659e158b"
  BIN = "envcat-#{VERSION}.darwin-x86_64"

  desc "Meow!"
  homepage "https://github.com/busyloop/envcat"
  url "https://github.com/busyloop/envcat/releases/download/v#{VERSION}/#{BIN}", using: :nounzip

  sha256 SHA256

  on_linux do
    odie "Sorry, this formula currently only works for macOS"
  end

  def install
    bin.install downloader.cached_location => 'envcat'
    bin.install_symlink "envcat" => 'envtpl'
    greet!
  end

  def greet!
    msg.lines.each do |line|
      ohai line.chomp
    end
  end

  def msg; <<~EOM
    Installation successful.

     _._     _,-'""`-._
    (,-.`._,'(       |\\`-/|
        `-.-' \\ )-`( , o o)
              `-    \\`_`"'-

    `envcat` and `envtpl` are now in your PATH.
    See `envcat --help` for usage details.

    Enjoy!
  EOM
  end
end
