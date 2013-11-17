Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VhznD-0003we-Mu
	for mharc-qemu-trivial@gnu.org; Sun, 17 Nov 2013 05:41:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41821)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Vhzn7-0003iP-1C
	for qemu-trivial@nongnu.org; Sun, 17 Nov 2013 05:41:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Vhzn2-00054s-4V
	for qemu-trivial@nongnu.org; Sun, 17 Nov 2013 05:41:20 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:53012)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Vhzmq-00051Z-Uh; Sun, 17 Nov 2013 05:41:05 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 3EE8C41D40;
	Sun, 17 Nov 2013 14:40:53 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id E38EE211;
	Sun, 17 Nov 2013 14:40:52 +0400 (MSK)
Received: (nullmailer pid 6823 invoked by uid 1000);
	Sun, 17 Nov 2013 10:40:52 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: Anthony Liguori <aliguori@amazon.com>
Date: Sun, 17 Nov 2013 14:40:50 +0400
Message-Id: <1384684850-6777-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Subject: [Qemu-trivial]
	=?y?q?=5BPULL=20v2=20for-1=2E7=5D=20Trivial=20patches=20for=202013-11-17?=
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
X-List-Received-Date: Sun, 17 Nov 2013 10:41:26 -0000

Here's another pull request for the trivial-patches queue.
Since the previous pull request (which weren't pulled), I
removed a few patches which weren't marked for-1.7, and added
two more bugfixes on top (fixing python invocations).

What's left are either trivial stuff not affecting anything else,
or trivial bugfixes.

I'm not sending individual patches this time, because I've already
included them in the previous pull request (except of the 2 new
patches, for which I added Cc to sw@).

Please pull.

/mjt

The following changes since commit 964668b03d26f0b5baa5e5aff0c966f4fcb76e=
9e:

  Update version for 1.7.0-rc0 release (2013-11-06 21:49:39 -0800)

are available in the git repository at:

  git://git.corpit.ru/qemu.git trivial-patches

for you to fetch changes up to 0478f37ce258438d74164dd182b0ae125f174ec6:

  hw/i386/Makefile.obj: use $(PYTHON) to run .py scripts consistently (20=
13-11-17 00:30:14 +0400)

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

Michael Tokarev (1):
      hw/i386/Makefile.obj: use $(PYTHON) to run .py scripts consistently

Stefan Hajnoczi (1):
      usb: drop unused USBNetState.inpkt field

Stefan Weil (3):
      qga: Fix compilation for old versions of MinGW
      console: Remove unused debug code
      configure: Use -B switch only for Python versions which support it

whitearchey (1):
      qga: Fix shutdown command of guest agent to work with SysV

 .travis.yml               |   71 +++++++++
 Makefile                  |    2 +-
 configure                 |    9 +-
 hw/i386/Makefile.objs     |    2 +-
 hw/i386/kvm/pci-assign.c  |   36 ++---
 hw/usb/dev-network.c      |    1 -
 pc-bios/keymaps/cz        |   94 ++++++++++++
 qapi-schema.json          |    2 +-
 qga/commands-posix.c      |    2 +-
 qga/vss-win32/requester.h |    1 +
 ui/console.c              |   33 ----
 ui/keymaps.c              |    6 +
 ui/vnc_keysym.h           |  373 +++++++++++++++++++++++++++++++++++++++=
++++++
 vl.c                      |    1 +
 14 files changed, 574 insertions(+), 59 deletions(-)
 create mode 100644 .travis.yml
 create mode 100644 pc-bios/keymaps/cz

