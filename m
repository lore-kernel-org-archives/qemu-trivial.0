Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1drVK2-0007Fo-B2
	for mharc-qemu-trivial@gnu.org; Mon, 11 Sep 2017 16:28:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52480)
	by lists.gnu.org with esmtp (Exim 4.71) (envelope-from <n54@gmx.com>)
	id 1drVK0-0007D8-0p
	for qemu-trivial@nongnu.org; Mon, 11 Sep 2017 16:28:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <n54@gmx.com>) id 1drVJw-0002E3-Tz
	for qemu-trivial@nongnu.org; Mon, 11 Sep 2017 16:28:44 -0400
Received: from mout.gmx.net ([212.227.17.22]:63793)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <n54@gmx.com>)
	id 1drVJw-0002DM-Jc; Mon, 11 Sep 2017 16:28:40 -0400
Received: from localhost.localdomain ([185.58.161.191]) by mail.gmx.com
	(mrgmx101 [212.227.17.174]) with ESMTPSA (Nemesis) id
	0MZ8fw-1eA9AQ05HQ-00KuEm; Mon, 11 Sep 2017 22:28:38 +0200
From: Kamil Rytarowski <n54@gmx.com>
To: qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org,
	Kamil Rytarowski <n54@gmx.com>
Date: Mon, 11 Sep 2017 22:16:10 +0200
Message-Id: <20170911201610.15204-1-n54@gmx.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170911200002.4511-1-n54@gmx.com>
References: <20170911200002.4511-1-n54@gmx.com>
X-Provags-ID: V03:K0:a6Qg0LDi187GCVUA6u73ZCFV0C5cO5fiXXz/vj8+Ior6N/K4LHl
	Kq7D/U/XD+UH5I0Z2xSRc7RVGkuyvpfxy7pF5FEN7SCAkrLYrSg/mxZV/+G7Qc81eNDJsFV
	7LHmjWg5mZBAcB3k6nOWBZfb/jKiGsU9h7XQdmC4PnUy5TV/F28DA5jaKDlcG+tzgPoUxZw
	Bc3YROo7SlzbjsOyUMhJw==
X-UI-Out-Filterresults: notjunk:1;V01:K0:tVX5TN5zyCk=:3JELP5n7CVgeSY7FZRXzxN
	Fk26EpJiXFjVnIzv0+43Kn43yr0WdgAH4PbOXQFq+oo7YypQahUy8DIVMNLC9i7Th0hstTkoG
	pZrF/BRI7Sy+0w/D9LBvhhI4g9O03D2X+rhHPwUmTretD0vFoUYU2rvnrv5ML6u3eF8qaanlW
	UE1/jDzNDbm+RyN8Bcn0pFudBW4Vg6FKiq8JggD5VBn/cD7gy89HUCiVa0qEKVvKKmPwHCDLF
	IHu2Pva7Rs0SS1029545HboMo7uj9d502i+49kduEWQauQb/Tabv/2fnCPW8gdastvaQ7z7LR
	yWDeciFTVcScRdBbj9yIzNgSfrQkIFzh0tro7LjbeGroFjU0E7BJixymeVqkEeVafwtYgbpRf
	x4gN9UDY2AdKfGw97wG+Cy/DuM/Mn6IJtry741wZFAiewytSgoZ0KmYZopSQi+YOvZnRV674I
	TYGMO4vyxXI67ECVeLfQZsEb2cKkFuwvcKqCGUexpMl0jy5G8qOhg1VM5zgFl4clwmL70SZK9
	CUPBPIugSObkLuvrMhuEv7/G6mF73K6iMOXdS+olE1FyErhtGZMI0aeln47kYXFmxhT3KW+8o
	lV1yycx58Aq7vypZaZq3B5YR9Ant90gGoe7hniCdEmGOr41bpQtRDx9AHfZXkngA/AOJZAi7O
	/tXWSFAakiJwOwPMbELQwNG465POduiz8uXhj5TuVwdqo/ipEfX7y/b2jGYetR1froIJQOvRW
	QoBRAgLYmTngL4EZEvSr5JSXuH4T1qVnE8j/H0v325A/wdhTJV7JlrAbrm8BkRaLl0ao1RkCT
	FPlB/MPEdg6vUiNE25KsK4qFQZiqA==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 212.227.17.22
