
Directory/file structure used by Mesos slave

        https://github.com/apache/mesos/blob/04dd7f32b5cce29c68e20611580dc6bdc61fce11/src/slave/paths.hpp#L95

        // The slave leverages the file system for a number of purposes:
        //
        //   (1) For executor sandboxes and disk volumes.
        //
        //   (2) For checkpointing metadata in order to support "slave
        //       recovery". That is, allow the slave to restart without
        //       affecting the tasks / executors.
        //
        //   (3) To detect reboots (by checkpointing the boot id), in which
        //       case everything has died so no recovery should be attempted.
        //
        //   (4) For checkpointing resources that persist across slaves.
        //       This includes things like persistent volumes and dynamic
        //       reservations.
        //
        //   (5) For provisioning root filesystems for containers.
        //
        //   (6) For CSI plugins to preserve data that persist across slaves.
        //
        // The file system layout is as follows:
        //
        //   root ('--work_dir' flag)
        //   |-- containers
        //   |   |-- <container_id> (sandbox)
        //   |-- slaves
        //   |   |-- latest (symlink)
        //   |   |-- <slave_id>
        //   |       |-- frameworks
        //   |           |-- <framework_id>
        //   |               |-- executors
        //   |                   |-- <executor_id>
        //   |                       |-- runs
        //   |                           |-- latest (symlink)
        //   |                           |-- <container_id> (sandbox)
        //   |-- meta
        //   |   |-- boot_id
        //   |   |-- resources
        //   |   |   |-- resources.info
        //   |   |   |-- resources.target
        //   |   |-- slaves
        //   |       |-- latest (symlink)
        //   |       |-- <slave_id>
        //   |           |-- slave.info
        //   |           |-- resource_providers
        //   |           |   |-- <type>
        //   |           |       |-- <name>
        //   |           |           |-- latest (symlink)
        //   |           |           |-- <resource_provider_id>
        //   |           |               |-- resource_provider.state
        //   |           |               |-- operations
        //   |           |                   |-- <operation_uuid>
        //   |           |                       |-- operation.updates
        //   |           |-- frameworks
        //   |               |-- <framework_id>
        //   |                   |-- framework.info
        //   |                   |-- framework.pid
        //   |                   |-- executors
        //   |                       |-- <executor_id>
        //   |                           |-- executor.info
        //   |                           |-- runs
        //   |                               |-- latest (symlink)
        //   |                               |-- <container_id> (sandbox)
        //   |                                   |-- executor.sentinel (if completed)
        //   |                                   |-- pids
        //   |                                   |   |-- forked.pid
        //   |                                   |   |-- libprocess.pid
        //   |                                   |-- tasks
        //   |                                       |-- <task_id>
        //   |                                           |-- task.info
        //   |                                           |-- task.updates
        //   |-- volumes
        //   |   |-- roles
        //   |       |-- <role>
        //   |           |-- <persistence_id> (persistent volume)
        //   |-- provisioner
        //   |-- csi
