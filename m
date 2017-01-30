Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cYAz9-0008OT-Fy
	for mharc-qemu-trivial@gnu.org; Mon, 30 Jan 2017 07:23:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48237)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1cYAz7-0008MK-8d
	for qemu-trivial@nongnu.org; Mon, 30 Jan 2017 07:23:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1cYAz6-0002vB-Fy
	for qemu-trivial@nongnu.org; Mon, 30 Jan 2017 07:23:01 -0500
Received: from mx1.redhat.com ([209.132.183.28]:40288)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1cYAz0-0002t4-Ex; Mon, 30 Jan 2017 07:22:54 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 92D1451447;
	Mon, 30 Jan 2017 12:22:54 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-116-73.ams2.redhat.com [10.36.116.73])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id v0UCMqne007761; Mon, 30 Jan 2017 07:22:53 -0500
From: Thomas Huth <thuth@redhat.com>
To: Alistair Francis <alistair.francis@xilinx.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 30 Jan 2017 13:22:52 +0100
Message-Id: <1485778972-20924-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Mon, 30 Jan 2017 12:22:54 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH v2] hw/core/or-irq: Mark the device with
 cannot_instantiate_with_device_add_yet
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
X-List-Received-Date: Mon, 30 Jan 2017 12:23:02 -0000

The "or-irq" device needs to be wired up in source code, there is no
way the user can add this device with the "-device" parameter or the
"device_add" monitor command yet.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 v2: Changed patch description and comment

 hw/core/or-irq.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/core/or-irq.c b/hw/core/or-irq.c
index 1ac090d..808c8d1 100644
--- a/hw/core/or-irq.c
+++ b/hw/core/or-irq.c
@@ -89,6 +89,9 @@ static void or_irq_class_init(ObjectClass *klass, void *data)
     dc->props = or_irq_properties;
     dc->realize = or_irq_realize;
     dc->vmsd = &vmstate_or_irq;
+
+    /* Reason: Needs to be wired up in source code, e.g. see stm32f205_soc.c */
+    dc->cannot_instantiate_with_device_add_yet = true;
 }
 
 static const TypeInfo or_irq_type_info = {
-- 
1.8.3.1


