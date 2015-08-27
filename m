Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZUxG8-0007B8-5W
	for mharc-qemu-trivial@gnu.org; Thu, 27 Aug 2015 09:30:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50604)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1ZUujw-0000Ve-Ga
	for qemu-trivial@nongnu.org; Thu, 27 Aug 2015 06:49:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1ZUujv-0008Mb-Kr
	for qemu-trivial@nongnu.org; Thu, 27 Aug 2015 06:49:04 -0400
Received: from mail-wi0-x22d.google.com ([2a00:1450:400c:c05::22d]:38877)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>)
	id 1ZUujq-0008Ja-74; Thu, 27 Aug 2015 06:48:58 -0400
Received: by wicgk12 with SMTP id gk12so5020599wic.1;
	Thu, 27 Aug 2015 03:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=AFIjSd50ceR3Ew7cva0leNWUD6XQciAZaU5x6I6iHNc=;
	b=REvouoazj6VfvazvzD5w3BRyKeAd9Xm7QxglBw+Wr3rEfswEFjJopXEZ3eqq+Mhipa
	PwstJM2jzb3VhcTIl2OQVsrdFRIRrVQyrseKs9pG6oCm1e8wQyEu7vDu3K4twhLea6r5
	PirlboTseMXg2uoA51bmv/b/6ZktucZZ97MgxxiDaryWKDajeemKYROAwGu1sE7WMCVI
	dAzgrmvoqAz/r2Lsh/piUqErGN2p5YnZ5SBIFeguBTYhWTHeI5nqabaYSULFq6m9Ym0f
	Ibxn6k4TiTiFym2tUIicj/YSV5ev6GEvXF75XDSRZOKSi5Yy2tDeciKhHdLjdgZ9t2S7
	gdNg==
X-Received: by 10.180.74.167 with SMTP id u7mr17729030wiv.44.1440672537448;
	Thu, 27 Aug 2015 03:48:57 -0700 (PDT)
Received: from localhost ([149.6.167.210])
	by smtp.gmail.com with ESMTPSA id i1sm2449928wjq.42.2015.08.27.03.48.56
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Aug 2015 03:48:56 -0700 (PDT)
Sender: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Date: Thu, 27 Aug 2015 12:48:35 +0200
Message-Id: <1440672515-19053-1-git-send-email-marcandre.lureau@redhat.com>
X-Mailer: git-send-email 2.4.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::22d
X-Mailman-Approved-At: Thu, 27 Aug 2015 09:30:27 -0400
Cc: qemu-trivial@nongnu.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [Qemu-trivial] [PATCH] docs: fix a qga/qapi-schema.json comment
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
X-List-Received-Date: Thu, 27 Aug 2015 10:49:05 -0000

From: Marc-André Lureau <marcandre.lureau@redhat.com>

For consistency with the rest of the comment blocks.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 qga/qapi-schema.json | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/qga/qapi-schema.json b/qga/qapi-schema.json
index 6b0bd16..82894c6 100644
--- a/qga/qapi-schema.json
+++ b/qga/qapi-schema.json
@@ -12,6 +12,7 @@
 ##
 
 ##
+# @guest-sync-delimited:
 #
 # Echo back a unique integer value, and prepend to response a
 # leading sentinel byte (0xFF) the client can check scan for.
@@ -41,7 +42,7 @@
 # Returns: The unique integer id passed in by the client
 #
 # Since: 1.1
-# ##
+##
 { 'command': 'guest-sync-delimited',
   'data':    { 'id': 'int' },
   'returns': 'int' }
-- 
2.4.3


