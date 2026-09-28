class Baremetal < Formula
  desc "LLM inference and training engine for Apple Silicon"
  homepage "https://github.com/huseyincavusbi/bare.metal"
  head "https://github.com/huseyincavusbi/bare.metal.git", branch: "main"
  license "MPL-2.0"

  depends_on arch: :arm64
  depends_on macos: :tahoe
  depends_on xcode: :build

  def install
    system "make", "baremetal", "baremetal-train"
    libexec.install "build/baremetal", "build/baremetal-train"
    (share/"baremetal/kernels").install "build/kernels/default.metallib"
    bin.install_symlink libexec/"baremetal"
    bin.install_symlink libexec/"baremetal-train"
  end

  test do
    assert_match "Usage", shell_output("#{bin}/baremetal 2>&1", 1)
  end
end
