Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kl6Dw-00070i-3D
	for mharc-qemu-trivial@gnu.org; Fri, 04 Dec 2020 03:13:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kl6Dq-0006yp-0t; Fri, 04 Dec 2020 03:13:46 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kl6Dm-00076s-WB; Fri, 04 Dec 2020 03:13:45 -0500
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CnQSH53VjzLytt;
 Fri,  4 Dec 2020 16:13:03 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.487.0; Fri, 4 Dec 2020
 16:13:31 +0800
From: Gan Qixin <ganqixin@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <thuth@redhat.com>, <david@gibson.dropbear.id.au>,
 <peter.maydell@linaro.org>, <kuhn.chenqun@huawei.com>,
 <zhang.zhanghailiang@huawei.com>, Gan Qixin <ganqixin@huawei.com>, "Euler
 Robot" <euler.robot@huawei.com>
Subject: [PATCH 2/3] misc/mos6522: Use timer_free() in the finalize function
 to avoid memleak
Date: Fri, 4 Dec 2020 16:12:08 +0800
Message-ID: <20201204081209.360524-3-ganqixin@huawei.com>
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
X-List-Received-Date: Fri, 04 Dec 2020 08:13:48 -0000

When running device-introspect-test, a memory leak occurred in the mos6522_init
function, this patch use timer_free() in the finalize function to fix it.

ASAN shows memory leak stack:

Direct leak of 96 byte(s) in 2 object(s) allocated from:
    #0 0xfffd5fe9e1f0 in __interceptor_calloc (/lib64/libasan.so.5+0xee1f0)
    #1 0xfffd5f7b6800 in g_malloc0 (/lib64/libglib-2.0.so.0+0x56800)
    #2 0xaaae50303d0c in timer_new_full qemu/include/qemu/timer.h:523
    #3 0xaaae50303d0c in timer_new qemu/include/qemu/timer.h:544
    #4 0xaaae50303d0c in timer_new_ns qemu/include/qemu/timer.h:562
    #5 0xaaae50303d0c in mos6522_init qemu/hw/misc/mos6522.c:490
    #6 0xaaae50b77d70 in object_init_with_type qemu/qom/object.c:371
    #7 0xaaae50b7ae84 in object_initialize_with_type qemu/qom/object.c:515
    #8 0xaaae50b7b0f8 in object_new_with_type qemu/qom/object.c:729
    #9 0xaaae50bb6d58 in qmp_device_list_properties qemu/qom/qom-qmp-cmds.c:153
    #10 0xaaae50d7e1dc in qmp_marshal_device_list_properties qemu/qapi/qapi-commands-qdev.c:59
    #11 0xaaae50dc87a0 in do_qmp_dispatch_bh qemu/qapi/qmp-dispatch.c:110
    #12 0xaaae50d931a0 in aio_bh_call qemu/util/async.c:136

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Gan Qixin <ganqixin@huawei.com>
---
Cc: David Gibson <david@gibson.dropbear.id.au>
---
 hw/misc/mos6522.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/hw/misc/mos6522.c b/hw/misc/mos6522.c
index ac4cd1d58e..0236eeece1 100644
--- a/hw/misc/mos6522.c
+++ b/hw/misc/mos6522.c
@@ -490,6 +490,16 @@ static void mos6522_init(Object *obj)
     s->timers[1].timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, mos6522_timer2, s);
 }
 
+static void mos6522_finalize(Object *obj)
+{
+    MOS6522State *s = MOS6522(obj);
+
+    timer_del(s->timers[0].timer);
+    timer_free(s->timers[0].timer);
+    timer_del(s->timers[1].timer);
+    timer_free(s->timers[1].timer);
+}
+
 static Property mos6522_properties[] = {
     DEFINE_PROP_UINT64("frequency", MOS6522State, frequency, 0),
     DEFINE_PROP_END_OF_LIST()
@@ -519,6 +529,7 @@ static const TypeInfo mos6522_type_info = {
     .parent = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(MOS6522State),
     .instance_init = mos6522_init,
+    .instance_finalize = mos6522_finalize,
     .abstract = true,
     .class_size = sizeof(MOS6522DeviceClass),
     .class_init = mos6522_class_init,
-- 
2.27.0


