Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1drV4M-0000Rw-Q2
	for mharc-qemu-trivial@gnu.org; Mon, 11 Sep 2017 16:12:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47669)
	by lists.gnu.org with esmtp (Exim 4.71) (envelope-from <n54@gmx.com>)
	id 1drV4K-0000N2-Eg
	for qemu-trivial@nongnu.org; Mon, 11 Sep 2017 16:12:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <n54@gmx.com>) id 1drV4J-0002zj-B5
	for qemu-trivial@nongnu.org; Mon, 11 Sep 2017 16:12:32 -0400
Received: from mout.gmx.net ([212.227.15.15]:62011)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <n54@gmx.com>)
	id 1drV4E-0002y0-OP; Mon, 11 Sep 2017 16:12:26 -0400
Received: from localhost.localdomain ([185.58.161.191]) by mail.gmx.com
	(mrgmx003 [212.227.17.184]) with ESMTPSA (Nemesis) id
	0M5cpk-1dXVLb3sCm-00xc3N; Mon, 11 Sep 2017 22:12:24 +0200
From: Kamil Rytarowski <n54@gmx.com>
To: qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org,
	Kamil Rytarowski <n54@gmx.com>
Date: Mon, 11 Sep 2017 22:00:02 +0200
Message-Id: <20170911200002.4511-1-n54@gmx.com>
X-Mailer: git-send-email 2.14.1
X-Provags-ID: V03:K0:/XmiRM5VpE9lNPtRHZwlUM25fAKLCVRSlX7Hx8LMDa9yZOxCkLM
	I4+5U8BrDtzt6Z5aXT8aQNnvQJWoyK7CcdwXnKOtwJxDkKHB//HbLaYte+yR1wlzcslz4Oo
	ZPmOtvlg59OALbuE8I/c4liqNP9K7FHOEDDN22sBNNvFZB8JzbxS9JVF63/fLZuCKtGwtZ8
	vjMQ5bb5qBUfFH4SRr1pg==
X-UI-Out-Filterresults: notjunk:1;V01:K0:htEMPlXEK1g=:kJ5FUBoKS2hiVRtzc888R/
	MJq+2Mnv3IKUiKqAtAOIOOCdqXmw0K3DgBCtOfH0V9kan47v2Zog56kAxJ28A+A2offoQTHxZ
	6g1awYERueGxAM/CsVxmKu6y/Rwtz2RK5lZjSve1+M3Lbbh2exDgjgRgNb/xr4GpAaV9dr3aE
	LiJwuchL76hbX0QB6l4kPN2tRLZQqKsfwKCPbX9dlBecFdn/I+rXuhDWpONNKOpcSHm6kmC75
	Jl1zjetjfWLv2SkqhmL5lEvAS61WdVAUt/NpWgSp3WQNZ2TMRNOK6wFA5HR1iN4idHx65M3WB
	3IyObQJ1ZK93b1U7RPABIbeKtC29obJFS45UywxcUAF8+mtQ0LhdYBysGEFvOO5nCrm26ofKb
	DdumCZsQADtCAPAfNEiPgBlHT6RlSB1mDS+K7QqhOHatLhaeMAc2n5f/Ghny/SF0LJsEPVacs
	smTfEPfjnlU+AkxU3acNVeNSP9KbjxqS3sl/sEchjWNZnzxrpVFQwdEGTD22/KeoyuWmFwnei
	Hv0GBJZyhLj83V8aE7X8O8pL1ABrDGRZtIVW6m/ItBgukcIayAFJnJDpDhbhNep0RuFWf63Rl
	K6mI4chXDYM3c1LK2i9rM7Kfr4S/pjBruTny2dvwW46V1K1Zok4BznxcvYlyP13gWnK0xx4B/
	25ZcGaUm0JQf5OXfSEomiCWNoY2AbGO5/99tUpOnIc2mvEhcXmxrV4RmZcxbYxQLGRPdVEyqo
	ckH06i1TLe8eag2nSqZtQl+4kvDgFSeWqgm8PtL71eyvbTOV4HLXbIhd9ClUwXaJnW8dQbds4
	l7Zr8nIv6DFUFPk6iYuuO63d+aAbw==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 212.227.15.15
