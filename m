Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RVWTo-0003Ed-VL
	for mharc-qemu-trivial@gnu.org; Tue, 29 Nov 2011 17:48:48 -0500
Received: from eggs.gnu.org ([140.186.70.92]:36952)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdroth@linux.vnet.ibm.com>) id 1RVWTj-0002ru-4j
	for qemu-trivial@nongnu.org; Tue, 29 Nov 2011 17:48:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mdroth@linux.vnet.ibm.com>) id 1RVWTe-0005on-FD
	for qemu-trivial@nongnu.org; Tue, 29 Nov 2011 17:48:42 -0500
Received: from mout.perfora.net ([74.208.4.194]:56767)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdroth@linux.vnet.ibm.com>)
	id 1RVWTe-0005oV-86; Tue, 29 Nov 2011 17:48:38 -0500
Received: from illuin.austin.ibm.com ([32.97.110.59])
	by mrelay.perfora.net (node=mrus4) with ESMTP (Nemesis)
	id 0MN1aS-1RTLg93xLk-006wVN; Tue, 29 Nov 2011 17:48:14 -0500
From: Michael Roth <mdroth@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Date: Tue, 29 Nov 2011 16:47:48 -0600
Message-Id: <1322606869-25865-1-git-send-email-mdroth@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <4ED3F1C3.4060601@weilnetz.de>
References: <4ED3F1C3.4060601@weilnetz.de>
X-Provags-ID: V02:K0:7/Gl/xx7lBBBQK7hkaLBdKwz8FA2LB+qokDKo/QtkF7
	bL1FbRiif/8t9B+nKpbKis0D+djaE+u72Wf56XISJV59Sv5Asa
	BRCZvZxQzfTWi+NYQbo3NHPQXUBYY7FAiv2K7xZjYFU1QKF7mz
	BDlg2keszwyAhsZynN7sr1nwkLIgaTPWYQFmUhTYe6GFAQz2iK
	SXNtpAMt500OJYgFWBgAD8CtnOqfnYymw91a9d7TbII2lOMGSy
	7KersAwBUiGetp67cQEY9tQw0rEOoqXgKAyZyIkI95xCaSIwtt
	2bwx5nt/anBbmP0LrEKnZX/QxlBpt8Ik6En62oRNb4VI2X7Raf
	KRsE9wob1ORAp7M7tNQd/CKELhGVYCKhwPZ3RCqB6PLEb4r/ZV
	vFjBHJpnWvFTwmxM/6h3qpdo+oZtZpapnc=
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.208.4.194
Cc: qemu-trivial@nongnu.org, sw@weilnetz.de, stefano.stabellini@eu.citrix.com
Subject: [Qemu-trivial] [PATCH 1/2] qapi: fix guardname generation
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
X-List-Received-Date: Tue, 29 Nov 2011 22:48:47 -0000

Fix a bug in handling dotted paths, and exclude directory prefixes
from generated guardnames to avoid odd/pseudo-random guardnames in
generated headers.
---
 scripts/qapi.py |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/scripts/qapi.py b/scripts/qapi.py
index 5299976..6e05469 100644
--- a/scripts/qapi.py
+++ b/scripts/qapi.py
@@ -200,6 +200,7 @@ def basename(filename):
     return filename.split("/")[-1]
 
 def guardname(filename):
-    if filename.startswith('./'):
-        filename = filename[2:]
-    return filename.replace("/", "_").replace("-", "_").split(".")[0].upper() + '_H'
+    guard = basename(filename).rsplit(".", 1)[0]
+    for substr in [".", " ", "-"]:
+        guard = guard.replace(substr, "_")
+    return guard.upper() + '_H'
-- 
1.7.4.1


