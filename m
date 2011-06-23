Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QZf55-0007pp-UO
	for mharc-qemu-trivial@gnu.org; Thu, 23 Jun 2011 04:16:07 -0400
Received: from eggs.gnu.org ([140.186.70.92]:39545)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>) id 1QZf52-0007pB-MC
	for qemu-trivial@nongnu.org; Thu, 23 Jun 2011 04:16:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>) id 1QZf51-0001v5-F8
	for qemu-trivial@nongnu.org; Thu, 23 Jun 2011 04:16:04 -0400
Received: from fmmailgate02.web.de ([217.72.192.227]:35998)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>)
	id 1QZf4y-0001uI-8P; Thu, 23 Jun 2011 04:16:00 -0400
Received: from smtp03.web.de  ( [172.20.0.65])
	by fmmailgate02.web.de (Postfix) with ESMTP id DD6C81A38FB1A;
	Thu, 23 Jun 2011 10:15:58 +0200 (CEST)
Received: from [88.65.252.133] (helo=mchn199C.mchp.siemens.de)
	by smtp03.web.de with asmtp (TLSv1:AES256-SHA:256) (WEB.DE 4.110 #2)
	id 1QZf4w-0005lg-00; Thu, 23 Jun 2011 10:15:58 +0200
Message-ID: <4E02F63E.3010908@web.de>
Date: Thu, 23 Jun 2011 10:15:58 +0200
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
X-Provags-ID: V01U2FsdGVkX1/KM7H8Gjrxx0k0IQkG4TdBwiQDs3Sv0dQUWW5+
	bllikrBx7BNOb5JUC5m6jk++v+c3yiTrvjzb8RloDvp+hQisvc GU4LYQ/Ek=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 217.72.192.227
Cc: Stefan Weil <weil@mail.berlios.de>, qemu-devel <qemu-devel@nongnu.org>
Subject: [Qemu-trivial] [PATCH] Avoid double definitions of PRI*64
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
X-List-Received-Date: Thu, 23 Jun 2011 08:16:06 -0000

From: Jan Kiszka <jan.kiszka@siemens.com>

Recent mingw32 provide those defines.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 qemu-common.h |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/qemu-common.h b/qemu-common.h
index 109498d..7ca7e57 100644
--- a/qemu-common.h
+++ b/qemu-common.h
@@ -113,12 +113,15 @@ static inline char *realpath(const char *path, char *resolved_path)
     return resolved_path;
 }
 
+#ifndef PRId64
 #define PRId64 "I64d"
 #define PRIx64 "I64x"
 #define PRIu64 "I64u"
 #define PRIo64 "I64o"
 #endif
 
+#endif
+
 /* FIXME: Remove NEED_CPU_H.  */
 #ifndef NEED_CPU_H
 

