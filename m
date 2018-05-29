Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fNSAb-0001Ia-53
	for mharc-qemu-trivial@gnu.org; Mon, 28 May 2018 20:07:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40839)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1fNSAV-0001EG-UK
	for qemu-trivial@nongnu.org; Mon, 28 May 2018 20:07:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1fNSAU-0001T8-Bd
	for qemu-trivial@nongnu.org; Mon, 28 May 2018 20:07:15 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:43926 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mst@redhat.com>)
	id 1fNSAN-0001R0-6u; Mon, 28 May 2018 20:07:07 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D1F79401EF05;
	Tue, 29 May 2018 00:07:06 +0000 (UTC)
Received: from redhat.com (ovpn-121-106.rdu2.redhat.com [10.10.121.106])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2F769202699A;
	Tue, 29 May 2018 00:07:05 +0000 (UTC)
Date: Tue, 29 May 2018 03:07:04 +0300
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20180529030657-mutt-send-email-mst@kernel.org>
References: <20180528232719.4721-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20180528232719.4721-1-f4bug@amsat.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Tue, 29 May 2018 00:07:06 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Tue, 29 May 2018 00:07:06 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'mst@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [PATCH v4 00/21] Includes cleanup
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
X-List-Received-Date: Tue, 29 May 2018 00:07:19 -0000

On Mon, May 28, 2018 at 08:26:58PM -0300, Philippe Mathieu-Daud=E9 wrote:
> Hi,
>=20
> I split the previous series "Use the BYTE-based definitions when useful=
",
> this is the first generic part, only headers cleanup, which is big enou=
gh.
>=20
> Many patches, but "12 insertions(+), 145 deletions(-)" \o/

Series
Acked-by: Michael S. Tsirkin <mst@redhat.com>


