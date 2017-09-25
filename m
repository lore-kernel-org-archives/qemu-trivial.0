Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dwV4P-0004uq-6P
	for mharc-qemu-trivial@gnu.org; Mon, 25 Sep 2017 11:13:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51548)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <daniel@loffgren.org>) id 1dwHnB-0006Ij-I1
	for qemu-trivial@nongnu.org; Sun, 24 Sep 2017 21:02:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <daniel@loffgren.org>) id 1dwHnA-0005o8-TW
	for qemu-trivial@nongnu.org; Sun, 24 Sep 2017 21:02:37 -0400
Received: from tk2-216-17739.vs.sakura.ne.jp ([160.16.80.243]:60374
	helo=maro.localdomain)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <daniel@loffgren.org>)
	id 1dwHn5-0005aW-Nl; Sun, 24 Sep 2017 21:02:31 -0400
Received: from [10.0.0.206] (c-24-23-203-58.hsd1.ca.comcast.net [24.23.203.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by maro.localdomain (Postfix) with ESMTPSA id 074D219D355;
	Mon, 25 Sep 2017 10:00:17 +0900 (JST)
From: Daniel Loffgren <daniel@loffgren.org>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Message-Id: <40DEFE92-410B-4FED-B0A5-56C186627134@loffgren.org>
Date: Sun, 24 Sep 2017 18:02:21 -0700
Cc: qemu-trivial@nongnu.org
To: qemu-devel@nongnu.org
X-Mailer: Apple Mail (2.3273)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 160.16.80.243
X-Mailman-Approved-At: Mon, 25 Sep 2017 11:13:15 -0400
Subject: [Qemu-trivial] [PATCH 1/2] fprintf-fn.h uses GCC_FMT,
 but doesn't include the definition of it
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
X-List-Received-Date: Mon, 25 Sep 2017 01:02:38 -0000


Signed-off-by: Daniel Loffgren <daniel@loffgren.org>
---
 include/qemu/fprintf-fn.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/qemu/fprintf-fn.h b/include/qemu/fprintf-fn.h
index 9068a960b3..80361d87bf 100644
--- a/include/qemu/fprintf-fn.h
+++ b/include/qemu/fprintf-fn.h
@@ -8,6 +8,8 @@
 #ifndef QEMU_FPRINTF_FN_H
 #define QEMU_FPRINTF_FN_H
 
+#include "compiler.h"
+
 typedef int (*fprintf_function)(FILE *f, const char *fmt, ...)
     GCC_FMT_ATTR(2, 3);
 
-- 


