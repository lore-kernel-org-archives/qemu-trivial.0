Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YnhwL-0005dk-81
	for mharc-qemu-trivial@gnu.org; Thu, 30 Apr 2015 02:27:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58070)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YnhwD-0005MM-Gj
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 02:27:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YnhwC-0002b8-PR
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 02:27:09 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:43708)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Ynhw7-0002Z3-9B; Thu, 30 Apr 2015 02:27:03 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id D199842BA4;
	Thu, 30 Apr 2015 09:27:00 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 441A396D;
	Thu, 30 Apr 2015 08:09:01 +0300 (MSK)
Received: (nullmailer pid 4364 invoked by uid 1000);
	Thu, 30 Apr 2015 05:08:57 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 30 Apr 2015 08:08:48 +0300
Message-Id: <69315e3ffba630e6c9cae1c6c6052bd926a47478.1430370396.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1430370396.git.mjt@msgid.tls.msk.ru>
References: <cover.1430370396.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, "Emilio G. Cota" <cota@braap.org>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 35/42] linux-user/elfload: use QTAILQ_FOREACH
	instead of open-coding it
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
X-List-Received-Date: Thu, 30 Apr 2015 06:27:10 -0000

From: "Emilio G. Cota" <cota@braap.org>

Signed-off-by: Emilio G. Cota <cota@braap.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 linux-user/elfload.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 399c021..0ba9706 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -2887,8 +2887,7 @@ static int write_note_info(struct elf_note_info *info, int fd)
             return (error);
 
     /* write prstatus for each thread */
-    for (ets = info->thread_list.tqh_first; ets != NULL;
-         ets = ets->ets_link.tqe_next) {
+    QTAILQ_FOREACH(ets, &info->thread_list, ets_link) {
         if ((error = write_note(&ets->notes[0], fd)) != 0)
             return (error);
     }
-- 
2.1.4


