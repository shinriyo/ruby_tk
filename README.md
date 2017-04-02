# ruby_tk

## Install

```
set RUBY_CONFIGURE_OPTS "--enable-pthread --enable-shared \
                 --with-readline-dir=`brew --prefix readline` \
                 --with-openssl-dir=`brew --prefix openssl` \
                 --with-libyaml-dir=`brew --prefix libyaml` \
                 --with-opt-dir=`brew --prefix gdbm`:`brew --prefix gmp`:`brew --prefix libffi`" \
```

```
rbenv install 2.2.0
```

```
rbenv local 2.2.0
```

## Run

```
ruby tk.rb
```
