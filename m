Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1r2wmH-0000uj-Rd
	for mharc-qemu-trivial@gnu.org; Tue, 14 Nov 2023 12:00:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1r2wmD-0000kt-6s; Tue, 14 Nov 2023 12:00:37 -0500
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1r2wmB-0005aq-DK; Tue, 14 Nov 2023 12:00:36 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 051393327B;
 Tue, 14 Nov 2023 19:59:02 +0300 (MSK)
Received: from tls.msk.ru (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with SMTP id C85CC35202;
 Tue, 14 Nov 2023 19:58:43 +0300 (MSK)
Received: (nullmailer pid 2949136 invoked by uid 1000);
 Tue, 14 Nov 2023 16:58:42 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 Eric Auger <eric.auger@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PATCH trivial 21/21] util/range.c: spelling fix: inbetween
Date: Tue, 14 Nov 2023 19:58:34 +0300
Message-Id: <20231114165834.2949011-22-mjt@tls.msk.ru>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231114165834.2949011-1-mjt@tls.msk.ru>
References: <20231114165834.2949011-1-mjt@tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Tue, 14 Nov 2023 17:00:40 -0000

Fixes: b439595a08d7 "range: Introduce range_inverse_array()"
Cc: Eric Auger <eric.auger@redhat.com>
Cc: Cédric Le Goater <clg@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 util/range.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/util/range.c b/util/range.c
index 9605ccfcbe..f3f40098d5 100644
--- a/util/range.c
+++ b/util/range.c
@@ -98,7 +98,7 @@ void range_inverse_array(GList *in, GList **rev,
         out = append_new_range(out, low, MIN(range_lob(r) - 1, high));
     }
 
-    /* insert a range inbetween each original range until we reach high */
+    /* insert a range in between each original range until we reach high */
     for (; l->next; l = l->next) {
         r = (Range *)l->data;
         rn = (Range *)l->next->data;
-- 
2.39.2


