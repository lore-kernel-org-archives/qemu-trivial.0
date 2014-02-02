Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1W9zpH-0002rj-0l
	for mharc-qemu-trivial@gnu.org; Sun, 02 Feb 2014 11:23:19 -0500
Received: from eggs.gnu.org ([208.118.235.92]:50088)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1W9zo1-0002pE-Og
	for qemu-trivial@nongnu.org; Sun, 02 Feb 2014 11:23:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1W9zmb-0000N1-Tt
	for qemu-trivial@nongnu.org; Sun, 02 Feb 2014 11:22:01 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:32861)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1W9zlU-00083T-8v; Sun, 02 Feb 2014 11:19:24 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 7FB0140213;
	Sun,  2 Feb 2014 20:12:44 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 559855FC;
	Sun,  2 Feb 2014 20:12:44 +0400 (MSK)
Received: (nullmailer pid 1636 invoked by uid 1000);
	Sun, 02 Feb 2014 16:12:44 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: aliguori@amazon.com
Date: Sun,  2 Feb 2014 20:12:36 +0400
Message-Id: <1391357563-1592-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 0/7] Trivial patches for 2014-02-02
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
X-List-Received-Date: Sun, 02 Feb 2014 16:23:17 -0000

There's nothing exciting in there, some really small things here and ther=
e.

Please pull.

Thanks,

/mjt

The following changes since commit 89e4a51ca9546a7bbe1998c4e3d4a3ac3a0c19=
be:

  Merge remote-tracking branch 'stefanha/tags/tracing-pull-request' into =
staging (2014-01-31 11:13:08 +0000)

are available in the git repository at:


  git://git.corpit.ru/qemu.git tags/trivial-patches-2014-02-02

for you to fetch changes up to b76afd1072e02fe77e09790fbe1e831700976c5f:

  tests/.gitignore: Ignore tests/check-qom-interface (2014-02-01 13:56:31=
 +0400)

----------------------------------------------------------------
trivial patches for 2014-02-02

----------------------------------------------------------------
Fam Zheng (1):
      tests/.gitignore: Ignore tests/check-qom-interface

Martin Husemann (1):
      qemu 1.7.0 does not build on NetBSD

Richard Henderson (1):
      tcg/s390: Remove sigill_handler

Stefan Hajnoczi (1):
      osdep: drop unused #include "trace.h"

Stefan Weil (3):
      i386: Add missing include file for QEMU_PACKED
      readline: Add missing GCC_FMT_ATTR
      hw/ppc: Remove unused defines

 hw/i386/bios-linker-loader.c    |    3 +--
 hw/ppc/ppc4xx_devs.c            |    2 --
 include/exec/softmmu_template.h |    5 ++++-
 include/qemu/readline.h         |    3 ++-
 monitor.c                       |    3 ++-
 qemu-io.c                       |    3 ++-
 tcg/s390/tcg-target.c           |   19 -------------------
 tests/.gitignore                |    1 +
 util/osdep.c                    |    1 -
 9 files changed, 12 insertions(+), 28 deletions(-)

