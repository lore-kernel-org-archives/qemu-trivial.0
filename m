Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZrpY9-0004wP-8m
	for mharc-qemu-trivial@gnu.org; Thu, 29 Oct 2015 11:55:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52358)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1ZrpY2-0004nH-UJ
	for qemu-trivial@nongnu.org; Thu, 29 Oct 2015 11:55:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1ZrpY1-0007XZ-Ie
	for qemu-trivial@nongnu.org; Thu, 29 Oct 2015 11:55:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40539)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1ZrpXx-0007Ve-Bn; Thu, 29 Oct 2015 11:55:25 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id 01AACAB1;
	Thu, 29 Oct 2015 15:55:24 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-44.ams2.redhat.com
	[10.36.116.44])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t9TFtMJe012175
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 29 Oct 2015 11:55:24 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 6B57F303F16C; Thu, 29 Oct 2015 16:55:22 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 29 Oct 2015 16:55:20 +0100
Message-Id: <1446134122-32292-3-git-send-email-armbru@redhat.com>
In-Reply-To: <1446134122-32292-1-git-send-email-armbru@redhat.com>
References: <1446134122-32292-1-git-send-email-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, kraxel@redhat.com
Subject: [Qemu-trivial] [PATCH v2 2/4] audio: Use g_new() & friends where
	that makes obvious sense
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
X-List-Received-Date: Thu, 29 Oct 2015 15:55:32 -0000

g_new(T, n) is neater than g_malloc(sizeof(T) * n).  It's also safer,
for two reasons.  One, it catches multiplication overflowing size_t.
Two, it returns T * rather than void *, which lets the compiler catch
more type errors.

This commit only touches allocations with size arguments of the form
sizeof(T).  Same Coccinelle semantic patch as in commit b45c03f.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 audio/alsaaudio.c    | 2 +-
 audio/coreaudio.c    | 2 +-
 audio/dsoundaudio.c  | 2 +-
 audio/ossaudio.c     | 2 +-
 audio/paaudio.c      | 2 +-
 audio/wavaudio.c     | 2 +-
 hw/audio/intel-hda.c | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/audio/alsaaudio.c b/audio/alsaaudio.c
index 6315b2d..76813f4 100644
--- a/audio/alsaaudio.c
+++ b/audio/alsaaudio.c
@@ -1125,7 +1125,7 @@ static ALSAConf glob_conf = {
 
 static void *alsa_audio_init (void)
 {
-    ALSAConf *conf = g_malloc(sizeof(ALSAConf));
+    ALSAConf *conf = g_new(ALSAConf, 1);
     *conf = glob_conf;
     return conf;
 }
diff --git a/audio/coreaudio.c b/audio/coreaudio.c
index 6dfd63e..6390ba4 100644
--- a/audio/coreaudio.c
+++ b/audio/coreaudio.c
@@ -504,7 +504,7 @@ static CoreaudioConf glob_conf = {
 
 static void *coreaudio_audio_init (void)
 {
-    CoreaudioConf *conf = g_malloc(sizeof(CoreaudioConf));
+    CoreaudioConf *conf = g_new(CoreaudioConf, 1);
     *conf = glob_conf;
 
     atexit(coreaudio_atexit);
diff --git a/audio/dsoundaudio.c b/audio/dsoundaudio.c
index e9472c1..3949fa4 100644
--- a/audio/dsoundaudio.c
+++ b/audio/dsoundaudio.c
@@ -786,7 +786,7 @@ static void *dsound_audio_init (void)
 {
     int err;
     HRESULT hr;
-    dsound *s = g_malloc0(sizeof(dsound));
+    dsound *s = g_new0(dsound, 1);
 
     s->conf = glob_conf;
     hr = CoInitialize (NULL);
diff --git a/audio/ossaudio.c b/audio/ossaudio.c
index 7dbe333..2614c62 100644
--- a/audio/ossaudio.c
+++ b/audio/ossaudio.c
@@ -848,7 +848,7 @@ static OSSConf glob_conf = {
 
 static void *oss_audio_init (void)
 {
-    OSSConf *conf = g_malloc(sizeof(OSSConf));
+    OSSConf *conf = g_new(OSSConf, 1);
     *conf = glob_conf;
 
     if (access(conf->devpath_in, R_OK | W_OK) < 0 ||
diff --git a/audio/paaudio.c b/audio/paaudio.c
index fea6071..9c498cf 100644
--- a/audio/paaudio.c
+++ b/audio/paaudio.c
@@ -814,7 +814,7 @@ static PAConf glob_conf = {
 
 static void *qpa_audio_init (void)
 {
-    paaudio *g = g_malloc(sizeof(paaudio));
+    paaudio *g = g_new(paaudio, 1);
     g->conf = glob_conf;
     g->mainloop = NULL;
     g->context = NULL;
diff --git a/audio/wavaudio.c b/audio/wavaudio.c
index c586020..f706fae 100644
--- a/audio/wavaudio.c
+++ b/audio/wavaudio.c
@@ -230,7 +230,7 @@ static WAVConf glob_conf = {
 
 static void *wav_audio_init (void)
 {
-    WAVConf *conf = g_malloc(sizeof(WAVConf));
+    WAVConf *conf = g_new(WAVConf, 1);
     *conf = glob_conf;
     return conf;
 }
diff --git a/hw/audio/intel-hda.c b/hw/audio/intel-hda.c
index 433463e..6074c2e 100644
--- a/hw/audio/intel-hda.c
+++ b/hw/audio/intel-hda.c
@@ -467,7 +467,7 @@ static void intel_hda_parse_bdl(IntelHDAState *d, IntelHDAStream *st)
     addr = intel_hda_addr(st->bdlp_lbase, st->bdlp_ubase);
     st->bentries = st->lvi +1;
     g_free(st->bpl);
-    st->bpl = g_malloc(sizeof(bpl) * st->bentries);
+    st->bpl = g_new(bpl, st->bentries);
     for (i = 0; i < st->bentries; i++, addr += 16) {
         pci_dma_read(&d->pci, addr, buf, 16);
         st->bpl[i].addr  = le64_to_cpu(*(uint64_t *)buf);
-- 
2.4.3


