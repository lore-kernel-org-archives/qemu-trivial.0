Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lfJE2-0004Uq-7X
	for mharc-qemu-trivial@gnu.org; Sat, 08 May 2021 05:26:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1lfJE0-0004UX-D1; Sat, 08 May 2021 05:26:16 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:40251)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1lfJDy-0001u2-K1; Sat, 08 May 2021 05:26:16 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 95BA940010;
 Sat,  8 May 2021 12:26:01 +0300 (MSK)
Received: from tls.msk.ru (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with SMTP id E9A2870;
 Sat,  8 May 2021 12:26:01 +0300 (MSK)
Received: (nullmailer pid 351552 invoked by uid 1000);
 Sat, 08 May 2021 09:26:01 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, kraxel@redhat.com,
 Michael Tokarev <mjt@tls.msk.ru>
Subject: [PATCH trivial] vnc: spelling fix (enable->enabled)
Date: Sat,  8 May 2021 12:25:58 +0300
Message-Id: <20210508092558.351102-1-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sat, 08 May 2021 09:26:16 -0000

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>

diff --git a/ui/vnc.c b/ui/vnc.c
index 456db47d71..2bea46b2b3 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -598,3 +598,3 @@ bool vnc_display_reload_certs(const char *id, Error **errp)
     if (!vd->tlscreds) {
-        error_setg(errp, "vnc tls is not enable");
+        error_setg(errp, "vnc tls is not enabled");
         return false;

