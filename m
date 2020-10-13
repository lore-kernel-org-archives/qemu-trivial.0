Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kSIpj-00079B-ER
	for mharc-qemu-trivial@gnu.org; Tue, 13 Oct 2020 07:51:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1kSIph-00075W-QX; Tue, 13 Oct 2020 07:51:09 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:53417)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1kSIpf-0004xz-PO; Tue, 13 Oct 2020 07:51:09 -0400
Received: from localhost.localdomain ([82.252.141.186]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1N5W4y-1kQbzE1ZhC-016xCP; Tue, 13 Oct 2020 13:50:58 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Klaus Jensen <k.jensen@samsung.com>, Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 03/14] hw/block/nvme: Simplify timestamp sum
Date: Tue, 13 Oct 2020 13:50:41 +0200
Message-Id: <20201013115052.133355-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201013115052.133355-1-laurent@vivier.eu>
References: <20201013115052.133355-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:/ee+PThk7XogI9GHj1Wg2rfny9f8gwTp3lAHF4xjlhyMTJpfemN
 j7RnUX8wJOWQBKfI6a+YJxSCIq6Z4GpS3A+7boOVVo2orHdS3caJhsI8bFaeQfvEwLJcAxn
 /jp4X6SpqlpPuGhberN2Y5Wkmuwm2z7EJb4cr1o7Ycgtr7LTBbYyjWxDtkD3xbx3qVVx9/o
 iZrwOAHej9cl80LuVDqNg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:/GdTjfWZIek=:tysByNhNiZh1Lp9V7EyKdO
 6ZLHp0VbEUbmC3ezkNKmyACGlFXlcW2urULxmyh55uHj6h2CUitYakekbwkeFcCaFMbIJPJUD
 my0J0/h6xICzGRmyflv9k6CMSGTopNNaA8mOB9yb5TFNpIdEo5LydPp+66RFNjRmeOG61xHPF
 2tvQ+ilra80FRBIgxzRpIiShWaMMgpPZ5gN8UI4PqbU6kqmJZgg81LvOIvc6SZDpWfr9pOQUr
 Rxa2/vpSsJral6XkgrxUh4DUrFdPmrsj3CNYMt6R5NFizwSj1ABZyoTu26IIYNb8iB9bdliKl
 cabWdJxNqMsIX1mNrcgpjoCUJxJGti4UgG6k6AwXbOHBYBlx211mDmgsU3yGx0BNFGPT1uSDu
 So6NZQlE0OGOPRigXKkCeD0E0OJMQv3PiTs4/uLnUT1/4UWvIh6Xq4GpuZR5z810xDRH3fl4x
 pbbR8dMuWBzP+xjP63Da9AXoHxwLPKKILSOCvoXUfsEq+IeUUD+DdzFqeR8fgQImfocnzMEBk
 e373K219ArtjZF6ConQLE+PlBl1Etywc6etM9QhNih+1ea9PfESzVizFkeqlUOGNEFGZ0nhnA
 lEd1opbWcxxk4y4IX/aiiPyGYKdItPsY7cQjdSrLovNz+hI/ng3bGt849GTeVggKJoawBnKGj
 0ntemync2YvzP2hfw/H8O3Hrl5awV7ZvGIjSRKPIF9kGecKW4xVd8lQRvjvJbXSxARbgsbyMw
 iMgvYjbrzDl7VRQtmLZq65vRbBCfzewrbAZhiPhbcUGqUhoyoSIaXYFvDOlqhvq4dcy030yOk
 F/fNo69+FYJX+PkWk8t/iuvdovJHUFsT4ZZFS3yl5rUCK13Zu+QZMOMwyEOVEIxgqsYOyXQ
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/13 07:40:12
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
X-List-Received-Date: Tue, 13 Oct 2020 11:51:10 -0000

From: Philippe Mathieu-Daudé <philmd@redhat.com>

As the 'timestamp' variable is declared as a 48-bit bitfield,
we do not need to wrap the sum result.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
Message-Id: <20201002075716.1657849-1-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/block/nvme.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 63078f600920..44fa5b90769b 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -1280,12 +1280,7 @@ static inline uint64_t nvme_get_timestamp(const NvmeCtrl *n)
 
     union nvme_timestamp ts;
     ts.all = 0;
-
-    /*
-     * If the sum of the Timestamp value set by the host and the elapsed
-     * time exceeds 2^48, the value returned should be reduced modulo 2^48.
-     */
-    ts.timestamp = (n->host_timestamp + elapsed_time) & 0xffffffffffff;
+    ts.timestamp = n->host_timestamp + elapsed_time;
 
     /* If the host timestamp is non-zero, set the timestamp origin */
     ts.origin = n->host_timestamp ? 0x01 : 0x00;
-- 
2.26.2


