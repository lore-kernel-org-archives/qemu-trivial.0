Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qeYDq-00071y-Q5
	for mharc-qemu-trivial@gnu.org; Fri, 08 Sep 2023 05:56:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1qeYDn-000710-9v; Fri, 08 Sep 2023 05:56:15 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1qeYDl-0006bX-4w; Fri, 08 Sep 2023 05:56:15 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 0810A200CD;
 Fri,  8 Sep 2023 12:56:46 +0300 (MSK)
Received: from tls.msk.ru (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with SMTP id 099BA26913;
 Fri,  8 Sep 2023 12:55:57 +0300 (MSK)
Received: (nullmailer pid 275955 invoked by uid 1000);
 Fri, 08 Sep 2023 09:55:56 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 David Woodhouse <dwmw@amazon.co.uk>
Subject: [PULL 05/23] xen: spelling fix
Date: Fri,  8 Sep 2023 12:55:02 +0300
Message-Id: <20230908095520.275866-6-mjt@tls.msk.ru>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230908095520.275866-1-mjt@tls.msk.ru>
References: <20230908095520.275866-1-mjt@tls.msk.ru>
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
X-List-Received-Date: Fri, 08 Sep 2023 09:56:15 -0000

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
Acked-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/xen/xen_pvdev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/xen/xen_pvdev.c b/hw/xen/xen_pvdev.c
index be1504b82c..c5ad71e8dc 100644
--- a/hw/xen/xen_pvdev.c
+++ b/hw/xen/xen_pvdev.c
@@ -89,7 +89,7 @@ char *xenstore_read_str(const char *base, const char *node)
     str = qemu_xen_xs_read(xenstore, 0, abspath, &len);
     if (str != NULL) {
         /* move to qemu-allocated memory to make sure
-         * callers can savely g_free() stuff. */
+         * callers can safely g_free() stuff. */
         ret = g_strdup(str);
         free(str);
     }
-- 
2.39.2


