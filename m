Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dwEfE-0003Ia-L0
	for mharc-qemu-trivial@gnu.org; Sun, 24 Sep 2017 17:42:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48564)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dwEfB-0003Dp-8Q
	for qemu-trivial@nongnu.org; Sun, 24 Sep 2017 17:42:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dwEfA-0004q2-BF
	for qemu-trivial@nongnu.org; Sun, 24 Sep 2017 17:42:09 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:48955)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dwEf2-0004lV-Is; Sun, 24 Sep 2017 17:42:00 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id C42EC41C91;
	Mon, 25 Sep 2017 00:41:59 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 370A7C3F;
	Mon, 25 Sep 2017 00:22:57 +0300 (MSK)
Received: (nullmailer pid 28288 invoked by uid 1000);
	Sun, 24 Sep 2017 21:22:52 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@xilinx.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Mon, 25 Sep 2017 00:22:42 +0300
Message-Id: <596656f66f36f8859b891c9e72356d0dd0f4d242.1506288070.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1506288070.git.mjt@msgid.tls.msk.ru>
References: <cover.1506288070.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1506288070.git.mjt@msgid.tls.msk.ru>
References: <cover.1506288070.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 24/31] target/xtensa: Use the pre-defined
 MEMTXATTRS_UNSPECIFIED macro
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
X-List-Received-Date: Sun, 24 Sep 2017 21:42:10 -0000

From: Alistair Francis <alistair.francis@xilinx.com>

Instead of using the hardcoded (MemTxAttrs){0} for no memory attributes
let's use the already defined MEMTXATTRS_UNSPECIFIED macro instead.

This is technically a change of behaviour as MEMTXATTRS_UNSPECIFIED sets
the unspecified field to 1, but it doesn't look like anything is
checking this field.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
Acked-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 target/xtensa/op_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/xtensa/op_helper.c b/target/xtensa/op_helper.c
index 519fbeddd6..3d990c0caa 100644
--- a/target/xtensa/op_helper.c
+++ b/target/xtensa/op_helper.c
@@ -1025,11 +1025,11 @@ void HELPER(ule_s)(CPUXtensaState *env, uint32_t br, float32 a, float32 b)
 uint32_t HELPER(rer)(CPUXtensaState *env, uint32_t addr)
 {
     return address_space_ldl(env->address_space_er, addr,
-                             (MemTxAttrs){0}, NULL);
+                             MEMTXATTRS_UNSPECIFIED, NULL);
 }
 
 void HELPER(wer)(CPUXtensaState *env, uint32_t data, uint32_t addr)
 {
     address_space_stl(env->address_space_er, addr, data,
-                      (MemTxAttrs){0}, NULL);
+                      MEMTXATTRS_UNSPECIFIED, NULL);
 }
-- 
2.11.0


