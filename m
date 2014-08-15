Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XIJE9-00012a-4c
	for mharc-qemu-trivial@gnu.org; Fri, 15 Aug 2014 11:15:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57805)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XIJE2-0000x8-4r
	for qemu-trivial@nongnu.org; Fri, 15 Aug 2014 11:15:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XIJDx-0005c7-5F
	for qemu-trivial@nongnu.org; Fri, 15 Aug 2014 11:15:30 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:39934)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XIJDm-0005Z9-K5; Fri, 15 Aug 2014 11:15:14 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 6738742F58;
	Fri, 15 Aug 2014 19:15:13 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 4C5A56DF;
	Fri, 15 Aug 2014 19:15:13 +0400 (MSK)
Received: (nullmailer pid 17901 invoked by uid 1000);
	Fri, 15 Aug 2014 15:15:13 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Fri, 15 Aug 2014 19:14:51 +0400
Message-Id: <1408115711-17836-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 00/20] Trivial patches for 2014-08-15
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
X-List-Received-Date: Fri, 15 Aug 2014 15:15:35 -0000

Here's another trivial-patches pull request, with patches accumulated
since the previous one which has been processed today.

This time, there's a bunch of changes by Gonglei removing "Yoda
conditions" and updating docs/comments, irq zero initing patches
by Peter Crosthwaite, and some other small fixes.

Please consider pulling/applying.

Thanks,

/mjt

The following changes since commit f083201667fddd51055c2ac67f67221e82298a=
35:

  Merge remote-tracking branch 'remotes/mjt/tags/trivial-patches-2014-08-=
09' into staging (2014-08-15 13:41:55 +0100)

are available in the git repository at:

  git://git.corpit.ru/qemu.git tags/trivial-patches-2014-08-15

for you to fetch changes up to 5edbdbcdf882e4220adc7dbf433351077cd1fbbc:

  ivshmem: check the value returned by fstat() (2014-08-15 19:12:58 +0400=
)

----------------------------------------------------------------
trivial patches for 2014-08-15

----------------------------------------------------------------
Fam Zheng (1):
      memory: Update obsolete comment about AddrRange field type

Gonglei (11):
      pci-host: update obsolete reference about piix_pci.c
      pci-host: update uncorresponding description
      CODING_STYLE: Section about conditional statement
      usb: don't use 'Yoda conditions'
      audio: don't use 'Yoda conditions'
      isa-bus: don't use 'Yoda conditions'
      don't use 'Yoda conditions'
      spice: don't use 'Yoda conditions'
      vl: don't use 'Yoda conditions'
      vmxnet3: don't use 'Yoda conditions'
      qemu-options.hx: fix typo about l2tpv3

Hu Tao (1):
      vl: free err

Jan Kiszka (1):
      apic: Fix reported DFR content

Liming Wang (1):
      qemu-options.hx: fix a typo of chardev

Peter Crosthwaite (3):
      ssi: xilinx_spi: Initialise CS GPIOs as NULL
      ppc: convert g_new(qemu_irq usages to g_new0
      intc: i8259: Convert Array allocation to g_new0

zhanghailiang (2):
      l2cap: fix access to freed memory
      ivshmem: check the value returned by fstat()

 CODING_STYLE              |   14 ++++++++++++++
 hw/audio/gus.c            |    2 +-
 hw/audio/hda-codec.c      |    3 ++-
 hw/audio/sb16.c           |    6 +++---
 hw/bt/l2cap.c             |    2 +-
 hw/intc/apic.c            |    2 +-
 hw/intc/i8259.c           |    2 +-
 hw/intc/openpic.c         |    2 +-
 hw/isa/isa-bus.c          |    2 +-
 hw/isa/lpc_ich9.c         |    2 +-
 hw/misc/ivshmem.c         |    6 +++++-
 hw/net/vmxnet3.c          |   16 ++++++++--------
 hw/pci-host/pam.c         |    4 ++--
 hw/pci-host/q35.c         |    2 +-
 hw/ppc/e500.c             |    2 +-
 hw/ppc/mac_newworld.c     |    2 +-
 hw/ssi/xilinx_spi.c       |    2 +-
 hw/usb/dev-audio.c        |    2 +-
 hw/usb/dev-mtp.c          |    4 ++--
 hw/usb/hcd-ehci.c         |    2 +-
 include/hw/pci-host/pam.h |    2 +-
 memory.c                  |    3 +--
 qdev-monitor.c            |    2 +-
 qemu-char.c               |    2 +-
 qemu-options.hx           |    4 ++--
 ui/spice-core.c           |    4 ++--
 util/qemu-sockets.c       |    2 +-
 vl.c                      |    6 ++++--
 28 files changed, 62 insertions(+), 42 deletions(-)

