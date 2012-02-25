Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S1H2J-0004KD-I1
	for mharc-qemu-trivial@gnu.org; Sat, 25 Feb 2012 07:47:39 -0500
Received: from eggs.gnu.org ([208.118.235.92]:44597)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1S1H2B-0003nR-HP
	for qemu-trivial@nongnu.org; Sat, 25 Feb 2012 07:47:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1S1H24-0004Li-Nz
	for qemu-trivial@nongnu.org; Sat, 25 Feb 2012 07:47:31 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:36775)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1S1H1t-0004Jd-Ll; Sat, 25 Feb 2012 07:47:13 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	533D0728009B; Sat, 25 Feb 2012 13:47:12 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id uKHa68ZW+gPZ; Sat, 25 Feb 2012 13:47:11 +0100 (CET)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id DE1A3728009A; Sat, 25 Feb 2012 13:47:11 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial <qemu-trivial@nongnu.org>
Date: Sat, 25 Feb 2012 13:47:09 +0100
Message-Id: <1330174030-21373-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.9
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 78.47.199.172
Cc: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH] Fix spelling in documentation
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
X-List-Received-Date: Sat, 25 Feb 2012 12:47:37 -0000

This fixes a new spelling issue which was detected by codespell.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 include/qemu/object.h |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/include/qemu/object.h b/include/qemu/object.h
index 69e4b7b..dd7f3c0 100644
--- a/include/qemu/object.h
+++ b/include/qemu/object.h
@@ -288,7 +288,7 @@ struct Object
  *   implementing an explicit class type if they are not adding additional
  *   virtual functions.
  * @class_init: This function is called after all parent class initialization
- *   has occured to allow a class to set its default virtual method pointers.  
+ *   has occurred to allow a class to set its default virtual method pointers.
  *   This is also the function to use to override virtual methods from a parent
  *   class.
  * @class_finalize: This function is called during class destruction and is
-- 
1.7.9


