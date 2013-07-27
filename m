Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V2z0Y-00020l-ND
	for mharc-qemu-trivial@gnu.org; Sat, 27 Jul 2013 03:33:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40273)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1V2z0S-0001nu-8F
	for qemu-trivial@nongnu.org; Sat, 27 Jul 2013 03:33:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1V2z0Q-0005f2-Fl
	for qemu-trivial@nongnu.org; Sat, 27 Jul 2013 03:33:36 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:59862)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1V2z0M-0005dC-1t; Sat, 27 Jul 2013 03:33:30 -0400
Received: from gandalf.tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id F1C1142F73;
	Sat, 27 Jul 2013 11:33:28 +0400 (MSK)
Received: by gandalf.tls.msk.ru (Postfix, from userid 1000)
	id 2AC96202880; Sat, 27 Jul 2013 11:33:28 +0400 (MSK)
From: Michael Tokarev <mjt@tls.msk.ru>
To: anthony@codemonkey.ws
Date: Sat, 27 Jul 2013 11:33:15 +0400
Message-Id: <1374910406-15273-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL trivial 00/11] trivial patches for 2013-07-27
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
X-List-Received-Date: Sat, 27 Jul 2013 07:33:37 -0000

We collected a few more trivial patches this week, including a compile
failure fix for 32bit builds by Stefan Weil.

Please pull.

The following changes since commit 200a06397f5d3e982028fd78b25b420507ade0=
21:

  Merge remote-tracking branch 'afaerber/tags/qom-cpu-for-anthony' into s=
taging (2013-07-26 17:53:19 -0500)

are available in the git repository at:


  git://git.corpit.ru/qemu.git trivial-patches

for you to fetch changes up to 6c86f405efd6532b58ad1b607cc9f11e856ef5ca:

  target-mips: Remove assignment to a variable which is never used (2013-=
07-27 11:22:54 +0400)

----------------------------------------------------------------
Liu Ping Fan (1):
      timer: make timers_state static

Petar Jovanovic (1):
      linux-user: correct argument number for sys_mremap and sys_splice

Ramkumar Ramachandra (1):
      qemu-options: mention C-a h in the -nographic doc

Stefan Weil (8):
      aes: Remove unused code (NDEBUG, u16)
      hw/9pfs: Fix potential memory leak and avoid reuse of freed memory
      exec: Remove env from list of poisoned names
      watchdog: Remove break after exit
      PPC: dbdma: macio: Fix format specifiers (build regression)
      misc: Fix new typos in comments and strings
      misc: Use g_assert_not_reached for code which is expected to be unr=
eachable
      target-mips: Remove assignment to a variable which is never used

 block/vhdx.h                       |    2 +-
 blockdev.c                         |    2 +-
 cpus.c                             |    2 +-
 docs/rdma.txt                      |    2 +-
 hw/9pfs/virtio-9p-proxy.c          |    2 ++
 hw/ide/macio.c                     |    9 +++++----
 hw/net/vmxnet3.c                   |   16 ++++++++--------
 hw/net/vmxnet_tx_pkt.c             |    2 +-
 hw/usb/hcd-ehci.c                  |    8 ++++----
 hw/virtio/virtio-balloon.c         |    4 ++--
 hw/watchdog/watchdog.c             |    1 -
 hw/xen/xen_pt.c                    |    3 ++-
 include/exec/poison.h              |    1 -
 linux-user/main.c                  |    4 ++--
 migration-rdma.c                   |    4 ++--
 net/eth.c                          |    2 +-
 qdev-monitor.c                     |    4 ++--
 qemu-options.hx                    |    3 ++-
 target-arm/helper.c                |    2 +-
 target-mips/op_helper.c            |    1 -
 tests/test-qmp-input-visitor.c     |    2 +-
 tests/test-qmp-output-visitor.c    |    4 ++--
 tests/test-visitor-serialization.c |    8 ++++----
 util/aes.c                         |    5 -----
 24 files changed, 45 insertions(+), 48 deletions(-)

