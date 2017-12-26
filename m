Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eTpiu-0005Zp-DI
	for mharc-qemu-trivial@gnu.org; Tue, 26 Dec 2017 08:56:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59389)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <info@mobile-stream.com>) id 1eTnQ9-0000ez-Ri
	for qemu-trivial@nongnu.org; Tue, 26 Dec 2017 06:29:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <info@mobile-stream.com>) id 1eTnQ6-0003y9-Of
	for qemu-trivial@nongnu.org; Tue, 26 Dec 2017 06:29:21 -0500
Received: from mx12.valuehost.ru ([217.112.42.215]:51429)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <info@mobile-stream.com>) id 1eTnQ6-0003ue-GY
	for qemu-trivial@nongnu.org; Tue, 26 Dec 2017 06:29:18 -0500
Received: from mx7.valuehost.ru (localhost.valuehost.ru [127.0.0.1])
	by mx12.valuehost.ru (Postfix) with ESMTP id B88D62E643
	for <qemu-trivial@nongnu.org>; Tue, 26 Dec 2017 14:29:02 +0300 (MSK)
Date: Tue, 26 Dec 2017 14:29:13 +0300
From: info@mobile-stream.com
Reply-To: info@mobile-stream.com
X-Priority: 3 (Normal)
Message-ID: <1954640316.20171226142913@mobile-stream.com>
To: qemu-trivial@nongnu.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 217.112.42.215
X-Mailman-Approved-At: Tue, 26 Dec 2017 08:56:51 -0500
Subject: [Qemu-trivial] fix evsrwu and others for powerpcspe
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
X-List-Received-Date: Tue, 26 Dec 2017 11:29:23 -0000

GEN_SPEOP_ARITH2 declares non-local temporaries then calls gen_op_evsrwu/evsrws/evslw which generates branch insn.

--- target/ppc/translate/spe-impl.inc.c.orig
+++ target/ppc/translate/spe-impl.inc.c
@@ -158,8 +158,8 @@
         gen_exception(ctx, POWERPC_EXCP_SPEU);                                \
         return;                                                               \
     }                                                                         \
-    t0 = tcg_temp_new_i32();                                                  \
-    t1 = tcg_temp_new_i32();                                                  \
+    t0 = tcg_temp_local_new_i32();                                                  \
+    t1 = tcg_temp_local_new_i32();                                                  \
                                                                               \
     tcg_gen_trunc_tl_i32(t0, cpu_gpr[rA(ctx->opcode)]);                       \
     tcg_gen_trunc_tl_i32(t1, cpu_gpr[rB(ctx->opcode)]);                       \


