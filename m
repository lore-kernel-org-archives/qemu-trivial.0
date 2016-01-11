Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aIY3L-00045N-4N
	for mharc-qemu-trivial@gnu.org; Mon, 11 Jan 2016 03:42:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50838)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aIY3E-0003pW-Qr
	for qemu-trivial@nongnu.org; Mon, 11 Jan 2016 03:42:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aIY3D-0000ua-O1
	for qemu-trivial@nongnu.org; Mon, 11 Jan 2016 03:42:08 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:34376)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1aIY37-0000re-D5; Mon, 11 Jan 2016 03:42:01 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 71C7E40375;
	Mon, 11 Jan 2016 11:42:00 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id E4A31A8A;
	Mon, 11 Jan 2016 11:41:59 +0300 (MSK)
Received: (nullmailer pid 28764 invoked by uid 1000);
	Mon, 11 Jan 2016 08:41:59 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon, 11 Jan 2016 11:41:39 +0300
Message-Id: <cover.1452501577.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 00/19] Trivial patches for 2016-01-11
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
X-List-Received-Date: Mon, 11 Jan 2016 08:42:10 -0000

This is the first trivial-patches pull request for 2016 year, and
the first one for qemu 2.6 series.  With some old stuff in there,
collecting missing patches since Nov-2015.

There's nothing exciting in there, except of a possible fun patch
enabling sigaltstack syscall.

Please consider applying/pulling.

Thanks,

/mjt

The following changes since commit 6bb9ead762bf749af11ea225fc2a74db1b93c1=
05:

  Merge remote-tracking branch 'remotes/kraxel/tags/pull-ui-20160108-1' i=
nto staging (2016-01-08 12:50:19 +0000)

are available in the git repository at:

  git://git.corpit.ru/qemu.git tags/pull-trivial-patches-2016-01-11

for you to fetch changes up to fe02fc5209d497d011b2b4b09395e2503d9dedc6:

  hw/s390x: Remove superfluous return statements (2016-01-11 11:39:28 +03=
00)

----------------------------------------------------------------
trivial patches for 2016-01-11

----------------------------------------------------------------
Cao jin (5):
      xen/Makefile.objs: simplify
      hw/misc/edu: Convert to realize()
      gt64120: convert to realize()
      SH PCI Host: convert to realize()
      PCI Bonito: QOMify and cleanup

Eric Blake (1):
      crypto: Fix typo in example

Johan Ouwerkerk (1):
      Add missing syscall nrs. according to more recent Linux kernels

Marc-Andr=C3=A9 Lureau (1):
      configure: fix trace backend check

Michael Tokarev (2):
      unicore32: convert get_sp_from_cpustate from macro to inline
      linux-user: enable sigaltstack for all architectures

Paolo Bonzini (1):
      net: convert qemu_log to error_report, fix message

Peter Maydell (2):
      scripts/checkpatch.pl: Don't allow special cases of unspaced operat=
ors
      osdep.h: Include glib-compat.h in osdep.h rather than qemu-common.h

Thomas Huth (5):
      MAINTAINERS: Add the correct device_tree.h file
      hw/ide: Remove superfluous return statements
      hw/acpi: Remove superfluous return statement
      hw/core/qdev: Remove superfluous return statement
      hw/s390x: Remove superfluous return statements

Zhu Lingshan (1):
      iscsi: fix readcapacity error message

 MAINTAINERS                          |  3 ++-
 block/iscsi.c                        |  2 +-
 configure                            |  2 +-
 hw/acpi/memory_hotplug.c             |  1 -
 hw/core/qdev.c                       |  1 -
 hw/ide/atapi.c                       |  1 -
 hw/ide/macio.c                       |  2 --
 hw/mips/gt64xxx_pci.c                |  6 ++----
 hw/misc/edu.c                        |  6 ++----
 hw/pci-host/bonito.c                 | 23 ++++++++++++-----------
 hw/s390x/css.c                       |  1 -
 hw/s390x/s390-pci-bus.c              |  4 ----
 hw/sh4/sh_pci.c                      |  5 ++---
 hw/xen/Makefile.objs                 |  3 +--
 include/crypto/tlssession.h          |  2 +-
 include/qemu-common.h                |  1 -
 include/qemu/osdep.h                 |  2 ++
 linux-user/aarch64/syscall_nr.h      | 13 +++++++++++++
 linux-user/arm/syscall_nr.h          | 12 ++++++++++++
 linux-user/mips/syscall_nr.h         | 12 ++++++++++++
 linux-user/syscall.c                 |  6 ------
 linux-user/unicore32/target_signal.h |  6 +++++-
 net/dump.c                           |  2 +-
 scripts/checkpatch.pl                | 13 -------------
 24 files changed, 69 insertions(+), 60 deletions(-)

