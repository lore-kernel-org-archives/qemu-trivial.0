Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YqqJi-0006i9-9O
	for mharc-qemu-trivial@gnu.org; Fri, 08 May 2015 18:00:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45175)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YqqJb-0006VS-JT
	for qemu-trivial@nongnu.org; Fri, 08 May 2015 18:00:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YqqJa-0005l5-N5
	for qemu-trivial@nongnu.org; Fri, 08 May 2015 18:00:15 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:57947)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YqqJU-0005XT-Bu; Fri, 08 May 2015 18:00:08 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id B89C840761;
	Sat,  9 May 2015 01:00:06 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 9E8106E2;
	Sat,  9 May 2015 01:00:06 +0300 (MSK)
Received: (nullmailer pid 10310 invoked by uid 1000);
	Fri, 08 May 2015 22:00:06 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Sat,  9 May 2015 01:00:00 +0300
Message-Id: <cover.1431122325.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 0/5] Trivial patches for 2015-05-09
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
X-List-Received-Date: Fri, 08 May 2015 22:00:16 -0000

Here's a next trivial-patches tree pull request.  There aren't many patches
this time, but one of them (replacing assert with g_assert) is a build fix.
Please consider applying.

Thanks,

/mjt

The following changes since commit f8340b360b9bc29d48716ba8aca79df2b9544979:

  hw/ptimer: Do not artificially limit timers when using icount (2015-05-08 17:15:23 +1000)

are available in the git repository at:

  git://git.corpit.ru/qemu.git tags/pull-trivial-patches-2015-05-09

for you to fetch changes up to 0caef8f6df4a9426bd6333ab843ce51ce005d7d0:

  docs: update BLOCK_IMAGE_CORRUPTED documentation (2015-05-08 14:11:10 +0300)

----------------------------------------------------------------
trivial patches for 2015-05-09

----------------------------------------------------------------
Alberto Garcia (1):
      docs: update BLOCK_IMAGE_CORRUPTED documentation

Gonglei (1):
      xhci: remove unused code

Michael Tokarev (1):
      glib-compat.h: change assert to g_assert

Thomas Huth (1):
      Remove various unused functions

zhanghailiang (1):
      sheepdog: fix resource leak with sd_snapshot_create

 backends/tpm.c                   | 11 -----------
 block/sheepdog.c                 |  1 +
 docs/qmp/qmp-events.txt          |  5 +++--
 hw/usb/hcd-xhci.c                |  1 -
 include/glib-compat.h            |  6 +++---
 include/sysemu/iothread.h        |  1 -
 include/sysemu/tpm_backend_int.h |  2 --
 iothread.c                       | 12 ------------
 qapi/block-core.json             |  2 +-
 9 files changed, 8 insertions(+), 33 deletions(-)

