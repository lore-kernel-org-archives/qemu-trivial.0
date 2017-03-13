Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cnRTv-0002nB-Db
	for mharc-qemu-trivial@gnu.org; Mon, 13 Mar 2017 11:01:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37119)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shorne@gmail.com>) id 1cnRTt-0002k7-0n
	for qemu-trivial@nongnu.org; Mon, 13 Mar 2017 11:01:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shorne@gmail.com>) id 1cnRTr-0005Yk-Vf
	for qemu-trivial@nongnu.org; Mon, 13 Mar 2017 11:01:53 -0400
Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243]:35050)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <shorne@gmail.com>)
	id 1cnRTl-0005UD-GF; Mon, 13 Mar 2017 11:01:45 -0400
Received: by mail-pf0-x243.google.com with SMTP id 67so19269514pfg.2;
	Mon, 13 Mar 2017 08:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=dP8D5mXHfCmlZKkCceVV+mOKQHLFklS/BMRH3xOn8mI=;
	b=N3cSeIrNqvvzh0KP0ETbQDW8SY8bRBrap8HBP2toEIYT3Ln/72KmpxsQ3WhMDBaZqd
	kidvN+O88GySJ3QUZqtHTkwovuKJ4xrtJcTDhcXR81bmXEGjtLegc+N+yIX9O+WexTf1
	cc6lRluOIwl6/I6dR8m7+WZQYXzDBKNx46P14Oz7mMpukzXsQJrl3FxIC+4CixaAlTQ3
	8gtHjZFjmqqrVguSHZ0HSOx2TY1LeKicNvEyupMkmeJY1sVPjLOORLHlmUqvH7yk76XS
	FlzJMHNHkBPkEBuv7QUS+TrIbEh05avxBThNGUbBJqf/7GwHdca9bzwByAlEjgG95dZk
	zJQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=dP8D5mXHfCmlZKkCceVV+mOKQHLFklS/BMRH3xOn8mI=;
	b=j/8YRl0+6X4PqssPYZj1EL3h0UqvH8s8N2hCckRqvVp3sWtIEewygaxVVBF5VSYlJH
	Efb1M8Y8hVcd5sMjoIzAkjXRfsg1HbKkQuy2FBinvS7ArAGB9GUdgj/yBfR8xS/a0wAa
	UrrCrJR9WiecZnHRIGuTA4IF4bEg3Rb5A+G6d0hsjFKANPHxPH1Jw3nwdVahtHJiY78v
	wNrdXfsMMjS0Uo2ktqxP8TmMco3H2rJR2SaDr80J/nI81+nAwPqp1zGg+tlq3B0ZXHMK
	iiaNdff+fcoSwafT+FLbBZ0UyYc0h2qbEOT0UdTRcfIEEIqKwcV6o3EuVYO+aVyCMKJF
	HhIg==
X-Gm-Message-State: AMke39kANmhs8TVWV5d3IHfYq+ZJAwRAaJvgkNKJsHiCcrzX/m1Ys1rEFjpU+YastBfU/g==
X-Received: by 10.99.189.9 with SMTP id a9mr37451111pgf.190.1489417302040;
	Mon, 13 Mar 2017 08:01:42 -0700 (PDT)
Received: from localhost (z17.124-44-180.ppp.wakwak.ne.jp. [124.44.180.17])
	by smtp.gmail.com with ESMTPSA id
	b83sm33446538pfe.12.2017.03.13.08.01.40
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 13 Mar 2017 08:01:41 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, openrisc@lists.librecores.org, rth@twiddle.net,
	Stafford Horne <shorne@gmail.com>
Date: Tue, 14 Mar 2017 00:01:24 +0900
Message-Id: <20170313150124.4762-1-shorne@gmail.com>
X-Mailer: git-send-email 2.9.3
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::243
Subject: [Qemu-trivial] [PATCH] target/openrisc: Fixes for memory debugging
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
X-List-Received-Date: Mon, 13 Mar 2017 15:01:54 -0000

When debugging in gdb you might want to inspect instructions in mapped
pages or in exception vectors like 0x800 etc.  This was previously not
possible in qemu since the *get_phys_page_debug() routine only looked
into the data tlb.

Change to fall back to look into instruction tlb and plain physical
pages.

Signed-off-by: Stafford Horne <shorne@gmail.com>
---
 target/openrisc/mmu.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/target/openrisc/mmu.c b/target/openrisc/mmu.c
index 56b11d3..a6d7bcd 100644
--- a/target/openrisc/mmu.c
+++ b/target/openrisc/mmu.c
@@ -124,7 +124,7 @@ static int cpu_openrisc_get_phys_addr(OpenRISCCPU *cpu,
 {
     int ret = TLBRET_MATCH;
 
-    if (rw == 2) {    /* ITLB */
+    if (rw == MMU_INST_FETCH) {    /* ITLB */
        *physical = 0;
         ret = cpu->env.tlb->cpu_openrisc_map_address_code(cpu, physical,
                                                           prot, address, rw);
@@ -221,12 +221,27 @@ hwaddr openrisc_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
     OpenRISCCPU *cpu = OPENRISC_CPU(cs);
     hwaddr phys_addr;
     int prot;
+    int miss;
 
-    if (cpu_openrisc_get_phys_addr(cpu, &phys_addr, &prot, addr, 0)) {
-        return -1;
+    /* Check memory for any kind of address, since during debug the
+       gdb can ask for anything, check data tlb for address */
+    miss = cpu_openrisc_get_phys_addr(cpu, &phys_addr, &prot, addr, 0);
+
+    /* Check instruction tlb */
+    if (miss) {
+        miss = cpu_openrisc_get_phys_addr(cpu, &phys_addr, &prot, addr, MMU_INST_FETCH);
+    }
+
+    /* Last, fall back to a plain address */
+    if (miss) {
+        miss = cpu_openrisc_get_phys_nommu(cpu, &phys_addr, &prot, addr, 0);
     }
 
-    return phys_addr;
+    if (miss) {
+        return -1;
+    } else {
+        return phys_addr;
+    }
 }
 
 void cpu_openrisc_mmu_init(OpenRISCCPU *cpu)
-- 
2.9.3


