Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YTRt7-0003Wt-1c
	for mharc-qemu-trivial@gnu.org; Thu, 05 Mar 2015 04:16:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46405)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YTRt1-0003OZ-VI
	for qemu-trivial@nongnu.org; Thu, 05 Mar 2015 04:16:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YTRt0-0007BJ-Nt
	for qemu-trivial@nongnu.org; Thu, 05 Mar 2015 04:16:07 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:38655)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YTRss-00079Q-HO; Thu, 05 Mar 2015 04:15:58 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 0992040AA1;
	Thu,  5 Mar 2015 12:15:57 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id EBD4992E;
	Thu,  5 Mar 2015 12:15:56 +0300 (MSK)
Received: (nullmailer pid 28125 invoked by uid 1000);
	Thu, 05 Mar 2015 09:15:56 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu,  5 Mar 2015 12:15:56 +0300
Message-Id: <cover.1425546787.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL v3 00/45] Trivial patches for 2015-03-04
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
X-List-Received-Date: Thu, 05 Mar 2015 09:16:11 -0000

And here's Yet Another pull request, dropping one more patch
("microblaze: fix memory leak") which was broken and escaped
my testing coverage.  I left the tag/subject intact, and again,
wont include all the individual patches, which is the same
set as in the original pull request minus 2 patches.

Please consider pulling.

Thanks,

/mjt

The following changes since commit 3539bbb93e944ffde31c61c369ea9eedcc5697=
a6:

  Merge remote-tracking branch 'remotes/awilliam/tags/vfio-update-2015030=
2.0' into staging (2015-03-04 14:37:31 +0000)

are available in the git repository at:

  git://git.corpit.ru/qemu.git tags/pull-trivial-patches-2015-03-04

for you to fetch changes up to df16fd9e61db90c661e6630d7de1fdcc5200ac25:

  9pfs: remove useless return (2015-03-05 12:12:16 +0300)

----------------------------------------------------------------
trivial patches for 2015-03-04

----------------------------------------------------------------
Alberto Garcia (2):
      qerror.h: Swap definitions that were not in alphabetical order
      qmp-commands.hx: Fix several typos

Borislav Petkov (1):
      memsave: Improve and disambiguate error message

Cole Robinson (3):
      qapi-schema: Fix SpiceChannel docs
      gitignore: Track common.env in iotests gitignore
      gitignore: Ignore new tests

Gabriel L. Somlo (1):
      smbios: document cmdline options for smbios type 2-4, 17 structures

Gonglei (18):
      xen-pt: fix Negative array index read
      xen-pt: fix Out-of-bounds read
      block: remove superfluous '\n' around error_report/error_setg
      a9gtimer: remove superfluous '\n' around error_setg
      pl330.c: remove superfluous '\n' around error_setg
      numa: remove superfluous '\n' around error_setg
      Remove superfluous '\n' around error_report()
      vhost-scsi: Remove superfluous '\n' around error_report()
      vfio: Remove superfluous '\n' around error_report()
      xtensa: Remove superfluous '\n' around error_report()
      tpm: Remove superfluous '\n' around error_report()
      arm/digic_boards: Remove superfluous '\n' around error_report()
      vhost: Remove superfluous '\n' around error_report()
      nbd: fix resource leak
      sparc/leon3.c: fix memory leak
      macio: fix possible memory leak
      milkymist.c: fix memory leak
      sysbus: fix memory leak

Markus Armbruster (1):
      xilinx_ethlite: Clean up after commit 2f991ad

Michael Tokarev (3):
      qemu-options: fix/document -incoming options
      e500: fix memory leak
      9pfs: remove useless return

Paolo Bonzini (2):
      cutils: refine strtol error handling in parse_debug_env
      gdbstub: avoid possible NULL pointer dereference

Radim Kr=C4=8Dm=C3=A1=C5=99 (2):
      fix GCC 5.0.0 logical-not-parentheses warnings
      milkymist-pfpu: fix GCC 5.0.0 aggressive-loop-optimizations warning

