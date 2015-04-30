Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YnoEj-0005zj-FE
	for mharc-qemu-trivial@gnu.org; Thu, 30 Apr 2015 09:10:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48100)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YnoEd-0005wV-8E
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 09:10:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YnoEY-0004rb-Ti
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 09:10:35 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:36097)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YnoEN-0004qB-94; Thu, 30 Apr 2015 09:10:19 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id A05C44176F;
	Thu, 30 Apr 2015 16:10:18 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 81AF9921;
	Thu, 30 Apr 2015 16:10:18 +0300 (MSK)
Received: (nullmailer pid 10834 invoked by uid 1000);
	Thu, 30 Apr 2015 13:10:18 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 30 Apr 2015 16:10:16 +0300
Message-Id: <cover.1430399271.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 00/42] Trivial patches for 2015-04-30
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
X-List-Received-Date: Thu, 30 Apr 2015 13:10:40 -0000

Another attempt, now without the problematic ARRAY_SIZE removal,
but with additional patch removing the unused cpu_get_pc(), and
with additional Reviewed-by.

Resending only the newly added patch, not whole series.

Thanks,

/mjt

The following changes since commit 06feaacfb4cfef10cc0c93d97df7bfc8a71dbc=
7e:

  Merge remote-tracking branch 'remotes/bonzini/tags/for-upstream' into s=
taging (2015-04-30 12:04:11 +0100)

are available in the git repository at:

  git://git.corpit.ru/qemu.git tags/pull-trivial-patches-2015-04-30

for you to fetch changes up to 553029351bac9f5b4f9ea72793e55f02e7677ec2:

  openrisc: cpu: Remove unused cpu_get_pc (2015-04-30 16:06:18 +0300)

----------------------------------------------------------------
trivial patches for 2015-04-30

----------------------------------------------------------------
Chih-Min Chao (5):
      bitops : fix coding style
      ui/vnc : fix coding style
      ui/vnc : remove 'struct' of 'typedef struct'
      ui/console : remove 'struct' from 'typedef struct' type
      hw/display : remove 'struct' from 'typedef QXL struct'

Emilio G. Cota (5):
      cpus: use first_cpu macro instead of QTAILQ_FIRST(&cpus)
      input: remove unused mouse_handlers list
      qemu-char: remove unused list node from FDCharDriver
      coroutine: remove unnecessary parentheses in qemu_co_queue_empty
      linux-user/elfload: use QTAILQ_FOREACH instead of open-coding it

Gonglei (3):
      target-mips: fix memory leak
      vhost-user: remove superfluous '\n' around error_report()
      microblaze: fix memory leak

Jan Kiszka (1):
      hostmem: Fix mem-path property name in error report

John Snow (1):
      qmp-commands: Fix typo

Laszlo Ersek (1):
      docs/atomics.txt: fix two typos

Michael Tokarev (3):
      qemu-options: trivial spelling fix (messsage)
      libcacard: do not use full paths for include files in the same dir
      microblaze: cpu: Renumber EXCP_* constants to close gap

Paolo Bonzini (3):
      range: remove useless inclusions
      qemu-config: remove stray inclusions of hw/ files
      libcacard: stop including qemu-common.h

Peter Crosthwaite (10):
      arm: cpu.h: Remove unused typdefs
      configure: alphabetize tricore in target list
      defconfigs: Piggyback microblazeel on microblaze
      microblaze: mmu: Delete flip_um fn prototype
      microblaze: cpu: Remote unused cpu_get_pc
      microblaze: cpu: Remove unused CC_OP enum
      microblaze: cpu: Delete EXCP_NMI
      microblaze: cpu: delete unused cpu_interrupts_enabled
      tcg: Delete unused cpu_pc_from_tb()
      openrisc: cpu: Remove unused cpu_get_pc

Stefan Berger (3):
      tpm: Cast 64bit variables to int when used in DPRINTF
      tpm: Modify DPRINTF to enable -Wformat checking
      tpm: fix coding style

Stefan Weil (1):
      misc: Fix new collection of typos

