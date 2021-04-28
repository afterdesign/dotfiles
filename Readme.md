# Dotfiles

## Run

1. Install CLI tools:

    ```bash
    xcode-select --install
    ```

1. Install homebrew:

    ```bash
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    ```

1. Install ansible and dependencies:

    ```bash
    brew install python@3.9 ansible
    ansible-galaxy install --force -r requirements.yml
    ```

1. Run ansible:

    ```bash
    git clone https://github.com/afterdesign/dotfiles.git ~/.dotfiles
    cd ~/.dotfiles
    ansible-playbook --ask-become-pass -i local.hosts playbook.yml
    ```

## License

Licensed under the [MIT license](http://opensource.org/licenses/MIT).

