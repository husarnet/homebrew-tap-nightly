class Husarnet < Formula
  desc "Low latency P2P VPN solution for robotics and more"
  homepage "https://husarnet.com"
  url "https://nightly.husarnet.com/husarnet-macos-2.0.156-arm64.tar.gz"
  version "2.0.156"
  sha256 "6f7cdefd3294ae9dcd590a4454a353b48f5e1d08b04e0e037640ecf43ff88c77"
  license ""

  def install
    bin.install "husarnet-macos-arm64" => "husarnet"
    bin.install "husarnet-daemon-macos-macos_arm64" => "husarnet-daemon"
  end

  def caveats
    <<~CAVEATS
      Husarnet daemon requires root privileges to run. To install it as a service execute:
        sudo husarnet daemon service-install
      This will start husarnet daemon and enable it on OS startup.
      Enjoy!
    CAVEATS
  end

  test do
    system "#{bin}/husarnet", "version"
  end
end