Subject: [Qemu-trivial] [PATCH] Rename round_page() to round_pageq()
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
X-List-Received-Date: Mon, 11 Sep 2017 20:12:33 -0000

This change fixes conflict with the DragonFly BSD headers.

Signed-off-by: Kamil Rytarowski <n54@gmx.com>
---
 hw/ppc/mac_newworld.c | 8 ++++----
 hw/ppc/mac_oldworld.c | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
index d466634997..b9d4bca74f 100644
--- a/hw/ppc/mac_newworld.c
+++ b/hw/ppc/mac_newworld.c
@@ -124,7 +124,7 @@ static uint64_t translate_kernel_address(void *opaque, uint64_t addr)
     return (addr & 0x0fffffff) + KERNEL_LOAD_ADDR;
 }
 
-static hwaddr round_page(hwaddr addr)
+static hwaddr round_pageq(hwaddr addr)
 {
     return (addr + TARGET_PAGE_SIZE - 1) & TARGET_PAGE_MASK;
 }
@@ -256,7 +256,7 @@ static void ppc_core99_init(MachineState *machine)
         }
         /* load initrd */
         if (initrd_filename) {
-            initrd_base = round_page(kernel_base + kernel_size + KERNEL_GAP);
+            initrd_base = round_pageq(kernel_base + kernel_size + KERNEL_GAP);
             initrd_size = load_image_targphys(initrd_filename, initrd_base,
                                               ram_size - initrd_base);
             if (initrd_size < 0) {
@@ -264,11 +264,11 @@ static void ppc_core99_init(MachineState *machine)
                              initrd_filename);
                 exit(1);
             }
-            cmdline_base = round_page(initrd_base + initrd_size);
+            cmdline_base = round_pageq(initrd_base + initrd_size);
         } else {
             initrd_base = 0;
             initrd_size = 0;
-            cmdline_base = round_page(kernel_base + kernel_size + KERNEL_GAP);
+            cmdline_base = round_pageq(kernel_base + kernel_size + KERNEL_GAP);
         }
         ppc_boot_device = 'm';
     } else {
diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
index fcac399562..50fefb339b 100644
--- a/hw/ppc/mac_oldworld.c
+++ b/hw/ppc/mac_oldworld.c
@@ -66,7 +66,7 @@ static uint64_t translate_kernel_address(void *opaque, uint64_t addr)
     return (addr & 0x0fffffff) + KERNEL_LOAD_ADDR;
 }
 
-static hwaddr round_page(hwaddr addr)
+static hwaddr round_pageq(hwaddr addr)
 {
     return (addr + TARGET_PAGE_SIZE - 1) & TARGET_PAGE_MASK;
 }
@@ -191,7 +191,7 @@ static void ppc_heathrow_init(MachineState *machine)
         }
         /* load initrd */
         if (initrd_filename) {
-            initrd_base = round_page(kernel_base + kernel_size + KERNEL_GAP);
+            initrd_base = round_pageq(kernel_base + kernel_size + KERNEL_GAP);
             initrd_size = load_image_targphys(initrd_filename, initrd_base,
                                               ram_size - initrd_base);
             if (initrd_size < 0) {
@@ -199,11 +199,11 @@ static void ppc_heathrow_init(MachineState *machine)
                              initrd_filename);
                 exit(1);
             }
-            cmdline_base = round_page(initrd_base + initrd_size);
+            cmdline_base = round_pageq(initrd_base + initrd_size);
         } else {
             initrd_base = 0;
             initrd_size = 0;
-            cmdline_base = round_page(kernel_base + kernel_size + KERNEL_GAP);
+            cmdline_base = round_pageq(kernel_base + kernel_size + KERNEL_GAP);
         }
         ppc_boot_device = 'm';
     } else {
-- 
2.14.1


