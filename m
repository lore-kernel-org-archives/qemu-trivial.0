Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1izQqg-0000U1-6g
	for mharc-qemu-trivial@gnu.org; Wed, 05 Feb 2020 15:00:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33948)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jusual@redhat.com>) id 1izPm1-0006mE-Im
 for qemu-trivial@nongnu.org; Wed, 05 Feb 2020 13:51:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jusual@redhat.com>) id 1izPm0-0005re-7y
 for qemu-trivial@nongnu.org; Wed, 05 Feb 2020 13:51:41 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:41149
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jusual@redhat.com>) id 1izPm0-0005nR-3s
 for qemu-trivial@nongnu.org; Wed, 05 Feb 2020 13:51:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580928699;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=OzZGw3pGQJA9fRYahalq5zdPl+c8vv2sD9FXMnrzKb0=;
 b=Y9JtJSW1YT3o9yRYJg9adwz6SUgDv1jdiZKskiUBds8A4MfRNa3tDhzILW1UsS8D9nIAy2
 pba2dgWCrvX3tYPLzK2InkOu/zDeKzkQZsvlVbnxXYdw2xhrj94i1A8FjkVgHLMWzYdtWE
 bkWcjMZVeA1y1sH5K4j/pwgB/+LYLXg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-103-gtjIdYSBO523jTju9qQRZA-1; Wed, 05 Feb 2020 13:51:37 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 03AC310CE782;
 Wed,  5 Feb 2020 18:51:36 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-204-83.brq.redhat.com
 [10.40.204.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 26CAC60C05;
 Wed,  5 Feb 2020 18:51:26 +0000 (UTC)
From: Julia Suvorova <jusual@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, "Michael S. Tsirkin" <mst@redhat.com>,
 Julia Suvorova <jusual@redhat.com>
Subject: [PATCH] hw/pci/pci_bridge: Fix typo in comment
Date: Wed,  5 Feb 2020 19:51:23 +0100
Message-Id: <20200205185123.210209-1-jusual@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: gtjIdYSBO523jTju9qQRZA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
X-Mailman-Approved-At: Wed, 05 Feb 2020 15:00:33 -0500
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Feb 2020 18:51:42 -0000

Signed-off-by: Julia Suvorova <jusual@redhat.com>
---
 include/hw/pci/pci_bridge.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/pci/pci_bridge.h b/include/hw/pci/pci_bridge.h
index ba488818d2..99c674e949 100644
--- a/include/hw/pci/pci_bridge.h
+++ b/include/hw/pci/pci_bridge.h
@@ -108,7 +108,7 @@ void pci_bridge_dev_unplug_request_cb(HotplugHandler *h=
otplug_dev,
=20
 /*
  * before qdev initialization(qdev_init()), this function sets bus_name an=
d
- * map_irq callback which are necessry for pci_bridge_initfn() to
+ * map_irq callback which are necessary for pci_bridge_initfn() to
  * initialize bus.
  */
 void pci_bridge_map_irq(PCIBridge *br, const char* bus_name,
--=20
2.24.1


