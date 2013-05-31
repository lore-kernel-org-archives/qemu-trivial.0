Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UiLoZ-0002gq-Ik
	for mharc-qemu-trivial@gnu.org; Fri, 31 May 2013 05:40:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50164)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thomas@schwinge.name>) id 1UiLoW-0002cO-Ef
	for qemu-trivial@nongnu.org; Fri, 31 May 2013 05:40:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thomas@schwinge.name>) id 1UiLoV-0006bm-6G
	for qemu-trivial@nongnu.org; Fri, 31 May 2013 05:40:00 -0400
Received: from smtprelay01.ispgateway.de ([80.67.31.39]:57700)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thomas@schwinge.name>) id 1UiLoV-0006bS-0F
	for qemu-trivial@nongnu.org; Fri, 31 May 2013 05:39:59 -0400
Received: from [217.84.5.141] (helo=stokes.schwinge.homeip.net)
	by smtprelay01.ispgateway.de with esmtpa (Exim 4.68)
	(envelope-from <thomas@schwinge.name>) id 1UiLoT-0007yc-1w
	for qemu-trivial@nongnu.org; Fri, 31 May 2013 11:39:57 +0200
Received: (qmail 910 invoked from network); 31 May 2013 09:39:39 -0000
Received: from feldtkeller.schwinge.homeip.net (192.168.111.172)
	by stokes.schwinge.homeip.net with QMQP; 31 May 2013 09:39:39 -0000
Received: (nullmailer pid 17722 invoked by uid 1000);
	Fri, 31 May 2013 09:39:28 -0000
From: Thomas Schwinge <thomas@codesourcery.com>
To: qemu-devel@nongnu.org
Date: Fri, 31 May 2013 11:39:14 +0200
Message-Id: <1369993154-17690-1-git-send-email-thomas@codesourcery.com>
X-Mailer: git-send-email 1.7.10.4
X-Df-Sender: dGhvbWFzQHNjaHdpbmdlLm5hbWU=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 80.67.31.39
Cc: qemu-trivial@nongnu.org, Thomas Schwinge <thomas@codesourcery.com>
Subject: [Qemu-trivial] [PATCH] fpu: Simplify floatx80ToCommonNaN function.
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
X-List-Received-Date: Fri, 31 May 2013 09:40:01 -0000

Signed-off-by: Thomas Schwinge <thomas@codesourcery.com>
---
 fpu/softfloat-specialize.h |   15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git fpu/softfloat-specialize.h fpu/softfloat-specialize.h
index 518f694..83add1a 100644
--- fpu/softfloat-specialize.h
+++ fpu/softfloat-specialize.h
@@ -934,15 +934,14 @@ static commonNaNT floatx80ToCommonNaN( floatx80 a STATUS_PARAM)
     commonNaNT z;
 
     if ( floatx80_is_signaling_nan( a ) ) float_raise( float_flag_invalid STATUS_VAR);
-    if ( a.low >> 63 ) {
-        z.sign = a.high >> 15;
-        z.low = 0;
-        z.high = a.low << 1;
-    } else {
-        z.sign = floatx80_default_nan_high >> 15;
-        z.low = 0;
-        z.high = floatx80_default_nan_low << 1;
+    /* Replace a Pseudo NaN with a default NaN.  */
+    if (!(a.low >> 63)) {
+        a.low = floatx80_default_nan_low;
+        a.high = floatx80_default_nan_high;
     }
+    z.sign = a.high >> 15;
+    z.low = 0;
+    z.high = a.low << 1;
     return z;
 }
 
-- 
1.7.10.4


