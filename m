Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aIzLC-0005YN-C0
	for mharc-qemu-trivial@gnu.org; Tue, 12 Jan 2016 08:50:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56459)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cfergeau@redhat.com>) id 1aIzBH-0003Oj-1B
	for qemu-trivial@nongnu.org; Tue, 12 Jan 2016 08:40:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cfergeau@redhat.com>) id 1aIzBB-00040q-Va
	for qemu-trivial@nongnu.org; Tue, 12 Jan 2016 08:40:14 -0500
Received: from mx1.redhat.com ([209.132.183.28]:46852)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cfergeau@redhat.com>)
	id 1aIzB6-0003x8-0C; Tue, 12 Jan 2016 08:40:04 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id 192619C0D7;
	Tue, 12 Jan 2016 13:40:03 +0000 (UTC)
Received: from edamame.cdg.redhat.com (ovpn-116-92.ams2.redhat.com
	[10.36.116.92])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u0CDe1st022668
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 12 Jan 2016 08:40:02 -0500
Received: by edamame.cdg.redhat.com (Postfix, from userid 1000)
	id F33821405FB; Tue, 12 Jan 2016 14:40:00 +0100 (CET)
From: Christophe Fergeau <cfergeau@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 12 Jan 2016 14:39:39 +0100
Message-Id: <1452605979-744-1-git-send-email-cfergeau@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
X-Mailman-Approved-At: Tue, 12 Jan 2016 08:50:28 -0500
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] man: virtfs-proxy-helper: Fix 'capbilities'
	typo
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
X-List-Received-Date: Tue, 12 Jan 2016 13:40:20 -0000

Signed-off-by: Christophe Fergeau <cfergeau@redhat.com>
---
 fsdev/virtfs-proxy-helper.texi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fsdev/virtfs-proxy-helper.texi b/fsdev/virtfs-proxy-helper.texi
index e60e3b9..1b905a0 100644
--- a/fsdev/virtfs-proxy-helper.texi
+++ b/fsdev/virtfs-proxy-helper.texi
@@ -29,7 +29,7 @@ driver sends filesystem request to proxy helper and receives the
 response from it.
 
 Proxy helper is designed so that it can drop the root privilege with
-retaining capbilities needed for doing filesystem operations only.
+retaining capabilities needed for doing filesystem operations only.
 
 @end table
 @c man end
-- 
2.5.0


