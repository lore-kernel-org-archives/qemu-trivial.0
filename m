Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WopJn-00041q-Uz
	for mharc-qemu-trivial@gnu.org; Mon, 26 May 2014 03:27:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45504)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WopJh-0003nt-FI
	for qemu-trivial@nongnu.org; Mon, 26 May 2014 03:27:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WopJc-0000r5-HN
	for qemu-trivial@nongnu.org; Mon, 26 May 2014 03:27:29 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:38539)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WopJO-0000nN-M5; Mon, 26 May 2014 03:27:10 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id B112442FAA;
	Mon, 26 May 2014 11:27:09 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id A518F6B7;
	Mon, 26 May 2014 11:20:15 +0400 (MSK)
Received: (nullmailer pid 23033 invoked by uid 1000);
	Mon, 26 May 2014 07:20:14 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon, 26 May 2014 11:20:08 +0400
Message-Id: <1401088811-22923-21-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1401088811-22923-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1401088811-22923-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Le Tan <tamlokveer@gmail.com>
Subject: [Qemu-trivial] [PULL 20/23] audio: replace fprintf(stderr,
	...) with error_report() in audio
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
X-List-Received-Date: Mon, 26 May 2014 07:27:34 -0000

From: Le Tan <tamlokveer@gmail.com>

Replace fprintf(stderr,...) with error_report() in files audio/*.
The trailing "\n"s of the @fmt argument have been removed
because @fmt of error_report() should not contain newline.

Signed-off-by: Le Tan <tamlokveer@gmail.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 audio/spiceaudio.c |    2 +-
 audio/wavcapture.c |    3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/audio/spiceaudio.c b/audio/spiceaudio.c
index fceee50..7b79bed 100644
--- a/audio/spiceaudio.c
+++ b/audio/spiceaudio.c
@@ -105,7 +105,7 @@ static int rate_get_samples (struct audio_pcm_info *info, SpiceRateCtl *rate)
     bytes = muldiv64 (ticks, info->bytes_per_second, get_ticks_per_sec ());
     samples = (bytes - rate->bytes_sent) >> info->shift;
     if (samples < 0 || samples > 65536) {
-        fprintf (stderr, "Resetting rate control (%" PRId64 " samples)\n", samples);
+        error_report("Resetting rate control (%" PRId64 " samples)", samples);
         rate_start (rate);
         samples = 0;
     }
diff --git a/audio/wavcapture.c b/audio/wavcapture.c
index 9d94623..6f6d792 100644
--- a/audio/wavcapture.c
+++ b/audio/wavcapture.c
@@ -63,8 +63,7 @@ static void wav_destroy (void *opaque)
         }
     doclose:
         if (fclose (wav->f)) {
-            fprintf (stderr, "wav_destroy: fclose failed: %s",
-                     strerror (errno));
+            error_report("wav_destroy: fclose failed: %s", strerror(errno));
         }
     }
 
-- 
1.7.10.4


