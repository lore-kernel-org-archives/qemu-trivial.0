Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Vp0sk-0004Uf-I0
	for mharc-qemu-trivial@gnu.org; Fri, 06 Dec 2013 14:16:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49265)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Vp0sb-00048D-Kn
	for qemu-trivial@nongnu.org; Fri, 06 Dec 2013 14:16:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Vp0sW-0006Cj-7u
	for qemu-trivial@nongnu.org; Fri, 06 Dec 2013 14:16:01 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:57632)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Vp0sL-00067R-07; Fri, 06 Dec 2013 14:15:45 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id D631840D77;
	Fri,  6 Dec 2013 23:15:43 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id BB6FF52D;
	Fri,  6 Dec 2013 23:15:43 +0400 (MSK)
Received: (nullmailer pid 19206 invoked by uid 1000);
	Fri, 06 Dec 2013 19:15:43 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: aliguori@amazon.com
Date: Fri,  6 Dec 2013 23:15:27 +0400
Message-Id: <1386357341-19147-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 00/14] Trivial patches for 2013-12-06
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
X-List-Received-Date: Fri, 06 Dec 2013 19:16:07 -0000

Here's the first trivial-patches pull request after 1.7.
It contains the few patches which were requested for 1.7
but hasn't been applied, plus a few more patches which
weren't supposed to be included in 1.7.

Please pull.

Thanks,

/mjt

The following changes since commit 7dc65c02fe3fb8f3146ce0b9ff5fec5945329f=
0e:

  Open 2.0 development tree (2013-11-27 14:02:45 -0800)

are available in the git repository at:

  git://git.corpit.ru/qemu.git trivial-patches

for you to fetch changes up to 6fedcaa1c5419fa89c31fd34dabbd71861c615d2:

  eeprom93xx: fix coding style (2013-12-06 22:56:51 +0400)

----------------------------------------------------------------
Antony Pavlov (1):
      eeprom93xx: fix coding style

Don Koch (1):
      Don't crash on keyboard input with no handler

Fam Zheng (1):
      .gitignore: Ignore config.status

Michael Tokarev (1):
      hw/ppc/mac.h: remove unused BIOS_FILENAME definition

Stefan Weil (9):
      trace: Remove trace.h from console.h (less dependencies)
      trace: Remove trace.h from hw/usb/hcd-ehci.h (less dependencies)
      console: Replace conditional debug messages by trace methods
      gtk: Replace conditional debug messages by trace methods
      acpi-build: Fix compiler warning (missing gnu_printf format attribu=
te)
      qobject: Fix compiler warning (missing gnu_printf format attribute)
      misc: Replace 'struct QEMUTimer' by 'QEMUTimer'
      libcacard/cac: Remove unused statement (value stored is never read)
      libcacard/vcard_emul_nss: Remove unused statement (value stored is =
never read)

Zhi Yong Wu (1):
      virtio-net: fix the indent

 .gitignore                 |    1 +
 hw/char/cadence_uart.c     |    4 +--
 hw/display/vmware_vga.c    |    1 +
 hw/i386/acpi-build.c       |    5 ++--
 hw/net/virtio-net.c        |    2 +-
 hw/nvram/eeprom93xx.c      |   62 ++++++++++++++++++++++----------------=
------
 hw/ppc/mac.h               |    1 -
 hw/ppc/ppc.c               |    6 ++---
 hw/ppc/ppc405_uc.c         |    2 +-
 hw/ppc/ppc_booke.c         |    4 +--
 hw/timer/m48t59.c          |    4 +--
 hw/usb/hcd-ehci.c          |    1 +
 hw/usb/hcd-ehci.h          |    1 -
 include/hw/char/serial.h   |    4 +--
 include/hw/ppc/ppc.h       |    4 +--
 include/ui/console.h       |    1 -
 libcacard/cac.c            |    1 -
 libcacard/vcard_emul_nss.c |    1 -
 qobject/qerror.c           |    4 +--
 target-alpha/cpu-qom.h     |    2 +-
 target-mips/cpu.h          |    2 +-
 target-openrisc/cpu.h      |    2 +-
 target-sparc/cpu.h         |    2 +-
 trace-events               |    7 +++++
 ui/console.c               |   14 ++++------
 ui/gtk.c                   |   19 ++++----------
 ui/input.c                 |    2 +-
 27 files changed, 76 insertions(+), 83 deletions(-)


