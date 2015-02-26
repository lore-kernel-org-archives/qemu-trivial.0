Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YQzXo-00008O-Of
	for mharc-qemu-trivial@gnu.org; Thu, 26 Feb 2015 09:36:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45853)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berto@igalia.com>) id 1YQzXl-0008W6-Kg
	for qemu-trivial@nongnu.org; Thu, 26 Feb 2015 09:36:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berto@igalia.com>) id 1YQzXk-0001Sx-OV
	for qemu-trivial@nongnu.org; Thu, 26 Feb 2015 09:36:01 -0500
Received: from smtp3.mundo-r.com ([212.51.32.191]:57469 helo=smtp4.mundo-r.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berto@igalia.com>)
	id 1YQzXf-0001R9-8s; Thu, 26 Feb 2015 09:35:55 -0500
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: ArQOAK4u71RbdWOb/2dsb2JhbABbgwKBLK8aBQEBAQEBAQUBd4JyiHqLZ4EkTQEBAQEBAXyFD0sETjSIMwHWfIYHiXodAoQTBZk0k0kjgUUBgiptgkMBAQE
X-IPAS-Result: ArQOAK4u71RbdWOb/2dsb2JhbABbgwKBLK8aBQEBAQEBAQUBd4JyiHqLZ4EkTQEBAQEBAXyFD0sETjSIMwHWfIYHiXodAoQTBZk0k0kjgUUBgiptgkMBAQE
X-IronPort-AV: E=Sophos;i="5.09,652,1418079600"; d="scan'208";a="322323939"
Received: from fanzine.igalia.com ([91.117.99.155])
	by smtp4.mundo-r.com with ESMTP; 26 Feb 2015 15:35:39 +0100
Received: from dsl-hkibrasgw4-50df50-128.dhcp.inet.fi ([80.223.80.128]
	helo=perseus.local) by fanzine.igalia.com with esmtpsa 
	(Cipher TLS1.0:RSA_AES_128_CBC_SHA1:16) (Exim)
	id 1YQzXP-0007sz-2S; Thu, 26 Feb 2015 15:35:39 +0100
Received: from berto by perseus.local with local (Exim 4.84)
	(envelope-from <berto@igalia.com>)
	id 1YQzXB-0004gf-Kl; Thu, 26 Feb 2015 16:35:25 +0200
From: Alberto Garcia <berto@igalia.com>
To: qemu-devel@nongnu.org
Date: Thu, 26 Feb 2015 16:35:07 +0200
Message-Id: <6d7cb262a6c7071f1085f445dbdc0b2721f0f06e.1424961146.git.berto@igalia.com>
X-Mailer: git-send-email 2.1.4
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 212.51.32.191
Cc: qemu-trivial@nongnu.org, Alberto Garcia <berto@igalia.com>
Subject: [Qemu-trivial] [PATCH v2 1/1] qmp-commands.hx: Fix several typos
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
X-List-Received-Date: Thu, 26 Feb 2015 14:36:02 -0000

Signed-off-by: Alberto Garcia <berto@igalia.com>
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


