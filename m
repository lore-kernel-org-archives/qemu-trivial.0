Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VN4LP-0007m2-7F
	for mharc-qemu-trivial@gnu.org; Fri, 20 Sep 2013 13:18:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54785)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VN4LJ-0007ab-CY
	for qemu-trivial@nongnu.org; Fri, 20 Sep 2013 13:18:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VN4LE-0006FP-H0
	for qemu-trivial@nongnu.org; Fri, 20 Sep 2013 13:18:09 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:60684)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VN4Ky-00067Y-TK; Fri, 20 Sep 2013 13:17:49 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id E6657419CD;
	Fri, 20 Sep 2013 21:17:47 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 40ED5515;
	Fri, 20 Sep 2013 20:58:22 +0400 (MSK)
Received: (nullmailer pid 32178 invoked by uid 1000);
	Fri, 20 Sep 2013 16:58:20 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: aliguori@us.ibm.com
Date: Fri, 20 Sep 2013 20:58:07 +0400
Message-Id: <1379696296-32105-9-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1379696296-32105-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1379696296-32105-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org,
	qemu-stable <qemu-stable@nongnu.org>
Subject: [Qemu-trivial] [PULL 08/17] tci: Fix qemu-alpha on 32 bit hosts
	(wrong assertions)
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
X-List-Received-Date: Fri, 20 Sep 2013 17:18:13 -0000

From: Stefan Weil <sw@weilnetz.de>

Debian busybox-static for alpha has a load address of 0x0000000120000000
which is mapped to 0x0000000020000000 for 32 bit hosts.

qemu-alpha uses the TCG opcodes qemu_ld32, qemu_ld64, qemu_st32 and
qemu_st64 which all raise the assertion (taddr == host_addr).

Remove all assertions of this type because they are either wrong or
unnecessary (when sizeof(tcg_target_ulong) >= sizeof(target_ulong)).

Cc: qemu-stable <qemu-stable@nongnu.org>
Signed-off-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Richard Henderson <rth@twiddle.net>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 tci.c |   12 ------------
 1 file changed, 12 deletions(-)

diff --git a/tci.c b/tci.c
index 18c888e..6d64891 100644
--- a/tci.c
+++ b/tci.c
@@ -1085,7 +1085,6 @@ uintptr_t tcg_qemu_tb_exec(CPUArchState *env, uint8_t *tb_ptr)
             tmp8 = helper_ldb_mmu(env, taddr, tci_read_i(&tb_ptr));
 #else
             host_addr = (tcg_target_ulong)taddr;
-            assert(taddr == host_addr);
             tmp8 = *(uint8_t *)(host_addr + GUEST_BASE);
 #endif
             tci_write_reg8(t0, tmp8);
@@ -1097,7 +1096,6 @@ uintptr_t tcg_qemu_tb_exec(CPUArchState *env, uint8_t *tb_ptr)
             tmp8 = helper_ldb_mmu(env, taddr, tci_read_i(&tb_ptr));
 #else
             host_addr = (tcg_target_ulong)taddr;
-            assert(taddr == host_addr);
             tmp8 = *(uint8_t *)(host_addr + GUEST_BASE);
 #endif
             tci_write_reg8s(t0, tmp8);
@@ -1109,7 +1107,6 @@ uintptr_t tcg_qemu_tb_exec(CPUArchState *env, uint8_t *tb_ptr)
             tmp16 = helper_ldw_mmu(env, taddr, tci_read_i(&tb_ptr));
 #else
             host_addr = (tcg_target_ulong)taddr;
-            assert(taddr == host_addr);
             tmp16 = tswap16(*(uint16_t *)(host_addr + GUEST_BASE));
 #endif
             tci_write_reg16(t0, tmp16);
@@ -1121,7 +1118,6 @@ uintptr_t tcg_qemu_tb_exec(CPUArchState *env, uint8_t *tb_ptr)
             tmp16 = helper_ldw_mmu(env, taddr, tci_read_i(&tb_ptr));
 #else
             host_addr = (tcg_target_ulong)taddr;
