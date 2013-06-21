Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Upyk1-00068s-Jj
	for mharc-qemu-trivial@gnu.org; Fri, 21 Jun 2013 06:38:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42666)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1Upyjn-0005iW-3W
	for qemu-trivial@nongnu.org; Fri, 21 Jun 2013 06:38:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1Upyji-0007n8-Of
	for qemu-trivial@nongnu.org; Fri, 21 Jun 2013 06:38:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:64089)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1Upyjc-0007iz-Ub; Fri, 21 Jun 2013 06:38:29 -0400
Received: from int-mx01.intmail.prod.int.phx2.redhat.com
	(int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r5LAcSn6031516
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 21 Jun 2013 06:38:28 -0400
Received: from rincewind.home.kraxel.org (ovpn-116-29.ams2.redhat.com
	[10.36.116.29])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r5LAcRLS025409; Fri, 21 Jun 2013 06:38:27 -0400
Received: by rincewind.home.kraxel.org (Postfix, from userid 500)
	id C4A1243264; Fri, 21 Jun 2013 12:38:25 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 21 Jun 2013 12:38:19 +0200
Message-Id: <1371811105-730-8-git-send-email-kraxel@redhat.com>
In-Reply-To: <1371811105-730-1-git-send-email-kraxel@redhat.com>
References: <1371811105-730-1-git-send-email-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.11
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	Eric Blake <eblake@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
	Luiz Capitulino <lcapitulino@redhat.com>
Subject: [Qemu-trivial] [PATCH 07/13] qemu-char: fix documentation for
	telnet+wait socket flags
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
X-List-Received-Date: Fri, 21 Jun 2013 10:38:44 -0000

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 qapi-schema.json |    7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/qapi-schema.json b/qapi-schema.json
index a80ee40..a29ce57 100644
--- a/qapi-schema.json
+++ b/qapi-schema.json
@@ -3185,10 +3185,11 @@
 # @addr: socket address to listen on (server=true)
 #        or connect to (server=false)
 # @server: #optional create server socket (default: true)
-# @wait: #optional wait for connect (not used for server
-#        sockets, default: false)
+# @wait: #optional wait for incoming connection on server
+#        sockets (default: false).
 # @nodelay: #optional set TCP_NODELAY socket option (default: false)
-# @telnet: #optional enable telnet protocol (default: false)
+# @telnet: #optional enable telnet protocol on server
+#          sockets (default: false)
 #
 # Since: 1.4
 ##
-- 
1.7.9.7


