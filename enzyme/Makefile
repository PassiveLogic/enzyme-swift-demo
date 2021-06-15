all: Awesome

clean:
	rm -f *bc *.s *.o Awesome

# First pass of the build: swift compile to llvm bytecode. -Ounchecked is important here;
# the emitted bounds checking code causes enzyme to fail.
Awesome.bc: Awesome.swift
	swiftc -D BENCHMARK -import-objc-header enzyme.h -emit-bc -Ounchecked $< -o $@

# Second pass: now we enzyme the bytecode; this generates the derivative functions.
Awesome.enzyme-bc: Awesome.bc
	opt $< -load=$(ENZYME) -enzyme -S -o $@

# Third pass: now we LLVM optimize the resultant code.
Awesome.opt-bc: Awesome.enzyme-bc
	opt -O2 $< -o $@

# Now we generate assembler from the optimized bytecode
Awesome.s: Awesome.opt-bc
	llc -o $@ $<

# We assemble the result
Awesome.o: Awesome.s
	as  $< -o $@

# And now finally we can link an executable. Fortunately we can just pass the .o to the
# swiftc driver and it does the right thing.
Awesome: Awesome.o
	swiftc $<  -o $@

