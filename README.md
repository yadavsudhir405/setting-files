This project contains settings files related to `vim, zsh,` . Apart from this it contains vim plugins submodules.

# Vim

Vim is a text editor. Vim's powerfulness comes from it's plugin.There used to be different plugin manager to install plugin to vim before Vim-8.
Vim-8 and its onwards version introduced its default inbuilt plugin manager to manage plugins. Hence, after Vim-8 no need to install 
separate plugin manager to install plugin:

### How Vim default plugin manager works:
Vim default plugin manger works on convention. Plugin expects certain directories to be there in the System. It searches
and loads plugin from those directories.

 - Make a directories `.vim/pack` in home directory
 - Plugin look for plugins under `~/.vim/pack/*`
 - It automatically loads all plugins under `~/.vim/pack/*/start`
 - Any plugin under `~/.vim/pack/*/opt` are not loaded automatically. These plugins need to loaded manually by
`:packadd {plugin name}`

Say, now we need to install a plugin called `ReplaceWithRegister`, all we need to do is to checkout or download  
`ReplaceWithRegister` code and place under `~/.vim/pack/start/ReplaceWithRegister`

#### Better plugin directories management

Different editor theme like `Atom Dark One`  `materterail theme` etc can also be applied so that our editor look more
elegant. Again this is possible only via plugin. There are different type plugins available to add colors or theme to editor.

So, we can have directories structures like this:

  - `~/.vim/pack/plugins/start` for general plugins that needs to be loaded automatically
  - `~/.vim/pack/plugins/opt` for general plugins that needs to be added  manually
  - `~/.vim/pack/colors/start` for color or theme related plugins

We see `plugins` and `colors` directories have been added before `start` or `opt` and this will work because Plugin 
manager expects plugins to be under directories that follow this pattern `~/.vim/pack/*/start`. `*` playing important role here.

### Vim settings

All setting related to vim and its plugin are done in `~/.vimrc` file.

### 

Often a time it happens that there is a need to setup vim in multiple different machine say for example in personal and 
office machine. Setting up vim in multiple machine with same set of configuration can be little time consuming as we might 
need to do the same thing again and again and especially downloading or checking out each and individual plugins. So, what
we could do is, configuration files and plugins can be kept in git


