Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aTqKm-00058u-9o
	for mharc-qemu-trivial@gnu.org; Thu, 11 Feb 2016 07:26:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60185)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aTqKi-00050s-4W
	for qemu-trivial@nongnu.org; Thu, 11 Feb 2016 07:26:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aTqKh-0008R7-8M
	for qemu-trivial@nongnu.org; Thu, 11 Feb 2016 07:26:52 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:49564)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1aTqKd-0008LT-5r; Thu, 11 Feb 2016 07:26:47 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id AB98141467;
	Thu, 11 Feb 2016 15:26:45 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id D7CBDAB8;
	Thu, 11 Feb 2016 15:19:06 +0300 (MSK)
Received: (nullmailer pid 11177 invoked by uid 1000);
	Thu, 11 Feb 2016 12:19:04 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 11 Feb 2016 15:18:52 +0300
Message-Id: <b29b47e9b35017428904e0e934700877dfaabe73.1455192968.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1455192968.git.mjt@msgid.tls.msk.ru>
References: <cover.1455192968.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org,
	Christian Liebhardt <christian.liebhardt@keysight.com>,
	Michael Tokarev <mjt@tls.msk.ru>,
	Alistair Francis <alistair.francis@xilinx.com>
Subject: [Qemu-trivial] [PULL 03/14] qom: Correct object_property_get_int()
	description
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
X-List-Received-Date: Thu, 11 Feb 2016 12:26:53 -0000

From: Alistair Francis <alistair.francis@xilinx.com>

The description of object_property_get_int() stated that on an error
it returns NULL. This is not the case and the function will return -1
if an error occurs. Update the commented documentation accordingly.

Reported-By: Christian Liebhardt <christian.liebhardt@keysight.com>
Signed-off-by: Christian Liebhardt <christian.liebhardt@keysight.com>
Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 include/qom/object.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/qom/object.h b/include/qom/object.h
index 698827d..33abce9 100644
--- a/include/qom/object.h
+++ b/include/qom/object.h
@@ -1115,7 +1115,7 @@ void object_property_set_int(Object *obj, int64_t value,
  * @name: the name of the property
  * @errp: returns an error if this function fails
  *
- * Returns: the value of the property, converted to an integer, or NULL if
+ * Returns: the value of the property, converted to an integer, or negative if
  * an error occurs (including when the property value is not an integer).
  */
 int64_t object_property_get_int(Object *obj, const char *name,
-- 
2.1.4


