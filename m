Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WTCEh-0001WC-IL
	for mharc-qemu-trivial@gnu.org; Thu, 27 Mar 2014 11:28:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35841)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WTCEa-0001JZ-TB
	for qemu-trivial@nongnu.org; Thu, 27 Mar 2014 11:28:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WTCEW-0002eq-2t
	for qemu-trivial@nongnu.org; Thu, 27 Mar 2014 11:28:48 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:40944)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WTCEJ-0002bR-TK; Thu, 27 Mar 2014 11:28:32 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 31F9D43703;
	Thu, 27 Mar 2014 19:28:30 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id E71FB634;
	Thu, 27 Mar 2014 19:28:29 +0400 (MSK)
Received: (nullmailer pid 1764 invoked by uid 1000);
	Thu, 27 Mar 2014 15:28:29 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 27 Mar 2014 19:28:05 +0400
Message-Id: <1395934108-1694-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL for-2.0 00/23] Trivial patches for 2014-03-27
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
X-List-Received-Date: Thu, 27 Mar 2014 15:28:53 -0000

Here's another trivial-patches pull request, for 2.0.

I removed -m-to-QemuOpts conversion patches, what's left
are either really trivial stuff (some `static const' designators
from Stefan Weil, some duplicate statement removals from Prasad Joshi),
minor documentation fixes (and addition of coding style section),
one bugfix for KVM_GET_DIRTY_LOG ioctl return check by Mario Smarduch,
and a large(ish) series of shift-into-sign-bit by Peter Maydell.
Everything appears to be fine for 2.0.

Please consider applying or pulling.

Thanks!

/mjt

The following changes since commit bea4acda3bff00e98cb00d5354f23de9e74a928f:

  Merge remote-tracking branch 'remotes/mcayland/qemu-sparc' into staging (2014-03-27 10:54:17 +0000)

are available in the git repository at:


  git://git.corpit.ru/qemu.git tags/trivial-patches-2014-03-27

for you to fetch changes up to 3768d505adcd6c3fe819432d7dabd312995fa678:

  linux-user: remove duplicate statement (2014-03-27 19:22:49 +0400)

----------------------------------------------------------------
trivial patches for 2014-03-27

----------------------------------------------------------------
Eduardo Habkost (1):
      CODING_STYLE: Section about mixed declarations

Mario Smarduch (1):
      fix return check for KVM_GET_DIRTY_LOG ioctl

Mark Cave-Ayland (2):
      doc: update sun4m documentation
      doc: update default PowerPC framebuffer settings

Peter Maydell (12):
      target-i386: Avoid shifting left into sign bit
      hw/intc/apic.c: Use uint32_t for mask word in foreach_apic
      hw/pci/pci_host.c: Avoid shifting left into sign bit
      hw/i386/acpi_build.c: Avoid shifting left into sign bit
      target-mips: Avoid shifting left into sign bit
      hw/usb/hcd-ohci.c: Avoid shifting left into sign bit
      hw/intc/openpic: Avoid shifting left into sign bit
      hw/ppc: Avoid shifting left into sign bit
      tests/libqos/pci-pc: Avoid shifting left into sign bit
      hw/intc/slavio_intctl: Avoid shifting left into sign bit
      hw/intc/xilinx_intc: Avoid shifting left into sign bit
      hw/pci-host/apb.c: Avoid shifting left into sign bit

Prasad Joshi (2):
      hw/timer/grlib_gptimer: remove unnecessary assignment
      linux-user: remove duplicate statement

Stefan Weil (5):
      target-s390x: Add missing 'static' and 'const' attributes
      target-arm: Add missing 'static' attribute
      hw/ide: Add missing 'static' attributes
      util: Add 'static' attribute to function implementation
      target-i386: Add missing 'static' and 'const' attributes

 CODING_STYLE                 |    7 +
 hw/i386/acpi-build.c         |    2 +-
 hw/ide/pci.c                 |    2 +-
 hw/intc/apic.c               |    6 +-
 hw/intc/openpic.c            |   14 +-
 hw/intc/slavio_intctl.c      |    2 +-
 hw/intc/xilinx_intc.c        |    3 +-
 hw/pci-host/apb.c            |   10 +-
 hw/pci/pci_host.c            |    3 +-
 hw/ppc/ppc.c                 |    2 +-
 hw/ppc/ppc440_bamboo.c       |    4 +-
 hw/ppc/ppc4xx_devs.c         |    2 +-
 hw/ppc/ppc_booke.c           |   24 +--
 hw/ppc/virtex_ml507.c        |    4 +-
 hw/timer/grlib_gptimer.c     |    1 -
 hw/usb/hcd-ohci.c            |   32 ++--
 kvm-all.c                    |    2 +-
 linux-user/signal.c          |    2 -
 qemu-doc.texi                |   11 +-
 qemu-options.hx              |   10 +-
 target-arm/machine.c         |    2 +-
 target-i386/cpu.c            |    2 +-
 target-i386/cpu.h            |  334 +++++++++++++++++++++---------------------
 target-i386/kvm.c            |    2 +-
 target-mips/cpu.h            |    2 +-
 target-mips/helper.c         |    8 +-
 target-mips/op_helper.c      |    2 +-
 target-mips/translate_init.c |   22 +--
 target-s390x/arch_dump.c     |    6 +-
 tests/libqos/pci-pc.c        |   12 +-
 util/module.c                |    2 +-
 31 files changed, 276 insertions(+), 261 deletions(-)