Stefan Berger (1):
      Add copyright and author after file split

Stefan Weil (6):
      vhost_net: Add missing 'static' attribute
      disas/arm: Fix warnings caused by missing 'static' attribute
      disas/cris: Fix warning caused by missing 'static' attribute
      disas/microblaze: Fix warnings caused by missing 'static' attribute
      oslib-posix: Fix compiler warning (-Wclobbered) and simplify the co=
de
      migration: Fix coding style (whitespace issues)

Thomas Huth (3):
      ui: Removed unused functions
      ui/vnc: Remove vnc_stop_worker_thread()
      xen: Remove xen_cmos_set_s3_resume()

Wang Xin (2):
      qemu-char: add cyrillic characters 'numerosign' to VNC keysyms
      qemu-char: add cyrillic key 'numerosign' to Russian keymap

 .gitignore                    |   1 -
 block/archipelago.c           |   6 +-
 block/nbd.c                   |   1 +
 cpus.c                        |   4 +-
 disas/arm.c                   | 128 ------------------------------------=
------
 disas/cris.c                  |   2 +-
 disas/microblaze.c            |  13 +++--
 exec.c                        |   2 +-
 gdbstub.c                     |   8 ++-
 hw/9pfs/virtio-9p-local.c     |   1 -
 hw/arm/digic_boards.c         |   6 +-
 hw/block/nand.c               |   2 +-
 hw/core/sysbus.c              |   2 +
 hw/dma/pl330.c                |   4 +-
 hw/ide/pci.c                  |   2 +-
 hw/lm32/milkymist.c           |   1 +
 hw/microblaze/boot.c          |   2 +-
 hw/misc/macio/macio.c         |   3 +-
 hw/misc/milkymist-pfpu.c      |   2 +-
 hw/net/vhost_net.c            |   2 +-
 hw/net/virtio-net.c           |   4 +-
 hw/net/xilinx_ethlite.c       |   1 +
 hw/ppc/e500.c                 |   1 +
 hw/scsi/vhost-scsi.c          |   6 +-
 hw/sparc/leon3.c              |   1 +
 hw/timer/a9gtimer.c           |   2 +-
 hw/tpm/tpm_passthrough.c      |  12 ++--
 hw/vfio/common.c              |  10 ++--
 hw/virtio/vhost-backend.c     |   2 +-
 hw/xen/xen_pt_config_init.c   |   8 +--
 hw/xtensa/sim.c               |   2 +-
 hw/xtensa/xtfpga.c            |  10 ++--
 include/hw/xen/xen.h          |   1 -
 include/qapi/qmp/qerror.h     |   6 +-
 include/ui/console.h          |   3 -
 kvm-all.c                     |   2 +-
 migration/qemu-file-buf.c     |   4 ++
 migration/rdma.c              |  22 ++++----
 net/vhost-user.c              |   4 +-
 numa.c                        |   6 +-
 pc-bios/keymaps/ru            |   2 +-
 qapi-schema.json              |   6 +-
 qemu-img.c                    |   5 +-
 qemu-options.hx               |  56 ++++++++++++++++--
 qmp-commands.hx               |   6 +-
 target-s390x/kvm.c            |   2 +-
 tests/.gitignore              |   3 +
 tests/qemu-iotests/.gitignore |   1 +
 tpm.c                         |   2 +-
 trace/control.c               |   2 +-
 ui/console.c                  |  12 ----
 ui/d3des.c                    |   9 ---
 ui/d3des.h                    |   6 --
 ui/input-legacy.c             |   6 --
 ui/vnc-jobs.c                 |  13 -----
 ui/vnc-jobs.h                 |   1 -
 ui/vnc_keysym.h               |   1 +
 util/cutils.c                 |   5 +-
 util/oslib-posix.c            |   4 +-
 xen-hvm-stub.c                |   4 --
 60 files changed, 163 insertions(+), 282 deletions(-)

