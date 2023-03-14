class Husarnet < Formula
  desc "Low latency P2P VPN solution for robotics and more"
  homepage "https://husarnet.com"
  version "2.0.82"
  url "https://nightly.husarnet.com/husarnet-macos-2.0.82-arm64.tar.gz"
  sha256 "9a1f412bd75f584e9b93fc91f8c824d70d0f31c29ab3ac1507516354adc83c84"
  license ""

  def install
    bin.install "husarnet-macos-arm64" => "husarnet"
    bin.install "husarnet-daemon-unix-macos_arm64" => "husarnet-daemon"
    # will hopefully install the service in launchd
    system "#{bin}/husarnet", "daemon", "service-install"
  end

  test do
    system "#{bin}/husarnet", "version"
  end
end
