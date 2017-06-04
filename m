Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dHXny-0005Ix-2N
	for mharc-qemu-trivial@gnu.org; Sun, 04 Jun 2017 11:51:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60609)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dHXnu-0005Ez-Hp
	for qemu-trivial@nongnu.org; Sun, 04 Jun 2017 11:50:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dHXnt-0003D1-Je
	for qemu-trivial@nongnu.org; Sun, 04 Jun 2017 11:50:58 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:33555)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dHXno-00034A-5z; Sun, 04 Jun 2017 11:50:52 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id AB409404D1;
	Sun,  4 Jun 2017 18:45:27 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 820F35E3;
	Sun,  4 Jun 2017 18:45:27 +0300 (MSK)
Received: (nullmailer pid 16353 invoked by uid 1000);
	Sun, 04 Jun 2017 15:45:27 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org
Date: Sun,  4 Jun 2017 18:45:04 +0300
Message-Id: <cover.1496591095.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 00/22] Trivial patches for 2017-06-04
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sun, 04 Jun 2017 15:50:59 -0000

Trivial patches for 04 Jun 2017. Please consider applying.

/mjt

The following changes since commit c6e84fbd447a51e1161d74d71566a5f67b47ea=
c5:

  Merge remote-tracking branch 'remotes/mst/tags/for_upstream' into stagi=
ng (2017-06-02 17:46:22 +0100)

are available in the git repository at:

  git://git.corpit.ru/qemu.git tags/trivial-patches-fetch

for you to fetch changes up to 070ccceda3b23f85d048bbcf3c0040252a9a793a:

  hw/core: nmi.c can be compiled as common-obj nowadays (2017-06-04 18:43=
:09 +0300)

----------------------------------------------------------------
trivial patches for 2017-06-04

----------------------------------------------------------------
Eric Blake (2):
      block: Correct documentation for BLOCK_WRITE_THRESHOLD
      qapi: Fix some QMP documentation regressions

John Snow (1):
      ide-test: check return of fwrite

Juan Quintela (1):
      trivial: Remove unneeded ifndef in memory.h

Kamil Rytarowski (2):
      configure: Detect native NetBSD curses(3)
      ivshmem-server: ivshmem-client: Build when eventfd() is available

Luc MICHEL (1):
      target/arm: add data cache invalidation cp15 instruction to cortex-=
r5

Mao Zhongyi (1):
      scsi/lsi53c895a: Remove unused lsi_mem_*() return value

Marc-Andr=C3=A9 Lureau (2):
      qemu-ga: remove useless allocation
      dump: fix memory_mapping_filter leak

Markus Armbruster (2):
      docs qemu-doc: Avoid ide-drive, it's deprecated
      docs/qdev-device-use.txt: update section Default Devices

Max Filippov (1):
      hw/xtensa: sim: use g_string/g_new

Paolo Bonzini (1):
      altera_timer: fix incorrect memset

Philippe Mathieu-Daud=C3=A9 (3):
      hw/sparc: use ARRAY_SIZE() macro
      register: display register prefix (name) since it is available
      hw/mips: add missing include

Suraj Jitindar Singh (1):
      help: Add newline to end of thread option help text

Thomas Huth (4):
      qemu-doc: Move the qemu-ga description into a separate chapter
      qemu-doc: Add hyperlinks to further license information
      tests/libqtest: Print error instead of aborting when env variable i=
s missing
      hw/core: nmi.c can be compiled as common-obj nowadays

 configure                            |  5 +++--
 contrib/ivshmem-client/Makefile.objs |  2 +-
 contrib/ivshmem-server/Makefile.objs |  2 +-
 docs/bootindex.txt                   |  2 +-
 docs/qdev-device-use.txt             | 13 +++++++------
 hw/core/Makefile.objs                |  2 +-
 hw/core/register.c                   |  8 ++++----
 hw/scsi/lsi53c895a.c                 | 10 ++++------
 hw/sparc64/sun4u.c                   |  2 +-
 hw/timer/altera_timer.c              |  2 +-
 hw/xtensa/sim.c                      | 10 +++++-----
 include/exec/memory.h                |  2 --
 include/hw/mips/mips.h               |  1 +
 memory_mapping.c                     |  1 +
 qapi/block-core.json                 | 30 +++++++++++++++---------------
 qapi/block.json                      |  2 +-
 qemu-doc.texi                        | 21 +++++++++++----------
 qemu-options.hx                      |  4 ++--
 qga/commands-posix.c                 |  4 +---
 target/arm/cpu.c                     |  2 ++
 tests/ide-test.c                     |  8 ++++++--
 tests/libqtest.c                     |  5 ++++-
 22 files changed, 73 insertions(+), 65 deletions(-)

