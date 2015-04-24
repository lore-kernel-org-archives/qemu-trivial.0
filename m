Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ylhbg-0003fs-Ek
	for mharc-qemu-trivial@gnu.org; Fri, 24 Apr 2015 13:41:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42551)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>) id 1Ylhbd-0003bV-Tt
	for qemu-trivial@nongnu.org; Fri, 24 Apr 2015 13:41:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>) id 1Ylhbc-00064y-Ps
	for qemu-trivial@nongnu.org; Fri, 24 Apr 2015 13:41:37 -0400
Received: from david.siemens.de ([192.35.17.14]:43660)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>)
	id 1YlhbX-000640-Im; Fri, 24 Apr 2015 13:41:31 -0400
Received: from mail3.siemens.de (localhost [127.0.0.1])
	by david.siemens.de (8.14.3/8.14.3) with ESMTP id t3OHfSWW007494;
	Fri, 24 Apr 2015 19:41:28 +0200
Received: from md1f2u6c.ww002.siemens.net (md1f2u6c.mch.sbs.de [139.25.40.156]
	(may be forged))
	by mail3.siemens.de (8.14.3/8.14.3) with ESMTP id t3OHfSb7016720;
	Fri, 24 Apr 2015 19:41:28 +0200
Message-ID: <553A8046.7080709@siemens.com>
Date: Fri, 24 Apr 2015 19:41:26 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de;
	rv:1.8.1.12) Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12
	Mnenhy/0.7.5.666
MIME-Version: 1.0
To: qemu-trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 192.35.17.14
Cc: qemu-devel <qemu-devel@nongnu.org>
Subject: [Qemu-trivial] [PATCH] hostmem: Fix mem-path property name in error
	report
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
X-List-Received-Date: Fri, 24 Apr 2015 17:41:39 -0000

The subtle difference between "property not found" and "property not
set" is already confusing enough.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 backends/hostmem-file.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/backends/hostmem-file.c b/backends/hostmem-file.c
index 5179994..4b55361 100644
--- a/backends/hostmem-file.c
+++ b/backends/hostmem-file.c
@@ -43,7 +43,7 @@ file_backend_memory_alloc(HostMemoryBackend *backend, Error **errp)
         return;
     }
     if (!fb->mem_path) {
-        error_setg(errp, "mem_path property not set");
+        error_setg(errp, "mem-path property not set");
         return;
     }
 #ifndef CONFIG_LINUX
-- 
2.1.4

