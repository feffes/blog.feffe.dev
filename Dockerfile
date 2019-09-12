FROM registry.gitlab.com/pages/hugo/hugo_extended:latest AS build
WORKDIR /build
COPY . .
RUN /usr/bin/hugo





FROM abhin4v/hastatic
WORKDIR /opt/blog.feffe.dev
COPY --from=build /build/public/ .
CMD ["/usr/bin/hastatic"]