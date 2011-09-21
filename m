Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1R6H4s-000477-GF
	for mharc-qemu-trivial@gnu.org; Wed, 21 Sep 2011 03:18:42 -0400
Received: from eggs.gnu.org ([140.186.70.92]:44244)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>) id 1R6H4m-00046W-Uc
	for qemu-trivial@nongnu.org; Wed, 21 Sep 2011 03:18:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>) id 1R6H4l-0000dY-7l
	for qemu-trivial@nongnu.org; Wed, 21 Sep 2011 03:18:36 -0400
Received: from goliath.siemens.de ([192.35.17.28]:30559)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>)
	id 1R6H4k-0000dQ-Si; Wed, 21 Sep 2011 03:18:35 -0400
Received: from mail1.siemens.de (localhost [127.0.0.1])
	by goliath.siemens.de (8.13.6/8.13.6) with ESMTP id p8L7IWZD004467;
	Wed, 21 Sep 2011 09:18:32 +0200
Received: from mchn199C.mchp.siemens.de ([139.22.37.23])
	by mail1.siemens.de (8.13.6/8.13.6) with ESMTP id p8L7IVtv027830;
	Wed, 21 Sep 2011 09:18:32 +0200
Message-ID: <4E798FC8.8080800@siemens.com>
Date: Wed, 21 Sep 2011 09:18:32 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de;
	rv:1.8.1.12) Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12
	Mnenhy/0.7.5.666
MIME-Version: 1.0
To: qemu-trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6, seldom 2.4 (older,
	4)
X-Received-From: 192.35.17.28
Cc: qemu-devel <qemu-devel@nongnu.org>
Subject: [Qemu-trivial] [PATCH] Silence make if nothing is to do for
	libcacard
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
X-List-Received-Date: Wed, 21 Sep 2011 07:18:40 -0000

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 libcacard/Makefile |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/libcacard/Makefile b/libcacard/Makefile
index 81d9eb5..a145569 100644
--- a/libcacard/Makefile
+++ b/libcacard/Makefile
@@ -27,6 +27,8 @@ clean:
 	rm -Rf .libs
 
 all: vscclient
+# Dummy command so that make thinks it has done something
+	@true
 
 #########################################################################
 # Rules for building libcacard standalone library
-- 
1.7.3.4

