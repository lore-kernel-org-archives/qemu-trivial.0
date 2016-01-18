Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aL6TE-0004qB-1G
	for mharc-qemu-trivial@gnu.org; Mon, 18 Jan 2016 04:51:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50998)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cfergeau@redhat.com>) id 1aL6TB-0004m4-Rl
	for qemu-trivial@nongnu.org; Mon, 18 Jan 2016 04:51:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cfergeau@redhat.com>) id 1aL6TB-0003L9-0l
	for qemu-trivial@nongnu.org; Mon, 18 Jan 2016 04:51:29 -0500
Received: from mx1.redhat.com ([209.132.183.28]:55490)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cfergeau@redhat.com>)
	id 1aL6T9-0003KP-3y; Mon, 18 Jan 2016 04:51:27 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id B0E64C0AA570;
	Mon, 18 Jan 2016 09:51:26 +0000 (UTC)
Received: from edamame.cdg.redhat.com ([10.41.1.102])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u0I9pPjX017075
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Mon, 18 Jan 2016 04:51:26 -0500
Received: by edamame.cdg.redhat.com (Postfix, from userid 1000)
	id ED1B9142BD0; Mon, 18 Jan 2016 10:51:24 +0100 (CET)
From: Christophe Fergeau <cfergeau@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 18 Jan 2016 10:51:19 +0100
Message-Id: <1453110679-23401-1-git-send-email-cfergeau@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH v2] man: virtfs-proxy-helper: Rework awkward
	sentence
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
X-List-Received-Date: Mon, 18 Jan 2016 09:51:30 -0000

There was a 'capbilities' typo in this man page. This commit
reformulates the sentence the typo was in to make it easier to grasp.
This is based on a suggestion from Eric Blake.

Signed-off-by: Christophe Fergeau <cfergeau@redhat.com>
---
Changes since v1:
- rather than just fixing the typo, reformulate the sentence it's in as
  suggested by Eric.


 fsdev/virtfs-proxy-helper.texi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fsdev/virtfs-proxy-helper.texi b/fsdev/virtfs-proxy-helper.texi
index e60e3b9..a2f4ecc 100644
--- a/fsdev/virtfs-proxy-helper.texi
+++ b/fsdev/virtfs-proxy-helper.texi
@@ -28,8 +28,8 @@ QEMU and proxy helper communicate using this socket. QEMU proxy fs
 driver sends filesystem request to proxy helper and receives the
 response from it.
 
-Proxy helper is designed so that it can drop the root privilege with
-retaining capbilities needed for doing filesystem operations only.
+The proxy helper is designed so that it can drop root privileges except
+for the capabilities needed for doing filesystem operations.
 
 @end table
 @c man end
-- 
2.5.0


