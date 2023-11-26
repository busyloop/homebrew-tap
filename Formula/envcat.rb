class Envcat < Formula
  VERSION = "1.1.0"
  BIN = "envcat-#{VERSION}.darwin-x86_64"
  SHA256 = "be4f427f8d30df6515fd80e0c62bda24a9038567f57df59bad78d45ad968d26d"

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
