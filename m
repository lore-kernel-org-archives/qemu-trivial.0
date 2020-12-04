Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kl6E2-00073c-Au
	for mharc-qemu-trivial@gnu.org; Fri, 04 Dec 2020 03:13:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kl6Du-0006zt-7o; Fri, 04 Dec 2020 03:13:51 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kl6Do-00076u-73; Fri, 04 Dec 2020 03:13:49 -0500
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CnQSH5GFwzLyxy;
 Fri,  4 Dec 2020 16:13:03 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.487.0; Fri, 4 Dec 2020
 16:13:28 +0800
From: Gan Qixin <ganqixin@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <thuth@redhat.com>, <david@gibson.dropbear.id.au>,
 <peter.maydell@linaro.org>, <kuhn.chenqun@huawei.com>,
 <zhang.zhanghailiang@huawei.com>, Gan Qixin <ganqixin@huawei.com>, "Euler
 Robot" <euler.robot@huawei.com>
Subject: [PATCH 1/3] pl031: Use timer_free() in the finalize function to avoid
 memleaks
Date: Fri, 4 Dec 2020 16:12:07 +0800
Message-ID: <20201204081209.360524-2-ganqixin@huawei.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201204081209.360524-1-ganqixin@huawei.com>
References: <20201204081209.360524-1-ganqixin@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191; envelope-from=ganqixin@huawei.com;
 helo=szxga05-in.huawei.com
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
X-List-Received-Date: Fri, 04 Dec 2020 08:13:53 -0000

When running device-introspect-test, a memory leak occurred in the pl031_init
function, this patch use timer_free() in the finalize function to fix it.

ASAN shows memory leak stack:

Direct leak of 48 byte(s) in 1 object(s) allocated from:
    #0 0xffffab97e1f0 in __interceptor_calloc (/lib64/libasan.so.5+0xee1f0)
    #1 0xffffab256800 in g_malloc0 (/lib64/libglib-2.0.so.0+0x56800)
    #2 0xaaabf5621cfc in timer_new_full qemu/include/qemu/timer.h:523
    #3 0xaaabf5621cfc in timer_new qemu/include/qemu/timer.h:544
    #4 0xaaabf5621cfc in timer_new_ns qemu/include/qemu/timer.h:562
    #5 0xaaabf5621cfc in pl031_init qemu/hw/rtc/pl031.c:194
    #6 0xaaabf6339f6c in object_initialize_with_type qemu/qom/object.c:515
    #7 0xaaabf633a1e0 in object_new_with_type qemu/qom/object.c:729
    #8 0xaaabf6375e40 in qmp_device_list_properties qemu/qom/qom-qmp-cmds.c:153
    #9 0xaaabf5a95540 in qdev_device_help qemu/softmmu/qdev-monitor.c:283
    #10 0xaaabf5a96940 in qmp_device_add qemu/softmmu/qdev-monitor.c:801
    #11 0xaaabf5a96e70 in hmp_device_add qemu/softmmu/qdev-monitor.c:916
    #12 0xaaabf5ac0a2c in handle_hmp_command qemu/monitor/hmp.c:1100

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Gan Qixin <ganqixin@huawei.com>
---
Cc: Peter Maydell <peter.maydell@linaro.org>
---
 hw/rtc/pl031.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/hw/rtc/pl031.c b/hw/rtc/pl031.c
index ae47f09635..2ea3dc1281 100644
--- a/hw/rtc/pl031.c
+++ b/hw/rtc/pl031.c
@@ -194,6 +194,14 @@ static void pl031_init(Object *obj)
     s->timer = timer_new_ns(rtc_clock, pl031_interrupt, s);
 }
 
+static void pl031_finalize(Object *obj)
+{
+    PL031State *s = PL031(obj);
+
+    timer_del(s->timer);
+    timer_free(s->timer);
+}
+
 static int pl031_pre_save(void *opaque)
 {
     PL031State *s = opaque;
@@ -325,11 +333,12 @@ static void pl031_class_init(ObjectClass *klass, void *data)
 }
 
 static const TypeInfo pl031_info = {
-    .name          = TYPE_PL031,
-    .parent        = TYPE_SYS_BUS_DEVICE,
-    .instance_size = sizeof(PL031State),
-    .instance_init = pl031_init,
-    .class_init    = pl031_class_init,
+    .name              = TYPE_PL031,
+    .parent            = TYPE_SYS_BUS_DEVICE,
+    .instance_size     = sizeof(PL031State),
+    .instance_init     = pl031_init,
+    .instance_finalize = pl031_finalize,
+    .class_init        = pl031_class_init,
 };
 
 static void pl031_register_types(void)
-- 
2.27.0


