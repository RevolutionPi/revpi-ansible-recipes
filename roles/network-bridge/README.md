# RevPi Network Bridge

A simple role for network bridge configuration on Revolution Pi devices.

## Customization

| name | type | description | default value |
|------|------|-------------|---------------|
| `bridge_ports` | list | List of network interfaces, which will be assigned to the bridge |
| `bridge_name` | string | Name of the bridge interface |
| `bridge_network_type` | string | Configuration type of the bridge interface. Choose `dhcp` for automatic IP configuration via DHCP or `static` for static IP configuration (see below) |
| `bridge_network_address` | string | IP address for bridge interface with prefix (eg. `192.168.0.1/24`) |
| `bridge_network_gateway` | string | IP address of bridge interfaces gateway |

## Example

```yaml
---
- hosts: revpi
  roles:
    - network-bridge
```
