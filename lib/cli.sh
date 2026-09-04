
cleanup() {
    echo ""
    msg_error "Script execution interrupted by user (Ctrl + C). Cleaning up..."
    exit 130
}

parse_args() {
    local OPTIND opt
    while getopts "i:o:t:hm-:" opt; do
        case "$opt" in
            i) INPUT_DIR="$OPTARG" ;;
            o) OUTPUT_DIR="$OPTARG" ;;
            t) TEMPLATE_NAME="$OPTARG" ;;
            m) MINIFY=true ;;
            h)
                show_help
                exit 0
                ;;
            -)
                case "${OPTARG}" in
                    minify) MINIFY=true ;;
                    help)
                        show_help
                        exit 0
                        ;;
                    *)
                        msg_error "Invalid option: --${OPTARG}"
                        show_help
                        exit 1
                        ;;
                esac
                ;;
            \?)
                msg_error "Invalid option: -$OPTARG"
                show_help
                exit 1
                ;;
        esac
    done
    shift $((OPTIND - 1))
}

cleanup() {
    echo ""
    msg_error "Script execution interrupted by user (Ctrl + C). Cleaning up..."
    exit 130
}