Thomas Huth (6):
      vmxnet: Remove unused function vmxnet_rx_pkt_get_num_frags()
      pci: Remove unused function ich9_d2pbr_init()
      monitor: Remove unused functions
      usb: Remove unused functions
      util: Remove unused functions
      kvm: Silence warning from valgrind

 backends/hostmem-file.c                  |  2 +-
 configure                                |  4 +-
 cpus.c                                   |  2 +-
 default-configs/microblazeel-softmmu.mak | 10 +----
 dma-helpers.c                            |  1 -
 docs/atomics.txt                         |  4 +-
 hmp.h                                    |  1 -
 hw/acpi/pcihp.c                          |  1 -
 hw/block/virtio-blk.c                    |  2 +-
 hw/display/qxl.c                         |  2 +-
 hw/i386/acpi-build.c                     |  1 -
 hw/microblaze/boot.c                     | 13 ++++---
 hw/mips/mips_fulong2e.c                  |  1 +
 hw/mips/mips_malta.c                     |  1 +
 hw/mips/mips_r4k.c                       |  1 +
 hw/misc/edu.c                            |  2 +-
 hw/net/virtio-net.c                      |  2 +-
 hw/net/vmxnet_rx_pkt.c                   |  7 ----
 hw/net/vmxnet_rx_pkt.h                   |  9 -----
 hw/pci-bridge/i82801b11.c                | 21 ----------
 hw/ppc/spapr.c                           |  2 +-
 hw/tpm/tpm_passthrough.c                 | 16 ++++----
 hw/tpm/tpm_tis.c                         | 26 ++++++-------
 hw/usb/core.c                            | 41 --------------------
 hw/virtio/vhost-user.c                   | 22 +++++------
 include/hw/i386/ich9.h                   |  2 -
 include/hw/pci-host/q35.h                |  1 -
 include/hw/usb.h                         |  5 ---
 include/monitor/monitor.h                |  1 -
 include/qemu-common.h                    |  4 --
 include/qemu/bitops.h                    | 61 ++++++++++++++------------=
---
 include/qemu/compatfd.h                  |  1 -
 kvm-all.c                                | 14 +++----
 libcacard/cac.c                          |  5 ++-
 libcacard/card_7816.c                    |  4 +-
 libcacard/event.c                        |  2 +-
 libcacard/vcard.c                        |  4 +-
 libcacard/vcard_emul_nss.c               |  4 +-
 libcacard/vcardt.c                       |  4 +-
 libcacard/vreader.c                      |  4 +-
 libcacard/vscclient.c                    |  8 +++-
 linux-user/elfload.c                     |  3 +-
 monitor.c                                | 13 -------
 qemu-char.c                              |  1 -
 qemu-coroutine-lock.c                    |  2 +-
 qemu-options.hx                          |  2 +-
 qga/qapi-schema.json                     |  2 +-
 qmp-commands.hx                          |  4 +-
 target-arm/cpu.h                         | 14 -------
 target-microblaze/cpu.h                  | 27 +++----------
 target-microblaze/mmu.h                  |  1 -
 target-openrisc/cpu.h                    |  5 ---
 target-s390x/mmu_helper.c                |  8 ++--
 target-s390x/translate.c                 |  2 +-
 target-tricore/cpu.h                     |  5 ---
 tcg/tcg.h                                |  6 ++-
 tests/libqos/ahci.c                      |  4 +-
 ui/console.c                             |  4 +-
 ui/input-legacy.c                        |  2 -
 ui/spice-display.c                       |  8 ++--
 ui/vnc-auth-vencrypt.c                   |  8 ++--
 ui/vnc-tls.c                             | 10 ++---
 ui/vnc-ws.c                              |  4 +-
 ui/vnc.c                                 |  2 +-
 util/compatfd.c                          | 19 ---------
 util/osdep.c                             | 66 --------------------------=
------
 util/qemu-config.c                       |  2 -
 67 files changed, 156 insertions(+), 386 deletions(-)

