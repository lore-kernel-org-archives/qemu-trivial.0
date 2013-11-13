Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Vga4s-0000Vn-A2
	for mharc-qemu-trivial@gnu.org; Wed, 13 Nov 2013 08:01:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54011)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Vga4l-0000Hd-10
	for qemu-trivial@nongnu.org; Wed, 13 Nov 2013 08:01:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Vga4g-0006wo-3f
	for qemu-trivial@nongnu.org; Wed, 13 Nov 2013 08:01:42 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:34866)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Vga4T-0006qW-Mo; Wed, 13 Nov 2013 08:01:26 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 51D1141706;
	Wed, 13 Nov 2013 17:01:24 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 29F0A50F;
	Wed, 13 Nov 2013 17:01:24 +0400 (MSK)
Received: (nullmailer pid 16029 invoked by uid 1000);
	Wed, 13 Nov 2013 13:01:24 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: Anthony Liguori <aliguori@amazon.com>
Date: Wed, 13 Nov 2013 17:01:04 +0400
Message-Id: <1384347680-15976-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Jan Krupa <JKrupa@suse.com>, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 00/16] [for-1.7] Trivial patches for 2013-11-13
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Nov 2013 13:01:48 -0000

Here's a next trivial-patches pull request, for patches collected
in almost 3 weeks.

There's nothing extra-ordinary here, except of one thing: this is
keyboard maps handling series by Jan Krupa.  While I don't expect
any breakage in this area, but the series introduces a new keymap
(cz), fixes other keymaps by adding symbol definitions used in there
to qemu, and adds some functionality which may be helpful when
working with keymaps (like recognizing (only basic) unicode chars
in form of Uxxxx).  I haven't heard anything about this series
from anyone else, except of the comments from Anthony that the
whole kbd handling needs some major restructuring/changing, so
I still don't understand whenever applying this is a good idea
or not.  If you think it is not a good idea, I can easily prepare
another pull request without these changes.

There are a few other changes which potentially might be a bit
dangerous, like the trace.h include changes by Stefan Weil --
while these changes look fine, there's still a remote chance
that one of them will break build in some configuration or platform.
Maybe it is not a good idea to apply this at such late point in
the release cycle.  I verified these, but I haven't tested all
platforms, especially win*.

Please consider applying.

Thanks,

/mjt

The following changes since commit 964668b03d26f0b5baa5e5aff0c966f4fcb76e=
9e:

  Update version for 1.7.0-rc0 release (2013-11-06 21:49:39 -0800)

are available in the git repository at:

  git://git.corpit.ru/qemu.git trivial-patches

for you to fetch changes up to e239f1ce7690065e16e2a2ec9baf6d9b66ca5efb:

  qga: Fix shutdown command of guest agent to work with SysV (2013-11-13 =
16:05:11 +0400)

----------------------------------------------------------------
Alex Benn=C3=A9e (1):
      .travis.yml: basic compile and check recipes

Antony Pavlov (1):
      vl: fix build when configured with no graphic support

Cole Robinson (1):
      pci-assign: Fix error_report of pci-stub message

Fam Zheng (1):
      qapi: Fix comment for create-type to match code.

Jan Krupa (4):
      qemu-char: add Czech characters to VNC keysyms
      qemu-char: add Czech keymap file
      qemu-char: add support for U-prefixed symbols
      qemu-char: add missing characters used in keymaps

Stefan Hajnoczi (1):
      usb: drop unused USBNetState.inpkt field

Stefan Weil (6):
      qga: Fix compilation for old versions of MinGW
      console: Remove unused debug code
      trace: Remove trace.h from console.h (less dependencies)
      trace: Remove trace.h from hw/usb/hcd-ehci.h (less dependencies)
      console: Replace conditional debug messages by trace methods
      gtk: Replace conditional debug messages by trace methods

whitearchey (1):
      qga: Fix shutdown command of guest agent to work with SysV

 .travis.yml               |   71 +++++++++
 Makefile                  |    2 +-
 hw/display/vmware_vga.c   |    1 +
 hw/i386/kvm/pci-assign.c  |   36 ++---
 hw/usb/dev-network.c      |    1 -
 hw/usb/hcd-ehci.c         |    1 +
 hw/usb/hcd-ehci.h         |    1 -
 include/ui/console.h      |    1 -
 pc-bios/keymaps/cz        |   94 ++++++++++++
 qapi-schema.json          |    2 +-
 qga/commands-posix.c      |    2 +-
 qga/vss-win32/requester.h |    1 +
 trace-events              |    7 +
 ui/console.c              |   45 +-----
 ui/gtk.c                  |   19 +--
 ui/keymaps.c              |    6 +
 ui/vnc_keysym.h           |  373 +++++++++++++++++++++++++++++++++++++++=
++++++
 vl.c                      |    1 +
 18 files changed, 583 insertions(+), 81 deletions(-)
 create mode 100644 .travis.yml
 create mode 100644 pc-bios/keymaps/cz

