SillyTavern 自动部署


for example compose

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
    build: 
      context: https://github.com/sleechengn/sillytavern.git
      dockerfile: Dockerfile
    container_name: "sillytavern"
    hostname: "sillytavern"
    restart: unless-stopped
    networks:
      lan13:
        ipv4_address: 192.168.13.6
```

access port: http://you-ip:8000/
