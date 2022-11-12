![akıllı CMS](https://raw.githubusercontent.com/akilli/cms/master/gui/cms.svg?sanitize=true)

# `akilli/cms`

[akilli/php](https://github.com/akilli/php) based PHP image including the cms source files and defining an `ONBUILD`
command

```
ONBUILD COPY . /opt/
```

so that you can easily extend it by creating a custom `Dockerfile` with just the following line in it

```
FROM akilli/cms
```
