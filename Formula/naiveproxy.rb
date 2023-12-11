class Naiveproxy < Formula
  desc "Network proxy"
  homepage "https://github.com/klzgrad/naiveproxy"
  version "120.0.6099.43-1"
  if Hardware::CPU.intel?
    url "https://github.com/klzgrad/naiveproxy/releases/download/v#{version}/naiveproxy-v#{version}-mac-x64.tar.xz"
    sha256 "e617e6a9c7feda69508c11a730844fd5dbf2e6cc9419cbf2b629142c713bb240"
  else
    url "https://github.com/klzgrad/naiveproxy/releases/download/v#{version}/naiveproxy-v#{version}-mac-arm64.tar.xz"
    sha256 "7818d44f29f65a92d4f7e5daaf9b02d1e0093e292bf7ce7926492dc21a95f055"
  end
  license "BSD-3-Clause"

  def install
    bin.install "naive"
    pkgetc.install "config.json"
  end
  
  service do
    run [opt_bin/"naive","/etc/naiveproxy/config.json"]
    keep_alive true
    error_log_path var/"log/naive.log"
    log_path var/"log/naive.log"
    working_dir ENV["HOME"]
  end
end
