Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VSkiX-0003Yd-0z
	for mharc-qemu-trivial@gnu.org; Sun, 06 Oct 2013 05:33:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46623)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VSkiQ-0003MK-Hc
	for qemu-trivial@nongnu.org; Sun, 06 Oct 2013 05:33:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VSkiL-0001mW-Lz
	for qemu-trivial@nongnu.org; Sun, 06 Oct 2013 05:33:30 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:53373)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VSki8-0001gK-KD; Sun, 06 Oct 2013 05:33:12 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id A1B9640CAE;
	Sun,  6 Oct 2013 13:33:02 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 8427B501;
	Sun,  6 Oct 2013 13:33:02 +0400 (MSK)
Received: (nullmailer pid 25796 invoked by uid 1000);
	Sun, 06 Oct 2013 09:33:01 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: aliguori@us.ibm.com
Date: Sun,  6 Oct 2013 13:32:45 +0400
Message-Id: <1381051979-25742-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 00/14] Trivial patches for 2013-10-06
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
X-List-Received-Date: Sun, 06 Oct 2013 09:33:35 -0000

Here's another trivial patche pull request, for patches collected
in last 2 weeks (2 instead of 1 because both week were more or
less quiet and there weren't many patches).  There's nothing
exciting in here, but there are a few minor fixes for small but
annoying-in-some-environments issues.

Please pull.

Thanks,

/mjt

The following changes since commit a684f3cf9b9b9c3cb82be87aafc463de897461=
0c:

  Merge remote-tracking branch 'kraxel/seabios-1.7.3.2' into staging (201=
3-09-30 17:15:27 -0500)

are available in the git repository at:


  git://git.corpit.ru/qemu.git trivial-patches

for you to fetch changes up to 387eedebf60a463ba30833588f10123da296ba4d:

  migration: Fix compiler warning ('caps' may be used uninitialized) (201=
3-10-05 14:02:29 +0400)

----------------------------------------------------------------
Amos Kong (1):
      exec: cleanup DEBUG_SUBPAGE

Daniel P. Berrange (1):
      hw/9pfs: Fix errno value for xattr functions

Fam Zheng (1):
      .gitignore: ignore tests/qemu-iotests/socket_scm_helper

Guenter Roeck (1):
      sh4: Fix serial line access for Linux kernels later than 3.2

J=C3=A1n Vesel=C3=BD (1):
      pci-ohci: Add missing 'break' in ohci_service_td

Markus Armbruster (3):
      tests: Update .gitignore for test-int128 and test-bitops
      tests: Fix schema parser test for in-tree build
      vl: Clean up unnecessary boot_order complications

Michael Tokarev (1):
      migration: Fix compiler warning ('caps' may be used uninitialized)

Stefan Weil (5):
      block: Remove unused assignment (fixes warning from clang)
      target-i386: Fix compiler warning (integer constant is too large)
      hw/alpha: Fix compiler warning (integer constant is too large)
      qemu-char: Fix potential out of bounds access to local arrays
      util/path: Fix type which is longer than 8 bit for MinGW

 blockdev.c                        |    1 -
 exec.c                            |   18 +++++++++---------
 hw/9pfs/virtio-9p-xattr.c         |    6 +++---
 hw/alpha/typhoon.c                |    2 +-
 hw/char/sh_serial.c               |    2 --
 hw/usb/hcd-ohci.c                 |    2 ++
 migration.c                       |    1 +
 qemu-char.c                       |    4 ++--
 target-i386/arch_memory_mapping.c |    2 +-
 tests/.gitignore                  |    3 +++
 tests/Makefile                    |    8 ++++----
 tests/qemu-iotests/.gitignore     |    1 +
 util/path.c                       |    4 ++--
 vl.c                              |    6 ++----
 14 files changed, 31 insertions(+), 29 deletions(-)

