Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YR3fd-0007Lv-1j
	for mharc-qemu-trivial@gnu.org; Thu, 26 Feb 2015 14:00:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42742)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crobinso@redhat.com>) id 1YR3fX-00078m-L9
	for qemu-trivial@nongnu.org; Thu, 26 Feb 2015 14:00:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crobinso@redhat.com>) id 1YR3fU-0007g8-EL
	for qemu-trivial@nongnu.org; Thu, 26 Feb 2015 14:00:19 -0500
Received: from mx1.redhat.com ([209.132.183.28]:53501)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crobinso@redhat.com>)
	id 1YR3fK-0007VY-0U; Thu, 26 Feb 2015 14:00:06 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t1QJ03VY017529
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Thu, 26 Feb 2015 14:00:03 -0500
Received: from colepc.redhat.com (ovpn-113-31.phx2.redhat.com [10.3.113.31])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t1QJ028d020480; Thu, 26 Feb 2015 14:00:03 -0500
From: Cole Robinson <crobinso@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 26 Feb 2015 13:59:58 -0500
Message-Id: <c0d13cbb078dfba50ad9b00e66be60ec0c6d6776.1424977076.git.crobinso@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Cole Robinson <crobinso@redhat.com>
Subject: [Qemu-trivial] [PATCH] qapi-schema: Fix SpiceChannel docs
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
X-List-Received-Date: Thu, 26 Feb 2015 19:00:23 -0000

The value is called channel-type, not connection-type

Signed-off-by: Cole Robinson <crobinso@redhat.com>
---
 qapi-schema.json | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/qapi-schema.json b/qapi-schema.json
index e16f8eb..8141f71 100644
--- a/qapi-schema.json
+++ b/qapi-schema.json
@@ -860,31 +860,31 @@
 # Since: 2.1
 ##
 { 'type': 'SpiceServerInfo',
   'base': 'SpiceBasicInfo',
   'data': { '*auth': 'str' } }
 
 ##
 # @SpiceChannel
 #
 # Information about a SPICE client channel.
 #
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
 #              display channels in a multihead setup
 #
 # @tls: true if the channel is encrypted, false otherwise.
 #
 # Since: 0.14.0
 ##
 { 'type': 'SpiceChannel',
   'base': 'SpiceBasicInfo',
   'data': {'connection-id': 'int', 'channel-type': 'int', 'channel-id': 'int',
            'tls': 'bool'} }
 
-- 
2.1.0


