Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XVyis-00079M-Td
	for mharc-qemu-trivial@gnu.org; Mon, 22 Sep 2014 04:11:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43798)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XVyil-0006wZ-Gq
	for qemu-trivial@nongnu.org; Mon, 22 Sep 2014 04:11:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XVyig-0006CJ-Hc
	for qemu-trivial@nongnu.org; Mon, 22 Sep 2014 04:11:43 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:36074)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XVyiS-00062F-W3; Mon, 22 Sep 2014 04:11:25 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id B889845CD2;
	Mon, 22 Sep 2014 12:11:18 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 58CFA6B3;
	Mon, 22 Sep 2014 12:11:18 +0400 (MSK)
Received: (nullmailer pid 16985 invoked by uid 1000);
	Mon, 22 Sep 2014 08:11:18 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon, 22 Sep 2014 12:11:08 +0400
Message-Id: <1411373477-16938-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 0/9] Trivial patches for 2014-09-22
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
X-List-Received-Date: Mon, 22 Sep 2014 08:11:48 -0000

Here's a next (small) batch of trivial stuff.  Accumulated for over
2 weeks, but still quite small.  Random tiny things here and there.
Please consider pulling/applying.

Thanks,

/mjt

The following changes since commit 07e2863d0271ac6c05206d8ce9e4f4c39b25d3ea:

  exec.c: fix setting 1-byte-long watchpoints (2014-09-19 17:42:16 +0100)

are available in the git repository at:

  git://git.corpit.ru/qemu.git tags/trivial-patches-2014-09-22

for you to fetch changes up to 7e3d523883202396ae7ff8bafcc796c86e026adc:

  arch_init: Setting QEMU_ARCH enum straight (2014-09-22 12:09:43 +0400)

----------------------------------------------------------------
trivial patches for 2014-09-22

----------------------------------------------------------------
Adelina Tuvenie (1):
      block: allow creation of fixed vhdx images

Bastian Koppelmann (1):
      arch_init: Setting QEMU_ARCH enum straight

Chen Gang (1):
      xen-hvm.c: Always return -1 when failure occurs in xen_hvm_init()

Gonglei (1):
      configure: trivial fixes

Li Liu (1):
      qemu-char: Permit only a single "stdio" character device

Stefan Weil (1):
      pc: Add missing 'static' attribute

zhanghailiang (3):
      Fix typos and misspellings in comments
      rdma: Fix incorrect description in comments
      vl: Print maxmem in hex format for error message

 block/vhdx.c               |    2 +-
 configure                  |    6 +++---
 docs/rdma.txt              |    6 +++---
 hw/i386/pc.c               |    2 +-
 hw/ppc/spapr.c             |    2 +-
 include/sysemu/arch_init.h |   34 +++++++++++++++++-----------------
 libcacard/vcard_emul_nss.c |    4 ++--
 migration-rdma.c           |    4 ++--
 qemu-char.c                |   10 +++++++++-
 vl.c                       |   22 +++++++++++-----------
 xen-hvm.c                  |    9 ++++-----
 11 files changed, 54 insertions(+), 47 deletions(-)

