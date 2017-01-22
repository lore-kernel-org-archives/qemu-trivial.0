Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cVJXC-0005yj-Bg
	for mharc-qemu-trivial@gnu.org; Sun, 22 Jan 2017 09:54:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36588)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1cVJX9-0005xL-Nm
	for qemu-trivial@nongnu.org; Sun, 22 Jan 2017 09:54:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1cVJX8-0000l0-Jp
	for qemu-trivial@nongnu.org; Sun, 22 Jan 2017 09:54:19 -0500
Received: from [2a03:4000:1::4e2f:c7ac:d] (port=57403 helo=mail.weilnetz.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1cVJX2-0000ju-Aw; Sun, 22 Jan 2017 09:54:12 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by mail.weilnetz.de (Postfix) with ESMTP id 7FB2911810AA;
	Sun, 22 Jan 2017 15:54:11 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from mail.weilnetz.de ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id wf0Poqke8HIE; Sun, 22 Jan 2017 15:54:09 +0100 (CET)
Received: from qemu.weilnetz.de (qemu.weilnetz.de [188.68.58.204])
	by mail.weilnetz.de (Postfix) with ESMTP id EDA9211810A5;
	Sun, 22 Jan 2017 15:54:08 +0100 (CET)
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
	id CD45B460C23; Sun, 22 Jan 2017 15:54:08 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: QEMU Developer <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Michael Roth <mdroth@linux.vnet.ibm.com>, Eric Blake <eblake@redhat.com>,
	Stefan Weil <sw@weilnetz.de>
Date: Sun, 22 Jan 2017 15:54:07 +0100
Message-Id: <20170122145407.27476-1-sw@weilnetz.de>
X-Mailer: git-send-email 2.11.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a03:4000:1::4e2f:c7ac:d
Subject: [Qemu-trivial] [PATCH] qapi: Remove unwanted commas after #optional
 keyword
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sun, 22 Jan 2017 14:54:21 -0000

We don't want that commas to be part of the generated documentation,
so remove them.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---

This is an alternative solution for the issue which is also addressed
by my previous patch http://patchwork.ozlabs.org/patch/718177/.

It's also possible to apply both patches.

Stefan

 qapi-schema.json     |  4 ++--
 qapi/block-core.json | 10 +++++-----
 qapi/event.json      |  6 +++---
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/qapi-schema.json b/qapi-schema.json
index ddc878390e..176e1a5a0b 100644
--- a/qapi-schema.json
+++ b/qapi-schema.json
@@ -1506,7 +1506,7 @@
 #
 # The network connection information for server
 #
-# @auth: #optional, authentication method
+# @auth: #optional authentication method
 #
 # Since: 2.1
 ##
@@ -1694,7 +1694,7 @@
 #
 # Information about a SPICE server
 #
-# @auth: #optional, authentication method
+# @auth: #optional authentication method
 #
 # Since: 2.1
 ##
diff --git a/qapi/block-core.json b/qapi/block-core.json
index 1b3e6eb0e8..932f5bb3b4 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -3126,10 +3126,10 @@
 #
 # @filename:        filename of the new image to be loaded
 #
-# @format:          #optional, format to open the new image with (defaults to
+# @format:          #optional format to open the new image with (defaults to
 #                   the probed format)
 #
-# @read-only-mode:  #optional, change the read-only mode of the device; defaults
+# @read-only-mode:  #optional change the read-only mode of the device; defaults
 #                   to 'retain'
 #
 # Since: 2.5
@@ -3208,10 +3208,10 @@
 #       corruption being detected. It should not be parsed by machine as it is
 #       not guaranteed to be stable
 #
-# @offset: #optional, if the corruption resulted from an image access, this is
+# @offset: #optional if the corruption resulted from an image access, this is
 #          the host's access offset into the image
 #
-# @size: #optional, if the corruption resulted from an image access, this is
+# @size: #optional if the corruption resulted from an image access, this is
 #        the access size
 #
 # @fatal: if set, the image is marked corrupt and therefore unusable after this
@@ -3302,7 +3302,7 @@
 #
 # @speed: rate limit, bytes per second
 #
-# @error: #optional, error message. Only present on failure. This field
+# @error: #optional error message. Only present on failure. This field
 #         contains a human-readable error message. There are no semantics
 #         other than that streaming has failed and clients should not try to
 #         interpret the error string
diff --git a/qapi/event.json b/qapi/event.json
index f3737b771f..7bf539b84d 100644
--- a/qapi/event.json
+++ b/qapi/event.json
@@ -186,7 +186,7 @@
 # At this point, it's safe to reuse the specified device ID. Device removal can
 # be initiated by the guest or by HMP/QMP commands.
 #
-# @device: #optional, device name
+# @device: #optional device name
 #
 # @path: device path
 #
@@ -209,7 +209,7 @@
 # Emitted once until the 'query-rx-filter' command is executed, the first event
 # will always be emitted
 #
-# @name: #optional, net client name
+# @name: #optional net client name
 #
 # @path: device path
 #
@@ -531,7 +531,7 @@
 #
 # @type: quorum operation type (Since 2.6)
 #
-# @error: #optional, error message. Only present on failure. This field
+# @error: #optional error message. Only present on failure. This field
 #         contains a human-readable error message. There are no semantics other
 #         than that the block layer reported an error and clients should not
 #         try to interpret the error string.
-- 
2.11.0


