alias b := build
alias c := clean
alias r := run

bin := "gamu"
gb-bin := bin + ".gba"

run:
  cargo run --quiet

build:
  cargo build --release --quiet
  arm-none-eabi-objcopy -O binary target/thumbv4t-none-eabi/release/{{bin}} {{gb-bin}}
  gbafix {{gb-bin}}

clean:
  cargo clean
  rm -rf {{gb-bin}}
