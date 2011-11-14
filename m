Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RQ2Ev-0006d5-Lj
	for mharc-qemu-trivial@gnu.org; Mon, 14 Nov 2011 14:30:45 -0500
Received: from eggs.gnu.org ([140.186.70.92]:57631)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1RQ2Es-0006QO-29
	for qemu-trivial@nongnu.org; Mon, 14 Nov 2011 14:30:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1RQ2Eq-0003dH-Ue
	for qemu-trivial@nongnu.org; Mon, 14 Nov 2011 14:30:41 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:33858)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1RQ2Eo-0003cY-EU; Mon, 14 Nov 2011 14:30:38 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	C32F372825C8; Mon, 14 Nov 2011 20:30:23 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id s4vmQ7QrzJ4H; Mon, 14 Nov 2011 20:30:03 +0100 (CET)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 5A6EB72825F4; Mon, 14 Nov 2011 20:30:03 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Date: Mon, 14 Nov 2011 20:29:57 +0100
Message-Id: <1321298997-20673-2-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1321298997-20673-1-git-send-email-sw@weilnetz.de>
References: <1321298997-20673-1-git-send-email-sw@weilnetz.de>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Anthony Liguori <aliguori@us.ibm.com>
Subject: [Qemu-trivial] [PATCH 1.0 2/2] Fix some spelling bugs in
	documentation and comments
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
X-List-Received-Date: Mon, 14 Nov 2011 19:30:43 -0000

These errors were detected by codespell:

remaing -> remaining
soley -> solely
virutal -> virtual
seperate -> separate

libcacard.txt still needs some more patches.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 block-migration.c      |    2 +-
 docs/libcacard.txt     |    6 +++---
 docs/qapi-code-gen.txt |    2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/block-migration.c b/block-migration.c
index 0bff075..5f10486 100644
--- a/block-migration.c
+++ b/block-migration.c
@@ -521,7 +521,7 @@ static int is_stage2_completed(void)
 
         if ((remaining_dirty / bwidth) <=
             migrate_max_downtime()) {
-            /* finish stage2 because we think that we can finish remaing work
+            /* finish stage2 because we think that we can finish remaining work
                below max_downtime */
 
             return 1;
diff --git a/docs/libcacard.txt b/docs/libcacard.txt
index ae010d2..296706a 100644
--- a/docs/libcacard.txt
+++ b/docs/libcacard.txt
@@ -281,7 +281,7 @@ create card responses.
         VCardResponse *vcard_make_response(VCard7816Status status);
 
     This is the most basic function to get a response. This function will
-    return a response the consists soley one 2 byte status code. If that status
+    return a response the consists solely one 2 byte status code. If that status
     code is defined in card_7816t.h, then this function is guarrenteed to
     return a response with that status. If a cart type specific status code
     is passed and vcard_make_response fails to allocate the appropriate memory
@@ -327,7 +327,7 @@ and applet.
 
         int vcard_emul_get_login_count(VCard *card);
 
-    This function returns the the number of remaing login attempts for this
+    This function returns the the number of remaining login attempts for this
     card. If the card emulator does not know, or the card does not have a
     way of giving this information, this function returns -1.
 
@@ -373,7 +373,7 @@ functions:
 
   The options structure is built by another function in the virtual card
   interface where a string of virtual card emulator specific strings are
-  mapped to the options. The actual structure is defined by the virutal card
+  mapped to the options. The actual structure is defined by the virtual card
   emulator and is used to determine the configuration of soft cards, or to
   determine which physical cards to present to the guest.
 
diff --git a/docs/qapi-code-gen.txt b/docs/qapi-code-gen.txt
index c0a9325..5831e37 100644
--- a/docs/qapi-code-gen.txt
+++ b/docs/qapi-code-gen.txt
@@ -14,7 +14,7 @@ To map QMP-defined interfaces to the native C QAPI implementations,
 a JSON-based schema is used to define types and function
 signatures, and a set of scripts is used to generate types/signatures,
 and marshaling/dispatch code. The QEMU Guest Agent also uses these
-scripts, paired with a seperate schema, to generate
+scripts, paired with a separate schema, to generate
 marshaling/dispatch code for the guest agent server running in the
 guest.
 
-- 
1.7.2.5


