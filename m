Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RQGiq-0005Xu-3l
	for mharc-qemu-trivial@gnu.org; Tue, 15 Nov 2011 05:58:36 -0500
Received: from eggs.gnu.org ([140.186.70.92]:36817)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <matthias.bgg@googlemail.com>) id 1RQGin-0005Xo-DG
	for qemu-trivial@nongnu.org; Tue, 15 Nov 2011 05:58:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <matthias.bgg@googlemail.com>) id 1RQGij-00066A-3a
	for qemu-trivial@nongnu.org; Tue, 15 Nov 2011 05:58:33 -0500
Received: from mail-ww0-f53.google.com ([74.125.82.53]:47027)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <matthias.bgg@googlemail.com>)
	id 1RQGii-00064c-RK; Tue, 15 Nov 2011 05:58:29 -0500
Received: by wwf27 with SMTP id 27so4884241wwf.10
	for <multiple recipients>; Tue, 15 Nov 2011 02:58:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=6CI7yglXt5wb9Se4plw8BN6i48bHo6VzDPkPD/7e0/U=;
	b=rAepBqmiXSkuIGjO1LD03jBl6HerSo6eYDeS2+cEeU9NXUI19IjtlfDEt4K9ly6TdD
	/nHe/qA8BbEaIYHD+KVBdMJfoRRfzTuixk74TaF7xUrArk7yw+IHYZr/iuvK25Go5hZA
	DLtdh3OmrdUSkwupq9igVpvmFFThOWMswrSR0=
Received: by 10.180.92.163 with SMTP id cn3mr29503560wib.26.1321354707295;
	Tue, 15 Nov 2011 02:58:27 -0800 (PST)
Received: from localhost.localdomain ([84.88.50.64])
	by mx.google.com with ESMTPS id fo3sm14081452wib.21.2011.11.15.02.58.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 15 Nov 2011 02:58:26 -0800 (PST)
From: matthias.bgg@googlemail.com
To: qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 15 Nov 2011 11:57:14 +0000
Message-Id: <1321358234-14229-1-git-send-email-matthias.bgg@gmail.com>
X-Mailer: git-send-email 1.7.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 74.125.82.53
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [Qemu-trivial] [PATCH] Fixing some spelling in docs/libcacard.txt
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
X-List-Received-Date: Tue, 15 Nov 2011 10:58:34 -0000

From: Matthias Brugger <matthias.bgg@gmail.com>


Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
---
 docs/libcacard.txt |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/docs/libcacard.txt b/docs/libcacard.txt
index 5dee6fa..576af57 100644
--- a/docs/libcacard.txt
+++ b/docs/libcacard.txt
@@ -170,7 +170,7 @@ public entry point:
                                int cert_count);
 
   The parameters for this are:
-  card       - the virtual card structure which will prepresent this card.
+  card       - the virtual card structure which will represent this card.
   flags      - option flags that may be specific to this card type.
   cert       - array of binary certificates.
   cert_len   - array of lengths of each of the certificates specified in cert.
@@ -179,7 +179,7 @@ public entry point:
   cert_count - number of entries in cert, cert_len, and key arrays.
 
   Any cert, cert_len, or key with the same index are matching sets. That is
-  cert[0] is cert_len[0] long and has the corresponsing private key of key[0].
+  cert[0] is cert_len[0] long and has the corresponding private key of key[0].
 
 The card type emulator is expected to own the VCardKeys, but it should copy
 any raw cert data it wants to save. It can create new applets and add them to
@@ -261,7 +261,7 @@ Prior to processing calling the card type emulator's VCardProcessAPDU function,
    apdu->a_Le   - The expected length of any returned data.
    apdu->a_cla  - The raw apdu class.
    apdu->a_channel - The channel (decoded from the class).
-   apdu->a_secure_messaging_type - The decoded secure messagin type
+   apdu->a_secure_messaging_type - The decoded secure messaging type
                                    (from class).
    apdu->a_type - The decode class type.
    apdu->a_gen_type - the generic class type (7816, PROPRIETARY, RFU, PTS).
@@ -273,7 +273,7 @@ Creating a Response --
 
 The expected result of any APDU call is a response. The card type emulator must
 set *response with an appropriate VCardResponse value if it returns VCARD_DONE.
-Reponses could be as simple as returning a 2 byte status word response, to as
+Responses could be as simple as returning a 2 byte status word response, to as
 complex as returning a block of data along with a 2 byte response. Which is
 returned will depend on the semantics of the APDU. The following functions will
 create card responses.
@@ -282,12 +282,12 @@ create card responses.
 
     This is the most basic function to get a response. This function will
     return a response the consists soley one 2 byte status code. If that status
-    code is defined in card_7816t.h, then this function is guarrenteed to
+    code is defined in card_7816t.h, then this function is guaranteed to
     return a response with that status. If a cart type specific status code
     is passed and vcard_make_response fails to allocate the appropriate memory
     for that response, then vcard_make_response will return a VCardResponse
     of VCARD7816_STATUS_EXC_ERROR_MEMORY. In any case, this function is
-    guarrenteed to return a valid VCardResponse.
+    guaranteed to return a valid VCardResponse.
 
         VCardResponse *vcard_response_new(unsigned char *buf, int len,
                                           VCard7816Status status);
-- 
1.7.1


