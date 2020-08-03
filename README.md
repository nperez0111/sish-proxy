# Sish Proxy

Easy way to create proxies to your local server to share your local server to anywhere.

<!-- TABLE OF CONTENTS -->

## Table of Contents

- [Sish Proxy](#sish-proxy)
  - [Table of Contents](#table-of-contents)
  - [About The Project](#about-the-project)
    - [Built With](#built-with)
  - [Getting Started](#getting-started)
    - [Prerequisites](#prerequisites)
  - [Usage](#usage)
  - [Contributing](#contributing)

<!-- ABOUT THE PROJECT -->

## About The Project

I wanted an easy way to create proxies to my local server to be able to share with coworkers something I am working on quickly. Using a self hosted instance of [sish](https://github.com/antoniomika/sish) I found it easy to do just that. However I also found that it requires me to write a pretty complex ssh command that was hard to remember the syntax for. So I made this.

Here's why:

- You won't have to remember a complex SSH command that is difficult to remember the syntax for when you are trying to show something quickly
- You can easily proxy to a running server even by just passing the port number
- You can specify human readable subdomains that are more friendly to those clicking your link

Of course, this is an extremely simple script that barely does anything that an ssh command allows the flexibility for but it makes remembering the syntax as simple as just putting in the port to proxy on.

### Built With

This section should list any major frameworks that you built your project using. Leave any add-ons/plugins for the acknowledgements section. Here are a few examples.

- [Sish](https://github.com/antoniomika/sish)

<!-- GETTING STARTED -->

## Getting Started

This is to show just how easy it is to get started with sish proxy.

### Prerequisites

1. Save the script to your user local bin directory so that the script is already in your PATH:
2. Edit the top section of the script with your sish server and port number

```sh
#1 Saving script and install to somewhere in your path
git clone https://github.com/nperez0111/sish-proxy
cd sish-proxy
sudo ln -s "$PWD/proxy.sh" /usr/local/bin/proxy

#2 Edit proxy.sh with your server domain and port
SISH_SERVER=example.com
SISH_PORT=22
```

## Usage

```sh
> proxy 3000 foo
```

This simple command will forward requests at foo.example.com to your local server at localhost:3000

<!-- CONTRIBUTING -->

## Contributing

Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request
