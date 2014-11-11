Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XoCii-0002jg-QG
	for mharc-qemu-trivial@gnu.org; Tue, 11 Nov 2014 09:47:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60763)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XoCia-0002Tj-CX
	for qemu-trivial@nongnu.org; Tue, 11 Nov 2014 09:46:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XoCiV-00081m-Dm
	for qemu-trivial@nongnu.org; Tue, 11 Nov 2014 09:46:52 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:59817)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XoCiJ-0007yR-T9; Tue, 11 Nov 2014 09:46:36 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 32E8141DE5;
	Tue, 11 Nov 2014 17:46:34 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 1B3A86D9;
	Tue, 11 Nov 2014 17:46:34 +0300 (MSK)
Received: (nullmailer pid 14555 invoked by uid 1000);
	Tue, 11 Nov 2014 14:46:34 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue, 11 Nov 2014 17:46:22 +0300
Message-Id: <cover.1415716845.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 00/11 for-2.2] Trivial patches for 2014-11-11
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
X-List-Received-Date: Tue, 11 Nov 2014 14:46:57 -0000

Here's another week's trivial patches pull req, for 2.2 release.
There's nothing exciting in there, but some patches are worth to
mention.

  4/11: numa: make 'info numa' take into account hotplugged memory
    this one has been pinged several times, and the numa
    maintainer agreed to push it using other tree.  It can
    be considered a bugfix for `info numa' output (not taking
    some memory into account), and while somewhat large for
    -trivial, it is actually rather trivial

  5/11: gdbstub: Add a missing case of signal number translation in gdbstub
    a bugfix to allow gdb debugging

  7/11: coroutine-sigaltstack: Change jmp_buf to sigjmp_buf
    this one is a bugfix discussed today

Please consider applying/pulling.

Thanks,

/mjt

The following changes since commit 7135781f65f1267a72bf554ee2b7bd605f9e59aa:

  Merge remote-tracking branch 'remotes/mjt/tags/pull-trivial-patches-2014-11-02' into staging (2014-11-03 14:55:17 +0000)

are available in the git repository at:

  git://git.corpit.ru/qemu.git tags/pull-trivial-patches-2014-11-11

for you to fetch changes up to 705be728c0b5546da10d8ef4239a112d1616bb97:

  block: Fix comment for bdrv_co_get_block_status (2014-11-11 17:36:19 +0300)

----------------------------------------------------------------
trivial patches for 2014-11-11

----------------------------------------------------------------
Chen Fan (1):
      target-i386: cpu: keeping function parameters alignment on new line

Chen Gang (2):
      pc-bios: petalogix-s3adsp1800.dtb: Use 'xlnx, xps-ethernetlite-2.00.a' instead of 'xlnx, xps-ethernetlite-2.00.b'
      xen-hvm: Remove redundant variable 'xstate'

Fam Zheng (1):
      block: Fix comment for bdrv_co_get_block_status

Gonglei (2):
      qemu-doc.texi: fix typos in x509 examples
      sysbus: Correct SYSTEM_BUS(obj) defines

Martin Simmons (1):
      gdbstub: Add a missing case of signal number translation in gdbstub

Peter Wu (1):
      slirp/smbd: modify/set several parameters in generated smbd.conf

Willem Pinckaers (1):
      coroutine-sigaltstack: Change jmp_buf to sigjmp_buf

Zhu Guihua (1):
      icc_bus: fix typo ICC_BRIGDE -> ICC_BRIDGE

zhanghailiang (1):
      numa: make 'info numa' take into account hotplugged memory

 block.c                          |    6 +++---
 coroutine-sigaltstack.c          |    2 +-
 gdbstub.c                        |    5 ++++-
 hw/cpu/icc_bus.c                 |    4 ++--
 include/block/block.h            |    4 +++-
 include/hw/sysbus.h              |    2 +-
 include/sysemu/sysemu.h          |    1 +
 monitor.c                        |    6 +++++-
 net/slirp.c                      |    9 ++++++++-
 numa.c                           |   38 ++++++++++++++++++++++++++++++++++++++
 pc-bios/petalogix-s3adsp1800.dtb |  Bin 8259 -> 8259 bytes
 qemu-doc.texi                    |    4 ++--
 target-i386/cpu.c                |    6 +++---
 xen-hvm.c                        |    3 +--
 14 files changed, 72 insertions(+), 18 deletions(-)

