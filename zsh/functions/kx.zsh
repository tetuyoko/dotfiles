## Shortcut-key for switch kubernetes clusters.
#
function gke-activate() {
  name="$1"
  zone_or_region="$2"
  if echo "${zone_or_region}" | grep '[^-]*-[^-]*-[^-]*' > /dev/null; then
    echo "gcloud container clusters get-credentials \"${name}\" --zone=\"${zone_or_region}\""
    gcloud container clusters get-credentials "${name}" --zone="${zone_or_region}"
  else
    echo "gcloud container clusters get-credentials \"${name}\" --region=\"${zone_or_region}\""
    gcloud container clusters get-credentials "${name}" --region="${zone_or_region}"
  fi
}
function kx-complete() {
  _values $(gcloud container clusters list | awk '{print $1}')
}
function kx() {
  name="$1"
  if [ -z "$name" ]; then
    line=$(gcloud container clusters list | peco)
    name=$(echo $line | awk '{print $1}')
  else
    line=$(gcloud container clusters list | grep "$name")
  fi
  zone_or_region=$(echo $line | awk '{print $2}')
  gke-activate "${name}" "${zone_or_region}"
}
#compdef kx-complete kx
