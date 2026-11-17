from sekoia_automation.module import Module

from ssh_modules.models import SSHModuleConfiguration


class SSHModule(Module):
    configuration: SSHModuleConfiguration
