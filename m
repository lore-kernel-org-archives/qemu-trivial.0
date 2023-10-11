Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qqXHT-0007Yh-10
	for mharc-qemu-trivial@gnu.org; Wed, 11 Oct 2023 07:21:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1qqXHN-0007Ws-Ly; Wed, 11 Oct 2023 07:21:30 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1qqXH7-0000lU-Ck; Wed, 11 Oct 2023 07:21:28 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 832A729673;
 Wed, 11 Oct 2023 14:21:01 +0300 (MSK)
Received: from tls.msk.ru (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with SMTP id E5EF92E6F9;
 Wed, 11 Oct 2023 14:20:55 +0300 (MSK)
Received: (nullmailer pid 1032025 invoked by uid 1000);
 Wed, 11 Oct 2023 11:20:55 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Pierre Labatut <plabatut@google.com>, qemu-trivial@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>
Subject: [PULL 03/13] Fix compilation when UFFDIO_REGISTER is not set.
Date: Wed, 11 Oct 2023 14:20:44 +0300
Message-Id: <20231011112054.1031975-4-mjt@tls.msk.ru>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231011112054.1031975-1-mjt@tls.msk.ru>
References: <20231011112054.1031975-1-mjt@tls.msk.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
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
X-List-Received-Date: Wed, 11 Oct 2023 11:21:33 -0000

From: Pierre Labatut <plabatut@google.com>

Signed-off-by: Pierre Labatut <plabatut@google.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 subprojects/libvhost-user/libvhost-user.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
index 051a611da3..ac6d5d01d3 100644
--- a/subprojects/libvhost-user/libvhost-user.c
+++ b/subprojects/libvhost-user/libvhost-user.c
@@ -631,9 +631,9 @@ static bool
 generate_faults(VuDev *dev) {
     unsigned int i;
     for (i = 0; i < dev->nregions; i++) {
+#ifdef UFFDIO_REGISTER
         VuDevRegion *dev_region = &dev->regions[i];
         int ret;
-#ifdef UFFDIO_REGISTER
         struct uffdio_register reg_struct;
 
         /*
-- 
2.39.2


