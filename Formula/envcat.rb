class Envcat < Formula
  VERSION = "1.0.3"
  BIN = "envcat-#{VERSION}.darwin-x86_64"
  SHA256 = "b9f32fdbec02734d3e93d66c06f1a5a592e8dbcbea6c217f7e9f7419e691a4a3"

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

    `envcat` and `envtpl` should now be in your PATH.
    See `envcat --help` for usage details.

    Enjoy!
  EOM
  end
end
