Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WKiei-0007qQ-Pv
	for mharc-qemu-trivial@gnu.org; Tue, 04 Mar 2014 01:16:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58001)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WKiec-0007jK-PU
	for qemu-trivial@nongnu.org; Tue, 04 Mar 2014 01:16:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WKieX-0001B9-TM
	for qemu-trivial@nongnu.org; Tue, 04 Mar 2014 01:16:38 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:52140)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WKieD-00015m-KD; Tue, 04 Mar 2014 01:16:13 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id BEB4F4084E;
	Tue,  4 Mar 2014 10:16:03 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id A89CE650;
	Tue,  4 Mar 2014 10:16:03 +0400 (MSK)
Received: (nullmailer pid 16568 invoked by uid 1000);
	Tue, 04 Mar 2014 06:16:03 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue,  4 Mar 2014 10:15:49 +0400
Message-Id: <1393913761-16516-2-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1393913761-16516-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1393913761-16516-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: [Qemu-trivial] [PULL 01/13] include/qemu/host-utils.h: Trivial
	typo: ctz->cto
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
X-List-Received-Date: Tue, 04 Mar 2014 06:16:43 -0000

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 include/qemu/host-utils.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/qemu/host-utils.h b/include/qemu/host-utils.h
index de85d28..285c5fb 100644
--- a/include/qemu/host-utils.h
+++ b/include/qemu/host-utils.h
@@ -217,7 +217,7 @@ static inline int ctz64(uint64_t val)
 }
 
 /**
- * ctz64 - count trailing ones in a 64-bit value.
+ * cto64 - count trailing ones in a 64-bit value.
  * @val: The value to search
  *
  * Returns 64 if the value is -1.
-- 
1.7.10.4


