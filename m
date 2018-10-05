Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1g8Md5-0005MY-Jn
	for mharc-qemu-trivial@gnu.org; Fri, 05 Oct 2018 05:42:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51682)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1g8Md4-0005LU-Ir
	for qemu-trivial@nongnu.org; Fri, 05 Oct 2018 05:42:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1g8Md4-00081K-0T
	for qemu-trivial@nongnu.org; Fri, 05 Oct 2018 05:42:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34740)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1g8Mcz-0007xE-2C; Fri, 05 Oct 2018 05:42:33 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 55465C04BD5C;
	Fri,  5 Oct 2018 09:42:32 +0000 (UTC)
Received: from thuth.com (dhcp-200-199.str.redhat.com [10.33.200.199])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 630905C1B4;
	Fri,  5 Oct 2018 09:42:31 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	Alistair Francis <alistair@alistair23.me>
Date: Fri,  5 Oct 2018 11:42:26 +0200
Message-Id: <1538732546-2284-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Fri, 05 Oct 2018 09:42:32 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] hw/core/generic-loader: Set a category for
 the generic-loader device
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
X-List-Received-Date: Fri, 05 Oct 2018 09:42:39 -0000

Each device that is instantiatable by the users should be marked with
a category. Since the generic-loader does not fit anywhere else, put
it into the MISC category.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/core/generic-loader.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/core/generic-loader.c b/hw/core/generic-loader.c
index fde32cb..be29ae1 100644
--- a/hw/core/generic-loader.c
+++ b/hw/core/generic-loader.c
@@ -204,6 +204,7 @@ static void generic_loader_class_init(ObjectClass *klass, void *data)
     dc->unrealize = generic_loader_unrealize;
     dc->props = generic_loader_props;
     dc->desc = "Generic Loader";
+    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
 }
 
 static TypeInfo generic_loader_info = {
-- 
1.8.3.1


