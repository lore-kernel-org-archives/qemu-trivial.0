Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VQkeT-0002iL-BY
	for mharc-qemu-trivial@gnu.org; Mon, 30 Sep 2013 17:05:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57993)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VQkeP-0002cl-4Y
	for qemu-trivial@nongnu.org; Mon, 30 Sep 2013 17:05:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VQkeK-0001hr-C2
	for qemu-trivial@nongnu.org; Mon, 30 Sep 2013 17:05:05 -0400
Received: from qemu.weilnetz.de ([2a03:4000:2:362::1]:51967
	helo=v2201305906712890.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VQkeF-0001go-3v; Mon, 30 Sep 2013 17:04:55 -0400
Received: by v2201305906712890.yourvserver.net (Postfix, from userid 1000)
	id 0341317F939; Mon, 30 Sep 2013 23:04:50 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel <qemu-devel@nongnu.org>
Date: Mon, 30 Sep 2013 23:04:49 +0200
Message-Id: <1380575089-11408-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a03:4000:2:362::1
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Stefan Weil <sw@weilnetz.de>,
	Gerd Hoffmann <kraxel@redhat.com>, Anthony Liguori <anthony@codemonkey.ws>,
	qemu-stable <qemu-stable@nongnu.org>
Subject: [Qemu-trivial] [PATCH] qemu-char: Fix potential out of bounds
	access to local arrays
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
X-List-Received-Date: Mon, 30 Sep 2013 21:05:07 -0000

Latest gcc-4.8 supports a new option -fsanitize=address which activates
an AddressSanitizer. This AddressSanitizer stops the QEMU system emulation
very early because two character arrays of size 8 are potentially written
with 9 bytes.

Commit 6ea314d91439741e95772dfbab98b4135e04bebb added the code.

There is no obvious reason why width or height could need 8 characters,
so reduce it to 7 characters which together with the terminating '\0'
fit into the arrays.

Cc: qemu-stable <qemu-stable@nongnu.org>
Signed-off-by: Stefan Weil <sw@weilnetz.de>
---

This is not a critical error because only other local variables can be
overwritten with a null byte, but the fix is also very simple, so maybe
this is a candidate for qemu-stable (1.5 and 1.6?).

Regards,
Stefan

 qemu-char.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/qemu-char.c b/qemu-char.c
index f7f5464..6d393e6 100644
--- a/qemu-char.c
+++ b/qemu-char.c
@@ -2989,11 +2989,11 @@ QemuOpts *qemu_chr_parse_compat(const char *label, const char *filename)
     if (strstart(filename, "vc", &p)) {
         qemu_opt_set(opts, "backend", "vc");
         if (*p == ':') {
-            if (sscanf(p+1, "%8[0-9]x%8[0-9]", width, height) == 2) {
+            if (sscanf(p+1, "%7[0-9]x%7[0-9]", width, height) == 2) {
                 /* pixels */
                 qemu_opt_set(opts, "width", width);
                 qemu_opt_set(opts, "height", height);
-            } else if (sscanf(p+1, "%8[0-9]Cx%8[0-9]C", width, height) == 2) {
+            } else if (sscanf(p+1, "%7[0-9]Cx%7[0-9]C", width, height) == 2) {
                 /* chars */
                 qemu_opt_set(opts, "cols", width);
                 qemu_opt_set(opts, "rows", height);
-- 
1.7.10.4


