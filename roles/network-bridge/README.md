# RevPi Network Bridge

A simple role for network bridge configuration on Revolution Pi devices.

## Customization

| name | type | description | default value |
|------|------|-------------|---------------|
| `bridge_ports` | list | List of network interfaces, which will be assigned to the bridge | `['eth0', 'eth1']` |
| `bridge_name` | string | Name of the bridge interface | `br0` |
| `bridge_network_type` | string | Configuration type of the bridge interface. Choose `dhcp` for automatic IP configuration via DHCP or `static` for static IP configuration (see below) | `dhcp` |
| `bridge_network_address` | string | IP address for bridge interface with prefix (eg. `192.168.0.1/24`) | - |
| `bridge_network_gateway` | string | IP address of bridge interfaces gateway | - |

## Usage

**Before you can use this role, you have to clone the `roles` folder into your ansible projesct.**

Simple usage with default values:
```yaml
---
- hosts: revpi
  roles:
    - network-bridge
```

Full-blown example with custom configuration:
```yaml
---
- hosts: revpi
  roles:
    - role: network-bridge
      vars:
        bridge_name: my-bridge
        bridge_ports:
          - eth0
          - eth1
        bridge_network_type: static
        bridge_network_address: 172.16.0.10/16
        bridge_network_gateway: 172.16.0.1
```
