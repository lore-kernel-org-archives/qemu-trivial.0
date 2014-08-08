Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XFqwu-0005OM-QW
	for mharc-qemu-trivial@gnu.org; Fri, 08 Aug 2014 16:39:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39654)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XFqwn-0005DV-Tb
	for qemu-trivial@nongnu.org; Fri, 08 Aug 2014 16:39:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XFqwi-00011c-Uk
	for qemu-trivial@nongnu.org; Fri, 08 Aug 2014 16:39:33 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:32995)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XFqwO-0000ou-K2; Fri, 08 Aug 2014 16:39:08 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id DBA1341A14;
	Sat,  9 Aug 2014 00:39:05 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id C569B6D3;
	Sat,  9 Aug 2014 00:39:05 +0400 (MSK)
Received: (nullmailer pid 10307 invoked by uid 1000);
	Fri, 08 Aug 2014 20:39:05 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Sat,  9 Aug 2014 00:38:53 +0400
Message-Id: <1407530342-10259-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 0/9] Trivial patches for 2014-08-09
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
X-List-Received-Date: Fri, 08 Aug 2014 20:39:39 -0000

There's a next pull request for the -trivial tree.
Nothing exciting in there this time.  Small things
left from pre-2.1 time, small new things here and
there, and 2 portability fixes on top of 2.1.

Please consider applying.

/mjt

The following changes since commit 2d591ce2aeebf9620ff527c7946844a3122afeec:

  Merge remote-tracking branch 'remotes/mdroth/qga-pull-2014-08-08' into staging (2014-08-08 14:16:05 +0100)

are available in the git repository at:

  git://git.corpit.ru/qemu.git tags/trivial-patches-2014-08-09

for you to fetch changes up to 169a24aea4f287739797a8b15565b9b5e59e53be:

  build-sys: Move qapi-{types, visit, event}.o into util-obj-y (2014-08-09 00:09:17 +0400)

----------------------------------------------------------------
trivial patches for 2014-08-09

----------------------------------------------------------------
Alex Bligh (1):
      Show length mismatch error is hex

Chen Gang (1):
      qemu-img: Check getchar() return value in read_password() for WIN32

Fam Zheng (2):
      po: Add Chinese translation
      build-sys: Move qapi-{types, visit, event}.o into util-obj-y

Michael Tokarev (2):
      hw/timer/imx_*: fix TIMER_MAX clash with system symbol
      l2tpv3 (configure): it is linux-specific

Stefan Weil (2):
      virtio: Move extern declaration to header file
      hw/timer: Move extern declaration from .c to .h file

chenfan (1):
      target-i386/cpu.c: Fix two error output indentation

 Makefile                          |    2 +-
 Makefile.objs                     |   10 +----
 arch_init.c                       |    4 +-
 configure                         |    1 +
 hw/timer/imx_epit.c               |   16 +++----
 hw/timer/imx_gpt.c                |   32 +++++++-------
 hw/timer/tusb6010.c               |    3 --
 hw/virtio/vhost-backend.c         |    2 -
 include/hw/usb.h                  |    7 ++-
 include/hw/virtio/vhost-backend.h |    2 +
 po/zh_CN.po                       |   86 +++++++++++++++++++++++++++++++++++++
 qemu-img.c                        |    9 +++-
 target-i386/cpu.c                 |   10 ++---
 tests/Makefile                    |    2 +-
 14 files changed, 137 insertions(+), 49 deletions(-)
 create mode 100644 po/zh_CN.po

