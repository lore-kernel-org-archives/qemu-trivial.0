Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gqrEO-0007b8-1B
	for mharc-qemu-trivial@gnu.org; Mon, 04 Feb 2019 22:17:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42755)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gqrEL-0007aV-Rh
	for qemu-trivial@nongnu.org; Mon, 04 Feb 2019 22:17:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gqr6R-0002eN-BV
	for qemu-trivial@nongnu.org; Mon, 04 Feb 2019 22:08:53 -0500
Received: from mx1.redhat.com ([209.132.183.28]:38250)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gqr6L-0002b5-8t; Mon, 04 Feb 2019 22:08:45 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A3C378666F;
	Tue,  5 Feb 2019 03:08:36 +0000 (UTC)
Received: from thuth.com (ovpn-116-65.phx2.redhat.com [10.3.116.65])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4D64B60CCE;
	Tue,  5 Feb 2019 03:08:35 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>,
	qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	=?UTF-8?q?K=C5=91v=C3=A1g=C3=B3=20Zolt=C3=A1n?= <dirty.ice.hu@gmail.com>
Date: Tue,  5 Feb 2019 04:08:21 +0100
Message-Id: <1549336101-17623-3-git-send-email-thuth@redhat.com>
In-Reply-To: <1549336101-17623-1-git-send-email-thuth@redhat.com>
References: <1549336101-17623-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Tue, 05 Feb 2019 03:08:36 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 2/2] audio/sdlaudio: Simplify the
 sdl_callback function
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
X-List-Received-Date: Tue, 05 Feb 2019 03:17:02 -0000

At the end of the while-loop, either "samples" or "sdl->live" is zero, so
now that we've removed the semaphore code, the content of the while-loop
is always only executed once. Thus we can remove the while-loop now to
get rid of one indentation level here.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 audio/sdlaudio.c | 45 +++++++++++++++++++--------------------------
 1 file changed, 19 insertions(+), 26 deletions(-)

diff --git a/audio/sdlaudio.c b/audio/sdlaudio.c
index 53bfdbf..f7ee70b 100644
--- a/audio/sdlaudio.c
+++ b/audio/sdlaudio.c
@@ -189,37 +189,30 @@ static void sdl_callback (void *opaque, Uint8 *buf, int len)
     SDLAudioState *s = &glob_sdl;
     HWVoiceOut *hw = &sdl->hw;
     int samples = len >> hw->info.shift;
+    int to_mix, decr;
 
-    if (s->exit) {
+    if (s->exit || !sdl->live) {
         return;
     }
 
-    while (samples) {
-        int to_mix, decr;
-
-        /* dolog ("in callback samples=%d\n", samples); */
-
-        if (s->exit || !sdl->live) {
-            break;
-        }
-
-        /* dolog ("in callback live=%d\n", live); */
-        to_mix = audio_MIN (samples, sdl->live);
-        decr = to_mix;
-        while (to_mix) {
-            int chunk = audio_MIN (to_mix, hw->samples - hw->rpos);
-            struct st_sample *src = hw->mix_buf + hw->rpos;
-
-            /* dolog ("in callback to_mix %d, chunk %d\n", to_mix, chunk); */
-            hw->clip (buf, src, chunk);
-            hw->rpos = (hw->rpos + chunk) % hw->samples;
-            to_mix -= chunk;
-            buf += chunk << hw->info.shift;
-        }
-        samples -= decr;
-        sdl->live -= decr;
-        sdl->decr += decr;
+    /* dolog ("in callback samples=%d live=%d\n", samples, sdl->live); */
+
+    to_mix = audio_MIN(samples, sdl->live);
+    decr = to_mix;
+    while (to_mix) {
+        int chunk = audio_MIN(to_mix, hw->samples - hw->rpos);
+        struct st_sample *src = hw->mix_buf + hw->rpos;
+
+        /* dolog ("in callback to_mix %d, chunk %d\n", to_mix, chunk); */
+        hw->clip(buf, src, chunk);
+        hw->rpos = (hw->rpos + chunk) % hw->samples;
+        to_mix -= chunk;
+        buf += chunk << hw->info.shift;
     }
+    samples -= decr;
+    sdl->live -= decr;
+    sdl->decr += decr;
+
     /* dolog ("done len=%d\n", len); */
 
     /* SDL2 does not clear the remaining buffer for us, so do it on our own */
-- 
1.8.3.1


