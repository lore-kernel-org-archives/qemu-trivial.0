Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1sgy1a-0006vb-58
	for mharc-qemu-trivial@gnu.org; Wed, 21 Aug 2024 22:58:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wh1sper@zju.edu.cn>)
 id 1sgy1Y-0006ug-VV; Wed, 21 Aug 2024 22:58:08 -0400
Received: from azure-sdnproxy.icoremail.net ([20.231.56.155])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <wh1sper@zju.edu.cn>)
 id 1sgy1W-00004s-Qv; Wed, 21 Aug 2024 22:58:08 -0400
Received: from NUC10i7FNH.. (unknown [101.82.162.35])
 by mail-app3 (Coremail) with SMTP id cC_KCgB32n0uqcZmlqLCAg--.27067S2;
 Thu, 22 Aug 2024 10:57:55 +0800 (CST)
From: Haoran Zhang <wh1sper@zju.edu.cn>
To: philmd@linaro.org
Cc: qemu-trivial@nongnu.org, marcandre.lureau@redhat.com,
 qemu-stable@nongnu.org, Haoran Zhang <wh1sper@zju.edu.cn>
Subject: [PATCH v2] hw/display/vhost-user-gpu.c: fix vhost_user_gpu_chr_read()
 where `size` was incorrectly passed to `msg->flags`.
Date: Thu, 22 Aug 2024 10:31:36 +0800
Message-ID: <20240822025656.129397-1-wh1sper@zju.edu.cn>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: cC_KCgB32n0uqcZmlqLCAg--.27067S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73
 VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUY37AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E
 6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28Cjx
 kF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8I
 cVCY1x0267AKxVWxJr0_GcWl84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2js
 IEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE
 5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeV
 CFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1l
 c7CjxVAaw2AFwI0_JF0_Jw1lc2xSY4AK67AK6r4UMxAIw28IcxkI7VAKI48JMxC20s026x
 CaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_
 JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r
 1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_
 Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8Jb
 IYCTnIWIevJa73UjIFyTuYvjfUe7KsUUUUU
X-CM-SenderInfo: asssliaqzvq6lmxovvfxof0/1tbiAggTB2bDWKYK2AAKsd
Received-SPF: pass client-ip=20.231.56.155; envelope-from=wh1sper@zju.edu.cn;
 helo=azure-sdnproxy.icoremail.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-List-Received-Date: Thu, 22 Aug 2024 02:58:09 -0000

Fixes: 267f664658 ("hw/display: add vhost-user-vga & gpu-pci")
Signed-off-by: Haoran Zhang <wh1sper@zju.edu.cn>
---
 hw/display/vhost-user-gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/display/vhost-user-gpu.c b/hw/display/vhost-user-gpu.c
index 63c64ddde6..c0c66910f1 100644
--- a/hw/display/vhost-user-gpu.c
+++ b/hw/display/vhost-user-gpu.c
@@ -390,7 +390,7 @@ vhost_user_gpu_chr_read(void *opaque)
     }
 
     msg->request = request;
-    msg->flags = size;
+    msg->flags = flags;
     msg->size = size;
 
     if (request == VHOST_USER_GPU_CURSOR_UPDATE ||
-- 
2.43.0


