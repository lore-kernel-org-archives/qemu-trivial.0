Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cUbVx-0003ZQ-A7
	for mharc-qemu-trivial@gnu.org; Fri, 20 Jan 2017 10:54:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33880)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1cUbVv-0003XF-3p
	for qemu-trivial@nongnu.org; Fri, 20 Jan 2017 10:54:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1cUbVu-0007xy-C7
	for qemu-trivial@nongnu.org; Fri, 20 Jan 2017 10:54:07 -0500
Received: from mx1.redhat.com ([209.132.183.28]:47570)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1cUbVp-0007u3-VD; Fri, 20 Jan 2017 10:54:02 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0351C7FE8C;
	Fri, 20 Jan 2017 15:54:02 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-116-51.ams2.redhat.com [10.36.116.51])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id v0KFrxfm024640; Fri, 20 Jan 2017 10:54:00 -0500
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-trivial@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 20 Jan 2017 16:53:59 +0100
Message-Id: <1484927639-3841-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Fri, 20 Jan 2017 15:54:02 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] hw/isa/isa-bus: Set category of the
 "isabus-bridge" device
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
X-List-Received-Date: Fri, 20 Jan 2017 15:54:07 -0000

It has "bridge" in its name, so it should be in the category
DEVICE_CATEGORY_BRIDGE.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/isa/isa-bus.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/isa/isa-bus.c b/hw/isa/isa-bus.c
index 9d07b11..0ffbc8d 100644
--- a/hw/isa/isa-bus.c
+++ b/hw/isa/isa-bus.c
@@ -219,6 +219,7 @@ static void isabus_bridge_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
 
+    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
     dc->fw_name = "isa";
 }
 
-- 
1.8.3.1


