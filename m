Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1sgyDL-0008QE-18
	for mharc-qemu-trivial@gnu.org; Wed, 21 Aug 2024 23:10:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wh1sper@zju.edu.cn>)
 id 1sgyD9-0008Mn-Rx; Wed, 21 Aug 2024 23:10:07 -0400
Received: from sgoci-sdnproxy-4.icoremail.net ([129.150.39.64])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <wh1sper@zju.edu.cn>)
 id 1sgyD7-0001WU-41; Wed, 21 Aug 2024 23:10:07 -0400
Received: from NUC10i7FNH.. (unknown [101.82.162.35])
 by mail-app3 (Coremail) with SMTP id cC_KCgB32n39q8Zm8eTCAg--.27114S2;
 Thu, 22 Aug 2024 11:09:52 +0800 (CST)
From: Haoran Zhang <wh1sper@zju.edu.cn>
To: philmd@linaro.org
Cc: qemu-trivial@nongnu.org, marcandre.lureau@redhat.com,
 qemu-stable@nongnu.org, Haoran Zhang <wh1sper@zju.edu.cn>
Subject: [PATCH v2] hw/display/vhost-user-gpu.c: fix vhost_user_gpu_chr_read()
Date: Thu, 22 Aug 2024 11:07:58 +0800
Message-ID: <20240822030940.134155-1-wh1sper@zju.edu.cn>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: cC_KCgB32n39q8Zm8eTCAg--.27114S2
X-Coremail-Antispam: 1UD129KBjvdXoW7JFy3JFyktw45CF4fJw1kXwb_yoWxtFg_Ga
 1rAFZ7WF45Gr1qgr45Jr1rurWSq3y3Ar4IvFn3JFy5tryUKw1Iyw4F934rur15uwsrKr1D
 ArZ8J3ykAws0qjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbsxFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
 6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
 A2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr1j
 6rxdM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
 0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
 jxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
 1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r12
 6r1DMxkIecxEwVAFwVW8GwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8Jw
 C20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAF
 wI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjx
 v20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2
 jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0x
 ZFpf9x0JUwL05UUUUU=
X-CM-SenderInfo: asssliaqzvq6lmxovvfxof0/1tbiAggTB2bDWKYK2AAQsH
Received-SPF: pass client-ip=129.150.39.64; envelope-from=wh1sper@zju.edu.cn;
 helo=sgoci-sdnproxy-4.icoremail.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
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
X-List-Received-Date: Thu, 22 Aug 2024 03:10:10 -0000

fix vhost_user_gpu_chr_read() where `size` was incorrectly passed to `msg->flags`.

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


