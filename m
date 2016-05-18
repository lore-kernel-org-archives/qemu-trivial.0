Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b30Mz-0000Jt-RA
	for mharc-qemu-trivial@gnu.org; Wed, 18 May 2016 08:14:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58454)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b30Mx-0000Fa-Dz
	for qemu-trivial@nongnu.org; Wed, 18 May 2016 08:14:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b30Mt-00032X-53
	for qemu-trivial@nongnu.org; Wed, 18 May 2016 08:14:30 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:48739)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1b30Mk-00030R-GT; Wed, 18 May 2016 08:14:18 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 3B7B0417A4;
	Wed, 18 May 2016 15:14:17 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 0333CADB;
	Wed, 18 May 2016 15:06:11 +0300 (MSK)
Received: (nullmailer pid 12384 invoked by uid 1000);
	Wed, 18 May 2016 12:06:09 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Cao jin <caoj.fnst@cn.fujitsu.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Wed, 18 May 2016 15:05:57 +0300
Message-Id: <ec609656fc12573c35e2bca58d9b1451fb7e4cf2.1463573089.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1463573089.git.mjt@msgid.tls.msk.ru>
References: <cover.1463573089.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 02/13] remove comment for nonexistent
 structure member
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
X-List-Received-Date: Wed, 18 May 2016 12:14:32 -0000

From: Cao jin <caoj.fnst@cn.fujitsu.com>

Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 include/sysemu/hostmem.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/sysemu/hostmem.h b/include/sysemu/hostmem.h
index a19801d..4d6617e 100644
--- a/include/sysemu/hostmem.h
+++ b/include/sysemu/hostmem.h
@@ -44,7 +44,6 @@ struct HostMemoryBackendClass {
  *
  * @parent: opaque parent object container
  * @size: amount of memory backend provides
- * @id: unique identification string in memdev namespace
  * @mr: MemoryRegion representing host memory belonging to backend
  */
 struct HostMemoryBackend {
-- 
2.1.4


