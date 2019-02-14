Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1guEYz-0002TC-DA
	for mharc-qemu-trivial@gnu.org; Thu, 14 Feb 2019 05:48:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50311)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1guEYn-0002JD-Q7
	for qemu-trivial@nongnu.org; Thu, 14 Feb 2019 05:48:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1guEYj-0002kl-QL
	for qemu-trivial@nongnu.org; Thu, 14 Feb 2019 05:48:05 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:42293)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1guEYj-0002VK-C4; Thu, 14 Feb 2019 05:48:01 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1MX00X-1ga9NL2AtF-00XKox; Thu, 14 Feb 2019 11:47:46 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
	kvm@vger.kernel.org, libvir-list@redhat.com,
	"Michael S. Tsirkin" <mst@redhat.com>, Eric Blake <eblake@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-trivial@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
	Kamil Rytarowski <kamil@netbsd.org>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Gerd Hoffmann <kraxel@gmail.com>
Date: Thu, 14 Feb 2019 11:47:14 +0100
Message-Id: <20190214104717.3543-12-laurent@vivier.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190214104717.3543-1-laurent@vivier.eu>
References: <20190214104717.3543-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:d+kNLakKyr+Vr+dBEmmNfauzVYZSbZwhd6bUBwfm1SgYlljxwXL
	pM5b0w26z+dQtOJSwbYI12ZZ04mhHq6xJODKScFzr7iZsJQrzNDGfHiEcFmIIozvBROjVqb
	95eGF0NzTt17p6pwp4VIAsFPgj5h2wa9xF18vMwwim/g4p0W3dGYGVYk4SUez110h4WSuHL
	pm8JqutBZOs/qPrt+TKOQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:iwLeW2vOwPc=:z6DP5FR9UkIL0fAHw2nB0I
	HqbrjeSyTWv5QvEV8uXDEhuNrE8Vy4F4O9cqehk5C+5HIbAbV8LZZlD/DdaARKQzTu1y0bga0
	PXz0Yek7M86qLBqltRFvX8AXxsienT0lyVEH/5lJ2S5PVDhHfTiH1VSM6b3Gu8qTN718pYeBX
	wjmnFdg8f6xxL/pJGSIZrsw2Mn5dFyZQwSANW5obsmlZJRuTKfGJ+vmq+F9ETEilUBnx99sZ8
	R4+XfrxAMVyiw58M/V2z50WEkyYJ4yqUIxuD5MhVW1ztkTkb9dVJaLsG3vQznmRiswY5iMi9Q
	EKZYQv+W+0nbX6XWHNfW89V5gyyqzaGCIit4sQVxIJl0QX1uKVr4KikNhxi12DFMF2JivOkL5
	LznJ0goERbvgTRGrpxnw8EmK+mUxtbGc7gFGv70wTDPXyhViu7qtUxXSF4qCBfwzEuJS5gZOI
	CJc6VBCyiET11Ou6pebSNvwBwgSpvnVd8qWUS7krTiRGdJejPn1T2WGGxo+dDuIPcRWLq+41t
	E8+YMAgb/sXCJXRnG1fP3sKU1txSGq/j9d/FhxW6C/fPmJB8fzxj8QgIINHMdt6sOscEhFkfv
	0RIuJWhUUoQCzRrsDmgbKPZeIQ0EI1HwkvMtPEZadN2EoKMz5IVyeDGjN6g1dSgp6Aljc32bQ
	2nnYldVcuR46JTRAGlLvIo+49vAEI4L7NASTLP/D+hGFrOktEh1hm02hF9N2uDHpkBGK17F79
	tdrjOzdBKGQ+g6sbsk1IZlECx7d3rSHfEQICkw==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.133
Subject: [Qemu-trivial] [PULL 11/14] wavcapture: Convert to error_report
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
X-List-Received-Date: Thu, 14 Feb 2019 10:48:12 -0000

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Kill off a pile of monitor_printf's and cur_mon usage.
The only one left in wavcapture.c is the info case.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Gerd Hoffmann <kraxel@gmail.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20170320173840.3626-3-dgilbert@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 audio/wavcapture.c | 39 +++++++++++++++++----------------------
 1 file changed, 17 insertions(+), 22 deletions(-)

diff --git a/audio/wavcapture.c b/audio/wavcapture.c
index cf31ed652c2b..cd24570aa70c 100644
--- a/audio/wavcapture.c
+++ b/audio/wavcapture.c
@@ -38,30 +38,29 @@ static void wav_destroy (void *opaque)
     uint8_t dlen[4];
     uint32_t datalen = wav->bytes;
     uint32_t rifflen = datalen + 36;
