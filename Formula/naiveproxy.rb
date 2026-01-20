class Naiveproxy < Formula
  desc "Network proxy"
  homepage "https://github.com/klzgrad/naiveproxy"
  version "140.0.7339.123-2"

  if Hardware::CPU.intel?
    url "https://github.com/klzgrad/naiveproxy/releases/download/v#{version}/naiveproxy-v#{version}-mac-x64.tar.xz"
    sha256 "f37d0c51781d8b4de5be64d23174b3a25c3baa3dc6ab985f74e395ae872b5a8b"
  else
    url "https://github.com/klzgrad/naiveproxy/releases/download/v#{version}/naiveproxy-v#{version}-mac-arm64.tar.xz"
    sha256 "92249395f1f881fbfc1f69a06ff5a1b7c7da36f1f82c76892cf948f7999e8324"
  end

  license "BSD-3-Clause"

  def install
    bin.install "naive"
    pkgetc.install "config.json"
  end

  service do
    run [opt_bin/"naive", etc/"naiveproxy/config.json"]
    keep_alive true
    log_path var/"log/naiveproxy.log"
    error_log_path var/"log/naiveproxy.log"
  end
end
