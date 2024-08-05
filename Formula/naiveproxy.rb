class Naiveproxy < Formula
  desc "Network proxy"
  homepage "https://github.com/klzgrad/naiveproxy"
  version "127.0.6533.64-2"
  if Hardware::CPU.intel?
    url "https://github.com/klzgrad/naiveproxy/releases/download/v#{version}/naiveproxy-v#{version}-mac-x64.tar.xz"
    sha256 "26cd21bece966ff51e3a675421176c5cc30b04b750b6f13f00e8db68b962c545"
  else
    url "https://github.com/klzgrad/naiveproxy/releases/download/v#{version}/naiveproxy-v#{version}-mac-arm64.tar.xz"
    sha256 "e042429807cc04a38d9918d9569ceee9f1796aac19d4f0248e03d40aafe91ed9"
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
