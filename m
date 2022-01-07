Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n5rUo-00027q-By
	for mharc-qemu-trivial@gnu.org; Fri, 07 Jan 2022 10:49:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan@weilnetz.de>)
 id 1n5rUm-00027F-US; Fri, 07 Jan 2022 10:49:36 -0500
Received: from mail.weilnetz.de ([37.120.169.71]:40826
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan@weilnetz.de>)
 id 1n5rUk-0006JK-Rf; Fri, 07 Jan 2022 10:49:36 -0500
Received: from qemu.weilnetz.de (qemu.weilnetz.de [188.68.58.204])
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTP id 04802DA0787;
 Fri,  7 Jan 2022 16:49:32 +0100 (CET)
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
 id EFC89460019; Fri,  7 Jan 2022 16:49:31 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Stefan Weil <sw@weilnetz.de>
Subject: [PATCH] libvhost-user: Fix wrong type of argument to formatting
 function (reported by LGTM)
Date: Fri,  7 Jan 2022 16:49:30 +0100
Message-Id: <20220107154930.505075-1-sw@weilnetz.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=37.120.169.71; envelope-from=stefan@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 07 Jan 2022 15:49:37 -0000

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---

LGTM has some more alerts which need attention:
https://lgtm.com/projects/g/qemu/qemu/

Regards,
Stefan

 subprojects/libvhost-user/libvhost-user.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
index 787f4d2d4f..6eb72c4200 100644
--- a/subprojects/libvhost-user/libvhost-user.c
+++ b/subprojects/libvhost-user/libvhost-user.c
@@ -651,7 +651,7 @@ generate_faults(VuDev *dev) {
 
         if (ioctl(dev->postcopy_ufd, UFFDIO_REGISTER, &reg_struct)) {
             vu_panic(dev, "%s: Failed to userfault region %d "
-                          "@%p + size:%zx offset: %zx: (ufd=%d)%s\n",
+                          "@%" PRIx64 " + size:%zx offset: %zx: (ufd=%d)%s\n",
                      __func__, i,
                      dev_region->mmap_addr,
                      dev_region->size, dev_region->mmap_offset,
-- 
2.30.2


