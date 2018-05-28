Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fNRYC-0006lP-Ny
	for mharc-qemu-trivial@gnu.org; Mon, 28 May 2018 19:27:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60789)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNRY9-0006io-Dj
	for qemu-trivial@nongnu.org; Mon, 28 May 2018 19:27:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNRY6-0000S6-3N
	for qemu-trivial@nongnu.org; Mon, 28 May 2018 19:27:35 -0400
Received: from mail-qt0-x229.google.com ([2607:f8b0:400d:c0d::229]:41361)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNRY1-0000NO-1w; Mon, 28 May 2018 19:27:29 -0400
Received: by mail-qt0-x229.google.com with SMTP id g13-v6so16547891qth.8;
	Mon, 28 May 2018 16:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=RbhyIDLHMtAi5RRt0fCQzwWLCZuGpF5ZNoKBI4ogDYM=;
	b=kxJ/vBUcEd9+M3eJ8pnUCfy9CRTxj1/XwV4awVpx/FFyd5VLZNmJPpyyo7fhjxKSuf
	vNv5Q0qkYR+pSoReJhDLraT4SKP2lNiMkL1phmMoFu6+sZ1gyBNXlq5nsPi28AdmUWiU
	J7Gh0HjkOvhhCVu3bHV0X0v9HbuxjG8gNH/ThRSQQwnNVKU1X5BVyBKDl/KKVgWO6K7H
	VpmNlKnmrFXXFMUn/CQNnzdehoh5h/4B4VZM87m0eJx/VXO7ToXbrk9UCwqhQNUjJMi8
	FSEGWNKErU7SLjuhfKoQRriVZCkG1LnxwD9JZETKhdGLr8gR3zsBpiO9arBD0FdmRarL
	Zz2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=RbhyIDLHMtAi5RRt0fCQzwWLCZuGpF5ZNoKBI4ogDYM=;
	b=ESplmPK8ZWZMoT3niMYKr1OtPjJrH8nhm/nb6OXZjFc9bapTAVQd7bkw/l86Gef4pa
	mH5mUUsXWh70eriCexaACB/l0V04nUAOgdQEdoBo4DbhD49yo7/4dSGnuJ5vDSghvvd8
	21ft21clsDPjQ5RPZZ2cdMqiwy1dcB6fOlTwpzBLOpQil2X/Kfl+5ZHOwBl9MXlX0+az
	BdDRQLzbqBFc64KcPUM3LJhmiySKPws99IeFModa1F6LOBh8L3Dkk7FANpX/mmxz7Y1j
	nfD9W32NKJ0+Mq81h04/eOjhNpbULHNqeBklagLmcKKn8/ECvxbZ84zXvTR1z7SHxT+E
	d1cQ==
X-Gm-Message-State: ALKqPwepTJk+LbEkCrOp7NZ6X0gIK5eab7dFNWKAbE6kJ2igdjEMSRNj
	gEAmwaa/rQsESU2senlu9pA=
X-Google-Smtp-Source: ADUXVKIg2sP7pfebslGNbsawhrmkGpSY1wFjPnWLttqVq+OfD/RpTCP6r1E9aEdb6yUOj91AOcfZSQ==
X-Received: by 2002:ac8:2d42:: with SMTP id
	o2-v6mr6829443qta.256.1527550048343; 
	Mon, 28 May 2018 16:27:28 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	s19-v6sm23756182qki.62.2018.05.28.16.27.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 May 2018 16:27:27 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Thomas Huth <thuth@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 28 May 2018 20:26:58 -0300
Message-Id: <20180528232719.4721-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::229
Subject: [Qemu-trivial] [PATCH v4 00/21] Includes cleanup
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
X-List-Received-Date: Mon, 28 May 2018 23:27:39 -0000

Hi,

I split the previous series "Use the BYTE-based definitions when useful",
this is the first generic part, only headers cleanup, which is big enough.

Many patches, but "12 insertions(+), 145 deletions(-)" \o/

v3 was:
http://lists.nongnu.org/archive/html/qemu-devel/2018-04/msg02049.html

