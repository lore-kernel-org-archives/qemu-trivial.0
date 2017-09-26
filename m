Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dws9m-0006NE-Qt
	for mharc-qemu-trivial@gnu.org; Tue, 26 Sep 2017 11:52:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34604)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dws9k-0006L0-5W
	for qemu-trivial@nongnu.org; Tue, 26 Sep 2017 11:52:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dws9i-00062a-08
	for qemu-trivial@nongnu.org; Tue, 26 Sep 2017 11:52:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37454)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1dws9Q-0005vd-Pt; Tue, 26 Sep 2017 11:52:00 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B8BBBC04B946;
	Tue, 26 Sep 2017 15:51:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com B8BBBC04B946
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=thuth@redhat.com
Received: from thh440s.redhat.com (ovpn-116-52.ams2.redhat.com [10.36.116.52])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 08C4169A66;
	Tue, 26 Sep 2017 15:51:56 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Alistair Francis <alistair.francis@xilinx.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Date: Tue, 26 Sep 2017 17:51:56 +0200
Message-Id: <1506441116-16627-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Tue, 26 Sep 2017 15:51:58 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] hw/arm/xlnx-zynqmp: Mark the "xlnx,
 zynqmp" device with user_creatable = false
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Sep 2017 15:52:21 -0000

The device uses serial_hds in its realize function and thus can't be
used twice. Apart from that, the comma in its name makes it quite hard
to use for the user anyway, since a comma is normally used to separate
the device name from its properties when using the "-device" parameter
or the "device_add" HMP command.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/arm/xlnx-zynqmp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 2b27daf..d4b6560 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -440,6 +440,8 @@ static void xlnx_zynqmp_class_init(ObjectClass *oc, void *data)
 
     dc->props = xlnx_zynqmp_props;
     dc->realize = xlnx_zynqmp_realize;
+    /* Reason: Uses serial_hds in realize function, thus can't be used twice */
+    dc->user_creatable = false;
 }
 
 static const TypeInfo xlnx_zynqmp_type_info = {
-- 
1.8.3.1


