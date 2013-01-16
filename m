Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TvWcZ-0001Eu-50
	for mharc-qemu-trivial@gnu.org; Wed, 16 Jan 2013 12:17:51 -0500
Received: from eggs.gnu.org ([208.118.235.92]:54965)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1TvWcS-0000v6-5t
	for qemu-trivial@nongnu.org; Wed, 16 Jan 2013 12:17:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1TvWcP-0004pW-Nn
	for qemu-trivial@nongnu.org; Wed, 16 Jan 2013 12:17:44 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:58601)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1TvWcK-0004oW-9A; Wed, 16 Jan 2013 12:17:36 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	598697280056; Wed, 16 Jan 2013 18:17:35 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id y2hDrYCKZYiP; Wed, 16 Jan 2013 18:17:34 +0100 (CET)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id CED9A7280057; Wed, 16 Jan 2013 18:17:34 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial@nongnu.org
Date: Wed, 16 Jan 2013 18:17:33 +0100
Message-Id: <1358356653-16309-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 78.47.199.172
Cc: Stefan Weil <sw@weilnetz.de>, malc <av1474@comtv.ru>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH] audio: Replace non-portable asprintf in
	debug code by g_strdup_printf
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
X-List-Received-Date: Wed, 16 Jan 2013 17:17:50 -0000

sw->name already uses the correct g_free to free the allocated memory.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 audio/audio.c |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

The patch preserves the special coding style used for audio code.

Regards,
Stefan

diff --git a/audio/audio.c b/audio/audio.c
index 1510b59..02bb886 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -828,8 +828,9 @@ static int audio_attach_capture (HWVoiceOut *hw)
         QLIST_INSERT_HEAD (&hw_cap->sw_head, sw, entries);
         QLIST_INSERT_HEAD (&hw->cap_head, sc, entries);
 #ifdef DEBUG_CAPTURE
-        asprintf (&sw->name, "for %p %d,%d,%d",
-                  hw, sw->info.freq, sw->info.bits, sw->info.nchannels);
+        sw->name = g_strdup_printf ("for %p %d,%d,%d",
+                                    hw, sw->info.freq, sw->info.bits,
+                                    sw->info.nchannels);
         dolog ("Added %s active = %d\n", sw->name, sw->active);
 #endif
         if (sw->active) {
-- 
1.7.10.4