> v3 was:
> http://lists.nongnu.org/archive/html/qemu-devel/2018-04/msg02049.html
>=20
> Philippe Mathieu-Daud=E9 (21):
>   vfio: Include "exec/address-spaces.h" directly in the source file
>   accel: Do not include "exec/address-spaces.h" if it is not necessary
>   target: Do not include "exec/address-spaces.h" if it is not necessary
>   memory: Do not include "exec/ioport.h" if it is not necessary
>   target/i386: Do not include "exec/ioport.h" if it is not necessary
>   target/xtensa: Include "qemu/timer.h" to use NANOSECONDS_PER_SECOND
>   target/ppc: Include "exec/exec-all.h" which provides tlb_flush()
>   target/hppa: Include "qemu/log.h" to use qemu_log()
>   target: Do not include "exec/exec-all.h" if it is not necessary
>   hw: Do not include "exec/ioport.h" if it is not necessary
>   hw: Do not include "exec/address-spaces.h" if it is not necessary
>   hw: Do not include "sysemu/block-backend.h" if it is not necessary
>   hw: Do not include "sysemu/blockdev.h" if it is not necessary
>   hw: Do not include "sysemu/blockdev.h" if it is not necessary
>   hw/block/nvme: Include "qemu/cutils.h" directly in the source file
>   hw/misc/mips_itu: Cleanup includes
>   hw/misc/sga: Use the correct ISA include
>   hw/hppa: Remove unused include
>   hw/i386/pc: Remove unused include
>   hw/ide: Remove unused include
>   hw: Clean "hw/devices.h" includes
>=20
>  bsd-user/qemu.h                          | 1 -
>  hw/block/nvme.h                          | 1 -
>  hw/hppa/hppa_sys.h                       | 1 -
>  include/hw/arm/allwinner-a10.h           | 1 -
>  include/hw/arm/bcm2835_peripherals.h     | 1 -
>  include/hw/devices.h                     | 7 ++-----
>  include/hw/display/bcm2835_fb.h          | 1 -
>  include/hw/dma/bcm2835_dma.h             | 1 -
>  include/hw/misc/bcm2835_mbox.h           | 1 -
>  include/hw/misc/bcm2835_property.h       | 1 -
>  include/hw/misc/mips_itu.h               | 2 ++
>  include/hw/sh4/sh_intc.h                 | 1 -
>  include/hw/vfio/vfio-common.h            | 1 -
>  include/hw/virtio/virtio-access.h        | 1 -
>  target/arm/arm_ldst.h                    | 1 -
>  target/ppc/helper_regs.h                 | 1 +
>  accel/tcg/cpu-exec.c                     | 1 -
>  hw/acpi/pcihp.c                          | 1 -
>  hw/acpi/piix4.c                          | 1 -
>  hw/arm/aspeed.c                          | 1 -
>  hw/arm/bcm2836.c                         | 1 -
>  hw/arm/collie.c                          | 1 -
>  hw/arm/gumstix.c                         | 1 -
>  hw/arm/mainstone.c                       | 1 -
>  hw/arm/nseries.c                         | 1 -
>  hw/arm/omap1.c                           | 2 --
>  hw/arm/omap2.c                           | 2 --
>  hw/arm/omap_sx1.c                        | 1 -
>  hw/arm/pxa2xx.c                          | 1 -
>  hw/arm/spitz.c                           | 1 -
>  hw/arm/versatilepb.c                     | 1 -
>  hw/arm/vexpress.c                        | 1 -
>  hw/arm/virt.c                            | 1 -
>  hw/arm/xilinx_zynq.c                     | 1 -
>  hw/arm/xlnx-zcu102.c                     | 1 -
>  hw/arm/z2.c                              | 1 -
>  hw/block/dataplane/virtio-blk.c          | 1 -
>  hw/block/m25p80.c                        | 1 -
>  hw/block/nvme.c                          | 1 +
>  hw/block/onenand.c                       | 2 --
>  hw/block/pflash_cfi01.c                  | 1 -
>  hw/block/pflash_cfi02.c                  | 1 -
>  hw/block/virtio-blk.c                    | 1 -
>  hw/char/mcf_uart.c                       | 1 -
>  hw/char/serial.c                         | 1 -
>  hw/char/sh_serial.c                      | 1 -
>  hw/core/loader-fit.c                     | 1 -
>  hw/core/platform-bus.c                   | 1 -
>  hw/core/qdev-properties.c                | 1 -
>  hw/cris/axis_dev88.c                     | 1 -
>  hw/display/sm501.c                       | 1 -
>  hw/display/tc6393xb.c                    | 1 -
>  hw/i386/kvmvapic.c                       | 1 -
>  hw/i386/pc.c                             | 1 -
>  hw/i386/xen/xen-mapcache.c               | 1 -
>  hw/ide/core.c                            | 1 -
>  hw/ide/pci.c                             | 1 -
>  hw/ide/via.c                             | 1 -
>  hw/isa/isa-superio.c                     | 1 -
>  hw/lm32/lm32_boards.c                    | 1 -
>  hw/lm32/milkymist.c                      | 1 -
>  hw/m68k/mcf5206.c                        | 1 -
>  hw/m68k/mcf_intc.c                       | 1 -
>  hw/microblaze/petalogix_ml605_mmu.c      | 1 -
>  hw/microblaze/petalogix_s3adsp1800_mmu.c | 1 -
>  hw/mips/mips_malta.c                     | 1 -
>  hw/mips/mips_r4k.c                       | 1 -
>  hw/misc/arm_integrator_debug.c           | 1 -
>  hw/misc/mips_itu.c                       | 5 +----
>  hw/misc/sga.c                            | 2 +-
>  hw/net/mcf_fec.c                         | 1 -
>  hw/net/ne2000-isa.c                      | 1 -
>  hw/pci-host/versatile.c                  | 1 -
>  hw/ppc/ppc405_boards.c                   | 1 -
>  hw/ppc/sam460ex.c                        | 1 -
>  hw/ppc/spapr.c                           | 1 -
>  hw/ppc/virtex_ml507.c                    | 2 --
>  hw/riscv/riscv_htif.c                    | 1 -
>  hw/s390x/virtio-ccw.c                    | 2 --
>  hw/scsi/mptsas.c                         | 1 -
>  hw/scsi/scsi-generic.c                   | 1 -
>  hw/sd/pl181.c                            | 1 -
>  hw/sd/sdhci.c                            | 2 --
>  hw/sd/ssi-sd.c                           | 1 -
>  hw/sh4/r2d.c                             | 1 -
>  hw/sh4/sh7750.c                          | 1 -
>  hw/timer/sh_timer.c                      | 1 -
>  hw/usb/dev-storage.c                     | 1 -
>  hw/vfio/ccw.c                            | 1 +
>  hw/vfio/platform.c                       | 1 +
>  hw/virtio/virtio-pci.c                   | 1 -
>  hw/xen/xen_devconfig.c                   | 1 -
>  hw/xtensa/xtfpga.c                       | 1 -
>  memory.c                                 | 1 -
>  monitor.c                                | 1 -
>  target/arm/arm-powerctl.c                | 1 -
>  target/arm/crypto_helper.c               | 1 -
>  target/arm/iwmmxt_helper.c               | 1 -
>  target/arm/neon_helper.c                 | 1 -
>  target/arm/psci.c                        | 1 -
>  target/arm/vec_helper.c                  | 1 -
>  target/cris/cpu.c                        | 1 -
>  target/hppa/helper.c                     | 1 -
>  target/hppa/int_helper.c                 | 2 +-
>  target/i386/hax-all.c                    | 2 --
>  target/i386/hax-mem.c                    | 1 -
>  target/i386/hax-windows.c                | 1 -
>  target/i386/hvf/hvf.c                    | 2 --
>  target/i386/hvf/x86_task.c               | 3 ---
>  target/i386/kvm.c                        | 1 -
>  target/i386/whpx-all.c                   | 1 -
>  target/lm32/cpu.c                        | 1 -
>  target/m68k/cpu.c                        | 1 -
>  target/moxie/cpu.c                       | 1 -
>  target/moxie/mmu.c                       | 1 -
>  target/openrisc/cpu.c                    | 1 -
>  target/ppc/int_helper.c                  | 1 -
>  target/s390x/cpu.c                       | 1 -
>  target/s390x/diag.c                      | 1 -
>  target/s390x/helper.c                    | 1 -
>  target/s390x/kvm.c                       | 1 -
>  target/s390x/mem_helper.c                | 1 -
>  target/s390x/misc_helper.c               | 1 -
>  target/sparc/mmu_helper.c                | 1 -
>  target/tilegx/cpu.c                      | 1 -
>  target/xtensa/core-dc232b.c              | 2 +-
>  target/xtensa/core-dc233c.c              | 1 -
>  target/xtensa/core-de212.c               | 1 -
>  target/xtensa/core-fsf.c                 | 1 -
>  target/xtensa/core-sample_controller.c   | 1 -
>  target/xtensa/cpu.c                      | 1 -
>  tcg/tcg-op-vec.c                         | 1 -
>  target/xtensa/import_core.sh             | 1 -
>  133 files changed, 12 insertions(+), 145 deletions(-)
>=20
> --=20
> 2.17.0

