import os

from invoke.context import Context
from invoke.runners import Result

from fabric import Connection, task


@task
def info(c):
    assert os.environ["Keychain_service"]
    assert os.environ["Keychain_account"]
    assert os.environ["host"]
    context: Context = c
    r: Result = context.run(
        'mask --maskfile "$(ghq list --full-path https://github.com/huzhenghui/Keychain-Generic-Password)/maskfile.md" get --service "${Keychain_service}" --account "${Keychain_account}"',
        shell="/bin/zsh",
        hide=True,
        env={
            "Keychain_service": os.environ["Keychain_service"],
            "Keychain_account": os.environ["Keychain_account"]
        }
    )
    conn = Connection(
        os.environ["host"],
        connect_kwargs={"password": r.stdout.splitlines()[0]}
    )
    conn.run("cat /proc/version", echo=True)
    conn.run("uname -a", echo=True)
    conn.run("df -h", echo=True)
    conn.run("w", echo=True)
    conn.run("whoami", echo=True)
    conn.run("ifconfig", echo=True)
    conn.run("route -n", echo=True)
    conn.run("last", echo=True)
