Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rKzGE-0000wx-8F
	for mharc-qemu-trivial@gnu.org; Wed, 03 Jan 2024 06:18:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1rKzGC-0000wT-9f; Wed, 03 Jan 2024 06:18:08 -0500
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1rKzGA-00041h-Ev; Wed, 03 Jan 2024 06:18:08 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 0140640655;
 Wed,  3 Jan 2024 14:18:44 +0300 (MSK)
Received: from tls.msk.ru (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with SMTP id 7D585593A6;
 Wed,  3 Jan 2024 14:18:01 +0300 (MSK)
Received: (nullmailer pid 250165 invoked by uid 1000);
 Wed, 03 Jan 2024 11:18:01 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org
Subject: [PATCH trivial] audio/audio.c: remove trailing newline in error_setg
Date: Wed,  3 Jan 2024 14:18:00 +0300
Message-Id: <20240103111800.250151-1-mjt@tls.msk.ru>
X-Mailer: git-send-email 2.39.2
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
X-List-Received-Date: Wed, 03 Jan 2024 11:18:08 -0000

error_setg() appends newline to the formatted message.
Fixes: cb94ff5f80c5

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 audio/audio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/audio/audio.c b/audio/audio.c
index 8d1e4ad922..7ac74f9e16 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -1744,7 +1744,7 @@ static AudioState *audio_init(Audiodev *dev, Error **errp)
         if (driver) {
             done = !audio_driver_init(s, driver, dev, errp);
         } else {
-            error_setg(errp, "Unknown audio driver `%s'\n", drvname);
+            error_setg(errp, "Unknown audio driver `%s'", drvname);
         }
         if (!done) {
             goto out;
-- 
2.39.2


