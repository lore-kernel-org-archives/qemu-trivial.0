Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UnRaw-00051V-Ax
	for mharc-qemu-trivial@gnu.org; Fri, 14 Jun 2013 06:51:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54863)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UnRaq-0004sc-EY
	for qemu-trivial@nongnu.org; Fri, 14 Jun 2013 06:51:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UnRam-0004I6-UF
	for qemu-trivial@nongnu.org; Fri, 14 Jun 2013 06:50:56 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:44447)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1UnRah-0004FE-Nn; Fri, 14 Jun 2013 06:50:48 -0400
Received: from gandalf.tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 66E5C4165A;
	Fri, 14 Jun 2013 14:50:46 +0400 (MSK)
Received: by gandalf.tls.msk.ru (Postfix, from userid 1000)
	id 49D2B50A; Fri, 14 Jun 2013 14:50:44 +0400 (MSK)
From: Michael Tokarev <mjt@tls.msk.ru>
To: Anthony Liguori <aliguori@us.ibm.com>
Date: Fri, 14 Jun 2013 14:50:16 +0400
Message-Id: <1371207042-17980-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 00/26] Trivial-patches pull request for
	2013-06-14
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
X-List-Received-Date: Fri, 14 Jun 2013 10:51:00 -0000

This is yet another pull request from the trivial-patches queue.
There are many changes this time, most are really trivial, but
some, while also of trivial nature, are large(ish). These include:

 - linux headers update request, which syncs copy of linux headers
   with 3.10-rc5, together with 3 preparational changes

 - "char/serial: serial_ioport_write: Factor out common code" by
   Peter Crosthwaite, which is large but it removes ad-hoc implementation
   and uses generic bits instead

 - "create qemu_openpty_raw() helper function and move it to a separate f=
ile"
   by Michael Tokarev, which is also a bit large but it just moves common=
 code
   into a separate file.

It all appears to build (on OpenBSD, FreeBSD, OpenIndiana and Linux) and
work, as far as I can tell.

Please pull.

Thanks,

/mjt

The following changes since commit bd5c51ee6c4f1c79cae5ad2516d711a27b4ea8=
ec:

  qemu-char: don't issue CHR_EVENT_OPEN in a BH (2013-06-10 11:38:37 -050=
0)

are available in the git repository at:

  git://git.corpit.ru/qemu.git trivial-patches-next

for you to fetch changes up to ba275adba09adfc0f7ec533f1fddba678d9ba826:

  piix: fix some printf errors when debug is enabled (2013-06-14 14:38:45=
 +0400)

----------------------------------------------------------------
Alexey Kardashevskiy (3):
      KVM: ARM: Add dummy kvm_arch_init_irq_routing()
      KVM: S390: Add dummy kvm_arch_init_irq_routing()
      linux-headers: Update to v3.10-rc5

Alon Levy (1):
      libcacard/vscclient: fix leakage of socket on error paths

Andreas F=C3=A4rber (1):
      Makefile: Install qemu-img and qemu-nbd man pages only if built

Ed Maste (2):
      configure: remove ${config_host_ld} variable
      configure: Disable host-bsd USB on FreeBSD

Herv=C3=A9 Poussineau (1):
      cputlb: fix debug logs

Hu Tao (1):
      piix: fix some printf errors when debug is enabled

Michael Tokarev (4):
      qemu-char: remove a few needless #includes
      gitignore: unignore *.patch
      main-loop: do not include slirp/slirp.h, use libslirp.h instead
      create qemu_openpty_raw() helper function and move it to a separate=
 file

Peter Crosthwaite (4):
      intc/xilinx_intc: Use qemu_set_irq
      char/serial: cosmetic fixes.
      char/serial: Use generic Fifo8
      char/serial: serial_ioport_write: Factor out common code

Peter Wu (2):
      gtk: implement -full-screen
      Unbreak -no-quit for GTK, validate SDL options

Richard W.M. Jones (1):
      curl: Whitespace only changes.

Scott Wood (1):
      KVM: PPC: Add dummy kvm_arch_init_irq_routing()

Stefan Hajnoczi (1):
      ivshmem: add missing error exit(2)

Stefan Weil (4):
      device tree: Fix cppcheck warning
      hw/scsi: Don't increment a boolean value
      target-sparc: Replace free by g_free
      hw/xen: Use g_free instead of free and fix potential memory leaks

 .gitignore                        |    1 -
 Makefile                          |    5 +-
 block/curl.c                      |    4 +-
 configure                         |    7 +--
 cputlb.c                          |    4 +-
 device_tree.c                     |    2 +-
 hw/acpi/piix4.c                   |   12 ++---
 hw/char/serial.c                  |  128 +++++++++++++++++++------------=
-----------------
 hw/intc/xilinx_intc.c             |    6 +--
 hw/misc/ivshmem.c                 |    1 +
 hw/scsi/vmw_pvscsi.c              |    2 +-
 hw/xen/xen_pt_config_init.c       |    4 +-
 include/hw/char/serial.h          |   15 ++----
 include/qemu-common.h             |   15 +-----
 include/ui/console.h              |    2 +-
 libcacard/vscclient.c             |    9 +++-
 linux-headers/asm-arm/kvm.h       |   12 ++---
 linux-headers/asm-mips/kvm.h      |  138 +++++++++++++++++++++++++++++++=
+++++++++++++++++++++
 linux-headers/asm-mips/kvm_para.h |    1 +
 linux-headers/asm-powerpc/kvm.h   |   89 +++++++++++++++++++++++++++++++=
++
 linux-headers/asm-x86/kvm.h       |    1 -
 linux-headers/linux/kvm.h         |   42 +++++++++++++---
 linux-headers/linux/vfio.h        |    1 +
 linux-headers/linux/vhost.h       |   28 +++++++++++
 main-loop.c                       |    3 +-
 qemu-char.c                       |   79 ++----------------------------
 target-arm/kvm.c                  |    4 ++
 target-ppc/kvm.c                  |    4 ++
 target-s390x/kvm.c                |    4 ++
 target-sparc/cpu.c                |    2 +-
 ui/gtk.c                          |   18 +++----
 util/Makefile.objs                |    2 +-
 util/qemu-openpty.c               |  135 +++++++++++++++++++++++++++++++=
+++++++++++++++++++
 vl.c                              |   17 ++++---
 xen-all.c                         |    8 +--
 35 files changed, 569 insertions(+), 236 deletions(-)
 create mode 100644 linux-headers/asm-mips/kvm.h
 create mode 100644 linux-headers/asm-mips/kvm_para.h
 create mode 100644 util/qemu-openpty.c


