Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WuObp-0002PH-O9
	for mharc-qemu-trivial@gnu.org; Tue, 10 Jun 2014 12:09:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58364)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WuObi-0002BF-KU
	for qemu-trivial@nongnu.org; Tue, 10 Jun 2014 12:09:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WuObd-000848-FK
	for qemu-trivial@nongnu.org; Tue, 10 Jun 2014 12:09:06 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:59938)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WuObR-0007jK-Jr; Tue, 10 Jun 2014 12:08:49 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 4F50241246;
	Tue, 10 Jun 2014 20:08:47 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 3817C661;
	Tue, 10 Jun 2014 20:08:47 +0400 (MSK)
Received: (nullmailer pid 13289 invoked by uid 1000);
	Tue, 10 Jun 2014 16:08:47 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue, 10 Jun 2014 20:08:18 +0400
Message-Id: <1402416523-13212-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 00/25] Trivial patches for 2014-06-10
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
X-List-Received-Date: Tue, 10 Jun 2014 16:09:11 -0000

Another trivial-patches pull request.

Lots of small things all over this time.  Mostly by Peter Maydell ;)

There's one sort-of questionable patch by myself - fixing error message
in virtio.c, which is "shiny new", but I think such a really trivial
thing is fine ;)

Please consider pulling.

Thanks,

/mjt

The following changes since commit 3334e929ae2d01e47c3e64757ee7fcf975cede94:

  Merge remote-tracking branch 'remotes/kraxel/tags/pull-console-20140610-1' into staging (2014-06-10 12:06:17 +0100)

are available in the git repository at:


  git://git.corpit.ru/qemu.git tags/trivial-patches-2014-06-10

for you to fetch changes up to 1a2858995d283ddad4a745460d1cc770a9b93fc1:

  virtio.c: fix error message (2014-06-10 20:07:01 +0400)

----------------------------------------------------------------
trivial patches for 2014-06-10

----------------------------------------------------------------
Chen Gang (1):
      migration: Plug memory leak in migrate-set-cache-size command

Markus Armbruster (2):
      libcacard: Drop superfluous conditionals around g_free()
      libcacard: Clean up dead stores before g_free()

Michael Tokarev (1):
      virtio.c: fix error message

Nicolas Owens (1):
      hw: vmware_vga: don't return cursorx when the driver asks for cursory register

Paolo Bonzini (3):
      vdi: remove double conversion
      smbios: use g_free directly on NULL pointers
      cpu/x86: correctly set errors in x86_cpu_parse_featurestr

Peter Crosthwaite (4):
      net: cadence_gem: Fix Tx descriptor update
      net: cadence_gem: Add Tx descriptor fetch printf
      net: cadence_gem: Comment spelling sweep
      net: cadence_gem: Remove &desc[0] usages

Peter Maydell (11):
      slirp: Remove unused zero_ethaddr[] variable
      hw/i386/pc.c: Remove unused parallel_io and parallel_irq variables
      hw/sd/sd.c: Drop unused sd_acmd_type[] array
      util/qemu-sockets.c: Avoid unused variable warnings
      hw/dma/xilinx_axidma: Remove unused stream_halted() function
      hw/intc/openpic: Remove unused function IRQ_testbit()
      hw/isa/pc87312: Remove unused function is_parallel_epp()
      target-i386/translate.c: Remove unused tcg_gen_lshift()
      hw/misc/milkymist-softusb: Remove unused softusb_{read, write}_pmem()
      target-microblaze: Delete unused sign_extend() function
      hw/net/ne2000-isa: Register vmstate struct

Sergey Fedorov (1):
      qtest: fix hex2nib for capital characters

Stefan Weil (1):
      apb: Fix compiler warnings (large constants)

 arch_init.c                   |    1 -
 block/vdi.c                   |    1 -
 hw/display/vmware_vga.c       |    2 +-
 hw/dma/xilinx_axidma.c        |    5 -----
 hw/i386/pc.c                  |    3 ---
 hw/i386/smbios.c              |    9 ++-------
 hw/input/milkymist-softusb.c  |   25 -------------------------
 hw/intc/openpic.c             |    5 -----
 hw/isa/pc87312.c              |    5 -----
 hw/net/cadence_gem.c          |   31 ++++++++++++++++++-------------
 hw/net/ne2000-isa.c           |    1 +
 hw/pci-host/apb.c             |    4 ++--
 hw/sd/sd.c                    |   11 -----------
 hw/virtio/virtio.c            |    2 +-
 libcacard/cac.c               |   14 ++++----------
 libcacard/card_7816.c         |   12 +++---------
 libcacard/vcard.c             |   12 ++----------
 libcacard/vcard_emul_nss.c    |    4 +---
 libcacard/vreader.c           |    6 +-----
 page_cache.c                  |    1 +
 qtest.c                       |    2 +-
 slirp/slirp.c                 |    2 --
 target-i386/cpu.c             |   17 +++++++----------
 target-i386/translate.c       |    8 --------
 target-microblaze/translate.c |   13 -------------
 util/qemu-sockets.c           |    3 +--
 26 files changed, 46 insertions(+), 153 deletions(-)

