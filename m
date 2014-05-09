Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WizjN-0002sp-CY
	for mharc-qemu-trivial@gnu.org; Sat, 10 May 2014 01:21:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37672)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <tamlokveer@gmail.com>) id 1WiuaO-00037T-4L
	for qemu-trivial@nongnu.org; Fri, 09 May 2014 19:52:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <tamlokveer@gmail.com>) id 1WiuaF-0001I0-2n
	for qemu-trivial@nongnu.org; Fri, 09 May 2014 19:52:16 -0400
Received: from mail-pa0-x22d.google.com ([2607:f8b0:400e:c03::22d]:44480)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <tamlokveer@gmail.com>)
	id 1WiuZw-0001Er-OF; Fri, 09 May 2014 19:51:48 -0400
Received: by mail-pa0-f45.google.com with SMTP id ey11so5014717pad.4
	for <multiple recipients>; Fri, 09 May 2014 16:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=ktVx3eo370mgx2jbNSPS+TaBH7SoFSiVJh9rE9QNkVA=;
	b=Df12KuYoQSnOhAQAYqf09R44b3Wvcsizuu9dsAuEQ+QxBE409guZvuv2XEju/4jm8Q
	7v3YMU85hrUpJxBZF8+i2dEjEokWGeMK3BzsRToAMsIwfZcwEj3V6TPyAz/qKYrHV3yM
	cvS3/DJtGmAzkUIq5X/0rUm37ZqTjzb/O4U9EteBJCF669/h5w+78PRT5+adH+nv1ZEE
	tyyrNGzWiWSKS83eSGXD4PLD6DRQO2Hg0refmebBcjOJLfAK9QI9pf0FqW+rouR1lEcS
	L8xzGxa6+RV+aSJ5vf4kW0HIGtxDgBAr1hfUjalc+4zSzaLYiT/VdWzzRJBCwT4IFdjN
	DM9g==
X-Received: by 10.66.142.233 with SMTP id rz9mr26069282pab.71.1399679507465;
	Fri, 09 May 2014 16:51:47 -0700 (PDT)
Received: from localhost.localdomain ([162.105.146.101])
	by mx.google.com with ESMTPSA id op3sm9623456pbc.40.2014.05.09.16.51.45
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 09 May 2014 16:51:46 -0700 (PDT)
From: Le Tan <tamlokveer@gmail.com>
To: qemu-devel@nongnu.org
Date: Sat, 10 May 2014 07:55:20 +0800
Message-Id: <859e114fe7fcfbd22eddfb8cde3846662598c564.1399641611.git.tamlokveer@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1399641611.git.tamlokveer@gmail.com>
References: <y>
 <cover.1399641611.git.tamlokveer@gmail.com>
In-Reply-To: <cover.1399641611.git.tamlokveer@gmail.com>
References: <cover.1399641611.git.tamlokveer@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c03::22d
X-Mailman-Approved-At: Sat, 10 May 2014 01:21:52 -0400
Cc: qemu-trivial@nongnu.org, jan.kiszka@web.de, afaerber@suse.de,
	Le Tan <tamlokveer@gmail.com>
Subject: [Qemu-trivial] [PATCH 2/4] audio: replace fprintf(stderr,
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
X-List-Received-Date: Fri, 09 May 2014 23:52:25 -0000

Replace fprintf(stderr,...) with error_report() in files audio/*.
The trailing "\n"s of the @fmt argument have been removed
because @fmt of error_report() should not contain newline.

Signed-off-by: Le Tan <tamlokveer@gmail.com>
---
 audio/spiceaudio.c |    2 +-
 audio/wavcapture.c |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

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
index 9d94623..60f7a72 100644
--- a/audio/wavcapture.c
+++ b/audio/wavcapture.c
@@ -63,8 +63,8 @@ static void wav_destroy (void *opaque)
         }
     doclose:
         if (fclose (wav->f)) {
-            fprintf (stderr, "wav_destroy: fclose failed: %s",
-                     strerror (errno));
+            error_report("wav_destroy: fclose failed: %s",
+                         strerror (errno));
         }
     }
 
-- 
1.7.9.5


