Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ujxma-0002Ae-Me
	for mharc-qemu-trivial@gnu.org; Tue, 04 Jun 2013 16:24:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52169)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alevy@redhat.com>) id 1UjxmU-0001xt-09
	for qemu-trivial@nongnu.org; Tue, 04 Jun 2013 16:24:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alevy@redhat.com>) id 1UjxmP-0005zF-9d
	for qemu-trivial@nongnu.org; Tue, 04 Jun 2013 16:24:33 -0400
Received: from mx1.redhat.com ([209.132.183.28]:7001)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alevy@redhat.com>)
	id 1UjxmF-0005ux-Lo; Tue, 04 Jun 2013 16:24:19 -0400
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r54KOG8r009216
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 4 Jun 2013 16:24:19 -0400
Received: from garlic.sbx07344.newyony.wayport.net (vpn1-5-107.ams2.redhat.com
	[10.36.5.107])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r54KNeZj022345; Tue, 4 Jun 2013 16:24:13 -0400
From: Alon Levy <alevy@redhat.com>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Tue,  4 Jun 2013 16:23:39 -0400
Message-Id: <1370377419-31788-5-git-send-email-alevy@redhat.com>
In-Reply-To: <1370377419-31788-1-git-send-email-alevy@redhat.com>
References: <1370377419-31788-1-git-send-email-alevy@redhat.com>
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 5/5] libcacard/vscclient.c: fix use of
	uninitialized variable
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
X-List-Received-Date: Tue, 04 Jun 2013 20:24:38 -0000

Found by Coverity.

Signed-off-by: Alon Levy <alevy@redhat.com>
---
 libcacard/vscclient.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/libcacard/vscclient.c b/libcacard/vscclient.c
index 5180d29..4275c23 100644
--- a/libcacard/vscclient.c
+++ b/libcacard/vscclient.c
@@ -645,7 +645,7 @@ main(
     GIOChannel *channel_stdin;
     char *qemu_host;
     char *qemu_port;
-    VSCMsgHeader mhHeader;
+    VSCMsgHeader mhHeader = {0,};
 
     VCardEmulOptions *command_line_options = NULL;
 
-- 
1.8.2.1


