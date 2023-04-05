Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pk3HQ-0003Rr-S8
	for mharc-qemu-trivial@gnu.org; Wed, 05 Apr 2023 09:34:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pk3HN-0003RM-7R; Wed, 05 Apr 2023 09:34:25 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pk3HK-0001W9-8V; Wed, 05 Apr 2023 09:34:24 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 6FE324000E;
 Wed,  5 Apr 2023 16:34:18 +0300 (MSK)
Received: from tls.msk.ru (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with SMTP id 801A6DD;
 Wed,  5 Apr 2023 16:34:17 +0300 (MSK)
Received: (nullmailer pid 50427 invoked by uid 1000);
 Wed, 05 Apr 2023 13:34:17 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org
Subject: [PATCH trivial] block.c: add newline for "Detected format" warning
Date: Wed,  5 Apr 2023 16:34:04 +0300
Message-Id: <20230405133404.50376-1-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 05 Apr 2023 13:34:26 -0000

Add the forgotten trailing newline.

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 block.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block.c b/block.c
index a18f052374..3d220d3955 100644
--- a/block.c
+++ b/block.c
@@ -7026,7 +7026,7 @@ void bdrv_img_create(const char *filename, const char *fmt,
             if (!backing_fmt) {
                 error_setg(&local_err,
                            "Backing file specified without backing format");
-                error_append_hint(&local_err, "Detected format of %s.",
+                error_append_hint(&local_err, "Detected format of %s.\n",
                                   bs->drv->format_name);
                 goto out;
             }
-- 
2.30.2


