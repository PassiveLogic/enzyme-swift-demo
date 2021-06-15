import _Differentiation

// This is our differentiable function, y = a^2 + b^3. So complicated,
// thank goodness we have autodiff to determine the derivatives!
@differentiable(reverse)
public func awesome(a: Float, b: Float) -> Float {
    a * a + b * b * b
}

// 'valueWithGradient' is a magicly generated swift function to call the given
// function (awesome()) with the given parameters (3, 5) and return both the value
// (the result of awesome()) and the derivatives with respect to each of the inputs.
var (value, derivatives) = valueWithGradient(at: 3, 5, of: awesome)
print("awesome(3,5) = \(value), dA = \(derivatives.0), dB = \(derivatives.1)")

#if BENCHMARK
    var sum: Float = 0
    let iterations = 100_000_000

    for i in 1 ... iterations {
        (value, derivatives) = valueWithGradient(at: 3 * Float(i), 5 * Float(i), of: awesome)
        sum += value + derivatives.0 + derivatives.1 // just so the compiler can't optimize out the call.
    }

    print("Ran \(iterations) iterations, sum = \(sum).")

#endif
