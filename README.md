# PPA2 Testing

Personal Package Archive (PPA) for testing ROS2 MRS deb packages.

## Adding the PPA

```bash
curl https://ctu-mrs.github.io/ppa2-testing/add_ppa.sh | bash
```

## Uninstalling packages from this PPA

```bash
sudo apt-get -y install aptitude
sudo apt remove $(aptitude search -F '%p' '~S ~i ?origin("ctu-mrs") ?label("testing")')
```

## Removing the PPA

```bash
curl https://ctu-mrs.github.io/ppa2-testing/remove_ppa.sh | bash
```
