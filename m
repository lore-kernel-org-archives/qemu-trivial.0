Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cX7sS-0001Bb-K0
	for mharc-qemu-trivial@gnu.org; Fri, 27 Jan 2017 09:51:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49396)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1cX7sM-00016w-6a
	for qemu-trivial@nongnu.org; Fri, 27 Jan 2017 09:51:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1cX7sH-0000Gb-JM
	for qemu-trivial@nongnu.org; Fri, 27 Jan 2017 09:51:42 -0500
Received: from mx1.redhat.com ([209.132.183.28]:42442)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1cX7sA-0000Er-PO; Fri, 27 Jan 2017 09:51:30 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BEE057FB77;
	Fri, 27 Jan 2017 14:51:30 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-116-67.ams2.redhat.com [10.36.116.67])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id v0REpSBF016202; Fri, 27 Jan 2017 09:51:29 -0500
From: Thomas Huth <thuth@redhat.com>
To: Alistair Francis <alistair.francis@xilinx.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>
Date: Fri, 27 Jan 2017 15:51:28 +0100
Message-Id: <1485528688-29914-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Fri, 27 Jan 2017 14:51:30 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] hw/core/or-irq: Mark the device with
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
X-List-Received-Date: Fri, 27 Jan 2017 14:51:47 -0000

The "or-irq" device is just used internally. It's strange to
see this device showing up in the "-device ?" help text. Let's mark it
with cannot_instantiate_with_device_add_yet to hide it from the users.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/core/or-irq.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/core/or-irq.c b/hw/core/or-irq.c
index 1ac090d..2487fa3 100644
--- a/hw/core/or-irq.c
+++ b/hw/core/or-irq.c
@@ -89,6 +89,9 @@ static void or_irq_class_init(ObjectClass *klass, void *data)
     dc->props = or_irq_properties;
     dc->realize = or_irq_realize;
     dc->vmsd = &vmstate_or_irq;
+
+    /* It's just used internally, and should not be exposed to users */
+    dc->cannot_instantiate_with_device_add_yet = true;
 }
 
 static const TypeInfo or_irq_type_info = {
-- 
1.8.3.1


