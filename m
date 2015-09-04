Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZXwrW-0004sw-22
	for mharc-qemu-trivial@gnu.org; Fri, 04 Sep 2015 15:41:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53308)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1ZXwrT-0004pl-DD
	for qemu-trivial@nongnu.org; Fri, 04 Sep 2015 15:41:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1ZXwrS-0005vk-Hs
	for qemu-trivial@nongnu.org; Fri, 04 Sep 2015 15:41:23 -0400
Received: from mail-qg0-x22a.google.com ([2607:f8b0:400d:c04::22a]:33339)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>)
	id 1ZXwrO-0005uZ-CC; Fri, 04 Sep 2015 15:41:18 -0400
Received: by qgev79 with SMTP id v79so24434587qge.0;
	Fri, 04 Sep 2015 12:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=weBNZZ0nh5HSykS49iONfTmvjk7swdTc8TB/p30GIP8=;
	b=QHwbL0GyK8exoFYb8674QqSQhwtBG1I2FcVlQ8yl4Sftz3PfmbBU3rrb+Bqzim4qwy
	IXYrMSrCDFn7BvnoAE/MgmzQbOQD8zyVYRVfunM6aeEhEbQIRw1pb6XBPIzQtT+b02Rk
	xmsvRCD77TH1kOtluBmbOmXOhY/iwpi/Cc3VY88CFjihUqCRF8a89i8hkhAItAkAcbe4
	6TCU9rP5/rBahAbv720U/Rd+7VTj4QPrjT8cM9nG2gS18gM9vZLWVxGwy0F4C3tas+Os
	hkzOmPA7U89aNHCvTJzNuvDPH7CHcB7ms2fH91BKU8HK+zchKSqbfG0KwJXQ8JAD2ZjS
	6JCw==
X-Received: by 10.140.132.133 with SMTP id 127mr8430120qhe.6.1441395677631;
	Fri, 04 Sep 2015 12:41:17 -0700 (PDT)
Received: from localhost (bne75-h02-31-39-163-232.dsl.sta.abo.bbox.fr.
	[31.39.163.232]) by smtp.gmail.com with ESMTPSA id
	g71sm1917260qkh.30.2015.09.04.12.41.15
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 04 Sep 2015 12:41:16 -0700 (PDT)
Sender: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Date: Fri,  4 Sep 2015 21:41:01 +0200
Message-Id: <1441395661-22447-1-git-send-email-marcandre.lureau@redhat.com>
X-Mailer: git-send-email 2.4.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400d:c04::22a
Cc: qemu-trivial@nongnu.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [Qemu-trivial] [PATCH] qapi-schema: remove legacy<> from doc
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
X-List-Received-Date: Fri, 04 Sep 2015 19:41:24 -0000

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The legacy<> type is no longer used since 7ce7ffe02.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 qapi-schema.json | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/qapi-schema.json b/qapi-schema.json
index 67fef37..884d476 100644
--- a/qapi-schema.json
+++ b/qapi-schema.json
@@ -1632,13 +1632,10 @@
 #        1) A primitive type such as 'u8', 'u16', 'bool', 'str', or 'double'.
 #           These types are mapped to the appropriate JSON type.
 #
-#        2) A legacy type in the form 'legacy<subtype>' where subtype is the
-#           legacy qdev typename.  These types are always treated as strings.
-#
-#        3) A child type in the form 'child<subtype>' where subtype is a qdev
+#        2) A child type in the form 'child<subtype>' where subtype is a qdev
 #           device type name.  Child properties create the composition tree.
 #
-#        4) A link type in the form 'link<subtype>' where subtype is a qdev
+#        3) A link type in the form 'link<subtype>' where subtype is a qdev
 #           device type name.  Link properties form the device model graph.
 #
 # Since: 1.2
@@ -1689,10 +1686,10 @@
 #
 # @property: The property name to read
 #
-# Returns: The property value.  The type depends on the property type.  legacy<>
-#          properties are returned as #str.  child<> and link<> properties are
-#          returns as #str pathnames.  All integer property types (u8, u16, etc)
-#          are returned as #int.
+# Returns: The property value.  The type depends on the property
+#          type. child<> and link<> properties are returns as #str
+#          pathnames.  All integer property types (u8, u16, etc) are
+#          returned as #int.
 #
 # Since: 1.2
 ##
-- 
2.4.3


