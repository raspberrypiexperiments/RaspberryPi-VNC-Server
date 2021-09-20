# MIT License
#
# Copyright (c) 2021 Marcin Sielski <marcin.sielski@gmail.com>
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

install:
	sudo mv /usr/bin/lxpolkit /usr/bin/lxpolkit.bak
	sudo cp vncserver@:1.service /etc/systemd/system
	sudo systemctl enable vncserver@:1.service
	sudo systemctl start vncserver@:1.service
	sleep 3
	sudo systemctl status vncserver@:1.service
	echo "Modify xsetroot -solid grey -cursor_name left_ptr at /etc/vnc/xstartup"

uninstall:
	sudo systemctl stop vncserver@:1.service
	sudo systemctl disable vncserver@:1.service
	sudo rm -rf /etc/systemd/system/vncserver@:1.service
