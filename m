Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T1NZk-0006M0-UK
	for mharc-qemu-trivial@gnu.org; Tue, 14 Aug 2012 16:18:52 -0400
Received: from eggs.gnu.org ([208.118.235.92]:55895)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berto@elpiso.org>) id 1T1NZi-0006Lq-H7
	for qemu-trivial@nongnu.org; Tue, 14 Aug 2012 16:18:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berto@elpiso.org>) id 1T1NZh-000623-HY
	for qemu-trivial@nongnu.org; Tue, 14 Aug 2012 16:18:50 -0400
Received: from smtp4.mundo-r.com ([212.51.32.151]:65216)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berto@elpiso.org>) id 1T1NZh-00061j-Ah
	for qemu-trivial@nongnu.org; Tue, 14 Aug 2012 16:18:49 -0400
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AloCAOWxKlBbdWObgWdsb2JhbABFhgGxAYMmIgEBFiYngkoPAUYZHAIYDgI+iEWlM5NUgSGMeYIKgRIDiEiNA5Jy
X-IronPort-AV: E=Sophos;i="4.77,769,1336341600"; d="scan'208";a="957276700"
Received: from fanzine.igalia.com ([91.117.99.155])
	by smtp4.mundo-r.com with ESMTP; 14 Aug 2012 22:18:47 +0200
Received: from dsl-hkibrasgw4-fe53df00-164.dhcp.inet.fi ([80.223.83.164]
	helo=hermes.local) by fanzine.igalia.com with esmtpsa 
	(Cipher TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16) (Exim)
	id 1T1NZf-0001no-5o; Tue, 14 Aug 2012 22:18:47 +0200
Received: from berto by hermes.local with local (Exim 4.80)
	(envelope-from <berto@elpiso.org>)
	id 1T1NZQ-00043C-SY; Tue, 14 Aug 2012 23:18:33 +0300
From: Alberto Garcia <agarcia@igalia.com>
To: qemu-trivial@nongnu.org
Date: Tue, 14 Aug 2012 23:18:32 +0300
Message-Id: <1344975512-15542-1-git-send-email-agarcia@igalia.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 212.51.32.151
Cc: Orit Wasserman <owasserm@redhat.com>
Subject: [Qemu-trivial] =?utf-8?q?=5BPATCH=5D_savevm=3A_fix_compiler_warni?=
	=?utf-8?q?ng?=
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
X-List-Received-Date: Tue, 14 Aug 2012 20:18:51 -0000

If we have a 32-bit long then the truncation of a 64-bit value will
produce a compiler warning unless we make an explicit cast.
---
 savevm.c |    2 +-
 1 ficheiro modificado, 1 adição(+), 1 eliminado(-)

diff --git a/savevm.c b/savevm.c
index 0ea10c9..c89fc4e 100644
--- a/savevm.c
+++ b/savevm.c
@@ -2473,7 +2473,7 @@ int xbzrle_encode_buffer(uint8_t *old_buf, uint8_t *new_buf, int slen,
         /* word at a time for speed, use of 32-bit long okay */
         if (!res) {
             /* truncation to 32-bit long okay */
-            long mask = 0x0101010101010101ULL;
+            long mask = (long) 0x0101010101010101ULL;
             while (i < slen) {
                 xor = *(long *)(old_buf + i) ^ *(long *)(new_buf + i);
                 if ((xor - mask) & ~xor & (mask << 7)) {
-- 
1.7.10.4


