job "python" {
  type = "service"

  group "python" {
    count = 1
    network {
      port "python" {
        to = 3002
      }
    }

    service {
      name     = "python-svc"
      port     = "python"
      provider = "nomad"
    }

    task "python-task" {
      driver = "docker"

      config {
        image = "nomad:local"
        tty = true
        ports = ["python"]
        extra_hosts = ["host.docker.internal:host-gateway"]
        group_add = ["dialout"]
        devices = [
          {
            host_path = "/dev/ttyACM0"
          },
          {
            host_path = "/dev/ttyACM1"
          },
          {
            host_path = "/dev/video0"
          },
          {
            host_path = "/dev/video1"
          },
          {
            host_path = "/dev/video2"
          },
          {
            host_path = "/dev/video3"
          },
          {
            host_path = "/dev/video4"
          },
           {
            host_path = "/dev/video5"
          }
        ]
      }
    }
  }
}