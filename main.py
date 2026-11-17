from ssh_modules import SSHModule
from ssh_modules.actions import RunSSHCommand, RunSSHScript

if __name__ == "__main__":
    module = SSHModule()
    module.register(RunSSHCommand, "run_ssh_command")
    module.register(RunSSHScript, "run_ssh_script")
    module.run()
