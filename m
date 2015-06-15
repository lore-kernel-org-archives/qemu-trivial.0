Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z4UDC-0004dp-DI
	for mharc-qemu-trivial@gnu.org; Mon, 15 Jun 2015 09:14:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37038)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berto@igalia.com>) id 1Z4UD7-0004XV-3k
	for qemu-trivial@nongnu.org; Mon, 15 Jun 2015 09:14:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berto@igalia.com>) id 1Z4UD6-0002ra-9h
	for qemu-trivial@nongnu.org; Mon, 15 Jun 2015 09:13:57 -0400
Received: from smtp3.mundo-r.com ([212.51.32.191]:13211 helo=smtp4.mundo-r.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berto@igalia.com>)
	id 1Z4UD0-0002Xs-OT; Mon, 15 Jun 2015 09:13:50 -0400
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AgsIAHPOflVbdWOb/2dsb2JhbABcgxABgTKrUgUBgQSDDI9WhgeBNUwBAQEBAQFpIoUiT040iDMByjqGGolLZR2EFwWLe2mEEIJni0KJKYN/LYo7JmNmAQEIgilsgQOBRAEBAQ
X-IPAS-Result: AgsIAHPOflVbdWOb/2dsb2JhbABcgxABgTKrUgUBgQSDDI9WhgeBNUwBAQEBAQFpIoUiT040iDMByjqGGolLZR2EFwWLe2mEEIJni0KJKYN/LYo7JmNmAQEIgilsgQOBRAEBAQ
X-IronPort-AV: E=Sophos;i="5.13,618,1427752800"; d="scan'208";a="365917873"
Received: from fanzine.igalia.com ([91.117.99.155])
	by smtp4.mundo-r.com with ESMTP; 15 Jun 2015 15:13:13 +0200
Received: from dsl-hkibrasgw4-50df50-128.dhcp.inet.fi ([80.223.80.128]
	helo=perseus.local) by fanzine.igalia.com with esmtpsa 
	(Cipher TLS1.0:RSA_AES_128_CBC_SHA1:16) (Exim)
	id 1Z4UCO-0002Z5-S1; Mon, 15 Jun 2015 15:13:13 +0200
Received: from berto by perseus.local with local (Exim 4.85)
	(envelope-from <berto@igalia.com>)
	id 1Z4UCB-0005uf-Hc; Mon, 15 Jun 2015 16:12:59 +0300
From: Alberto Garcia <berto@igalia.com>
To: qemu-devel@nongnu.org
Date: Mon, 15 Jun 2015 16:12:52 +0300
Message-Id: <1434373972-22694-1-git-send-email-berto@igalia.com>
X-Mailer: git-send-email 2.1.4
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 212.51.32.191
Cc: qemu-trivial@nongnu.org, Alberto Garcia <berto@igalia.com>,
	Eric Blake <eblake@redhat.com>
Subject: [Qemu-trivial] [PATCH] throttle: Fix typo in the documentation of
	block_set_io_throttle
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 15 Jun 2015 13:14:00 -0000

Signed-off-by: Alberto Garcia <berto@igalia.com>
---
 qapi/block-core.json | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index afa9d3d..793a01e 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -1083,7 +1083,7 @@
 #
 # I/O limits can be disabled by setting all of them to 0. In this case
 # the device will be removed from its group and the rest of its
-# members will no be affected. The 'group' parameter is ignored.
+# members will not be affected. The 'group' parameter is ignored.
 #
 # @device: The name of the device
 #
-- 
2.1.4