-            assert(taddr == host_addr);
             tmp16 = tswap16(*(uint16_t *)(host_addr + GUEST_BASE));
 #endif
             tci_write_reg16s(t0, tmp16);
@@ -1134,7 +1130,6 @@ uintptr_t tcg_qemu_tb_exec(CPUArchState *env, uint8_t *tb_ptr)
             tmp32 = helper_ldl_mmu(env, taddr, tci_read_i(&tb_ptr));
 #else
             host_addr = (tcg_target_ulong)taddr;
-            assert(taddr == host_addr);
             tmp32 = tswap32(*(uint32_t *)(host_addr + GUEST_BASE));
 #endif
             tci_write_reg32(t0, tmp32);
@@ -1146,7 +1141,6 @@ uintptr_t tcg_qemu_tb_exec(CPUArchState *env, uint8_t *tb_ptr)
             tmp32 = helper_ldl_mmu(env, taddr, tci_read_i(&tb_ptr));
 #else
             host_addr = (tcg_target_ulong)taddr;
-            assert(taddr == host_addr);
             tmp32 = tswap32(*(uint32_t *)(host_addr + GUEST_BASE));
 #endif
             tci_write_reg32s(t0, tmp32);
@@ -1159,7 +1153,6 @@ uintptr_t tcg_qemu_tb_exec(CPUArchState *env, uint8_t *tb_ptr)
             tmp32 = helper_ldl_mmu(env, taddr, tci_read_i(&tb_ptr));
 #else
             host_addr = (tcg_target_ulong)taddr;
-            assert(taddr == host_addr);
             tmp32 = tswap32(*(uint32_t *)(host_addr + GUEST_BASE));
 #endif
             tci_write_reg32(t0, tmp32);
@@ -1174,7 +1167,6 @@ uintptr_t tcg_qemu_tb_exec(CPUArchState *env, uint8_t *tb_ptr)
             tmp64 = helper_ldq_mmu(env, taddr, tci_read_i(&tb_ptr));
 #else
             host_addr = (tcg_target_ulong)taddr;
-            assert(taddr == host_addr);
             tmp64 = tswap64(*(uint64_t *)(host_addr + GUEST_BASE));
 #endif
             tci_write_reg(t0, tmp64);
@@ -1190,7 +1182,6 @@ uintptr_t tcg_qemu_tb_exec(CPUArchState *env, uint8_t *tb_ptr)
             helper_stb_mmu(env, taddr, t0, t2);
 #else
             host_addr = (tcg_target_ulong)taddr;
-            assert(taddr == host_addr);
             *(uint8_t *)(host_addr + GUEST_BASE) = t0;
 #endif
             break;
@@ -1202,7 +1193,6 @@ uintptr_t tcg_qemu_tb_exec(CPUArchState *env, uint8_t *tb_ptr)
             helper_stw_mmu(env, taddr, t0, t2);
 #else
             host_addr = (tcg_target_ulong)taddr;
-            assert(taddr == host_addr);
             *(uint16_t *)(host_addr + GUEST_BASE) = tswap16(t0);
 #endif
             break;
@@ -1214,7 +1204,6 @@ uintptr_t tcg_qemu_tb_exec(CPUArchState *env, uint8_t *tb_ptr)
             helper_stl_mmu(env, taddr, t0, t2);
 #else
             host_addr = (tcg_target_ulong)taddr;
-            assert(taddr == host_addr);
             *(uint32_t *)(host_addr + GUEST_BASE) = tswap32(t0);
 #endif
             break;
@@ -1226,7 +1215,6 @@ uintptr_t tcg_qemu_tb_exec(CPUArchState *env, uint8_t *tb_ptr)
             helper_stq_mmu(env, taddr, tmp64, t2);
 #else
             host_addr = (tcg_target_ulong)taddr;
-            assert(taddr == host_addr);
             *(uint64_t *)(host_addr + GUEST_BASE) = tswap64(tmp64);
 #endif
             break;
-- 
1.7.10.4


