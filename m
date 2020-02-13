Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j24g1-0000Zt-02
	for mharc-qemu-trivial@gnu.org; Wed, 12 Feb 2020 21:56:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57769)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kuhn.chenqun@huawei.com>) id 1j24fu-0000X5-LY
 for qemu-trivial@nongnu.org; Wed, 12 Feb 2020 21:56:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kuhn.chenqun@huawei.com>) id 1j24ft-0003Y5-Eg
 for qemu-trivial@nongnu.org; Wed, 12 Feb 2020 21:56:22 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:55366 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1j24fq-0003Nq-Bj; Wed, 12 Feb 2020 21:56:18 -0500
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id AFAF19510F785A03DCE3;
 Thu, 13 Feb 2020 10:56:12 +0800 (CST)
Received: from HGHY4C002233111.china.huawei.com (10.133.205.93) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.439.0; Thu, 13 Feb 2020 10:56:06 +0800
From: <kuhn.chenqun@huawei.com>
To: <qemu-devel@nongnu.org>, <i.mitsyanko@gmail.com>,
 <peter.maydell@linaro.org>
CC: <qemu-trivial@nongnu.org>, <philmd@redhat.com>, <ehabkost@redhat.com>,
 <zhang.zhanghailiang@huawei.com>, <armbru@redhat.com>, Chen Qun
 <kuhn.chenqun@huawei.com>
Subject: [PATCH v2] hw/char/exynos4210_uart: Fix memleaks in
 exynos4210_uart_init
Date: Thu, 13 Feb 2020 10:56:03 +0800
Message-ID: <20200213025603.149432-1-kuhn.chenqun@huawei.com>
X-Mailer: git-send-email 2.14.1.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.205.93]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.35
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
X-List-Received-Date: Thu, 13 Feb 2020 02:56:23 -0000

From: Chen Qun <kuhn.chenqun@huawei.com>

It's easy to reproduce as follow:
virsh qemu-monitor-command vm1 --pretty '{"execute": "device-list-properties",
"arguments":{"typename":"exynos4210.uart"}}'

ASAN shows memory leak stack:
  #1 0xfffd896d71cb in g_malloc0 (/lib64/libglib-2.0.so.0+0x571cb)
  #2 0xaaad270beee3 in timer_new_full /qemu/include/qemu/timer.h:530
  #3 0xaaad270beee3 in timer_new /qemu/include/qemu/timer.h:551
  #4 0xaaad270beee3 in timer_new_ns /qemu/include/qemu/timer.h:569
  #5 0xaaad270beee3 in exynos4210_uart_init /qemu/hw/char/exynos4210_uart.c:677
  #6 0xaaad275c8f4f in object_initialize_with_type /qemu/qom/object.c:516
  #7 0xaaad275c91bb in object_new_with_type /qemu/qom/object.c:684
  #8 0xaaad2755df2f in qmp_device_list_properties /qemu/qom/qom-qmp-cmds.c:152

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
---
Changes V2 to V1:
-Keep s->wordtime in exynos4210_uart_init (Base on Eduardo and Philippe's comments).
---
 hw/char/exynos4210_uart.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/char/exynos4210_uart.c b/hw/char/exynos4210_uart.c
index 25d6588e41..96d5180e3e 100644
--- a/hw/char/exynos4210_uart.c
+++ b/hw/char/exynos4210_uart.c
@@ -674,8 +674,6 @@ static void exynos4210_uart_init(Object *obj)
     SysBusDevice *dev = SYS_BUS_DEVICE(obj);
     Exynos4210UartState *s = EXYNOS4210_UART(dev);
 
-    s->fifo_timeout_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
-                                         exynos4210_uart_timeout_int, s);
     s->wordtime = NANOSECONDS_PER_SECOND * 10 / 9600;
 
     /* memory mapping */
@@ -691,6 +689,9 @@ static void exynos4210_uart_realize(DeviceState *dev, Error **errp)
 {
     Exynos4210UartState *s = EXYNOS4210_UART(dev);
 
+    s->fifo_timeout_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
+                                         exynos4210_uart_timeout_int, s);
+
     qemu_chr_fe_set_handlers(&s->chr, exynos4210_uart_can_receive,
                              exynos4210_uart_receive, exynos4210_uart_event,
                              NULL, s, NULL, true);
-- 
2.23.0



