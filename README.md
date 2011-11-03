# Austin's Vim Configuration

I've had a fairly complete vim configuration at bitbucket for a while,
but have always had problems keeping it up to date. With a serious nod
to [Janus](http://github.com/carlhuda/janus), I've created this new vim
configuration based around tpope's
[Pathogen](http://github.com/tpope/vim-pathogen).

## Limitations and Issues

### Windows
The Windows behaviour here is much less ideal than I would like, as the
bundle installation is fairly tightly tied to git. This isn't as big a
deal as it may have been in the past as I'm not using Windows and not
expecting to at any point in the near future.

### Removing Bundles
Because I clone the bundles (and don't remove their .git directories),
running `rake install` will cause the bundle to be updated. If, however,
I remove a bundle from the install list in the Rakefile and run `rake
install`, the bundle will not be removed automatically.

### Cached/Frozen Installations
The `installable` directory is less ideal than I would like, especially
with `manpageview` and `google-golang`, which I would like to treat more
like Mustache (where I check out all of mustache but only install the
syntax file from the repo).

The cache for such bundles, though, may be unacceptably large even in an
age where disk is cheap—I don't necessarily need to have two copies of
golang on my system. Thus, for setups like golang, I may have the
Rakefile look for `$GOROOT/misc/vim` and symlink
`vimfiles/bundle/google-golang` to that and only install the cached
bundle in `installable/google-golang` if the system version can't be
found. This would mean that I would need to potentially remove the
`google-golang` bundle every install, however.

### Conflicts
At least some plug-ins have conflicts that haven't yet been worked out.

Some of these issues are in the source bundles, such as astashov's
[vim-ruby-debugger](http://github.com/astashov/vim-ruby-debugger)
bundle, where it unconditionally sets some mappings (as of 2011-11-02).
There's a pull request for a good change that will allow those mappings
to be suppressed by a user that needs to be integrated before I'll bring
it back into the bundle, or I'll have to fork it and make the
modifications myself.
