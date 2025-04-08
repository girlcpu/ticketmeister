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
just build        # <- build binary for current platform
just run [args]   # <- where `[args]` gets passed into the program
just debug [args] # <- the same as run but for debugging

just update    # <- resolve and update dependencies
just clean     # <- shortcut to swift package clean
just deepclean # <- remove all build caches
```

<details>
<summary>advanced building</summary>

```sh
just build-macos-arm # <- the three supported platforms
just build-linux-x86 #
just build-linux-arm #
just build-all       # <- build all platforms
```

</details>

[swift]: http://swift.org/install
[just]: http://just.systems
[static linux sdk]: https://www.swift.org/documentation/articles/static-linux-getting-started.html
