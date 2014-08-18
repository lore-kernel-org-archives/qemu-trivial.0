Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XJBCU-0006kp-Fm
	for mharc-qemu-trivial@gnu.org; Sun, 17 Aug 2014 20:53:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50043)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1XJBCM-0006dj-KC
	for qemu-trivial@nongnu.org; Sun, 17 Aug 2014 20:53:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1XJBCB-0002Fm-2C
	for qemu-trivial@nongnu.org; Sun, 17 Aug 2014 20:53:22 -0400
Received: from mail-yk0-f180.google.com ([209.85.160.180]:46012)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1XJBCA-0002Ff-Ub
	for qemu-trivial@nongnu.org; Sun, 17 Aug 2014 20:53:10 -0400
Received: by mail-yk0-f180.google.com with SMTP id 200so3785519ykr.11
	for <qemu-trivial@nongnu.org>; Sun, 17 Aug 2014 17:53:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=OG6F89Hp0xb7JbGvrkGsR/2lfsw3CtJOvedJHZGmtTk=;
	b=m/GiHGqnfXlY28Y+OhD+ikBZnTTatoFpAdkpweRllyi7+bdX1kLepqeU5VsLh4L7q+
	l9vToV+rmCB1DXb0OM8Z6K6YX7yZJgKDkD6KWd4GwNvlYZrEcG/fPDtG8igUH3TjIWXb
	1nQpvji6n1I8d0YeT5dOKokZkPxLD8ocs4QZ2Ba4AqEI0KJ1p8/WG3YUts7sdZwbHUqS
	2VE0pGqKWliEXScgJHl1QOvY/+H8D8jnOFiUNDiaKEHne+5lBIn2+BaM/QxYXjLygF6+
	pqUSseZ3Jq0SCH0SlRE3MtGLko2Jwwd4ApwLUAvTqvTIFDMOQ1DaTET+HxA8tC9jOJC/
	aMsQ==
X-Gm-Message-State: ALoCoQkuVCuqYn0/wjdzRuXYUxu9ePZTlrd/9FOWtpau6tHL6g7JxD+YXxI14ZkwXGhs/L5cKrDF
X-Received: by 10.236.39.173 with SMTP id d33mr6666138yhb.104.1408323190191;
	Sun, 17 Aug 2014 17:53:10 -0700 (PDT)
Received: from localhost ([149.199.62.254]) by mx.google.com with ESMTPSA id
	v64sm32564930yhc.55.2014.08.17.17.53.09 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sun, 17 Aug 2014 17:53:09 -0700 (PDT)
Sender: Peter Crosthwaite <peter.crosthwaite@petalogix.com>
From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
To: qemu-devel@nongnu.org
Date: Sun, 17 Aug 2014 17:52:38 -0700
Message-Id: <737df733ddb4779e1dcb24b14d1b5d223509dce7.1408322869.git.peter.crosthwaite@xilinx.com>
X-Mailer: git-send-email 2.0.1.1.gfbfc394
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.160.180
Cc: qemu-trivial@nongnu.org, edgar.iglesias@xilinx.com
Subject: [Qemu-trivial] [PATCH trivial v1 1/2] microblaze: ml605: Get rid of
	ddr_base variable
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
X-List-Received-Date: Mon, 18 Aug 2014 00:53:28 -0000

It's a constant based on a macro. Just use the macro in place.

Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
---

 hw/microblaze/petalogix_ml605_mmu.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/microblaze/petalogix_ml605_mmu.c b/hw/microblaze/petalogix_ml605_mmu.c
index aea9c5b..6843abf 100644
--- a/hw/microblaze/petalogix_ml605_mmu.c
+++ b/hw/microblaze/petalogix_ml605_mmu.c
@@ -89,7 +89,6 @@ petalogix_ml605_init(MachineState *machine)
     SysBusDevice *busdev;
     DriveInfo *dinfo;
     int i;
-    hwaddr ddr_base = MEMORY_BASEADDR;
     MemoryRegion *phys_lmb_bram = g_new(MemoryRegion, 1);
     MemoryRegion *phys_ram = g_new(MemoryRegion, 1);
     qemu_irq irq[32];
@@ -106,7 +105,7 @@ petalogix_ml605_init(MachineState *machine)
 
     memory_region_init_ram(phys_ram, NULL, "petalogix_ml605.ram", ram_size);
     vmstate_register_ram_global(phys_ram);
-    memory_region_add_subregion(address_space_mem, ddr_base, phys_ram);
+    memory_region_add_subregion(address_space_mem, MEMORY_BASEADDR, phys_ram);
 
     dinfo = drive_get(IF_PFLASH, 0, 0);
     /* 5th parameter 2 means bank-width
@@ -201,7 +200,7 @@ petalogix_ml605_init(MachineState *machine)
         }
     }
 
-    microblaze_load_kernel(cpu, ddr_base, ram_size,
+    microblaze_load_kernel(cpu, MEMORY_BASEADDR, ram_size,
                            machine->initrd_filename,
                            BINARY_DEVICE_TREE_FILE,
                            machine_cpu_reset);
-- 
2.0.1.1.gfbfc394


