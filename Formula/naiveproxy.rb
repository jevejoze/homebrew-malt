class Naiveproxy < Formula
  desc "Network proxy"
  homepage "https://github.com/klzgrad/naiveproxy"
  version "143.0.7499.109-2"
  if Hardware::CPU.intel?
    url "https://github.com/klzgrad/naiveproxy/releases/download/v#{version}/naiveproxy-v#{version}-mac-x64.tar.xz"
    sha256 "2ffd08385a585b9925f08db3bfc43e4b06c35c1189500efc7a12cb5b27c8940e"
  else
    url "https://github.com/klzgrad/naiveproxy/releases/download/v#{version}/naiveproxy-v#{version}-mac-arm64.tar.xz"
    sha256 "7556194ef46859afd95505854ce621e3f57a4adac7ab11f5ef234dba7d831d8f"
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
