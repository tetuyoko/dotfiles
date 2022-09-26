# Shortcut-key for switch GCP configs.
function gconf() {
  projData=$(gcloud config configurations list | fzf)
  if echo "${projData}" | grep -E "^[a-zA-Z].*" > /dev/null ; then
    config=$(echo ${projData} | awk '{print $1}')
    gcloud config configurations activate ${config}

    echo "=== The current account is as follows ==="
    gcloud config configurations list | grep -m1 "${config}"
    cluster=$(kubectl config get-clusters | grep -m1 "${config}")
    if [ -n "${cluster}" ]; then; kubectl config use-context "${cluster}"; fi
  fi
}
zle -N gconf
