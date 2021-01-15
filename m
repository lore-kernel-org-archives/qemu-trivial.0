Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l0E6a-0003BS-Kq
	for mharc-qemu-trivial@gnu.org; Thu, 14 Jan 2021 20:40:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhanghan64@huawei.com>)
 id 1l0E6Y-00038o-Ny; Thu, 14 Jan 2021 20:40:46 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:3031)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhanghan64@huawei.com>)
 id 1l0E6V-0006QK-QU; Thu, 14 Jan 2021 20:40:46 -0500
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DH3ky5Qvszj7wp;
 Fri, 15 Jan 2021 09:39:38 +0800 (CST)
Received: from huawei.com (10.175.124.27) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.498.0; Fri, 15 Jan 2021
 09:40:33 +0800
From: Zhang Han <zhanghan64@huawei.com>
To: <kraxel@redhat.com>
CC: <alex.chen@huawei.com>, <hunongda@huawei.com>, <qemu-devel@nongnu.org>,
 <qemu-trivial@nongnu.org>, <zhang.zhanghailiang@huawei.com>,
 <zhanghan64@huawei.com>
Subject: [PATCH v2 7/7] audio: space prohibited between function name and
 parenthesis'('
Date: Fri, 15 Jan 2021 09:24:31 +0800
Message-ID: <20210115012431.79533-8-zhanghan64@huawei.com>
X-Mailer: git-send-email 2.29.1.59.gf9b6481aed
In-Reply-To: <20210115012431.79533-1-zhanghan64@huawei.com>
References: <20210115012431.79533-1-zhanghan64@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.124.27]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=zhanghan64@huawei.com; helo=szxga05-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 15 Jan 2021 01:40:47 -0000

Delete spaces between function name and open parenthesis'('

Signed-off-by: Zhang Han <zhanghan64@huawei.com>
---
 audio/audio_template.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/audio/audio_template.h b/audio/audio_template.h
index 6d42fa7011..05e793f61f 100644
--- a/audio/audio_template.h
+++ b/audio/audio_template.h
@@ -203,13 +203,13 @@ static void glue (audio_pcm_hw_gc_, TYPE) (HW **hwp)
 
     if (!hw->sw_head.lh_first) {
 #ifdef DAC
-        audio_detach_capture (hw);
+        audio_detach_capture(hw);
 #endif
-        QLIST_REMOVE (hw, entries);
-        glue (hw->pcm_ops->fini_, TYPE) (hw);
-        glue (s->nb_hw_voices_, TYPE) += 1;
-        glue (audio_pcm_hw_free_resources_ , TYPE) (hw);
-        g_free (hw);
+        QLIST_REMOVE(hw, entries);
+        glue(hw->pcm_ops->fini_, TYPE) (hw);
+        glue(s->nb_hw_voices_, TYPE) += 1;
+        glue(audio_pcm_hw_free_resources_ , TYPE) (hw);
+        g_free(hw);
         *hwp = NULL;
     }
 }
-- 
2.29.1.59.gf9b6481aed


