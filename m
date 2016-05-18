Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b30FC-0003hC-1C
	for mharc-qemu-trivial@gnu.org; Wed, 18 May 2016 08:06:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56338)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b30F9-0003gr-Op
	for qemu-trivial@nongnu.org; Wed, 18 May 2016 08:06:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b30F5-0000w5-Cr
	for qemu-trivial@nongnu.org; Wed, 18 May 2016 08:06:27 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:39843)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b30F5-0000vX-4r
	for qemu-trivial@nongnu.org; Wed, 18 May 2016 08:06:23 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 9042B417A4;
	Wed, 18 May 2016 15:06:11 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id A7EA4ADC;
	Wed, 18 May 2016 15:06:10 +0300 (MSK)
Received: (nullmailer pid 12402 invoked by uid 1000);
	Wed, 18 May 2016 12:06:09 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Cao jin <caoj.fnst@cn.fujitsu.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Wed, 18 May 2016 15:06:06 +0300
Message-Id: <cc2324d03dbd098b80cfc482d9d29114db57d975.1463573089.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1463573089.git.mjt@msgid.tls.msk.ru>
References: <cover.1463573089.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 11/13] smbios: fix typo
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
X-List-Received-Date: Wed, 18 May 2016 12:06:28 -0000

From: Cao jin <caoj.fnst@cn.fujitsu.com>

The spec says: "on paragraph (16-byte) boundaries"

Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 include/hw/smbios/smbios.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/smbios/smbios.h b/include/hw/smbios/smbios.h
index 76ccf70..ba36746 100644
--- a/include/hw/smbios/smbios.h
+++ b/include/hw/smbios/smbios.h
@@ -33,7 +33,7 @@ typedef enum SmbiosEntryPointType {
 
 /* SMBIOS Entry Point
  * There are two types of entry points defined in the SMBIOS specification
- * (see below). BIOS must place the entry point(s) at a 16-bit-aligned
+ * (see below). BIOS must place the entry point(s) at a 16-byte-aligned
  * address between 0xf0000 and 0xfffff. Note that either entry point type
  * can be used in a 64-bit target system, except that SMBIOS 2.1 entry point
  * only allows the SMBIOS struct table to reside below 4GB address space.
-- 
2.1.4


