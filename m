Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YTDNj-0000dD-M3
	for mharc-qemu-trivial@gnu.org; Wed, 04 Mar 2015 12:46:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45990)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YTDNc-0000OM-Or
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 12:46:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YTDNb-0004Hj-Vz
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 12:46:44 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:59866)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YTDNS-0004CX-7q; Wed, 04 Mar 2015 12:46:34 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id A561A408AC;
	Wed,  4 Mar 2015 20:46:31 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 0551D722;
	Wed,  4 Mar 2015 20:07:06 +0300 (MSK)
Received: (nullmailer pid 17505 invoked by uid 1000);
	Wed, 04 Mar 2015 17:07:05 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Wed,  4 Mar 2015 20:06:28 +0300
Message-Id: <c7b3f04ad194a37b4b4d4db8ca3ad7bd71a9dbce.1425488753.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1425488753.git.mjt@msgid.tls.msk.ru>
References: <cover.1425488753.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Alberto Garcia <berto@igalia.com>
Subject: [Qemu-trivial] [PULL 11/47] qmp-commands.hx: Fix several typos
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
X-List-Received-Date: Wed, 04 Mar 2015 17:46:50 -0000

From: Alberto Garcia <berto@igalia.com>

Signed-off-by: Alberto Garcia <berto@igalia.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qmp-commands.hx | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/qmp-commands.hx b/qmp-commands.hx
index a85d847..c12334a 100644
--- a/qmp-commands.hx
+++ b/qmp-commands.hx
@@ -1,5 +1,5 @@
 HXCOMM QMP dispatch table and documentation
-HXCOMM Text between SQMP and EQMP is copied to the QMP documention file and
+HXCOMM Text between SQMP and EQMP is copied to the QMP documentation file and
 HXCOMM does not show up in the other formats.
 
 SQMP
@@ -1767,7 +1767,7 @@ Arguments:
 
 - "protocol": protocol name (json-string)
 - "password": password (json-string)
-- "connected": [ keep | disconnect | fail ] (josn-string, optional)
+- "connected": [ keep | disconnect | fail ] (json-string, optional)
 
 Example:
 
@@ -2922,7 +2922,7 @@ Channels are described by a json-object, each one contain the following:
 - "channel-id": channel id.  Usually "0", might be different needed when
                 multiple channels of the same type exist, such as multiple
                 display channels in a multihead setup (json-int)
-- "tls": whevener the channel is encrypted (json-bool)
+- "tls": whether the channel is encrypted (json-bool)
 
 Example:
 
-- 
2.1.4


