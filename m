Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZugNW-0007Ap-Qx
	for mharc-qemu-trivial@gnu.org; Fri, 06 Nov 2015 07:44:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58396)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZugNS-00072V-42
	for qemu-trivial@nongnu.org; Fri, 06 Nov 2015 07:44:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZugNP-0000C4-Ar
	for qemu-trivial@nongnu.org; Fri, 06 Nov 2015 07:44:22 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:58183)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZugNC-00005W-Or; Fri, 06 Nov 2015 07:44:07 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 9481E40D82;
	Fri,  6 Nov 2015 15:44:03 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 7F640AB7;
	Fri,  6 Nov 2015 15:44:03 +0300 (MSK)
Received: (nullmailer pid 31671 invoked by uid 1000);
	Fri, 06 Nov 2015 12:44:03 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Fri,  6 Nov 2015 15:43:37 +0300
Message-Id: <cover.1446813768.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 00/24] Trivial patches for 2015-11-06
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
X-List-Received-Date: Fri, 06 Nov 2015 12:44:23 -0000

Another trivial-patches merge request.  Lots of various small
things all over.  Please consider merging/applying.

Thanks,

/mjt

The following changes since commit 9319738080faeb09876ce2017fcaea4937c475=
ee:

  Merge remote-tracking branch 'remotes/bonzini/tags/for-upstream-replay'=
 into staging (2015-11-06 11:31:40 +0000)

are available in the git repository at:

  git://git.corpit.ru/qemu.git tags/pull-trivial-patches-2015-11-06

for you to fetch changes up to bd54a9f9435c85de190a82019faef16c5ecf8e46:

  tap-bsd: use user-specified tap device if it already exists (2015-11-06=
 15:42:38 +0300)

----------------------------------------------------------------
trivial patches for 2015-11-06

----------------------------------------------------------------
Cao jin (2):
      fix bad indentation in pcie_cap_slot_write_config()
      qom/object: fix 2 comment typos

Daniel P. Berrange (1):
      configure: remove help string for 'vnc-tls' option

Ed Maste (1):
      tap-bsd: use user-specified tap device if it already exists

Eric Blake (2):
      maint: Ignore ivshmem binaries
      tests: ignore test-qga

Gonglei (1):
      ivshmem-server: fix possible OVERRUN

Julio Guerra (1):
      taget-ppc: Fix read access to IBAT registers higher than IBAT3

Kevin Wolf (1):
      gdbstub: Fix buffer overflows in gdb_handle_packet()

Marc-Andr=C3=A9 Lureau (1):
      hw/acpi/aml-build: remove useless glib version check

Markus Armbruster (3):
      ui: Use g_new() & friends where that makes obvious sense
      qxl: Use g_new() & friends where that makes obvious sense
      usb: Use g_new() & friends where that makes obvious sense

Paolo Bonzini (6):
      xen: fix invalid assertion
      bt: fix use of uninitialized variable seqlen
      pci-assign: do not test path with access() before opening
      target-alpha: fix uninitialized variable
      exec: avoid unnecessary cacheline bounce on ram_list.mru_block
      qemu-sockets: do not test path with access() before unlinking

Thomas Huth (5):
      hw/display/tcx: Remove superfluous OBJECT() typecasts
      hw/input/tsc210x: Remove superfluous memset
      tests/i44fx-test: No need for zeroing memory before memset
      linux-user/syscall: Replace g_malloc0 + memcpy with g_memdup
      hw/dma/pxa2xx: Remove superfluous memset

 .gitignore                              |  2 ++
 configure                               |  1 -
 contrib/ivshmem-server/ivshmem-server.c |  4 +++-
 exec.c                                  |  2 +-
 gdbstub.c                               | 18 ++++++++++++++--
 hw/acpi/aml-build.c                     |  2 --
 hw/bt/sdp.c                             | 29 +++++++++++++++++--------
 hw/display/qxl.c                        |  2 +-
 hw/display/tcx.c                        | 26 +++++++++++-----------
 hw/dma/pxa2xx_dma.c                     |  3 +--
 hw/i386/pci-assign-load-rom.c           |  6 +-----
 hw/input/tsc210x.c                      |  8 ++-----
 hw/pci/pcie.c                           | 12 +++++------
 hw/usb/ccid-card-emulated.c             |  4 ++--
 hw/usb/dev-mtp.c                        |  3 +--
 hw/usb/hcd-xhci.c                       |  2 +-
 hw/usb/redirect.c                       |  6 +++---
 hw/xen/xen_pt_config_init.c             |  4 ++--
 include/qom/object.h                    | 10 ++++-----
 linux-user/syscall.c                    |  3 +--
 net/tap-bsd.c                           | 38 +++++++++++++++++++++++++++=
+-----
 qom/object.c                            |  2 +-
 target-alpha/translate.c                |  2 +-
 target-ppc/translate_init.c             |  2 +-
 tests/.gitignore                        |  1 +
 tests/i440fx-test.c                     |  2 +-
 ui/console.c                            |  2 +-
 ui/curses.c                             |  2 +-
 ui/input-legacy.c                       |  4 ++--
 ui/keymaps.c                            |  2 +-
 ui/sdl.c                                |  2 +-
 ui/vnc-jobs.c                           |  6 +++---
 ui/vnc.c                                |  4 ++--
 util/qemu-sockets.c                     |  3 +--
 34 files changed, 130 insertions(+), 89 deletions(-)

