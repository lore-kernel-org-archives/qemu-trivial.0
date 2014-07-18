Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1X88r5-0007xL-I8
	for mharc-qemu-trivial@gnu.org; Fri, 18 Jul 2014 10:09:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37014)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1X88qy-0007kg-RP
	for qemu-trivial@nongnu.org; Fri, 18 Jul 2014 10:09:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1X88qs-0001nJ-UM
	for qemu-trivial@nongnu.org; Fri, 18 Jul 2014 10:09:40 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:49793)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1X88qb-0001d7-2J; Fri, 18 Jul 2014 10:09:17 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 61CFD43837;
	Fri, 18 Jul 2014 18:09:14 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 4C39C666;
	Fri, 18 Jul 2014 18:09:14 +0400 (MSK)
Received: (nullmailer pid 616 invoked by uid 1000);
	Fri, 18 Jul 2014 14:09:13 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Fri, 18 Jul 2014 18:09:05 +0400
Message-Id: <1405692553-564-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL for-2.1 0/8] Trivial patches for 2014-07-18
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
X-List-Received-Date: Fri, 18 Jul 2014 14:09:47 -0000

Since we're close to release, I included only really-really-trivial
and safe changes in this pull request, -- only those which wont
break anything.  One good patch is a documentation change mentioning
icmp sockets, plus a series from Stefan Weil which adds some missing
`static' attributes here and there and fixes some typos in comments.
Plus a single patch from Chen Gang which was in the queue for quite
some time, also really trivial.  And an addition of error message
for slirp code which was pinged several times already.

I haven't considered other "a bit less" than trivial patches for 2.1.

Please consider either pulling whole series or at least applying the
icmp doc change.

Thanks,

/mjt

The following changes since commit 4d121a549869b93475ccf8b9a0d3e693011d1abb:

  Merge remote-tracking branch 'remotes/mst/tags/for_upstream' into staging (2014-07-18 09:35:51 +0100)

are available in the git repository at:

  git://git.corpit.ru/qemu.git tags/trivial-patches-2014-07-18

for you to fetch changes up to 748bfb4eee8e699f3d2dd6a95820d1a9e57e4aa6:

  tests: Add missing 'static' attributes (fix warnings from smatch) (2014-07-18 17:45:37 +0400)

----------------------------------------------------------------
trivial patches for 2014-07-18

----------------------------------------------------------------
Chen Gang (1):
      qemu-img: Remove redundancy "ret = -1"

Gernot Hillier (1):
      doc: slirp supports ICMP echo if enabled in Linux

Peter Maydell (1):
      slirp: Give error message if hostfwd_add/remove for unrecognized vlan/stack

Stefan Weil (5):
      Fix new typos in comments (found by codespell)
      hw/usb: Add missing 'static' attribute
      qga: Add missing 'static' attribute
      migration: Add missing 'static' attribute
      tests: Add missing 'static' attributes (fix warnings from smatch)

 block-migration.c                     |    2 +-
 hw/i386/pc_piix.c                     |    2 +-
 hw/i386/pc_q35.c                      |    2 +-
 hw/usb/hcd-ohci.c                     |    2 +-
 include/libdecnumber/decNumberLocal.h |    2 +-
 net/slirp.c                           |    1 +
 qemu-doc.texi                         |   13 ++++++++++---
 qemu-img.c                            |    1 -
 qga/commands-posix.c                  |    2 +-
 tests/fdc-test.c                      |    2 +-
 tests/test-aio.c                      |    2 +-
 tests/test-qemu-opts.c                |    2 +-
 tests/test-throttle.c                 |    8 ++++----
 tests/test-visitor-serialization.c    |    6 +++---
 tests/test-vmstate.c                  |    4 ++--
 xen-hvm.c                             |    2 +-
 16 files changed, 30 insertions(+), 23 deletions(-)

