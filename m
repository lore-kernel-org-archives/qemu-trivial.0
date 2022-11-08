Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1osQ1E-00029m-ET
	for mharc-qemu-trivial@gnu.org; Tue, 08 Nov 2022 09:56:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jianchunfu@cmss.chinamobile.com>)
 id 1osJYj-0004is-CA; Tue, 08 Nov 2022 03:02:16 -0500
Received: from cmccmta3.chinamobile.com ([221.176.66.81])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jianchunfu@cmss.chinamobile.com>)
 id 1osJYg-0000am-IK; Tue, 08 Nov 2022 03:02:13 -0500
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[172.16.121.13])
 by rmmx-syy-dmz-app11-12011 (RichMail) with SMTP id 2eeb636a0cf69d7-3bd0c;
 Tue, 08 Nov 2022 16:01:59 +0800 (CST)
X-RM-TRANSID: 2eeb636a0cf69d7-3bd0c
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[223.108.79.103])
 by rmsmtp-syy-appsvr07-12007 (RichMail) with SMTP id 2ee7636a0cee666-511ee;
 Tue, 08 Nov 2022 16:01:59 +0800 (CST)
X-RM-TRANSID: 2ee7636a0cee666-511ee
From: jianchunfu <jianchunfu@cmss.chinamobile.com>
To: qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
Cc: mst@redhat.com,
	jianchunfu <jianchunfu@cmss.chinamobile.com>
Subject: [PATCH] libvhost-user: Handling potential memory allocation failures
Date: Tue,  8 Nov 2022 16:01:41 +0800
Message-Id: <20221108080141.5756-1-jianchunfu@cmss.chinamobile.com>
X-Mailer: git-send-email 2.18.4
Received-SPF: pass client-ip=221.176.66.81;
 envelope-from=jianchunfu@cmss.chinamobile.com; helo=cmccmta3.chinamobile.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 08 Nov 2022 09:55:59 -0500
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
X-List-Received-Date: Tue, 08 Nov 2022 08:02:16 -0000

Add malloc check of virtqueue element in libvhost-user.

Signed-off-by: jianchunfu <jianchunfu@cmss.chinamobile.com>
---
 subprojects/libvhost-user/libvhost-user.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
index 47d2efc60f..901cd7a2c0 100644
--- a/subprojects/libvhost-user/libvhost-user.c
+++ b/subprojects/libvhost-user/libvhost-user.c
@@ -2551,6 +2551,10 @@ virtqueue_alloc_element(size_t sz,
 
     assert(sz >= sizeof(VuVirtqElement));
     elem = malloc(out_sg_end);
+    if (!elem) {
+        DPRINT("%s: failed to malloc virtqelement\n", __func__);
+        exit(0);
+    }
     elem->out_num = out_num;
     elem->in_num = in_num;
     elem->in_sg = (void *)elem + in_sg_ofs;
-- 
2.18.4




