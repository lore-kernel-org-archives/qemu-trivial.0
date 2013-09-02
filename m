Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VGRtg-0001Tl-TL
	for mharc-qemu-trivial@gnu.org; Mon, 02 Sep 2013 07:02:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45060)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VGRtW-0001Al-10
	for qemu-trivial@nongnu.org; Mon, 02 Sep 2013 07:02:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VGRtR-0005NP-0G
	for qemu-trivial@nongnu.org; Mon, 02 Sep 2013 07:02:05 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:36778)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VGRtF-0005K0-OE; Mon, 02 Sep 2013 07:01:49 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id AE11640229;
	Mon,  2 Sep 2013 15:01:46 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 9981F20D;
	Mon,  2 Sep 2013 15:01:46 +0400 (MSK)
Received: (nullmailer pid 14620 invoked by uid 1000);
	Mon, 02 Sep 2013 11:01:46 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: aliguori@us.ibm.com
Date: Mon,  2 Sep 2013 15:01:20 +0400
Message-Id: <1378119695-14568-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 00/15] Trivial patches for 2013-09-02
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
X-List-Received-Date: Mon, 02 Sep 2013 11:02:12 -0000

Hello.  Here's one another pull request for the trivial patches queue.
The request comes somewhat out of order, but this is because I was at
a 3-week vacation and the trivial-patches queue hasn't been processed
during this time, and it accumulated a few patches which are pre-
dependences for further work.

Please consider pulling.

/mjt

The following changes since commit 4ff78e0dbcd5c795962567fdc1b31e9e03c55b=
07:

  Merge remote-tracking branch 'luiz/queue/qmp' into staging (2013-08-30 =
12:26:04 -0500)

are available in the git repository at:


  git://git.corpit.ru/qemu.git trivial-patches

for you to fetch changes up to fcdda211f9239f4218f96cdc336a482f7103d90b:

  aio / timers: use g_usleep() not sleep() (2013-09-01 20:02:45 +0400)

----------------------------------------------------------------
Alex Bligh (1):
      aio / timers: use g_usleep() not sleep()

Antony Pavlov (1):
      pflash_cfi02.c: fix debug macro

Eric Blake (1):
      qmp: fix integer usage in examples

Herv=C3=A9 Poussineau (1):
      adlib: sort offsets in portio registration

Michael R. Hines (1):
      rdma: silly ipv6 bugfix

Peter Maydell (2):
      configure: disable clang -Wstring-plus-int warning
      slirp/arp_table.c: Avoid shifting into sign bit of signed integers

Stefan Hajnoczi (1):
      curl: qemu_bh_new() can never return NULL

Stefan Weil (6):
      misc: Fix some typos in names and comments
      configure: Don't write .pyc files by default (python -B)
      configure: Remove unneeded redirections of stderr (pkg-config --cfl=
ags, --libs)
      configure: Remove unneeded redirections of stderr (pkg-config --exi=
sts)
      target-arm: Report unimplemented opcodes (LOG_UNIMP)
      tci: Remove function tcg_out64 (fix broken build)

Taimoor Mirza (1):
      slirp: Port redirection option behave differently on Linux and Wind=
ows

 block/backup.c                           |    2 +-
 block/curl.c                             |    6 ------
 configure                                |   71 ++++++++++++++++++++++++=
+++++++++++------------------------------------
 hw/audio/adlib.c                         |    2 +-
 hw/block/pflash_cfi02.c                  |    2 +-
 hw/s390x/css.c                           |    2 +-
 hw/timer/exynos4210_rtc.c                |    4 ++--
 include/hw/bt.h                          |    8 ++++----
 libcacard/card_7816.c                    |    2 +-
 libcacard/card_7816t.h                   |    2 +-
 linux-headers/asm-powerpc/epapr_hcalls.h |    4 ++--
 migration-rdma.c                         |   14 ++++++++------
 qmp-commands.hx                          |   26 +++++++++++++-----------=
--
 slirp/arp_table.c                        |    4 ++--
 slirp/socket.c                           |    2 ++
 target-arm/translate.c                   |    4 ++++
 tcg/tci/tcg-target.c                     |    7 -------
 tests/test-aio.c                         |    6 +++---
 18 files changed, 81 insertions(+), 87 deletions(-)


