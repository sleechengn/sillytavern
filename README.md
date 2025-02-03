SillyTavern 自动部署

```
networks:
  lan13:
    name: lan13
    driver: macvlan
    driver_opts:
      parent: eth1
    ipam:
      config:
        - subnet: "192.168.13.0/24"
          gateway: "192.168.13.1"
services:
  sillytavern:
    build: https://github.com/sleechengn/sillytavern.git
    container_name: "sillytavern"
    hostname: "sillytavern"
    restart: unless-stopped
    networks:
      lan13:
        ipv4_address: 192.168.13.6

```
