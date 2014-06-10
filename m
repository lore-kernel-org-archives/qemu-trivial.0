Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WuPDc-0002LT-9Q
	for mharc-qemu-trivial@gnu.org; Tue, 10 Jun 2014 12:48:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42725)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WuPDV-00028j-Nw
	for qemu-trivial@nongnu.org; Tue, 10 Jun 2014 12:48:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WuPDR-0007Wg-2n
	for qemu-trivial@nongnu.org; Tue, 10 Jun 2014 12:48:09 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:39057)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WuPDG-0007Tt-VQ; Tue, 10 Jun 2014 12:47:55 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 8E230412CD;
	Tue, 10 Jun 2014 20:47:53 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 678196BD;
	Tue, 10 Jun 2014 20:08:48 +0400 (MSK)
Received: (nullmailer pid 13327 invoked by uid 1000);
	Tue, 10 Jun 2014 16:08:47 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue, 10 Jun 2014 20:08:36 +0400
Message-Id: <1402416523-13212-19-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1402416523-13212-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1402416523-13212-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 18/25] vdi: remove double conversion
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
X-List-Received-Date: Tue, 10 Jun 2014 16:48:15 -0000

From: Paolo Bonzini <pbonzini@redhat.com>

This should be a problem when running on big-endian machines.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Benoit Canet <benoit@irqsave.net>
Reviewed-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 block/vdi.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/block/vdi.c b/block/vdi.c
index 27737af..1b2be1a 100644
--- a/block/vdi.c
+++ b/block/vdi.c
@@ -239,7 +239,6 @@ static void vdi_header_to_le(VdiHeader *header)
     cpu_to_le32s(&header->block_extra);
     cpu_to_le32s(&header->blocks_in_image);
     cpu_to_le32s(&header->blocks_allocated);
-    cpu_to_le32s(&header->blocks_allocated);
     uuid_convert(header->uuid_image);
     uuid_convert(header->uuid_last_snap);
     uuid_convert(header->uuid_link);
-- 
1.7.10.4


