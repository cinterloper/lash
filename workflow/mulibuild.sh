cd $BUILD_DIR
build() {
  docker build -t cinterloper/lash .
}
publish() {
  return true
}
release() {
  docker push cinterloper/lash
}
