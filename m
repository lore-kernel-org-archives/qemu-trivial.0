Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ll0d5-0003iz-94
	for mharc-qemu-trivial@gnu.org; Sun, 23 May 2021 22:47:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <someguy@effective-light.com>)
 id 1ll0d1-0003id-QL; Sun, 23 May 2021 22:47:39 -0400
Received: from mta-12-4.privateemail.com ([198.54.127.107]:17814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <someguy@effective-light.com>)
 id 1ll0d0-0007qw-49; Sun, 23 May 2021 22:47:39 -0400
Received: from mta-12.privateemail.com (localhost [127.0.0.1])
 by mta-12.privateemail.com (Postfix) with ESMTP id 42ED580063;
 Sun, 23 May 2021 22:47:23 -0400 (EDT)
Received: from hal-station.. (unknown [10.20.151.249])
 by mta-12.privateemail.com (Postfix) with ESMTPA id AD4448005F;
 Sun, 23 May 2021 22:47:22 -0400 (EDT)
From: Hamza Mahfooz <someguy@effective-light.com>
To: Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 Hamza Mahfooz <someguy@effective-light.com>
Subject: [PATCH] linux-user: make process_pending_signals thread-safe
Date: Sun, 23 May 2021 22:46:55 -0400
Message-Id: <20210524024655.11115-1-someguy@effective-light.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP
Received-SPF: pass client-ip=198.54.127.107;
 envelope-from=someguy@effective-light.com; helo=MTA-12-4.privateemail.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Mon, 24 May 2021 02:47:40 -0000

Use pthread_sigmask instead of sigprocmask inside process_pending_signals
to ensure that race conditions aren't possible.

Signed-off-by: Hamza Mahfooz <someguy@effective-light.com>
---
 linux-user/signal.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/linux-user/signal.c b/linux-user/signal.c
index 7eecec46c4..81ff753c01 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -1005,9 +1005,8 @@ void process_pending_signals(CPUArchState *cpu_env)
     sigset_t *blocked_set;
 
     while (qatomic_read(&ts->signal_pending)) {
-        /* FIXME: This is not threadsafe.  */
         sigfillset(&set);
-        sigprocmask(SIG_SETMASK, &set, 0);
+        pthread_sigmask(SIG_SETMASK, &set, 0);
 
     restart_scan:
         sig = ts->sync_signal.pending;
-- 
2.31.1


