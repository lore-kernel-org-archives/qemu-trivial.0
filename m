Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1r2wmG-0000rm-Kf
	for mharc-qemu-trivial@gnu.org; Tue, 14 Nov 2023 12:00:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1r2wmB-0000gr-2B; Tue, 14 Nov 2023 12:00:35 -0500
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1r2wm9-0005aK-Bc; Tue, 14 Nov 2023 12:00:34 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id E806E3327A;
 Tue, 14 Nov 2023 19:59:01 +0300 (MSK)
Received: from tls.msk.ru (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with SMTP id B6E3935201;
 Tue, 14 Nov 2023 19:58:43 +0300 (MSK)
Received: (nullmailer pid 2949133 invoked by uid 1000);
 Tue, 14 Nov 2023 16:58:42 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH trivial 20/21] util/filemonitor-inotify.c: spelling fix: kenel
Date: Tue, 14 Nov 2023 19:58:33 +0300
Message-Id: <20231114165834.2949011-21-mjt@tls.msk.ru>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231114165834.2949011-1-mjt@tls.msk.ru>
References: <20231114165834.2949011-1-mjt@tls.msk.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 14 Nov 2023 17:00:37 -0000

Fixes: 2e12dd405c66 "util/filemonitor-inotify: qemu_file_monitor_watch(): assert no overflow"
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 util/filemonitor-inotify.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/util/filemonitor-inotify.c b/util/filemonitor-inotify.c
index 2121111f38..7352b9fe53 100644
--- a/util/filemonitor-inotify.c
+++ b/util/filemonitor-inotify.c
@@ -89,7 +89,7 @@ static void qemu_file_monitor_watch(void *arg)
         struct inotify_event *ev = (struct inotify_event *)(buf + used);
 
         /*
-         * We trust the kenel to provide valid buffer with complete event
+         * We trust the kernel to provide valid buffer with complete event
          * records.
          */
         assert(len - used >= sizeof(struct inotify_event));
-- 
2.39.2


