function _tide_item_kubectl
    kubectl config view --minify --output 'jsonpath={.current-context}' 2>/dev/null | read -l context
    if string match -rq '^gke_.*_(?P<cluster>[\\w-]+)' $context
        set color $tide_kubectl_color
        if test $cluster = evy-sandbox
            set color yellow
        else if test $cluster = evy-production
            set color red
        end
        tide_kubectl_color=$color _tide_print_item kubectl $tide_kubectl_icon' ' (string replace -r '/(|default)$' '' $cluster)
    else if string match -v k3d-local $context
        _tide_print_item kubectl $tide_kubectl_icon' ' (string replace -r '/(|default)$' '' $context)
    end
end
