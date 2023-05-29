class Ape < Formula
  NAME = "ape"
  VERSION = "1.0.0"

  if OS.mac?
    arch = "darwin-x86_64"
    sha256 "c4726dc95039e301e327387f7076bcfdecdb165efe17996d71b1adb19aebe34b"
  elsif Hardware::CPU.arm?
    arch = "linux-aarch64"
    sha256 "218f196a12eadda9da784d89c1e858aad7771764e52b0841b0b6709f9aec6641"
  else
    arch = "linux-x86_64"
    sha256 "8ce2711362d7b0a7dc2217c2c7bcbb98e4f41ea417b73656aec9f4b47c35f08f"
  end

  BIN = "#{NAME}-#{VERSION}.#{arch}"
  URL = "https://github.com/busyloop/ape/releases/download/v#{VERSION}/#{BIN}"

  homepage "https://github.com/busyloop/#{NAME}"
  url "#{URL}", using: :nounzip
  desc "#{NAME}"

  def install
    bin.install downloader.cached_location => NAME
  end
end
