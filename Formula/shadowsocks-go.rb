class ShadowsocksGo < Formula
  desc "Secure SOCKS5 proxy"
  homepage "https://github.com/shadowsocks/go-shadowsocks2"
  version "0.1.3"
  url "https://github.com/shadowsocks/go-shadowsocks2/releases/download/v#{version}/shadowsocks2-macos.gz"
  sha256 "14d70cee68ae9c3fdf0be14f3640d177313048d241eaaaef9b4f976feccb31a9"
  license "Apache-2.0"

  def install
    bin.install "shadowsocks2-macos" => "ss-go"
  end
end
