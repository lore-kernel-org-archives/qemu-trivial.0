Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZJoTp-0003Ik-Vt
	for mharc-qemu-trivial@gnu.org; Mon, 27 Jul 2015 15:54:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58018)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZJoTk-00034N-Oa
	for qemu-trivial@nongnu.org; Mon, 27 Jul 2015 15:54:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZJoTj-0002cA-V1
	for qemu-trivial@nongnu.org; Mon, 27 Jul 2015 15:54:28 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:45901)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZJoTe-0002a2-EF; Mon, 27 Jul 2015 15:54:22 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 79A5D425A7;
	Mon, 27 Jul 2015 22:54:20 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 67B87A57;
	Mon, 27 Jul 2015 22:54:20 +0300 (MSK)
Received: (nullmailer pid 9514 invoked by uid 1000);
	Mon, 27 Jul 2015 19:54:20 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon, 27 Jul 2015 22:54:03 +0300
Message-Id: <cover.1438026619.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL for-2.4 00/10] Trivial patches for 2015-07-27
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
X-List-Received-Date: Mon, 27 Jul 2015 19:54:29 -0000

There are a few patches from the trivial queue which are, I think,
suitable for 2.4.  These are fixing or adding docs/comments, are
minor/trivial cleanups, or small bugfixes.

Please consider applying for 2.4.

The rest of the trivial tree will be pushed once 2.5 development
window will be open, hopefully  I will be able to do that by when.

/mjt

The following changes since commit edec47cfef96209987cb7922286cb384916aae=
02:

  main-loop: fix qemu_notify_event for aio_notify optimization (2015-07-2=
7 17:12:19 +0100)

are available in the git repository at:

  git://git.corpit.ru/qemu.git tags/pull-trivial-patches-2015-07-27

for you to fetch changes up to 226d007dbd75ec8d0f12d0f9e1ce66caf55d49e4:

  gdbstub: Set current CPU on interruptions (2015-07-27 22:46:16 +0300)

----------------------------------------------------------------
trivial patches for 2015-07-27

----------------------------------------------------------------
Jan Kiszka (1):
      gdbstub: Set current CPU on interruptions

Johannes Schlatow (1):
      Fix Cortex-A9 global timer

Kamalesh Babulal (1):
      device_tree: Fix a typo

Laszlo Ersek (2):
      hw/acpi/ich9: clear smi_en on reset
      hw/acpi/ich9: clean up stale comment about KVM not supporting SMM

Marc-Andr=C3=A9 Lureau (2):
      vmstate: remove unused declaration
      qapi: add missing @

Michal Privoznik (1):
      gitignore: Ignore shader generated files

Peter Maydell (1):
      qemu-common.h: Document cutils.c string functions

Stefan Weil (1):
      make: Clean build messages

 .gitignore                  |   2 +
 Makefile                    |   2 +-
 device_tree.c               |   2 +-
 gdbstub.c                   |   1 +
 hw/acpi/ich9.c              |   4 +-
 include/hw/timer/a9gtimer.h |   2 +-
 include/migration/vmstate.h |   3 --
 include/qemu-common.h       | 114 ++++++++++++++++++++++++++++++++++++++=
+++++-
 qapi-schema.json            |   2 +-
 tests/Makefile              |   4 +-
 10 files changed, 124 insertions(+), 12 deletions(-)

