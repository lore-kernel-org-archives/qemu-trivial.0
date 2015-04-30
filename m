Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Yngik-0000Or-HW
	for mharc-qemu-trivial@gnu.org; Thu, 30 Apr 2015 01:09:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45833)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Yngie-0000Ar-AD
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 01:09:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Yngic-0003mU-U6
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 01:09:04 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:56140)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YngiY-0003kP-3m; Thu, 30 Apr 2015 01:08:58 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 2F54B42B84;
	Thu, 30 Apr 2015 08:08:57 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 1C7D593E;
	Thu, 30 Apr 2015 08:08:57 +0300 (MSK)
Received: (nullmailer pid 4291 invoked by uid 1000);
	Thu, 30 Apr 2015 05:08:57 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 30 Apr 2015 08:08:13 +0300
Message-Id: <cover.1430370396.git.mjt@msgid.tls.msk.ru>
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
X-List-Received-Date: Thu, 30 Apr 2015 05:09:08 -0000

Hello.

This is the first pull request for trivial-patches tree since 2.3 has
been released.  During the freeze many patches has been accumulated,
and even more has been received after 2.4 developmnent has been opened.

So here we have 42 trivial patches, which is kinda too much, but that's
what we have :)

Please consider applying.

Thanks,

/mjt

The following changes since commit a9392bc93c8615ad1983047e9f91ee3fa8aae7=
5f:

  Merge remote-tracking branch 'remotes/kevin/tags/for-upstream' into sta=
ging (2015-04-28 16:55:03 +0100)

are available in the git repository at:

  git://git.corpit.ru/qemu.git tags/pull-trivial-patches-2015-04-30

for you to fetch changes up to fe31d3e6e6945b509e5b4ab03d38aae1266fe64e:

  microblaze: fix memory leak (2015-04-30 08:06:20 +0300)

----------------------------------------------------------------
trivial patches for 2015-04-30

----------------------------------------------------------------
Chih-Min Chao (5):
      bitops : fix coding style
      ui/vnc : fix coding style
      ui/vnc : remove 'struct' of 'typedef struct'
      ui/console : remove 'struct' from 'typedef struct' type
      hw/display : remove 'struct' from 'typedef QXL struct'

Emilio G. Cota (6):
      cpus: use first_cpu macro instead of QTAILQ_FIRST(&cpus)
      input: remove unused mouse_handlers list
      qemu-char: remove unused list node from FDCharDriver
      coroutine: remove unnecessary parentheses in qemu_co_queue_empty
      linux-user/elfload: use QTAILQ_FOREACH instead of open-coding it
      i440fx-test: remove ARRAY_SIZE redefinition

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

Peter Crosthwaite (9):
      arm: cpu.h: Remove unused typdefs
      configure: alphabetize tricore in target list
      defconfigs: Piggyback microblazeel on microblaze
      microblaze: mmu: Delete flip_um fn prototype
      microblaze: cpu: Remote unused cpu_get_pc
      microblaze: cpu: Remove unused CC_OP enum
      microblaze: cpu: Delete EXCP_NMI
      microblaze: cpu: delete unused cpu_interrupts_enabled
      tcg: Delete unused cpu_pc_from_tb()

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
 target-s390x/mmu_helper.c                |  8 ++--
 target-s390x/translate.c                 |  2 +-
 target-tricore/cpu.h                     |  5 ---
 tcg/tcg.h                                |  6 ++-
 tests/i440fx-test.c                      |  2 -
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
 67 files changed, 156 insertions(+), 383 deletions(-)