-    Monitor *mon = cur_mon;
 
     if (wav->f) {
         le_store (rlen, rifflen, 4);
         le_store (dlen, datalen, 4);
 
         if (fseek (wav->f, 4, SEEK_SET)) {
-            monitor_printf (mon, "wav_destroy: rlen fseek failed\nReason: %s\n",
-                            strerror (errno));
+            error_report("wav_destroy: rlen fseek failed: %s",
+                         strerror(errno));
             goto doclose;
         }
         if (fwrite (rlen, 4, 1, wav->f) != 1) {
-            monitor_printf (mon, "wav_destroy: rlen fwrite failed\nReason %s\n",
-                            strerror (errno));
+            error_report("wav_destroy: rlen fwrite failed: %s",
+                         strerror(errno));
             goto doclose;
         }
         if (fseek (wav->f, 32, SEEK_CUR)) {
-            monitor_printf (mon, "wav_destroy: dlen fseek failed\nReason %s\n",
-                            strerror (errno));
+            error_report("wav_destroy: dlen fseek failed: %s",
+                         strerror(errno));
             goto doclose;
         }
         if (fwrite (dlen, 1, 4, wav->f) != 4) {
-            monitor_printf (mon, "wav_destroy: dlen fwrite failed\nReason %s\n",
-                            strerror (errno));
+            error_report("wav_destroy: dlen fwrite failed: %s",
+                         strerror(errno));
             goto doclose;
         }
     doclose:
@@ -78,8 +77,7 @@ static void wav_capture (void *opaque, void *buf, int size)
     WAVState *wav = opaque;
 
     if (fwrite (buf, size, 1, wav->f) != 1) {
-        monitor_printf (cur_mon, "wav_capture: fwrite error\nReason: %s",
-                        strerror (errno));
+        error_report("wav_capture: fwrite error: %s", strerror(errno));
     }
     wav->bytes += size;
 }
@@ -110,7 +108,6 @@ static struct capture_ops wav_capture_ops = {
 int wav_start_capture (CaptureState *s, const char *path, int freq,
                        int bits, int nchannels)
 {
-    Monitor *mon = cur_mon;
     WAVState *wav;
     uint8_t hdr[] = {
         0x52, 0x49, 0x46, 0x46, 0x00, 0x00, 0x00, 0x00, 0x57, 0x41, 0x56,
@@ -124,13 +121,13 @@ int wav_start_capture (CaptureState *s, const char *path, int freq,
     CaptureVoiceOut *cap;
 
     if (bits != 8 && bits != 16) {
-        monitor_printf (mon, "incorrect bit count %d, must be 8 or 16\n", bits);
+        error_report("incorrect bit count %d, must be 8 or 16", bits);
         return -1;
     }
 
     if (nchannels != 1 && nchannels != 2) {
-        monitor_printf (mon, "incorrect channel count %d, must be 1 or 2\n",
-                        nchannels);
+        error_report("incorrect channel count %d, must be 1 or 2",
+                     nchannels);
         return -1;
     }
 
@@ -158,8 +155,8 @@ int wav_start_capture (CaptureState *s, const char *path, int freq,
 
     wav->f = fopen (path, "wb");
     if (!wav->f) {
-        monitor_printf (mon, "Failed to open wave file `%s'\nReason: %s\n",
-                        path, strerror (errno));
+        error_report("Failed to open wave file `%s': %s",
+                     path, strerror(errno));
         g_free (wav);
         return -1;
     }
@@ -170,14 +167,13 @@ int wav_start_capture (CaptureState *s, const char *path, int freq,
     wav->freq = freq;
 
     if (fwrite (hdr, sizeof (hdr), 1, wav->f) != 1) {
-        monitor_printf (mon, "Failed to write header\nReason: %s\n",
-                        strerror (errno));
+        error_report("Failed to write header: %s", strerror(errno));
         goto error_free;
     }
 
     cap = AUD_add_capture (&as, &ops, wav);
     if (!cap) {
-        monitor_printf (mon, "Failed to add audio capture\n");
+        error_report("Failed to add audio capture");
         goto error_free;
     }
 
@@ -189,8 +185,7 @@ int wav_start_capture (CaptureState *s, const char *path, int freq,
 error_free:
     g_free (wav->path);
     if (fclose (wav->f)) {
-        monitor_printf (mon, "Failed to close wave file\nReason: %s\n",
-                        strerror (errno));
+        error_report("Failed to close wave file: %s", strerror(errno));
     }
     g_free (wav);
     return -1;
-- 
2.20.1


