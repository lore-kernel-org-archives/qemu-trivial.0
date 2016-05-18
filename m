Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b30MT-0008Ds-CR
	for mharc-qemu-trivial@gnu.org; Wed, 18 May 2016 08:14:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58297)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b30MQ-0008Ah-75
	for qemu-trivial@nongnu.org; Wed, 18 May 2016 08:13:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b30ML-0002yW-Q5
	for qemu-trivial@nongnu.org; Wed, 18 May 2016 08:13:58 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:54980)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1b30MC-0002t6-Kq; Wed, 18 May 2016 08:13:44 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id AD44641788;
	Wed, 18 May 2016 15:06:10 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id DBBD0ADA;
	Wed, 18 May 2016 15:06:09 +0300 (MSK)
Received: (nullmailer pid 12379 invoked by uid 1000);
	Wed, 18 May 2016 12:06:09 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org
Date: Wed, 18 May 2016 15:05:55 +0300
Message-Id: <cover.1463573089.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 00/13] Trivial patches for 2016-05-18
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 18 May 2016 12:13:59 -0000

This is first pull request in quite a while.  Accumulating
only relatively old stuff which hasn't been applied to other
trees.  More to follow.

Please consider applying.

Thanks,

/mjt

The following changes since commit a257c741491ff1c3c192d13a89c136dd6401c54d:

  Merge remote-tracking branch 'remotes/cohuck/tags/s390x-20160517' into staging (2016-05-17 16:49:11 +0100)

are available in the git repository at:

  git://git.corpit.ru/qemu.git tags/pull-trivial-patches-2016-05-18

for you to fetch changes up to cb8d4c8f54b8271f642f02382eec29d468bb1c77:

  Fix some typos found by codespell (2016-05-18 15:04:27 +0300)

----------------------------------------------------------------
trivial patches for 2016-05-18

----------------------------------------------------------------
Alberto Garcia (1):
      ipack: Update e-mail address

Cao jin (3):
      remove comment for nonexistent structure member
      loader: fix potential memory leak
      smbios: fix typo

Greg Kurz (1):
      9p: drop unused declaration from coth.h

Michael Tokarev (1):
      s390: remove misleading comment

Peter Xu (1):
      qdict: fix unbounded stack warning for qdict_array_entries

Stefan Weil (3):
      Fix typo in variable name (found and fixed by codespell)
      configure: Use uniform description for devel packages
      Fix some typos found by codespell

Wei Jiangang (3):
      vl: fix comment about when parsing cpu definitions
      util: fix comment typos
      accel: make configure_accelerator return void

 accel.c                                 |  4 +--
 audio/mixeng.c                          |  2 +-
 audio/ossaudio.c                        |  2 +-
 configure                               |  2 +-
 contrib/ivshmem-server/ivshmem-server.h |  2 +-
 docs/specs/rocker.txt                   |  2 +-
 docs/throttle.txt                       |  2 +-
 hw/9pfs/coth.h                          |  1 -
 hw/char/ipoctal232.c                    |  2 +-
 hw/core/loader.c                        |  6 ++++
 hw/i2c/imx_i2c.c                        |  2 +-
 hw/ipack/ipack.c                        |  2 +-
 hw/ipack/tpci200.c                      |  2 +-
 hw/net/vmxnet3.c                        |  4 +--
 hw/pci/msi.c                            |  2 +-
 hw/pci/pci_bridge.c                     |  2 +-
 hw/s390x/ipl.c                          |  2 +-
 hw/scsi/spapr_vscsi.c                   |  2 +-
 hw/scsi/vmw_pvscsi.c                    |  2 +-
 hw/timer/a9gtimer.c                     |  2 +-
 hw/timer/aspeed_timer.c                 |  4 +--
 include/crypto/random.h                 |  2 +-
 include/hw/ipack/ipack.h                |  2 +-
 include/hw/smbios/smbios.h              |  2 +-
 include/hw/xen/xen_common.h             |  2 +-
 include/io/task.h                       |  2 +-
 include/qemu/osdep.h                    |  2 +-
 include/sysemu/accel.h                  |  2 +-
 include/sysemu/hostmem.h                |  1 -
 kvm-all.c                               |  2 +-
 migration/migration.c                   |  2 +-
 migration/ram.c                         |  2 +-
 nbd/client.c                            |  2 +-
 qga/channel-win32.c                     |  2 +-
 qga/commands.c                          |  4 +--
 qobject/qdict.c                         | 15 ++++----
 scripts/checkpatch.pl                   |  2 +-
 scripts/dump-guest-memory.py            | 64 ++++++++++++++++-----------------
 slirp/socket.c                          |  2 +-
 target-cris/translate.c                 |  4 +--
 target-cris/translate_v10.c             |  2 +-
 target-i386/cpu.c                       |  2 +-
 target-i386/cpu.h                       |  2 +-
 target-mips/op_helper.c                 |  2 +-
 target-tricore/translate.c              |  2 +-
 tcg/README                              |  2 +-
 tests/tcg/cris/check_addo.c             | 14 ++++----
 trace/simple.c                          |  4 +--
 ui/cocoa.m                              |  2 +-
 util/buffer.c                           |  4 +--
 util/qemu-sockets.c                     |  2 +-
 util/timed-average.c                    |  4 +--
 vl.c                                    |  2 +-
 53 files changed, 105 insertions(+), 106 deletions(-)

