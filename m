Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dVHqV-0000Bp-JB
	for mharc-qemu-trivial@gnu.org; Wed, 12 Jul 2017 09:38:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59403)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dVHqP-0008WQ-M4
	for qemu-trivial@nongnu.org; Wed, 12 Jul 2017 09:38:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dVHqO-0005Ow-Ls
	for qemu-trivial@nongnu.org; Wed, 12 Jul 2017 09:38:21 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:53715)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dVHqJ-0005Jg-45; Wed, 12 Jul 2017 09:38:15 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id B67E740F66;
	Wed, 12 Jul 2017 16:38:13 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 3CB07AD0;
	Wed, 12 Jul 2017 16:38:13 +0300 (MSK)
Received: (nullmailer pid 29032 invoked by uid 1000);
	Wed, 12 Jul 2017 13:38:12 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Max Filippov <jcmvbkbc@gmail.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Wed, 12 Jul 2017 16:37:57 +0300
Message-Id: <aa5a2c0b3dff907017388895d3005bd348cca6c4.1499866676.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1499866676.git.mjt@msgid.tls.msk.ru>
References: <cover.1499866676.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1499866676.git.mjt@msgid.tls.msk.ru>
References: <cover.1499866676.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 01/13] target/xtensa: gdbstub: drop dead
 return statement
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
X-List-Received-Date: Wed, 12 Jul 2017 13:38:23 -0000

From: Max Filippov <jcmvbkbc@gmail.com>

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
Reviewed-by: Laurent Vivier <lvivier@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 target/xtensa/gdbstub.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/xtensa/gdbstub.c b/target/xtensa/gdbstub.c
index da131ae8cc..d78a1b437d 100644
--- a/target/xtensa/gdbstub.c
+++ b/target/xtensa/gdbstub.c
@@ -72,7 +72,6 @@ int xtensa_cpu_gdb_read_register(CPUState *cs, uint8_t *mem_buf, int n)
                       __func__, n, reg->type);
         memset(mem_buf, 0, reg->size);
         return reg->size;
-        return 0;
     }
 }
 
-- 
2.11.0


