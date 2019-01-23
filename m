Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gmJDM-0004QU-Dy
	for mharc-qemu-trivial@gnu.org; Wed, 23 Jan 2019 09:09:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36654)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gmJDJ-0004N4-M5
	for qemu-trivial@nongnu.org; Wed, 23 Jan 2019 09:09:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gmJDH-00043S-SO
	for qemu-trivial@nongnu.org; Wed, 23 Jan 2019 09:09:09 -0500
Received: from mx1.redhat.com ([209.132.183.28]:49946)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gmJDD-0003yZ-44; Wed, 23 Jan 2019 09:09:03 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 467D8461FF;
	Wed, 23 Jan 2019 14:09:02 +0000 (UTC)
Received: from thuth.com (ovpn-116-107.ams2.redhat.com [10.36.116.107])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6626C6C205;
	Wed, 23 Jan 2019 14:09:01 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Date: Wed, 23 Jan 2019 15:08:53 +0100
Message-Id: <1548252536-6242-2-git-send-email-thuth@redhat.com>
In-Reply-To: <1548252536-6242-1-git-send-email-thuth@redhat.com>
References: <1548252536-6242-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Wed, 23 Jan 2019 14:09:02 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 1/4] COPYING.LIB: Synchronize the LGPL 2.1
 with the version from gnu.org
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
X-List-Received-Date: Wed, 23 Jan 2019 14:09:11 -0000

The current version of the LGPL 2.1 from gnu.org (see the URL
https://www.gnu.org/licenses/old-licenses/lgpl-2.1.txt ) slightly
differs from the old one that we use in our repository. Especially
the recommendation to use "either version 2 of the License, or [...]
any later version" is somewhat misleading, since there was never a
"version 2" of the "Lesser GPL" license - the "version 2" was still
called "Library GPL" instead.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 COPYING.LIB | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/COPYING.LIB b/COPYING.LIB
index 48afc2e..4362b49 100644
--- a/COPYING.LIB
+++ b/COPYING.LIB
@@ -1,8 +1,8 @@
-		  GNU LESSER GENERAL PUBLIC LICENSE
-		       Version 2.1, February 1999
+                  GNU LESSER GENERAL PUBLIC LICENSE
+                       Version 2.1, February 1999
 
  Copyright (C) 1991, 1999 Free Software Foundation, Inc.
-	51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
+ 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
  Everyone is permitted to copy and distribute verbatim copies
  of this license document, but changing it is not allowed.
 
@@ -10,7 +10,7 @@
  as the successor of the GNU Library Public License, version 2, hence
  the version number 2.1.]
 
-			    Preamble
+                            Preamble
 
   The licenses for most software are designed to take away your
 freedom to share and change it.  By contrast, the GNU General Public
@@ -112,7 +112,7 @@ modification follow.  Pay close attention to the difference between a
 former contains code derived from the library, whereas the latter must
 be combined with the library in order to run.
 
-		  GNU LESSER GENERAL PUBLIC LICENSE
+                  GNU LESSER GENERAL PUBLIC LICENSE
    TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
 
   0. This License Agreement applies to any software library or other
@@ -146,7 +146,7 @@ such a program is covered only if its contents constitute a work based
 on the Library (independent of the use of the Library in a tool for
 writing it).  Whether that is true depends on what the Library does
 and what the program that uses the Library does.
-  
+
   1. You may copy and distribute verbatim copies of the Library's
 complete source code as you receive it, in any medium, provided that
 you conspicuously and appropriately publish on each copy an
@@ -432,7 +432,7 @@ decision will be guided by the two goals of preserving the free status
 of all derivatives of our free software and of promoting the sharing
 and reuse of software generally.
 
-			    NO WARRANTY
+                            NO WARRANTY
 
   15. BECAUSE THE LIBRARY IS LICENSED FREE OF CHARGE, THERE IS NO
 WARRANTY FOR THE LIBRARY, TO THE EXTENT PERMITTED BY APPLICABLE LAW.
@@ -455,7 +455,7 @@ FAILURE OF THE LIBRARY TO OPERATE WITH ANY OTHER SOFTWARE), EVEN IF
 SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH
 DAMAGES.
 
-		     END OF TERMS AND CONDITIONS
+                     END OF TERMS AND CONDITIONS
 
            How to Apply These Terms to Your New Libraries
 
@@ -476,7 +476,7 @@ convey the exclusion of warranty; and each file should have at least the
     This library is free software; you can redistribute it and/or
     modify it under the terms of the GNU Lesser General Public
     License as published by the Free Software Foundation; either
-    version 2 of the License, or (at your option) any later version.
+    version 2.1 of the License, or (at your option) any later version.
 
     This library is distributed in the hope that it will be useful,
     but WITHOUT ANY WARRANTY; without even the implied warranty of
@@ -485,7 +485,7 @@ convey the exclusion of warranty; and each file should have at least the
 
     You should have received a copy of the GNU Lesser General Public
     License along with this library; if not, write to the Free Software
-    Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
+    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 
 Also add information on how to contact you by electronic and paper mail.
 
@@ -500,5 +500,3 @@ necessary.  Here is a sample; alter the names:
   Ty Coon, President of Vice
 
 That's all there is to it!
-
-
-- 
1.8.3.1


