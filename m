Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lresW-0000EB-Qx
	for mharc-qemu-trivial@gnu.org; Fri, 11 Jun 2021 06:59:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan@weilnetz.de>)
 id 1lresU-0000D3-93; Fri, 11 Jun 2021 06:59:06 -0400
Received: from mail.weilnetz.de ([37.120.169.71]:43196
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan@weilnetz.de>)
 id 1lresR-00069b-VL; Fri, 11 Jun 2021 06:59:05 -0400
Received: from qemu.weilnetz.de (qemu.weilnetz.de [188.68.58.204])
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTP id 1938BDA07C2;
 Fri, 11 Jun 2021 12:59:00 +0200 (CEST)
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
 id 8D5C3460056; Fri, 11 Jun 2021 12:58:59 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Weil <sw@weilnetz.de>
Subject: [PATCH] util/oslib-win32: Fix fatal assertion in qemu_try_memalign
Date: Fri, 11 Jun 2021 12:58:46 +0200
Message-Id: <20210611105846.347954-1-sw@weilnetz.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=37.120.169.71; envelope-from=stefan@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 11 Jun 2021 10:59:06 -0000

The function is called with alignment == 0 which caused an assertion.
Use the code from oslib_posix.c to fix that regression (introduced
by commit ed6f53f9ca9).

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 util/oslib-win32.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/util/oslib-win32.c b/util/oslib-win32.c
index ca99356fdf..7b318ea835 100644
--- a/util/oslib-win32.c
+++ b/util/oslib-win32.c
@@ -57,7 +57,11 @@ void *qemu_try_memalign(size_t alignment, size_t size)
     void *ptr;
 
     g_assert(size != 0);
-    g_assert(is_power_of_2(alignment));
+    if (alignment < sizeof(void *)) {
+        alignment = sizeof(void *);
+    } else {
+        g_assert(is_power_of_2(alignment));
+    }
     ptr = _aligned_malloc(size, alignment);
     trace_qemu_memalign(alignment, size, ptr);
     return ptr;
-- 
2.30.2


