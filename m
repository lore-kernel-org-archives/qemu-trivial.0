Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kBM7W-0007ur-Ju
	for mharc-qemu-trivial@gnu.org; Thu, 27 Aug 2020 13:55:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan@weilnetz.de>)
 id 1kBM7U-0007tK-NQ; Thu, 27 Aug 2020 13:55:28 -0400
Received: from mail.weilnetz.de ([37.120.169.71]:60812
 helo=v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan@weilnetz.de>)
 id 1kBM7S-0004bg-Hg; Thu, 27 Aug 2020 13:55:28 -0400
Received: from localhost (localhost [127.0.0.1])
 by v2201612906741603.powersrv.de (Postfix) with ESMTP id 9AA6DDB46E7;
 Thu, 27 Aug 2020 19:55:23 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at v2201612906741603.powersrv.de
Received: from v2201612906741603.powersrv.de ([127.0.0.1])
 by localhost (v2201612906741603.powersrv.de [127.0.0.1]) (amavisd-new,
 port 10024)
 with ESMTP id Mmikb0y49onP; Thu, 27 Aug 2020 19:55:21 +0200 (CEST)
Received: from qemu.weilnetz.de (qemu.weilnetz.de [188.68.58.204])
 by v2201612906741603.powersrv.de (Postfix) with ESMTP id 991BBDB46C9;
 Thu, 27 Aug 2020 19:55:21 +0200 (CEST)
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
 id 7E30C4601F0; Thu, 27 Aug 2020 19:55:21 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-trivial@nongnu.org,
	Stefan Weil <sw@weilnetz.de>
Subject: [PATCH] main-loop: Fix comment
Date: Thu, 27 Aug 2020 19:55:20 +0200
Message-Id: <20200827175520.32355-1-sw@weilnetz.de>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=37.120.169.71; envelope-from=stefan@weilnetz.de;
 helo=v2201612906741603.powersrv.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/27 13:30:56
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
X-List-Received-Date: Thu, 27 Aug 2020 17:55:29 -0000

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 include/qemu/main-loop.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/qemu/main-loop.h b/include/qemu/main-loop.h
index 8e98613656..d6892fd208 100644
--- a/include/qemu/main-loop.h
+++ b/include/qemu/main-loop.h
@@ -52,7 +52,7 @@ int qemu_init_main_loop(Error **errp);
  * repeatedly calls main_loop_wait(false).
  *
  * Main loop services include file descriptor callbacks, bottom halves
- * and timers (defined in qemu-timer.h).  Bottom halves are similar to timers
+ * and timers (defined in qemu/timer.h).  Bottom halves are similar to timers
  * that execute immediately, but have a lower overhead and scheduling them
  * is wait-free, thread-safe and signal-safe.
  *
-- 
2.28.0


