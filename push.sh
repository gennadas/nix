echo 'compressing and pushing'

ARCHIVE="main.7z"
REPO_DIR="main"

# remove old archive
git rm --cached -f "$ARCHIVE" >/dev/null 2>&1 || true
rm -f "$ARCHIVE"

# encrypt prompting for passkey then push
7z a -t7z -mhe=on "$ARCHIVE" "$REPO_DIR" && git add "$ARCHIVE" && git commit -m "$HOSTNAME $(date -u +'%Y-%m-%dT%H:%M:%SZ')" && git push origin main &&echo "\n____\ndone"



