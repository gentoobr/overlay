# `gentoobr` overlay

Overlay containing experimental packages developed by the brazilian community,
with focus on providing programs useful to portuguese speaking users and
introducing new people to contribute.

## Installing

This overlay can be installed both manually or using overlay managers, such as
`eselect-repository`. Don't forget to `emaint sync -a` or `emerge --sync`
after doing any installation procedure below.

### Using `eselect-repository`

```
eselect repository enable gentoobr
```

### Using `layman`

```
layman -L
layman -a gentoobr
```

### Manual installation

Create a file `/etc/portage/repos.conf/gentoobr.conf` containing:
```
[gentoobr]
sync-uri = https://github.com/gentoo-mirror/gentoobr.git
sync-type = git
sync-depth = 1
location = /var/db/repos/gentoobr
```

## Contributing

Please follow the guidelines below when submitting a pull request:

* Use `repoman` to create and verify commits;
* Commits must be signed (preferably following [GLEP 63][glep63]);

Also, use the following name convention for commits in the overlay:

* To add a package: `category/package: +`;
* To remove a package: `category/package: -`;
* To bump/update a package: `category/package: New version`;
* To change something else: `category/package: What changed`;

[glep63]: https://www.gentoo.org/glep/glep-0063.html
