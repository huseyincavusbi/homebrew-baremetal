class Baremetal < Formula
  desc "LLM inference and training engine for Apple Silicon"
  homepage "https://github.com/huseyincavusbi/bare.metal"
  url "https://github.com/huseyincavusbi/bare.metal/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "be453e40e349737145fd1517c9291ea5c60542ae77e6890763297cecccd2e97e"
  license "MPL-2.0"
  head "https://github.com/huseyincavusbi/bare.metal.git", branch: "main"

  depends_on arch: :arm64
  depends_on macos: :tahoe
  depends_on xcode: :build

  bottle do
    root_url "https://github.com/huseyincavusbi/bare.metal/releases/download/v0.1.1"
    sha256 arm64_golden_gate: "8e974976da77dc6c1da5de9367a0ab7c645391dfe77ee74ff66f292c8d97e774"
    sha256 arm64_tahoe: "ea3cd11292c457d0b8f1e615ab6f9a2e172a66d9967660f652f6619d5398fe93"
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
