Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cYAyS-0007dr-Bk
	for mharc-qemu-trivial@gnu.org; Mon, 30 Jan 2017 07:22:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48086)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1cYAyM-0007Nq-03
	for qemu-trivial@nongnu.org; Mon, 30 Jan 2017 07:22:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1cYAyL-0002gH-Aa
	for qemu-trivial@nongnu.org; Mon, 30 Jan 2017 07:22:14 -0500
Received: from mx1.redhat.com ([209.132.183.28]:44740)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1cYAyB-0002dz-SL; Mon, 30 Jan 2017 07:22:03 -0500
Received: from smtp.corp.redhat.com (int-mx16.intmail.prod.int.phx2.redhat.com
	[10.5.11.28])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4E2A280F63;
	Mon, 30 Jan 2017 12:22:03 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-116-73.ams2.redhat.com [10.36.116.73])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0780CB5BDA;
	Mon, 30 Jan 2017 12:22:01 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Alistair Francis <alistair.francis@xilinx.com>,
	qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 30 Jan 2017 13:22:01 +0100
Message-Id: <1485778921-20869-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.74 on 10.5.11.28
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Mon, 30 Jan 2017 12:22:03 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH v2] hw/core/register: Mark the device with
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
X-List-Received-Date: Mon, 30 Jan 2017 12:22:19 -0000

The "qemu,register" device needs to be wired up in source code, there
is no way the user can add this device with the "-device" parameter or
the "device_add" monitor command yet.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 v2: Changed patch description and comment

 hw/core/register.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/hw/core/register.c b/hw/core/register.c
index 4bfbc50..1416691 100644
--- a/hw/core/register.c
+++ b/hw/core/register.c
@@ -274,9 +274,18 @@ void register_finalize_block(RegisterInfoArray *r_array)
     g_free(r_array);
 }
 
+static void register_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+
+    /* Needs to be wired up in source code, see register_init_block32() */
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


