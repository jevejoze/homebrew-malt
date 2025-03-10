class Naiveproxy < Formula
  desc "Network proxy"
  homepage "https://github.com/klzgrad/naiveproxy"
  version "134.0.6998.39-1"
  if Hardware::CPU.intel?
    url "https://github.com/klzgrad/naiveproxy/releases/download/v#{version}/naiveproxy-v#{version}-mac-x64.tar.xz"
    sha256 "5864465ea5b294e7506fb8cf99cb2dfcabe33292d821c0fe898e738c7b6b4465"
  else
    url "https://github.com/klzgrad/naiveproxy/releases/download/v#{version}/naiveproxy-v#{version}-mac-arm64.tar.xz"
    sha256 "5a6f477b9941ff56b657ef7768d688d147219db6f5750e11cfe96534d006b282"
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