Subject: [Qemu-trivial] [PATCH v2] Replace round_page() with
 TARGET_PAGE_ALIGN()
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
X-List-Received-Date: Mon, 11 Sep 2017 20:28:45 -0000

This change fixes conflict with the DragonFly BSD headers.

Signed-off-by: Kamil Rytarowski <n54@gmx.com>
---
 hw/ppc/mac_newworld.c | 11 +++--------
 hw/ppc/mac_oldworld.c | 11 +++--------
 2 files changed, 6 insertions(+), 16 deletions(-)

diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
index d466634997..51bf83019b 100644
--- a/hw/ppc/mac_newworld.c
+++ b/hw/ppc/mac_newworld.c
@@ -124,11 +124,6 @@ static uint64_t translate_kernel_address(void *opaque, uint64_t addr)
     return (addr & 0x0fffffff) + KERNEL_LOAD_ADDR;
 }
 
-static hwaddr round_page(hwaddr addr)
-{
-    return (addr + TARGET_PAGE_SIZE - 1) & TARGET_PAGE_MASK;
-}
-
 static void ppc_core99_reset(void *opaque)
 {
     PowerPCCPU *cpu = opaque;
@@ -256,7 +251,7 @@ static void ppc_core99_init(MachineState *machine)
         }
         /* load initrd */
         if (initrd_filename) {
-            initrd_base = round_page(kernel_base + kernel_size + KERNEL_GAP);
+            initrd_base = TARGET_PAGE_ALIGN(kernel_base + kernel_size + KERNEL_GAP);
             initrd_size = load_image_targphys(initrd_filename, initrd_base,
                                               ram_size - initrd_base);
             if (initrd_size < 0) {
@@ -264,11 +259,11 @@ static void ppc_core99_init(MachineState *machine)
                              initrd_filename);
                 exit(1);
             }
-            cmdline_base = round_page(initrd_base + initrd_size);
+            cmdline_base = TARGET_PAGE_ALIGN(initrd_base + initrd_size);
         } else {
             initrd_base = 0;
             initrd_size = 0;
-            cmdline_base = round_page(kernel_base + kernel_size + KERNEL_GAP);
+            cmdline_base = TARGET_PAGE_ALIGN(kernel_base + kernel_size + KERNEL_GAP);
         }
         ppc_boot_device = 'm';
     } else {
diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
index fcac399562..feb31911ca 100644
--- a/hw/ppc/mac_oldworld.c
+++ b/hw/ppc/mac_oldworld.c
@@ -66,11 +66,6 @@ static uint64_t translate_kernel_address(void *opaque, uint64_t addr)
     return (addr & 0x0fffffff) + KERNEL_LOAD_ADDR;
 }
 
-static hwaddr round_page(hwaddr addr)
-{
-    return (addr + TARGET_PAGE_SIZE - 1) & TARGET_PAGE_MASK;
-}
-
 static void ppc_heathrow_reset(void *opaque)
 {
     PowerPCCPU *cpu = opaque;
@@ -191,7 +186,7 @@ static void ppc_heathrow_init(MachineState *machine)
         }
         /* load initrd */
         if (initrd_filename) {
-            initrd_base = round_page(kernel_base + kernel_size + KERNEL_GAP);
+            initrd_base = TARGET_PAGE_ALIGN(kernel_base + kernel_size + KERNEL_GAP);
             initrd_size = load_image_targphys(initrd_filename, initrd_base,
                                               ram_size - initrd_base);
             if (initrd_size < 0) {
@@ -199,11 +194,11 @@ static void ppc_heathrow_init(MachineState *machine)
                              initrd_filename);
                 exit(1);
             }
-            cmdline_base = round_page(initrd_base + initrd_size);
+            cmdline_base = TARGET_PAGE_ALIGN(initrd_base + initrd_size);
         } else {
             initrd_base = 0;
             initrd_size = 0;
-            cmdline_base = round_page(kernel_base + kernel_size + KERNEL_GAP);
+            cmdline_base = TARGET_PAGE_ALIGN(kernel_base + kernel_size + KERNEL_GAP);
         }
         ppc_boot_device = 'm';
     } else {
-- 
2.14.1


