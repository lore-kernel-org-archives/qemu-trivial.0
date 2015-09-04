Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZXy7J-00017d-Nz
	for mharc-qemu-trivial@gnu.org; Fri, 04 Sep 2015 17:01:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50200)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1ZXy7H-00013j-HV
	for qemu-trivial@nongnu.org; Fri, 04 Sep 2015 17:01:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1ZXy7G-0000wn-QE
	for qemu-trivial@nongnu.org; Fri, 04 Sep 2015 17:01:47 -0400
Received: from mail-qg0-x235.google.com ([2607:f8b0:400d:c04::235]:33758)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>)
	id 1ZXy7A-0000vb-TS; Fri, 04 Sep 2015 17:01:40 -0400
Received: by qgev79 with SMTP id v79so26044831qge.0;
	Fri, 04 Sep 2015 14:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=M2Fyzd7O8uQr4M993F1JDzFtoCF2dU6CGvUUjUcqHl4=;
	b=bZvaRiTSRl9qGa0QnGFjBEvU0+E+99e2QRzjtGhuRm6qEkH0iPXZ6gIuT79sB1ktRW
	bhBmYLD64/03R7xRO/cHHgTQfmiIA3rv7B/8w9j+RpocZGo3MC/mqT+X95SHPBD1aBqv
	VoqyFjKBiLANxSFcUpqbL0gu/9zHV4aYyp15YZcfb0J9LKRk8Drrcr9TMmBiFcKpMG1A
	Ia+uYJQjxZMMnIcPXZoFfoRpVniEBCw0cXIcwPlis/jSCsxcZAJjY0U3npaCXj/7Nn6I
	jFas3EX46iiymCnDIP9Yb86fpGkCinDeZ+kUYUIX/FY187JlYNBeWEsMxxqDaO+V9mA7
	3OfA==
X-Received: by 10.140.86.212 with SMTP id p78mr8187017qgd.25.1441400500401;
	Fri, 04 Sep 2015 14:01:40 -0700 (PDT)
Received: from localhost (bne75-h02-31-39-163-232.dsl.sta.abo.bbox.fr.
	[31.39.163.232]) by smtp.gmail.com with ESMTPSA id
	h107sm2036469qgd.34.2015.09.04.14.01.38
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 04 Sep 2015 14:01:39 -0700 (PDT)
Sender: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Date: Fri,  4 Sep 2015 23:01:25 +0200
Message-Id: <1441400485-29167-1-git-send-email-marcandre.lureau@redhat.com>
X-Mailer: git-send-email 2.4.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400d:c04::235
Cc: qemu-trivial@nongnu.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [Qemu-trivial] [PATCH] qom/object.h: remove some child/parent doc
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
X-List-Received-Date: Fri, 04 Sep 2015 21:01:48 -0000

From: Marc-André Lureau <marcandre.lureau@redhat.com>

It looks like this documentation is obsolete: a child object may lookup
its parent stored in the Object struct.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/qom/object.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/include/qom/object.h b/include/qom/object.h
index 2f95ab3..653699f 100644
--- a/include/qom/object.h
+++ b/include/qom/object.h
@@ -1261,9 +1261,6 @@ Object *object_resolve_path_component(Object *parent, const gchar *part);
  * Child properties form the composition tree.  All objects need to be a child
  * of another object.  Objects can only be a child of one object.
  *
- * There is no way for a child to determine what its parent is.  It is not
- * a bidirectional relationship.  This is by design.
- *
  * The value of a child property as a C string will be the child object's
  * canonical path. It can be retrieved using object_property_get_str().
  * The child object itself can be retrieved using object_property_get_link().
-- 
2.4.3


