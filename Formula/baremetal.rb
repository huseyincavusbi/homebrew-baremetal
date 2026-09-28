class Baremetal < Formula
  desc "LLM inference and training engine for Apple Silicon"
  homepage "https://github.com/huseyincavusbi/bare.metal"
  url "https://github.com/huseyincavusbi/bare.metal/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "60f77332863a1fb759223b7d8c7a309946394afcb0fa731b2505d8d928332e68"
  license "MPL-2.0"
  head "https://github.com/huseyincavusbi/bare.metal.git", branch: "main"

  depends_on arch: :arm64
  depends_on macos: :tahoe
  depends_on xcode: :build

  bottle do
    root_url "https://github.com/huseyincavusbi/bare.metal/releases/download/v0.1.0"
    sha256 arm64_golden_gate: "f04dd4174ccd57598991d2e994ade2543d26f2cda9a7c192a08c703fa99fd82a"
    sha256 arm64_tahoe: "54895eab2ef170dd9cddadb58b0c912ab7a38b21b17776ceb1fc80d8f0e810ee"
  end

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
