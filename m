Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l1Sli-0007rO-SI
	for mharc-qemu-trivial@gnu.org; Mon, 18 Jan 2021 06:32:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1l1Slf-0007p5-W3; Mon, 18 Jan 2021 06:32:20 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:39897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1l1Sle-0000Pp-Bk; Mon, 18 Jan 2021 06:32:19 -0500
Received: from localhost.localdomain ([82.252.149.54]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MLhsE-1lIzeM3K8O-00HhFx; Mon, 18 Jan 2021 12:32:10 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>
Subject: [PULL 1/4] hw/virtio-pci: Replace error_report() by
 qemu_log_mask(GUEST_ERROR)
Date: Mon, 18 Jan 2021 12:32:02 +0100
Message-Id: <20210118113205.1915888-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210118113205.1915888-1-laurent@vivier.eu>
References: <20210118113205.1915888-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ytZLWhdAIyUryIjvahpjtjy3oD0Q9D9Q9wWHxqzbJvUFiQtW3xI
 EznltKKYnt7NnCZ/msRz3R4bTGmj1JNEH/LYl4BlNVP3L1BgLpSv0MpLQV6BlQ9JjVEEa/p
 VbmX6ItRQnpM0/LpCYsqduTG9SN1iqUQ2m9noaH9Ef68tZbKm1PQq7QxfuoN/AxiUPmBrxX
 p1W3wjP3aM/QTA7QiZ4mQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:7vTjW94XwZo=:MRULBJPVS75oEpFXCRKwZN
 N+tyCxxI50FHSRwKBrFHWspj2gwRrr3Nx7GZg6rSHJlmgmOFUZimWU3QX/Pb+0eRAyEBgXsNj
 Gv3U6YVgvpXfDkh5iThh4gKNQ6MCgIFYphxJaR+7NVI31k+yCHjm0Zy8WVouG3HskhvdIqA3M
 ov3dans/hRHxCkKITp41hqZzxmfXziJ3hLUY1+zKLMMAVsduJZKk64OwZ6OdAidHfk55Fw2Qh
 TIET6Sqg0YbfkCYPfrpdwZuyrS+LEDxeHpacXVJpoeOjJgGPVKZOFY8AMeWBVSjcCl8pcC2eM
 lbxywfVQgFJSjp8jPAaw36CrsXoDJ1ojNlZLIk1NembwKeYkoLzBr586xMJLfcf1DVJJCGR6q
 1R531R++qVlBCaCx0OgdQHe/729+oXMhVUV9CyVuPRO+hA2Klel8HzqcfKDML
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 18 Jan 2021 11:32:20 -0000

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Replace I/O write error reported with error_report() by
qemu_log_mask(GUEST_ERROR) which allow filtering.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Message-Id: <20201210172834.178052-1-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/virtio/virtio-pci.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index f863f69ede4f..094c36aa3ea3 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -27,6 +27,7 @@
 #include "hw/qdev-properties.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
+#include "qemu/log.h"
 #include "qemu/module.h"
 #include "hw/pci/msi.h"
 #include "hw/pci/msix.h"
@@ -365,8 +366,9 @@ static void virtio_ioport_write(void *opaque, uint32_t addr, uint32_t val)
         virtio_queue_set_vector(vdev, vdev->queue_sel, val);
         break;
     default:
-        error_report("%s: unexpected address 0x%x value 0x%x",
-                     __func__, addr, val);
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: unexpected address 0x%x value 0x%x\n",
+                      __func__, addr, val);
         break;
     }
 }
-- 
2.29.2


