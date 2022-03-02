class Naiveproxy < Formula
  desc "Network proxy"
  homepage "https://github.com/klzgrad/naiveproxy"
  version "98.0.4758.80-2"
  if Hardware::CPU.intel?
    url "https://github.com/klzgrad/naiveproxy/releases/download/v#{version}/naiveproxy-v#{version}-mac-x64.tar.xz"
    sha256 "84b5b9578dda0eb5c1083417384264203a02370f5251ea0620aae4aa6be0dfdb"
  else
    url "https://github.com/klzgrad/naiveproxy/releases/download/v#{version}/naiveproxy-v#{version}-mac-arm64.tar.xz"
    sha256 "12e7db4f1be0b3f015700a523efa3a0540f8fb74094e7cb095063a142e32b2fc"
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
