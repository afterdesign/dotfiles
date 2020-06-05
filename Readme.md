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

1. Install ansible:

    ```bash
    brew install python
    pip3 install ansible
    ```

1. Run ansible:

    ```bash
    git clone git@github.com:afterdesign/dotfiles.git ~/.dotfiles
    cd ~/.dotfiles
    ansible-playbook --ask-become-pass -i local.hosts playbook.yml
    ```

## License

Licensed under the [MIT license](http://opensource.org/licenses/MIT).
