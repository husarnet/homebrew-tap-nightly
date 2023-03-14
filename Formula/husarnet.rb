class Husarnet < Formula
  desc "Low latency P2P VPN solution for robotics and more"
  homepage "https://husarnet.com"
  version "2.0.83"
  url "https://nightly.husarnet.com/husarnet-macos-2.0.83-arm64.tar.gz"
  sha256 "b28449b7cb5adb5985018af4c162da7c2c430105e1ddd3dab2095e1f25df877b"
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
