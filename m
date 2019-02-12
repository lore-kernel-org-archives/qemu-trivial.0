Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gtYQm-0002R5-DD
	for mharc-qemu-trivial@gnu.org; Tue, 12 Feb 2019 08:49:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45367)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1gtYQk-0002OT-8r
	for qemu-trivial@nongnu.org; Tue, 12 Feb 2019 08:48:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1gtYQj-0007N2-A6
	for qemu-trivial@nongnu.org; Tue, 12 Feb 2019 08:48:58 -0500
Received: from mx1.redhat.com ([209.132.183.28]:35276)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgilbert@redhat.com>)
	id 1gtYQg-00078V-Ks; Tue, 12 Feb 2019 08:48:54 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BD25889C51;
	Tue, 12 Feb 2019 13:48:53 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-116-178.ams2.redhat.com
	[10.36.116.178])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0E40F8490B;
	Tue, 12 Feb 2019 13:48:50 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, pbonzini@redhat.com, kraxel@redhat.com,
	mst@redhat.com
Cc: qemu-trivial@nongnu.org
Date: Tue, 12 Feb 2019 13:47:58 +0000
Message-Id: <20190212134758.10514-5-dgilbert@redhat.com>
In-Reply-To: <20190212134758.10514-1-dgilbert@redhat.com>
References: <20190212134758.10514-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 12 Feb 2019 13:48:53 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 4/4] wavcapture: Convert to error_report
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
X-List-Received-Date: Tue, 12 Feb 2019 13:48:59 -0000

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Kill off a pile of monitor_printf's and cur_mon usage.
The only one left in wavcapture.c is the info case.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 audio/wavcapture.c | 39 +++++++++++++++++----------------------
 1 file changed, 17 insertions(+), 22 deletions(-)

diff --git a/audio/wavcapture.c b/audio/wavcapture.c
index cf31ed652c..cd24570aa7 100644
--- a/audio/wavcapture.c
+++ b/audio/wavcapture.c
@@ -38,30 +38,29 @@ static void wav_destroy (void *opaque)
     uint8_t dlen[4];
     uint32_t datalen =3D wav->bytes;
     uint32_t rifflen =3D datalen + 36;
-    Monitor *mon =3D cur_mon;
=20
     if (wav->f) {
         le_store (rlen, rifflen, 4);
         le_store (dlen, datalen, 4);
=20
         if (fseek (wav->f, 4, SEEK_SET)) {
-            monitor_printf (mon, "wav_destroy: rlen fseek failed\nReason=
: %s\n",
-                            strerror (errno));
+            error_report("wav_destroy: rlen fseek failed: %s",
+                         strerror(errno));
             goto doclose;
         }
         if (fwrite (rlen, 4, 1, wav->f) !=3D 1) {
-            monitor_printf (mon, "wav_destroy: rlen fwrite failed\nReaso=
n %s\n",
-                            strerror (errno));
+            error_report("wav_destroy: rlen fwrite failed: %s",
+                         strerror(errno));
             goto doclose;
         }
         if (fseek (wav->f, 32, SEEK_CUR)) {
-            monitor_printf (mon, "wav_destroy: dlen fseek failed\nReason=
 %s\n",
-                            strerror (errno));
+            error_report("wav_destroy: dlen fseek failed: %s",
+                         strerror(errno));
             goto doclose;
         }
         if (fwrite (dlen, 1, 4, wav->f) !=3D 4) {
-            monitor_printf (mon, "wav_destroy: dlen fwrite failed\nReaso=
n %s\n",
-                            strerror (errno));
+            error_report("wav_destroy: dlen fwrite failed: %s",
+                         strerror(errno));
             goto doclose;
         }
     doclose:
@@ -78,8 +77,7 @@ static void wav_capture (void *opaque, void *buf, int s=
ize)
     WAVState *wav =3D opaque;
=20
     if (fwrite (buf, size, 1, wav->f) !=3D 1) {
-        monitor_printf (cur_mon, "wav_capture: fwrite error\nReason: %s"=
,
-                        strerror (errno));
+        error_report("wav_capture: fwrite error: %s", strerror(errno));
     }
     wav->bytes +=3D size;
 }
@@ -110,7 +108,6 @@ static struct capture_ops wav_capture_ops =3D {
 int wav_start_capture (CaptureState *s, const char *path, int freq,
                        int bits, int nchannels)
 {
-    Monitor *mon =3D cur_mon;
     WAVState *wav;
     uint8_t hdr[] =3D {
         0x52, 0x49, 0x46, 0x46, 0x00, 0x00, 0x00, 0x00, 0x57, 0x41, 0x56=
,
@@ -124,13 +121,13 @@ int wav_start_capture (CaptureState *s, const char =
*path, int freq,
     CaptureVoiceOut *cap;
=20
     if (bits !=3D 8 && bits !=3D 16) {
-        monitor_printf (mon, "incorrect bit count %d, must be 8 or 16\n"=
, bits);
+        error_report("incorrect bit count %d, must be 8 or 16", bits);
         return -1;
     }
=20
     if (nchannels !=3D 1 && nchannels !=3D 2) {
-        monitor_printf (mon, "incorrect channel count %d, must be 1 or 2=
\n",
-                        nchannels);
+        error_report("incorrect channel count %d, must be 1 or 2",
+                     nchannels);
         return -1;
     }
=20
@@ -158,8 +155,8 @@ int wav_start_capture (CaptureState *s, const char *p=
ath, int freq,
=20
     wav->f =3D fopen (path, "wb");
     if (!wav->f) {
-        monitor_printf (mon, "Failed to open wave file `%s'\nReason: %s\=
n",
-                        path, strerror (errno));
+        error_report("Failed to open wave file `%s': %s",
+                     path, strerror(errno));
         g_free (wav);
         return -1;
     }
@@ -170,14 +167,13 @@ int wav_start_capture (CaptureState *s, const char =
*path, int freq,
     wav->freq =3D freq;
=20
     if (fwrite (hdr, sizeof (hdr), 1, wav->f) !=3D 1) {
-        monitor_printf (mon, "Failed to write header\nReason: %s\n",
-                        strerror (errno));
+        error_report("Failed to write header: %s", strerror(errno));
         goto error_free;
     }
=20
     cap =3D AUD_add_capture (&as, &ops, wav);
     if (!cap) {
-        monitor_printf (mon, "Failed to add audio capture\n");
+        error_report("Failed to add audio capture");
         goto error_free;
     }
=20
@@ -189,8 +185,7 @@ int wav_start_capture (CaptureState *s, const char *p=
ath, int freq,
 error_free:
     g_free (wav->path);
     if (fclose (wav->f)) {
-        monitor_printf (mon, "Failed to close wave file\nReason: %s\n",
-                        strerror (errno));
+        error_report("Failed to close wave file: %s", strerror(errno));
     }
     g_free (wav);
     return -1;
--=20
2.20.1


