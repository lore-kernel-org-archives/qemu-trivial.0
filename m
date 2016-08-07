Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bWBi8-0001Yg-MX
	for mharc-qemu-trivial@gnu.org; Sat, 06 Aug 2016 20:13:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35635)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1bWBi6-0001YC-12
	for qemu-trivial@nongnu.org; Sat, 06 Aug 2016 20:12:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1bWBi2-0005xg-Nj
	for qemu-trivial@nongnu.org; Sat, 06 Aug 2016 20:12:57 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:56567)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1bWBi0-0005vv-9h
	for qemu-trivial@nongnu.org; Sat, 06 Aug 2016 20:12:54 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 441722026B
	for <qemu-trivial@nongnu.org>; Sat,  6 Aug 2016 20:12:37 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
	by compute1.internal (MEProxy); Sat, 06 Aug 2016 20:12:37 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=braap.org; h=date
	:from:message-id:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=
	WLUoFojKIQnOIi3u2tRGUKgxYcY=; b=s5eXilbG+8GL8boHei/b7kxpK1Wtpl9f
	l5xTVzInMYD5XQVk88+s59Zyjfth4QomBLtJlgeubljBdCGFXc4awEYIuMIy6gXQ
	PPikyZJ3GCPd/oZ7HV6yKUcZbuJZQgH4n7eWbx9UsbzoEwVTJjXXuQJfg4td6Y0h
	PjAZLspPHMo=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=date:from:message-id:subject:to
	:x-sasl-enc:x-sasl-enc; s=smtpout; bh=WLUoFojKIQnOIi3u2tRGUKgxYc
	Y=; b=haE17QFgLFz3FcaK0+dyNFoQvAkMrFf1paFdOaQjpNjnndgIF6tho/PPlm
	35AZwDiOXRjGjq5Y/ismYVFMhZsv/fLuffQVHVYKJUZ7Y9SrWr5OyN7oNidr/tZb
	pF4PQFJv0mi8pW4BfVDAuxRvbIlntKyIPHTtYOzoxT8tshG1w=
X-Sasl-enc: STg/qDQVkqgBxPI+EtJqhOEKRPZ8NDvgzRGqsXRIsxek 1470528756
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id E7ED8CCDCB
	for <qemu-trivial@nongnu.org>; Sat,  6 Aug 2016 20:12:36 -0400 (EDT)
From: "Emilio G. Cota" <cota@braap.org>
To: qemu-trivial@nongnu.org
Date: Sat,  6 Aug 2016 20:12:36 -0400
Message-Id: <1470528756-12764-1-git-send-email-cota@braap.org>
X-Mailer: git-send-email 2.5.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.111.4.26
Subject: [Qemu-trivial] [PATCH] qht: trivial: s/sucess/success/ in
 documentation
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
X-List-Received-Date: Sun, 07 Aug 2016 00:12:59 -0000

Signed-off-by: Emilio G. Cota <cota@braap.org>
---
 include/qemu/qht.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/qemu/qht.h b/include/qemu/qht.h
index 70bfc68..98045f1 100644
--- a/include/qemu/qht.h
+++ b/include/qemu/qht.h
@@ -69,7 +69,7 @@ void qht_destroy(struct qht *ht);
  * Attempting to insert a NULL @p is a bug.
  * Inserting the same pointer @p with different @hash values is a bug.
  *
- * Returns true on sucess.
+ * Returns true on success.
  * Returns false if the @p-@hash pair already exists in the hash table.
  */
 bool qht_insert(struct qht *ht, void *p, uint32_t hash);
-- 
2.5.0


