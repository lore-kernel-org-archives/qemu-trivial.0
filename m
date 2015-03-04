Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YTF68-0006qP-9v
	for mharc-qemu-trivial@gnu.org; Wed, 04 Mar 2015 14:36:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43208)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YTF63-0006hz-Jx
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 14:36:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YTF62-0001X7-QK
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 14:36:43 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:52849)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YTF5v-0001TA-6v; Wed, 04 Mar 2015 14:36:35 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id A76E3408F8;
	Wed,  4 Mar 2015 22:36:31 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 4F03D975;
	Wed,  4 Mar 2015 20:07:11 +0300 (MSK)
Received: (nullmailer pid 17536 invoked by uid 1000);
	Wed, 04 Mar 2015 17:07:05 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Wed,  4 Mar 2015 20:06:43 +0300
Message-Id: <c227c278783260e3dfb3e619a639e21d556e9599.1425488753.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1425488753.git.mjt@msgid.tls.msk.ru>
References: <cover.1425488753.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Cole Robinson <crobinso@redhat.com>
Subject: [Qemu-trivial] [PULL 26/47] qapi-schema: Fix SpiceChannel docs
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
X-List-Received-Date: Wed, 04 Mar 2015 19:36:44 -0000

From: Cole Robinson <crobinso@redhat.com>

The value is called channel-type, not connection-type

Signed-off-by: Cole Robinson <crobinso@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qapi-schema.json | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/qapi-schema.json b/qapi-schema.json
index e16f8eb..8141f71 100644
--- a/qapi-schema.json
+++ b/qapi-schema.json
@@ -871,9 +871,9 @@
 # @connection-id: SPICE connection id number.  All channels with the same id
 #                 belong to the same SPICE session.
 #
-# @connection-type: SPICE channel type number.  "1" is the main control
-#                   channel, filter for this one if you want to track spice
-#                   sessions only
+# @channel-type: SPICE channel type number.  "1" is the main control
+#                channel, filter for this one if you want to track spice
+#                sessions only
 #
 # @channel-id: SPICE channel ID number.  Usually "0", might be different when
 #              multiple channels of the same type exist, such as multiple
-- 
2.1.4


