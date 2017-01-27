Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cX7dj-0003MP-A7
	for mharc-qemu-trivial@gnu.org; Fri, 27 Jan 2017 09:36:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44348)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1cX7de-0003Gq-Ot
	for qemu-trivial@nongnu.org; Fri, 27 Jan 2017 09:36:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1cX7db-0003tU-FL
	for qemu-trivial@nongnu.org; Fri, 27 Jan 2017 09:36:30 -0500
Received: from mx1.redhat.com ([209.132.183.28]:58302)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1cX7dU-0003rJ-PX; Fri, 27 Jan 2017 09:36:20 -0500
Received: from smtp.corp.redhat.com (int-mx16.intmail.prod.int.phx2.redhat.com
	[10.5.11.28])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DD8C9C05B1D2;
	Fri, 27 Jan 2017 14:36:20 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-116-67.ams2.redhat.com [10.36.116.67])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A0D6417DE91;
	Fri, 27 Jan 2017 14:36:19 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Alistair Francis <alistair.francis@xilinx.com>,
	qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Date: Fri, 27 Jan 2017 15:36:18 +0100
Message-Id: <1485527778-29560-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.74 on 10.5.11.28
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Fri, 27 Jan 2017 14:36:20 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] hw/core/register: Mark the device with
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
X-List-Received-Date: Fri, 27 Jan 2017 14:36:33 -0000

The "qemu,register" device is just used internally. It's strange to
see this device showing up in the "-device ?" help text. Let's mark it
with cannot_instantiate_with_device_add_yet to hide it from the users.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/core/register.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/hw/core/register.c b/hw/core/register.c
index 4bfbc50..e0659be 100644
--- a/hw/core/register.c
+++ b/hw/core/register.c
@@ -274,9 +274,18 @@ void register_finalize_block(RegisterInfoArray *r_array)
     g_free(r_array);
 }
 
+static void register_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+
+    /* It's just used internally, and should not be exposed to users */
+    dc->cannot_instantiate_with_device_add_yet = true;
+}
+
 static const TypeInfo register_info = {
     .name  = TYPE_REGISTER,
     .parent = TYPE_DEVICE,
+    .class_init = register_class_init,
 };
 
 static void register_register_types(void)
-- 
1.8.3.1


