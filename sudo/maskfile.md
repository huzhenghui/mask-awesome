# Tasks

## create-old-sudo

```bash
cat /etc/pam.d/sudo > old.sudo
```

### old.sudo

```plain
# sudo: auth account password session
auth       sufficient     pam_smartcard.so
auth       required       pam_opendirectory.so
account    required       pam_permit.so
password   required       pam_deny.so
session    required       pam_permit.so
```

## modify-sudo

```bash
modify_sudo_gawk_file="$(mktemp)"
source "${ZSH}/custom/plugins/huzhenghui-mask/huzhenghui-mask.plugin.zsh"
mask-raw modify-sudo-gawk > "${modify_sudo_gawk_file}"
/usr/local/bin/gawk --file="${modify_sudo_gawk_file}" old.sudo > new.sudo
```

## modify-sudo-gawk

```awk
BEGIN {
    todo = 1;
    r = "^(auth[ ]+sufficient[ ]+).*$";
}
{
    if (1 == todo)
    {
        b = match($0, r);
        if (1 == b)
        {
            print gensub(r, "\\1pam_tid.so", 1);
            print $0;
            todo = 0;
        }
        else
        {
            print $0;
        }
    }
    else
    {
        print $0;
    }
}
```

### new.sudo

```
# sudo: auth account password session
auth       sufficient     pam_tid.so
auth       sufficient     pam_smartcard.so
auth       required       pam_opendirectory.so
account    required       pam_permit.so
password   required       pam_deny.so
session    required       pam_permit.so
```

## replace-sudo

```bash
sudo cp new.sudo /etc/pam.d/sudo
```