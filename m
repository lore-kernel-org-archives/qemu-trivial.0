Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wedo1-0008Sw-M4
	for mharc-qemu-trivial@gnu.org; Mon, 28 Apr 2014 01:08:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47911)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Wedns-0008Fo-Uj
	for qemu-trivial@nongnu.org; Mon, 28 Apr 2014 01:08:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Wednn-0000mt-OS
	for qemu-trivial@nongnu.org; Mon, 28 Apr 2014 01:08:32 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:52212)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Wednd-0000ky-7a; Mon, 28 Apr 2014 01:08:17 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 1F44A43035;
	Mon, 28 Apr 2014 09:08:16 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id F0A0F2B4;
	Mon, 28 Apr 2014 09:08:15 +0400 (MSK)
Received: (nullmailer pid 19122 invoked by uid 1000);
	Mon, 28 Apr 2014 05:08:15 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon, 28 Apr 2014 09:07:46 +0400
Message-Id: <1398661684-19059-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 00/18] Trivial patches for 2014-04-28
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
X-List-Received-Date: Mon, 28 Apr 2014 05:08:38 -0000

Here's another trivial-patches pull request.  I removed all
questionable or still-being-discussed patchses from there
which accumulated recently.

What's left are either code cleanups and rearrangements,
spelling fixes or --help output improvements, adding Qemu
logo file, one feature patch which's been waiting for too
long (conversion of -m to QemuOpts), and several small
bugfixes.

One change I want to mention especially, it is this one:

 slirp/smb: Move ncalrpc directory to tmp

While slirp code has a maintainer, Jan Kiszka, he never commented
on this change since initial patch submission back at Nov-2013,
despite several subsequent pings.  The change _is_ trivial and
fixes -smb with modern versions of samba.  We've been waiting
for this (trivial) fix for too long.

Thanks,

/mjt

The following changes since commit 411f491e0af173cf8f39347574941bd26fbae3=
81:

  Merge remote-tracking branch 'remotes/rth/tags/tgt-axp-pull-20140424' i=
nto staging (2014-04-25 13:25:22 +0100)

are available in the git repository at:

  git://git.corpit.ru/qemu.git tags/trivial-patches-2014-04-28

for you to fetch changes up to b87b8a8b32518df9e5285f9b3d4f9d9a0c426a06:

  slirp/smb: Move ncalrpc directory to tmp (2014-04-28 08:55:32 +0400)

----------------------------------------------------------------
trivial patches for 2014-04-28

----------------------------------------------------------------
Chen Gang (3):
      vl: Remove useless 'continue'
      vl: Eliminate a superfluous local variable
      vl: avoid closing stdout with 'writeconfig'

Cole Robinson (1):
      tests/.gitignore: Ignore test-rfifolock

Fam Zheng (1):
      configure: Improve help behavior

Igor Mammedov (1):
      vl: convert -m to QemuOpts

Igor Ryzhov (1):
      net/net.c: remove unnecessary semicolon

Kirill Batuzov (1):
      init_paths: fix minor memory leak

Laszlo Ersek (1):
      move test-* from .gitignore to tests/.gitignore

Michael Buesch (1):
      slirp/smb: Move ncalrpc directory to tmp

Michael Tokarev (3):
      gitignore: cleanups #2
      po/Makefile: fix $SRC_PATH reference
      po: add proper Language: tags to .po files

Paolo Bonzini (1):
      qemu-option: introduce qemu_find_opts_singleton

Stefan Weil (3):
      misc: Use cpu_physical_memory_read and cpu_physical_memory_write
      xilinx: Fix typo in comment (Marvel -> Marvell)
      Add QEMU logo (SVG file)

Tim Comer (1):
      virtfs-proxy-helper: fix call to accept

 .gitignore                  |   18 +-
 configure                   |    7 +-
 cpus.c                      |    2 +-
 fsdev/virtfs-proxy-helper.c |    1 +
 hw/i386/kvmvapic.c          |   31 +-
 hw/intc/apic.c              |    4 +-
 hw/net/xilinx_axienet.c     |    2 +-
 include/qemu/config-file.h  |    2 +
 net/net.c                   |    2 +-
 net/slirp.c                 |    2 +
 pc-bios/qemu_logo.svg       | 1010 +++++++++++++++++++++++++++++++++++++=
++++++
 po/Makefile                 |    4 +-
 po/de_DE.po                 |    2 +-
 po/fr_FR.po                 |    2 +-
 po/hu.po                    |    2 +-
 po/it.po                    |    2 +-
 po/tr.po                    |    2 +-
 qemu-options.hx             |    9 +-
 target-s390x/misc_helper.c  |   12 +-
 tests/.gitignore            |   12 +-
 util/path.c                 |    4 +-
 util/qemu-config.c          |   14 +
 vl.c                        |  103 +++--
 23 files changed, 1156 insertions(+), 93 deletions(-)
 create mode 100644 pc-bios/qemu_logo.svg

