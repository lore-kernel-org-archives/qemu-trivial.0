Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kZWqC-0007kR-VG
	for mharc-qemu-trivial@gnu.org; Mon, 02 Nov 2020 05:13:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kZWqB-0007hB-0Z; Mon, 02 Nov 2020 05:13:31 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:2067)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kZWq9-00077m-2i; Mon, 02 Nov 2020 05:13:30 -0500
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4CPpdy3gVHzhfYX;
 Mon,  2 Nov 2020 18:13:26 +0800 (CST)
Received: from [10.174.187.138] (10.174.187.138) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.487.0; Mon, 2 Nov 2020 18:13:17 +0800
Message-ID: <5F9FDBBD.4020607@huawei.com>
Date: Mon, 2 Nov 2020 18:13:17 +0800
From: AlexChen <alex.chen@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.2; WOW64;
 rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: =?UTF-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
CC: Peter Maydell <peter.maydell@linaro.org>, QEMU Trivial
 <qemu-trivial@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, QEMU
 <qemu-devel@nongnu.org>, <zhang.zhanghailiang@huawei.com>
Subject: [PATCH V3] hw/display/exynos4210_fimd: Fix potential NULL pointer
 dereference
References: <5F9F8D88.9030102@huawei.com>
 <b2945df0-186e-e670-bdfc-34104d8ddf2c@redhat.com>
In-Reply-To: <b2945df0-186e-e670-bdfc-34104d8ddf2c@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.187.138]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32; envelope-from=alex.chen@huawei.com;
 helo=szxga06-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/02 05:10:42
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Mon, 02 Nov 2020 10:13:31 -0000

In exynos4210_fimd_update(), the pointer 's' is dereferenced before
checking it is valid, which may lead to NULL pointer dereference.
So move the assignment to global_width after checking 's' is valid.

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Alex Chen <alex.chen@huawei.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/display/exynos4210_fimd.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/display/exynos4210_fimd.c b/hw/display/exynos4210_fimd.c
index 4c16e1f5a0..34a960a976 100644
--- a/hw/display/exynos4210_fimd.c
+++ b/hw/display/exynos4210_fimd.c
@@ -1275,12 +1275,14 @@ static void exynos4210_fimd_update(void *opaque)
     bool blend = false;
     uint8_t *host_fb_addr;
     bool is_dirty = false;
-    const int global_width = (s->vidtcon[2] & FIMD_VIDTCON2_SIZE_MASK) + 1;
+    int global_width;

     if (!s || !s->console || !s->enabled ||
         surface_bits_per_pixel(qemu_console_surface(s->console)) == 0) {
         return;
     }
+
+    global_width = (s->vidtcon[2] & FIMD_VIDTCON2_SIZE_MASK) + 1;
     exynos4210_update_resolution(s);
     surface = qemu_console_surface(s->console);

-- 
2.19.1

