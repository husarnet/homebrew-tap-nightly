class Husarnet < Formula
  desc "Low latency P2P VPN solution for robotics and more"
  homepage "https://husarnet.com"
  url "https://nightly.husarnet.com/husarnet-macos-2.0.144-arm64.tar.gz"
  version "2.0.144"
  sha256 "03dbd2c39e15c4cebdfc13bdc572a21c6347401d8cee395c4fca89545358594d"
  license ""

  def install
    bin.install "husarnet-macos-arm64" => "husarnet"
    bin.install "husarnet-daemon-unix-macos_arm64" => "husarnet-daemon"
  end

  # def post_install
  #   print "Will attempt to install the service. This requires sudo privileges."
  #   system "sudo", "#{bin}/husarnet", "daemon", "service-install"
  # end

  def caveats
    <<~EOS
      If service installation fails, execute:
        sudo husarnet daemon service-install
      To start husarnet daemon and enable it on startup.
      Enjoy!
    EOS
  end

  service do
    run opt_bin/"husarnet-daemon"
    keep_alive true
    require_root true
    log_path var/"log/husarnet.log"
    error_log_path var/"log/husarnet.err.log"
  end

  test do
    system "#{bin}/husarnet", "version"
  end
end
