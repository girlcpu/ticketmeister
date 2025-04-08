# ticketmeister

> _i really need a better name for this_

support ticket bot written in the language i always try to justify using but never build anything with

---

## prerequisites

you need [swift] and [just]

if you want to cross-compile to linux you need the [static linux sdk]

## building & running

**note:** [just] loads `.env` files for us ❤️

```sh
just build      # <- build binary for current platform
just run [args] # <- where `[args]` gets passed into the program
```

<details>
<summary>advanced building</summary>

```sh
just build-macos-arm # <- the three supported platforms
just build-linux-x86
just build-linux-arm
just build-all        # <- build all 3 platforms at once
just release          # <- build all and package into a nice `release/` directory
```

</details>

[swift]: http://swift.org/install
[just]: http://just.systems
[static linux sdk]: https://www.swift.org/documentation/articles/static-linux-getting-started.html
