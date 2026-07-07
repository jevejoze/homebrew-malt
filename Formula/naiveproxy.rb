class Naiveproxy < Formula
  desc "Network proxy"
  homepage "https://github.com/klzgrad/naiveproxy"
  version "150.0.7871.63-1"
  if Hardware::CPU.intel?
    url "https://github.com/klzgrad/naiveproxy/releases/download/v#{version}/naiveproxy-v#{version}-mac-x64-x64.tar.xz"
    sha256 "92e7fe5f3cfca5e0cca49798e5c435a5bd7ef05b543c0aa614a5623ad39a50d4"
  else
    url "https://github.com/klzgrad/naiveproxy/releases/download/v#{version}/naiveproxy-v#{version}-mac-arm64-arm64.tar.xz"
    sha256 "315f946fa91a65a30b25b69bba88836a117838f58b616c6a58c970c9ff1d9bbf"
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
