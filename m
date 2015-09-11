Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZaMFO-0004uN-9i
	for mharc-qemu-trivial@gnu.org; Fri, 11 Sep 2015 07:12:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59476)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZaMFE-0004ao-I6
	for qemu-trivial@nongnu.org; Fri, 11 Sep 2015 07:11:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZaMFD-0005M5-NN
	for qemu-trivial@nongnu.org; Fri, 11 Sep 2015 07:11:52 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:38179)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZaMF8-0005Jc-Fq; Fri, 11 Sep 2015 07:11:46 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 5AD2141207;
	Fri, 11 Sep 2015 14:11:45 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id DD53EA76;
	Fri, 11 Sep 2015 14:03:53 +0300 (MSK)
Received: (nullmailer pid 22803 invoked by uid 1000);
	Fri, 11 Sep 2015 11:03:51 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Fri, 11 Sep 2015 14:03:49 +0300
Message-Id: <a3c088a72c70401fd4d1342173dd971c2fce5e4d.1441969369.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1441969369.git.mjt@msgid.tls.msk.ru>
References: <cover.1441969369.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Shannon Zhao <shannon.zhao@linaro.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>
Subject: [Qemu-trivial] [PULL 25/26] hw/arm/spitz: Remove meaningless blank
	Property
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 11 Sep 2015 11:11:53 -0000

From: Shannon Zhao <shannon.zhao@linaro.org>

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/arm/spitz.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/hw/arm/spitz.c b/hw/arm/spitz.c
index 5bf032a..fdb1010 100644
--- a/hw/arm/spitz.c
+++ b/hw/arm/spitz.c
@@ -1060,10 +1060,6 @@ static VMStateDescription vmstate_spitz_kbd = {
     },
 };
 
-static Property spitz_keyboard_properties[] = {
-    DEFINE_PROP_END_OF_LIST(),
-};
-
 static void spitz_keyboard_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -1071,7 +1067,6 @@ static void spitz_keyboard_class_init(ObjectClass *klass, void *data)
 
     k->init = spitz_keyboard_init;
     dc->vmsd = &vmstate_spitz_kbd;
-    dc->props = spitz_keyboard_properties;
 }
 
 static const TypeInfo spitz_keyboard_info = {
-- 
2.1.4


