Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cUYyJ-00033u-Vw
	for mharc-qemu-trivial@gnu.org; Fri, 20 Jan 2017 08:11:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49170)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1cUYyH-00031d-Ly
	for qemu-trivial@nongnu.org; Fri, 20 Jan 2017 08:11:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1cUYyG-0003Ig-Pj
	for qemu-trivial@nongnu.org; Fri, 20 Jan 2017 08:11:13 -0500
Received: from mx1.redhat.com ([209.132.183.28]:42888)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1cUYyA-0003FT-MN; Fri, 20 Jan 2017 08:11:06 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E9D7C7FE8B;
	Fri, 20 Jan 2017 13:11:06 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-116-51.ams2.redhat.com [10.36.116.51])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id v0KDB56l003559; Fri, 20 Jan 2017 08:11:05 -0500
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-trivial@nongnu.org
Date: Fri, 20 Jan 2017 14:11:04 +0100
Message-Id: <1484917864-7928-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Fri, 20 Jan 2017 13:11:06 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] usb: Set category and description of the MTP
 device
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
X-List-Received-Date: Fri, 20 Jan 2017 13:11:14 -0000

It's a storage device, so let's classify it accordingly. And
while we're at it, also add a short description for people who
do not know what MTP means.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/usb/dev-mtp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/usb/dev-mtp.c b/hw/usb/dev-mtp.c
index 9cb0f50..bb73809 100644
--- a/hw/usb/dev-mtp.c
+++ b/hw/usb/dev-mtp.c
@@ -1580,6 +1580,8 @@ static void usb_mtp_class_initfn(ObjectClass *klass, void *data)
     uc->handle_reset   = usb_mtp_handle_reset;
     uc->handle_control = usb_mtp_handle_control;
     uc->handle_data    = usb_mtp_handle_data;
+    set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
+    dc->desc = "USB Media Transfer Protocol device";
     dc->fw_name = "mtp";
     dc->vmsd = &vmstate_usb_mtp;
     dc->props = mtp_properties;
-- 
1.8.3.1


