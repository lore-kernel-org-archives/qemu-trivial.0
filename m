Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QZf5O-0007sn-PX
	for mharc-qemu-trivial@gnu.org; Thu, 23 Jun 2011 04:16:26 -0400
Received: from eggs.gnu.org ([140.186.70.92]:50596)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>) id 1QZf5M-0007s7-14
	for qemu-trivial@nongnu.org; Thu, 23 Jun 2011 04:16:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>) id 1QZf5K-0001x1-JR
	for qemu-trivial@nongnu.org; Thu, 23 Jun 2011 04:16:23 -0400
Received: from fmmailgate01.web.de ([217.72.192.221]:43461)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>)
	id 1QZf5H-0001wX-EP; Thu, 23 Jun 2011 04:16:19 -0400
Received: from smtp06.web.de  ( [172.20.5.172])
	by fmmailgate01.web.de (Postfix) with ESMTP id 73817191F3653;
	Thu, 23 Jun 2011 10:15:56 +0200 (CEST)
Received: from [88.65.252.133] (helo=mchn199C.mchp.siemens.de)
	by smtp06.web.de with asmtp (TLSv1:AES256-SHA:256) (WEB.DE 4.110 #2)
	id 1QZf4u-0000Qi-00; Thu, 23 Jun 2011 10:15:56 +0200
Message-ID: <4E02F63B.7050701@web.de>
Date: Thu, 23 Jun 2011 10:15:55 +0200
From: Jan Kiszka <jan.kiszka@web.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de;
	rv:1.8.1.12) Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12
	Mnenhy/0.7.5.666
MIME-Version: 1.0
To: qemu-trivial <qemu-trivial@nongnu.org>
X-Enigmail-Version: 1.1.2
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
Sender: jan.kiszka@web.de
X-Sender: jan.kiszka@web.de
X-Provags-ID: V01U2FsdGVkX19qTv/YBidDgdVY13eOflOXFFFCiwPeiHRpZXgK
	ufeAPMAgIEwMh3+s1TB2i9KrCNG6ZiG+YX6IW8PNi1T5m6C4vT wYER/9fqM=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 217.72.192.221
Cc: Stefan Weil <weil@mail.berlios.de>, qemu-devel <qemu-devel@nongnu.org>
Subject: [Qemu-trivial] [PATCH] Do not include compatfd for WIN32
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
X-List-Received-Date: Thu, 23 Jun 2011 08:16:25 -0000

From: Jan Kiszka <jan.kiszka@siemens.com>

sigset_t, used by that header, is not available in mingw32 environments.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 cpus.c |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/cpus.c b/cpus.c
index 322295c..600f8f5 100644
--- a/cpus.c
+++ b/cpus.c
@@ -34,7 +34,10 @@
 
 #include "qemu-thread.h"
 #include "cpus.h"
+
+#ifndef _WIN32
 #include "compatfd.h"
+#endif
 
 #ifdef SIGRTMIN
 #define SIG_IPI (SIGRTMIN+4)
-- 
1.7.1