Philippe Mathieu-Daudé (21):
  vfio: Include "exec/address-spaces.h" directly in the source file
  accel: Do not include "exec/address-spaces.h" if it is not necessary
  target: Do not include "exec/address-spaces.h" if it is not necessary
  memory: Do not include "exec/ioport.h" if it is not necessary
  target/i386: Do not include "exec/ioport.h" if it is not necessary
  target/xtensa: Include "qemu/timer.h" to use NANOSECONDS_PER_SECOND
  target/ppc: Include "exec/exec-all.h" which provides tlb_flush()
  target/hppa: Include "qemu/log.h" to use qemu_log()
  target: Do not include "exec/exec-all.h" if it is not necessary
  hw: Do not include "exec/ioport.h" if it is not necessary
  hw: Do not include "exec/address-spaces.h" if it is not necessary
  hw: Do not include "sysemu/block-backend.h" if it is not necessary
  hw: Do not include "sysemu/blockdev.h" if it is not necessary
  hw: Do not include "sysemu/blockdev.h" if it is not necessary
  hw/block/nvme: Include "qemu/cutils.h" directly in the source file
  hw/misc/mips_itu: Cleanup includes
  hw/misc/sga: Use the correct ISA include
  hw/hppa: Remove unused include
  hw/i386/pc: Remove unused include
  hw/ide: Remove unused include
  hw: Clean "hw/devices.h" includes

 bsd-user/qemu.h                          | 1 -
 hw/block/nvme.h                          | 1 -
 hw/hppa/hppa_sys.h                       | 1 -
 include/hw/arm/allwinner-a10.h           | 1 -
 include/hw/arm/bcm2835_peripherals.h     | 1 -
 include/hw/devices.h                     | 7 ++-----
 include/hw/display/bcm2835_fb.h          | 1 -
 include/hw/dma/bcm2835_dma.h             | 1 -
 include/hw/misc/bcm2835_mbox.h           | 1 -
 include/hw/misc/bcm2835_property.h       | 1 -
 include/hw/misc/mips_itu.h               | 2 ++
 include/hw/sh4/sh_intc.h                 | 1 -
 include/hw/vfio/vfio-common.h            | 1 -
 include/hw/virtio/virtio-access.h        | 1 -
 target/arm/arm_ldst.h                    | 1 -
 target/ppc/helper_regs.h                 | 1 +
 accel/tcg/cpu-exec.c                     | 1 -
 hw/acpi/pcihp.c                          | 1 -
 hw/acpi/piix4.c                          | 1 -
 hw/arm/aspeed.c                          | 1 -
 hw/arm/bcm2836.c                         | 1 -
 hw/arm/collie.c                          | 1 -
 hw/arm/gumstix.c                         | 1 -
 hw/arm/mainstone.c                       | 1 -
 hw/arm/nseries.c                         | 1 -
 hw/arm/omap1.c                           | 2 --
 hw/arm/omap2.c                           | 2 --
 hw/arm/omap_sx1.c                        | 1 -
 hw/arm/pxa2xx.c                          | 1 -
 hw/arm/spitz.c                           | 1 -
 hw/arm/versatilepb.c                     | 1 -
 hw/arm/vexpress.c                        | 1 -
 hw/arm/virt.c                            | 1 -
 hw/arm/xilinx_zynq.c                     | 1 -
 hw/arm/xlnx-zcu102.c                     | 1 -
 hw/arm/z2.c                              | 1 -
 hw/block/dataplane/virtio-blk.c          | 1 -
 hw/block/m25p80.c                        | 1 -
 hw/block/nvme.c                          | 1 +
 hw/block/onenand.c                       | 2 --
 hw/block/pflash_cfi01.c                  | 1 -
 hw/block/pflash_cfi02.c                  | 1 -
 hw/block/virtio-blk.c                    | 1 -
 hw/char/mcf_uart.c                       | 1 -
 hw/char/serial.c                         | 1 -
 hw/char/sh_serial.c                      | 1 -
 hw/core/loader-fit.c                     | 1 -
 hw/core/platform-bus.c                   | 1 -
 hw/core/qdev-properties.c                | 1 -
 hw/cris/axis_dev88.c                     | 1 -
 hw/display/sm501.c                       | 1 -
 hw/display/tc6393xb.c                    | 1 -
 hw/i386/kvmvapic.c                       | 1 -
 hw/i386/pc.c                             | 1 -
 hw/i386/xen/xen-mapcache.c               | 1 -
 hw/ide/core.c                            | 1 -
 hw/ide/pci.c                             | 1 -
 hw/ide/via.c                             | 1 -
 hw/isa/isa-superio.c                     | 1 -
 hw/lm32/lm32_boards.c                    | 1 -
 hw/lm32/milkymist.c                      | 1 -
 hw/m68k/mcf5206.c                        | 1 -
 hw/m68k/mcf_intc.c                       | 1 -
 hw/microblaze/petalogix_ml605_mmu.c      | 1 -
 hw/microblaze/petalogix_s3adsp1800_mmu.c | 1 -
 hw/mips/mips_malta.c                     | 1 -
 hw/mips/mips_r4k.c                       | 1 -
 hw/misc/arm_integrator_debug.c           | 1 -
 hw/misc/mips_itu.c                       | 5 +----
 hw/misc/sga.c                            | 2 +-
 hw/net/mcf_fec.c                         | 1 -
 hw/net/ne2000-isa.c                      | 1 -
 hw/pci-host/versatile.c                  | 1 -
 hw/ppc/ppc405_boards.c                   | 1 -
 hw/ppc/sam460ex.c                        | 1 -
 hw/ppc/spapr.c                           | 1 -
 hw/ppc/virtex_ml507.c                    | 2 --
 hw/riscv/riscv_htif.c                    | 1 -
 hw/s390x/virtio-ccw.c                    | 2 --
 hw/scsi/mptsas.c                         | 1 -
 hw/scsi/scsi-generic.c                   | 1 -
 hw/sd/pl181.c                            | 1 -
 hw/sd/sdhci.c                            | 2 --
 hw/sd/ssi-sd.c                           | 1 -
 hw/sh4/r2d.c                             | 1 -
 hw/sh4/sh7750.c                          | 1 -
 hw/timer/sh_timer.c                      | 1 -
 hw/usb/dev-storage.c                     | 1 -
 hw/vfio/ccw.c                            | 1 +
 hw/vfio/platform.c                       | 1 +
 hw/virtio/virtio-pci.c                   | 1 -
 hw/xen/xen_devconfig.c                   | 1 -
 hw/xtensa/xtfpga.c                       | 1 -
 memory.c                                 | 1 -
 monitor.c                                | 1 -
 target/arm/arm-powerctl.c                | 1 -
 target/arm/crypto_helper.c               | 1 -
 target/arm/iwmmxt_helper.c               | 1 -
 target/arm/neon_helper.c                 | 1 -
 target/arm/psci.c                        | 1 -
 target/arm/vec_helper.c                  | 1 -
 target/cris/cpu.c                        | 1 -
 target/hppa/helper.c                     | 1 -
 target/hppa/int_helper.c                 | 2 +-
 target/i386/hax-all.c                    | 2 --
 target/i386/hax-mem.c                    | 1 -
 target/i386/hax-windows.c                | 1 -
 target/i386/hvf/hvf.c                    | 2 --
 target/i386/hvf/x86_task.c               | 3 ---
 target/i386/kvm.c                        | 1 -
 target/i386/whpx-all.c                   | 1 -
 target/lm32/cpu.c                        | 1 -
 target/m68k/cpu.c                        | 1 -
 target/moxie/cpu.c                       | 1 -
 target/moxie/mmu.c                       | 1 -
 target/openrisc/cpu.c                    | 1 -
 target/ppc/int_helper.c                  | 1 -
 target/s390x/cpu.c                       | 1 -
 target/s390x/diag.c                      | 1 -
 target/s390x/helper.c                    | 1 -
 target/s390x/kvm.c                       | 1 -
 target/s390x/mem_helper.c                | 1 -
 target/s390x/misc_helper.c               | 1 -
 target/sparc/mmu_helper.c                | 1 -
 target/tilegx/cpu.c                      | 1 -
 target/xtensa/core-dc232b.c              | 2 +-
 target/xtensa/core-dc233c.c              | 1 -
 target/xtensa/core-de212.c               | 1 -
 target/xtensa/core-fsf.c                 | 1 -
 target/xtensa/core-sample_controller.c   | 1 -
 target/xtensa/cpu.c                      | 1 -
 tcg/tcg-op-vec.c                         | 1 -
 target/xtensa/import_core.sh             | 1 -
 133 files changed, 12 insertions(+), 145 deletions(-)

-- 
2.17.0


