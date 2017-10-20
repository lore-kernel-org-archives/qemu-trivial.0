Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e5U0K-0002zm-PV
	for mharc-qemu-trivial@gnu.org; Fri, 20 Oct 2017 05:54:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33276)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1e5U0F-0002x1-E4
	for qemu-trivial@nongnu.org; Fri, 20 Oct 2017 05:54:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1e5U0E-0006KF-HD
	for qemu-trivial@nongnu.org; Fri, 20 Oct 2017 05:54:07 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42450)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1e5U07-00068s-GP; Fri, 20 Oct 2017 05:53:59 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BB7EA820FC;
	Fri, 20 Oct 2017 09:53:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com BB7EA820FC
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=thuth@redhat.com
Received: from thh440s.str.redhat.com (dhcp-192-189.str.redhat.com
	[10.33.192.189])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 23C3A600C2;
	Fri, 20 Oct 2017 09:53:53 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
	BALATON Zoltan <balaton@eik.bme.hu>,
	David Gibson <david@gibson.dropbear.id.au>,
	Gerd Hoffmann <kraxel@redhat.com>
Date: Fri, 20 Oct 2017 11:53:53 +0200
Message-Id: <1508493233-1166-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Fri, 20 Oct 2017 09:53:58 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] hw/display/sm501: Fix comment in
 sm501_sysbus_class_init()
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
X-List-Received-Date: Fri, 20 Oct 2017 09:54:11 -0000

The "cannot_instantiate_with_device_add_yet" flag has been renamed
to "user_creatable" a while ago.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/display/sm501.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/display/sm501.c b/hw/display/sm501.c
index 6eddac9..7f18224 100644
--- a/hw/display/sm501.c
+++ b/hw/display/sm501.c
@@ -1758,7 +1758,7 @@ static void sm501_sysbus_class_init(ObjectClass *klass, void *data)
     dc->reset = sm501_reset_sysbus;
     dc->vmsd = &vmstate_sm501_sysbus;
     /* Note: pointer property "chr-state" may remain null, thus
-     * no need for dc->cannot_instantiate_with_device_add_yet = true;
+     * no need for dc->user_creatable = false;
      */
 }
 
-- 
1.8.3.1


