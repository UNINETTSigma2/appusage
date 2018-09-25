[Jobs]
slurm = 1

[Log]
ignoredUsers    = root, sshd, dbus, chrony, polkitd, munge, ganglia, ntp, rpcuser, rpc, mysql, slurm, postfix
IgnoredPrograms = srun, slurm_script, mpiexec.hydra, pmi_proxy, sshd, bash, top, orterun, orted, less, screen, ssh-agent, man
allowedUsers    = 
checkCategory   = OTHER
hyperThreading  = 1

[Appusage]
startDate      = 180401
endDate        = 180930
machine        = fram
nodesRegex     = c[0-9]*
admGroup       = sysapp
slurm	       = 1
slurmQuotaFile = /cluster/var/accounting/project_cpu_quotas.toml
islands        = 39-62:63-86:15-38:3-14
coresPerNode   = 32
