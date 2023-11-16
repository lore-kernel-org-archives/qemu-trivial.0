Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1r3X59-0008Rq-Le
	for mharc-qemu-trivial@gnu.org; Thu, 16 Nov 2023 02:46:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1r3X4v-0007Tr-Lo; Thu, 16 Nov 2023 02:46:24 -0500
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1r3X4t-0005gI-Td; Thu, 16 Nov 2023 02:46:21 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 1D50533BEF;
 Thu, 16 Nov 2023 10:45:04 +0300 (MSK)
Received: from tls.msk.ru (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with SMTP id A942935855;
 Thu, 16 Nov 2023 10:44:42 +0300 (MSK)
Received: (nullmailer pid 3202553 invoked by uid 1000);
 Thu, 16 Nov 2023 07:44:41 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org
Subject: [PULL 22/27] include/hw/virtio/vhost.h: spelling fix: sate
Date: Thu, 16 Nov 2023 10:44:36 +0300
Message-Id: <20231116074441.3202417-23-mjt@tls.msk.ru>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231116074441.3202417-1-mjt@tls.msk.ru>
References: <20231116074441.3202417-1-mjt@tls.msk.ru>
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
X-List-Received-Date: Thu, 16 Nov 2023 07:46:25 -0000

Fixes: 4a00d5d7f4b6 "vhost: Add high-level state save/load functions"
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 include/hw/virtio/vhost.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
index 05d7204a08..02477788df 100644
--- a/include/hw/virtio/vhost.h
+++ b/include/hw/virtio/vhost.h
@@ -456,7 +456,7 @@ int vhost_save_backend_state(struct vhost_dev *dev, QEMUFile *f, Error **errp);
  * Must only be called while the device and all its vrings are stopped
  * (`VHOST_TRANSFER_STATE_PHASE_STOPPED`).
  *
- * @dev: The vhost device to which to send the sate
+ * @dev: The vhost device to which to send the state
  * @f: Migration stream from which to load the state
  * @errp: Potential error message
  *
-- 
2.39.2


