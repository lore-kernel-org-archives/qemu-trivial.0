Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VKBT0-0005PM-4Z
	for mharc-qemu-trivial@gnu.org; Thu, 12 Sep 2013 14:18:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53335)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VKBSu-0005ER-8k
	for qemu-trivial@nongnu.org; Thu, 12 Sep 2013 14:18:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VKBSs-0003tK-SU
	for qemu-trivial@nongnu.org; Thu, 12 Sep 2013 14:18:04 -0400
Received: from qemu.weilnetz.de ([2a03:4000:2:362::1]:50199
	helo=v2201305906712890.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VKBSp-0003sd-Kp; Thu, 12 Sep 2013 14:17:59 -0400
Received: by v2201305906712890.yourvserver.net (Postfix, from userid 1000)
	id 17A66180651; Thu, 12 Sep 2013 20:17:57 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel <qemu-devel@nongnu.org>
Date: Thu, 12 Sep 2013 20:17:50 +0200
Message-Id: <1379009870-18323-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a03:4000:2:362::1
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Stefan Weil <sw@weilnetz.de>,
	qemu-stable <qemu-stable@nongnu.org>, Richard Henderson <rth@twiddle.net>
Subject: [Qemu-trivial] [PATCH] tci: Fix qemu-alpha on 32 bit hosts (wrong
	assertions)
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
X-List-Received-Date: Thu, 12 Sep 2013 18:18:09 -0000

Debian busybox-static for alpha has a load address of 0x0000000120000000
which is mapped to 0x0000000020000000 for 32 bit hosts.

qemu-alpha uses the TCG opcodes qemu_ld32, qemu_ld64, qemu_st32 and
qemu_st64 which all raise the assertion (taddr == host_addr).

Remove all assertions of this type because they are either wrong or
unnecessary (when sizeof(tcg_target_ulong) >= sizeof(target_ulong)).

Cc: qemu-stable <qemu-stable@nongnu.org>
Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 tci.c |   12 ------------
 1 file changed, 12 deletions(-)

diff --git a/tci.c b/tci.c
index cea7234..0202ed9 100644
--- a/tci.c
+++ b/tci.c
@@ -1093,7 +1093,6 @@ uintptr_t tcg_qemu_tb_exec(CPUArchState *env, uint8_t *tb_ptr)
             tmp8 = helper_ldb_mmu(env, taddr, tci_read_i(&tb_ptr));
 #else
             host_addr = (tcg_target_ulong)taddr;
-            assert(taddr == host_addr);
             tmp8 = *(uint8_t *)(host_addr + GUEST_BASE);
 #endif
             tci_write_reg8(t0, tmp8);
@@ -1105,7 +1104,6 @@ uintptr_t tcg_qemu_tb_exec(CPUArchState *env, uint8_t *tb_ptr)
             tmp8 = helper_ldb_mmu(env, taddr, tci_read_i(&tb_ptr));
 #else
             host_addr = (tcg_target_ulong)taddr;
-            assert(taddr == host_addr);
             tmp8 = *(uint8_t *)(host_addr + GUEST_BASE);
 #endif
             tci_write_reg8s(t0, tmp8);
@@ -1117,7 +1115,6 @@ uintptr_t tcg_qemu_tb_exec(CPUArchState *env, uint8_t *tb_ptr)
             tmp16 = helper_ldw_mmu(env, taddr, tci_read_i(&tb_ptr));
 #else
             host_addr = (tcg_target_ulong)taddr;
-            assert(taddr == host_addr);
             tmp16 = tswap16(*(uint16_t *)(host_addr + GUEST_BASE));
 #endif
             tci_write_reg16(t0, tmp16);
@@ -1129,7 +1126,6 @@ uintptr_t tcg_qemu_tb_exec(CPUArchState *env, uint8_t *tb_ptr)
             tmp16 = helper_ldw_mmu(env, taddr, tci_read_i(&tb_ptr));
 #else
             host_addr = (tcg_target_ulong)taddr;
-            assert(taddr == host_addr);
             tmp16 = tswap16(*(uint16_t *)(host_addr + GUEST_BASE));
 #endif
             tci_write_reg16s(t0, tmp16);
@@ -1142,7 +1138,6 @@ uintptr_t tcg_qemu_tb_exec(CPUArchState *env, uint8_t *tb_ptr)
             tmp32 = helper_ldl_mmu(env, taddr, tci_read_i(&tb_ptr));
 #else
             host_addr = (tcg_target_ulong)taddr;
-            assert(taddr == host_addr);
             tmp32 = tswap32(*(uint32_t *)(host_addr + GUEST_BASE));
 #endif
             tci_write_reg32(t0, tmp32);
@@ -1154,7 +1149,6 @@ uintptr_t tcg_qemu_tb_exec(CPUArchState *env, uint8_t *tb_ptr)
             tmp32 = helper_ldl_mmu(env, taddr, tci_read_i(&tb_ptr));
 #else
             host_addr = (tcg_target_ulong)taddr;
-            assert(taddr == host_addr);
             tmp32 = tswap32(*(uint32_t *)(host_addr + GUEST_BASE));
 #endif
             tci_write_reg32s(t0, tmp32);
@@ -1167,7 +1161,6 @@ uintptr_t tcg_qemu_tb_exec(CPUArchState *env, uint8_t *tb_ptr)
             tmp32 = helper_ldl_mmu(env, taddr, tci_read_i(&tb_ptr));
 #else
             host_addr = (tcg_target_ulong)taddr;
-            assert(taddr == host_addr);
             tmp32 = tswap32(*(uint32_t *)(host_addr + GUEST_BASE));
 #endif
             tci_write_reg32(t0, tmp32);
@@ -1182,7 +1175,6 @@ uintptr_t tcg_qemu_tb_exec(CPUArchState *env, uint8_t *tb_ptr)
             tmp64 = helper_ldq_mmu(env, taddr, tci_read_i(&tb_ptr));
 #else
             host_addr = (tcg_target_ulong)taddr;
-            assert(taddr == host_addr);
             tmp64 = tswap64(*(uint64_t *)(host_addr + GUEST_BASE));
 #endif
             tci_write_reg(t0, tmp64);
@@ -1198,7 +1190,6 @@ uintptr_t tcg_qemu_tb_exec(CPUArchState *env, uint8_t *tb_ptr)
             helper_stb_mmu(env, taddr, t0, t2);
 #else
             host_addr = (tcg_target_ulong)taddr;
-            assert(taddr == host_addr);
             *(uint8_t *)(host_addr + GUEST_BASE) = t0;
 #endif
             break;
@@ -1210,7 +1201,6 @@ uintptr_t tcg_qemu_tb_exec(CPUArchState *env, uint8_t *tb_ptr)
             helper_stw_mmu(env, taddr, t0, t2);
 #else
             host_addr = (tcg_target_ulong)taddr;
-            assert(taddr == host_addr);
             *(uint16_t *)(host_addr + GUEST_BASE) = tswap16(t0);
 #endif
             break;
@@ -1222,7 +1212,6 @@ uintptr_t tcg_qemu_tb_exec(CPUArchState *env, uint8_t *tb_ptr)
             helper_stl_mmu(env, taddr, t0, t2);
 #else
             host_addr = (tcg_target_ulong)taddr;
-            assert(taddr == host_addr);
             *(uint32_t *)(host_addr + GUEST_BASE) = tswap32(t0);
 #endif
             break;
@@ -1234,7 +1223,6 @@ uintptr_t tcg_qemu_tb_exec(CPUArchState *env, uint8_t *tb_ptr)
             helper_stq_mmu(env, taddr, tmp64, t2);
 #else
             host_addr = (tcg_target_ulong)taddr;
-            assert(taddr == host_addr);
             *(uint64_t *)(host_addr + GUEST_BASE) = tswap64(tmp64);
 #endif
             break;
-- 
1.7.10.4


