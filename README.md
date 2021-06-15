# Enzyme Swift Demo

Example which demonstrates autodiff of a simple differentiable function in Swift
with both Swift native autodiff and Enzyme.

This has only been tested on a MacOS x86 host system, but linux *should* also work.

As of this writing this requires a Swift toolchain built on or after 6/12/2021. Nightly
builds can be obtained here:

https://swift.org/download/#snapshots

Build and run the two variants with the "go" script in this directory. Note that
"go" declares the specific versions of the tools (llvm, swift, enzyme) that are
known to work.
