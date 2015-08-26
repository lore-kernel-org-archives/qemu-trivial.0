Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZUYi5-00031H-Fo
	for mharc-qemu-trivial@gnu.org; Wed, 26 Aug 2015 07:17:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53258)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1ZUYhz-0002qd-6Y
	for qemu-trivial@nongnu.org; Wed, 26 Aug 2015 07:17:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1ZUYhy-00085W-2E
	for qemu-trivial@nongnu.org; Wed, 26 Aug 2015 07:17:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33773)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>)
	id 1ZUYhr-00082d-Ep; Wed, 26 Aug 2015 07:17:27 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id 521E38E3DC;
	Wed, 26 Aug 2015 11:17:26 +0000 (UTC)
Received: from localhost.localdomain.com (vpn1-4-60.ams2.redhat.com
	[10.36.4.60])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t7QBHODp028642; Wed, 26 Aug 2015 07:17:25 -0400
From: "Daniel P. Berrange" <berrange@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 26 Aug 2015 12:17:11 +0100
Message-Id: <1440587838-25595-1-git-send-email-berrange@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, "Daniel P. Berrange" <berrange@redhat.com>
Subject: [Qemu-trivial] [PATCH 0/7] Misc trivial code cleanups
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
X-List-Received-Date: Wed, 26 Aug 2015 11:17:36 -0000

This is a series of misc trivial code cleanups that I
originally used to illustrate the use of GNULIB's
syntax-check facility:

  http://lists.nongnu.org/archive/html/qemu-devel/2015-07/msg06268.html

Since it appears the license of the GNULIB syntax-check
is problematic, this series has separated the fixes out
from the GNULIB additions, to allow for possibility of
merging them as-is.

Daniel P. Berrange (7):
  maint: remove double semicolons in many files
  maint: remove / fix many doubled words
  maint: remove unused include for assert.h
  maint: remove unused include for dirent.h
  maint: remove unused include for signal.h
  maint: remove unused include for strings.h
  maint: avoid useless "if (foo) free(foo)" pattern

 backends/hostmem-file.c       |  4 +---
 block/qcow2-cluster.c         |  4 ++--
 block/qcow2-refcount.c        |  2 +-
 block/vhdx.c                  |  2 +-
 bsd-user/elfload.c            |  4 +---
 bsd-user/signal.c             |  1 -
 disas/ia64.c                  |  1 -
 disas/microblaze.c            |  1 -
 disas/sparc.c                 |  3 +--
 docs/libcacard.txt            |  4 ++--
 docs/multiseat.txt            |  2 +-
 docs/specs/qcow2.txt          |  2 +-
 docs/specs/rocker.txt         |  2 +-
 fsdev/virtio-9p-marshal.c     |  1 -
 hw/arm/vexpress.c             |  4 ++--
 hw/block/xen_disk.c           |  1 -
 hw/bt/hci.c                   |  9 +++------
 hw/core/loader.c              |  3 +--
 hw/core/qdev-properties.c     |  4 +---
 hw/display/exynos4210_fimd.c  |  4 +---
 hw/i386/xen/xen_platform.c    |  2 --
 hw/intc/arm_gic.c             |  2 +-
 hw/mips/mips_r4k.c            |  4 +---
 hw/net/fsl_etsec/rings.c      |  4 +---
 hw/net/rocker/rocker.c        |  4 +---
 hw/net/rocker/rocker_desc.c   |  8 ++------
 hw/net/rtl8139.c              |  2 +-
 hw/net/xen_nic.c              |  1 -
 hw/nvram/fw_cfg.c             |  4 +---
 hw/pci-host/prep.c            |  4 +---
 hw/pci/shpc.c                 |  1 -
 hw/sd/sd.c                    |  3 +--
 hw/tpm/tpm_passthrough.c      |  2 --
 hw/usb/hcd-xhci.c             |  4 +---
 hw/usb/host-libusb.c          |  2 +-
 hw/usb/redirect.c             |  2 --
 hw/vfio/common.c              |  2 +-
 hw/vfio/pci.c                 |  1 -
 hw/xen/xen_pt_config_init.c   |  4 +---
 include/block/block.h         |  2 +-
 include/exec/memory.h         |  2 +-
 linux-user/elfload.c          |  2 +-
 linux-user/signal.c           |  1 -
 migration/rdma.c              |  2 +-
 migration/savevm.c            |  8 ++------
 numa.c                        |  2 +-
 os-win32.c                    |  1 -
 page_cache.c                  |  1 -
 qemu-char.c                   |  5 +----
 qemu-doc.texi                 |  2 +-
 qemu-img.texi                 |  2 +-
 qemu-options.hx               |  2 +-
 qga/commands-win32.c          |  2 +-
 target-arm/cpu.h              |  4 ++--
 target-arm/helper.c           |  2 +-
 target-arm/translate.c        |  2 +-
 target-i386/translate.c       |  1 -
 target-lm32/helper.c          |  2 +-
 target-microblaze/op_helper.c |  1 -
 target-microblaze/translate.c |  2 +-
 target-mips/helper.c          |  1 -
 target-moxie/helper.c         |  3 +--
 target-moxie/translate.c      |  1 -
 target-sh4/helper.c           |  1 -
 target-sh4/op_helper.c        |  1 -
 target-tricore/helper.c       |  1 -
 tests/bios-tables-test.c      | 36 +++++++++++++-----------------------
 tests/tcg/testthread.c        |  1 -
 tests/test-xbzrle.c           |  2 --
 ui/spice-display.c            | 14 ++++----------
 util/bitmap.c                 |  2 +-
 71 files changed, 71 insertions(+), 154 deletions(-)

-- 
2.4.3


