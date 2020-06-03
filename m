Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jgeCw-0003Ce-EL
	for mharc-qemu-trivial@gnu.org; Wed, 03 Jun 2020 20:58:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joe.slater@windriver.com>)
 id 1jgcMk-0002aM-8T; Wed, 03 Jun 2020 19:00:10 -0400
Received: from mail.windriver.com ([147.11.1.11]:40154)
 by eggs.gnu.org with esmtps (TLS1.1:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <joe.slater@windriver.com>)
 id 1jgcMh-0005bh-Oi; Wed, 03 Jun 2020 19:00:09 -0400
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
 [147.11.189.40])
 by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 053MnQZl008733
 (version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
 Wed, 3 Jun 2020 15:49:27 -0700 (PDT)
Received: from ala-lpggp3.wrs.com (147.11.105.124) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.40) with Microsoft SMTP Server id 14.3.487.0;
 Wed, 3 Jun 2020 15:49:26 -0700
From: Joe Slater <joe.slater@windriver.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-trivial@nongnu.org>, <qemu-stable@nongnu.org>
Subject: [PATCH 2/2] lockable: do not rely on optimization for null lockables
Date: Wed, 3 Jun 2020 15:49:03 -0700
Message-ID: <20200603224903.26268-3-joe.slater@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200603224903.26268-1-joe.slater@windriver.com>
References: <20200603224903.26268-1-joe.slater@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=147.11.1.11;
 envelope-from=joe.slater@windriver.com; helo=mail.windriver.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/03 18:49:27
X-ACL-Warn: Detected OS   = Windows NT kernel [generic] [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 03 Jun 2020 20:58:06 -0400
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
X-List-Received-Date: Wed, 03 Jun 2020 23:00:10 -0000

If we use QLNULL for null lockables, we can always
use referencing unknown_lock_type as a link time
error indicator.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 include/qemu/lockable.h | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/include/qemu/lockable.h b/include/qemu/lockable.h
index 7f7aebb..7fc5750 100644
--- a/include/qemu/lockable.h
+++ b/include/qemu/lockable.h
@@ -24,21 +24,14 @@ struct QemuLockable {
     QemuLockUnlockFunc *unlock;
 };
 
-#define QLNULL ((QemuLockable *)0)
-
-
-/* This function gives an error if an invalid, non-NULL pointer type is passed
- * to QEMU_MAKE_LOCKABLE.  For optimized builds, we can rely on dead-code elimination
- * from the compiler, and give the errors already at link time.
+/*
+ *  If unknown_lock_type() is referenced, it means we have tried to passed something
+ *  not recognized as lockable to the macros below.  Use QLNULL to intentionally pass
+ *  a null lockable.
  */
-#if defined(__OPTIMIZE__) && !defined(__SANITIZE_ADDRESS__)
+#define QLNULL ((QemuLockable *)0)
 void unknown_lock_type(void *);
-#else
-static inline void unknown_lock_type(void *unused)
-{
-    abort();
-}
-#endif
+
 
 static inline __attribute__((__always_inline__)) QemuLockable *
 qemu_make_lockable(void *x, QemuLockable *lockable)
-- 
2.7.4


