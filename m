Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YqNGt-0002VX-Kl
	for mharc-qemu-trivial@gnu.org; Thu, 07 May 2015 10:59:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51320)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berto@igalia.com>) id 1YqNGr-0002SS-Fw
	for qemu-trivial@nongnu.org; Thu, 07 May 2015 10:59:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berto@igalia.com>) id 1YqNGq-00011v-LY
	for qemu-trivial@nongnu.org; Thu, 07 May 2015 10:59:29 -0400
Received: from smtp3.mundo-r.com ([212.51.32.191]:58965 helo=smtp4.mundo-r.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berto@igalia.com>)
	id 1YqNGm-0000p1-QB; Thu, 07 May 2015 10:59:24 -0400
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AlAPANh8S1VbdWOb/2dsb2JhbABcgwwBIoEPs2QFAQEBAQEBBQGBAgGDBY8VGwWGD4E1TAEBAQEBAWkihSBPTjSIMAHGS4YXiicdghcMQYEzBYwMkHSBJIsNI4Imhz8jYWYBAQiCKGyCRQEBAQ
X-IPAS-Result: AlAPANh8S1VbdWOb/2dsb2JhbABcgwwBIoEPs2QFAQEBAQEBBQGBAgGDBY8VGwWGD4E1TAEBAQEBAWkihSBPTjSIMAHGS4YXiicdghcMQYEzBYwMkHSBJIsNI4Imhz8jYWYBAQiCKGyCRQEBAQ
X-IronPort-AV: E=Sophos;i="5.13,384,1427752800"; d="scan'208";a="358510365"
Received: from fanzine.igalia.com ([91.117.99.155])
	by smtp4.mundo-r.com with ESMTP; 07 May 2015 16:58:47 +0200
Received: from dsl-hkibrasgw4-50df50-128.dhcp.inet.fi ([80.223.80.128]
	helo=perseus.local) by fanzine.igalia.com with esmtpsa 
	(Cipher TLS1.0:RSA_AES_128_CBC_SHA1:16) (Exim)
	id 1YqNGB-0003cX-CA; Thu, 07 May 2015 16:58:47 +0200
Received: from berto by perseus.local with local (Exim 4.85)
	(envelope-from <berto@igalia.com>)
	id 1YqNFx-0003eH-On; Thu, 07 May 2015 17:58:33 +0300
From: Alberto Garcia <berto@igalia.com>
To: qemu-devel@nongnu.org
Date: Thu,  7 May 2015 17:58:26 +0300
Message-Id: <1431010706-13990-1-git-send-email-berto@igalia.com>
X-Mailer: git-send-email 2.1.4
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 212.51.32.191
Cc: qemu-trivial@nongnu.org, Alberto Garcia <berto@igalia.com>,
	Eric Blake <eblake@redhat.com>
Subject: [Qemu-trivial] [PATCH] docs: update BLOCK_IMAGE_CORRUPTED
	documentation
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
X-List-Received-Date: Thu, 07 May 2015 14:59:30 -0000

Label the "size" and "offset" fields in BLOCK_IMAGE_CORRUPTED as
optional, and clarify that the latter refers to the host's offset into
the image.

Signed-off-by: Alberto Garcia <berto@igalia.com>
---
 docs/qmp/qmp-events.txt | 5 +++--
 qapi/block-core.json    | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/docs/qmp/qmp-events.txt b/docs/qmp/qmp-events.txt
index b19e490..64ba46c 100644
--- a/docs/qmp/qmp-events.txt
+++ b/docs/qmp/qmp-events.txt
@@ -43,9 +43,10 @@ Data:
 - "msg":       Informative message (e.g., reason for the corruption)
                (json-string)
 - "offset":    If the corruption resulted from an image access, this
-               is the access offset into the image (json-int)
+               is the host's access offset into the image
+               (json-int, optional)
 - "size":      If the corruption resulted from an image access, this
-               is the access size (json-int)
+               is the access size (json-int, optional)
 
 Example:
 
diff --git a/qapi/block-core.json b/qapi/block-core.json
index dcf7c04..863ffea 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -1847,7 +1847,7 @@
 #       not guaranteed to be stable
 #
 # @offset: #optional, if the corruption resulted from an image access, this is
-#          the access offset into the image
+#          the host's access offset into the image
 #
 # @size: #optional, if the corruption resulted from an image access, this is
 #        the access size
-- 
2.1.4


