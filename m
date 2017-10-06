Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e0cOZ-00073p-QJ
	for mharc-qemu-trivial@gnu.org; Fri, 06 Oct 2017 19:51:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40595)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cOU-00071P-KN
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:51:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cOT-0004pb-MS
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:51:02 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:49199)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cOR-0004oL-63; Fri, 06 Oct 2017 19:50:59 -0400
Received: by mail-qt0-x244.google.com with SMTP id o3so34343209qte.6;
	Fri, 06 Oct 2017 16:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Z3Jl1DU9Qsb1C3WWKK2RM7cka5/FfovhCUGw84Hbmb8=;
	b=g8Wf9LuqMp4BZsAQ4nen86G8O3bZhCgQ5IQJdADukN/9GCSmJTEDZlvBT/9Jho8o2G
	PKnAdwzFwYyJzwWXaCtMxfkFs+pW4DiRGsoWgqM3dOazCnh22x0gMmGjjD6E7850KJuV
	koVmXzZhYaK5Jyvvq5M/i4ukUxvFoKOBJEDnjcFZgtEtXyNYhbkNhvL3nS6tboXc++ZY
	GwT7wLKXCgsSpeTzng8k21ZROyvTuDiXHpcYE0j7WfNg8s8RvcbhzruHaw/BI8yYQK7G
	fD85wF7efDJ1S14rfJts9Uo0I41mRw3ldgT8C+8TDKXuAqZBYGCMwhjePGg7h/3gIFar
	h0Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=Z3Jl1DU9Qsb1C3WWKK2RM7cka5/FfovhCUGw84Hbmb8=;
	b=s0YrBGiAd0gAe3OSpn/USTsrIUuVRskfm1s68Hn5PU7uYUSTeEFWaBFzG4XIuQc+cp
	sNkY//iEV1JpkgqsFR+GcWsvWYd3dzAvEuvj3x8IiQWXoMikbWKvMln9klrOV00Qqoqc
	5b3qY7L3AEJxaHHhLzfZuh77JO3l0Y61N13WWANE+6+6QToLA3d/0ih0GiwdZo4qPpKS
	1lDKXaH4UcJ9w5Hyfo6VpMr/iP0wjzvvM+0DNNOfXQLgYwVGxoh+CFicJgvKIYY/fJP9
	tKKC/4IdyUBLGieXAk+Nk/4bcKYd2oTkL/M4KRgoKNTGmXg9uMQpS5lZo/RjMHd0hg+L
	VQog==
X-Gm-Message-State: AMCzsaXornFAx+CHEQaYUIwLErNDtpiWr4jpt3t21kW08j81g8I2HGWT
	6+L54mae998pZOgJ/kaow/w=
X-Google-Smtp-Source: AOwi7QAZwkl0ZOjcplAKcTrAjyCO0CsZihgj6vP3hKKH3FWRf9WSbtNpTaYtDfpn6v36M6p2KFQtrg==
X-Received: by 10.200.37.8 with SMTP id 8mr5392722qtm.77.1507333858619;
	Fri, 06 Oct 2017 16:50:58 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id g1sm1705226qta.95.2017.10.06.16.50.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Oct 2017 16:50:58 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
	Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	qemu trival <qemu-trivial@nongnu.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Date: Fri,  6 Oct 2017 20:49:02 -0300
Message-Id: <20171006235023.11952-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171006235023.11952-1-f4bug@amsat.org>
References: <20171006235023.11952-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-trivial] [PATCH 07/88] Audio: use g_new() family of functions
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
X-List-Received-Date: Fri, 06 Oct 2017 23:51:03 -0000

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
[PMD: added audio/alsaaudio.c and audio/coreaudio.c]
---
 audio/alsaaudio.c    | 2 +-
 audio/coreaudio.c    | 2 +-
 audio/dsoundaudio.c  | 2 +-
 audio/ossaudio.c     | 2 +-
 audio/paaudio.c      | 2 +-
 audio/wavaudio.c     | 2 +-
 audio/wavcapture.c   | 2 +-
 hw/audio/intel-hda.c | 2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/audio/alsaaudio.c b/audio/alsaaudio.c
index 3652a7b5fa..1a129c79e3 100644
--- a/audio/alsaaudio.c
+++ b/audio/alsaaudio.c
@@ -1126,7 +1126,7 @@ static ALSAConf glob_conf = {
 
 static void *alsa_audio_init (void)
 {
-    ALSAConf *conf = g_malloc(sizeof(ALSAConf));
+    ALSAConf *conf = g_new(ALSAConf, 1);
     *conf = glob_conf;
     return conf;
 }
diff --git a/audio/coreaudio.c b/audio/coreaudio.c
index c75142084f..651b390b5e 100644
--- a/audio/coreaudio.c
+++ b/audio/coreaudio.c
@@ -687,7 +687,7 @@ static CoreaudioConf glob_conf = {
 
 static void *coreaudio_audio_init (void)
 {
-    CoreaudioConf *conf = g_malloc(sizeof(CoreaudioConf));
+    CoreaudioConf *conf = g_new(CoreaudioConf, 1);
     *conf = glob_conf;
 
     return conf;
diff --git a/audio/dsoundaudio.c b/audio/dsoundaudio.c
index 516846eb80..0492d9075e 100644
--- a/audio/dsoundaudio.c
+++ b/audio/dsoundaudio.c
@@ -787,7 +787,7 @@ static void *dsound_audio_init (void)
 {
     int err;
     HRESULT hr;
-    dsound *s = g_malloc0(sizeof(dsound));
+    dsound *s = g_new0(dsound, 1);
 
     s->conf = glob_conf;
     hr = CoInitialize (NULL);
diff --git a/audio/ossaudio.c b/audio/ossaudio.c
index 0edd7ea5fe..50d772011c 100644
--- a/audio/ossaudio.c
+++ b/audio/ossaudio.c
@@ -846,7 +846,7 @@ static OSSConf glob_conf = {
 
 static void *oss_audio_init (void)
 {
-    OSSConf *conf = g_malloc(sizeof(OSSConf));
+    OSSConf *conf = g_new(OSSConf, 1);
     *conf = glob_conf;
 
     if (access(conf->devpath_in, R_OK | W_OK) < 0 ||
diff --git a/audio/paaudio.c b/audio/paaudio.c
index 65beb6f010..fc32960c25 100644
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
index 341eec3121..f90a02610f 100644
--- a/audio/wavaudio.c
+++ b/audio/wavaudio.c
@@ -231,7 +231,7 @@ static WAVConf glob_conf = {
 
 static void *wav_audio_init (void)
 {
-    WAVConf *conf = g_malloc(sizeof(WAVConf));
+    WAVConf *conf = g_new(WAVConf, 1);
     *conf = glob_conf;
     return conf;
 }
diff --git a/audio/wavcapture.c b/audio/wavcapture.c
index 5863803584..a744b748a5 100644
--- a/audio/wavcapture.c
+++ b/audio/wavcapture.c
@@ -145,7 +145,7 @@ int wav_start_capture (CaptureState *s, const char *path, int freq,
     ops.capture = wav_capture;
     ops.destroy = wav_destroy;
 
-    wav = g_malloc0 (sizeof (*wav));
+    wav = g_new0(WAVState, 1);
 
     shift = bits16 + stereo;
     hdr[34] = bits16 ? 0x10 : 0x08;
diff --git a/hw/audio/intel-hda.c b/hw/audio/intel-hda.c
index 18a50a8f83..3a2b611d41 100644
--- a/hw/audio/intel-hda.c
+++ b/hw/audio/intel-hda.c
@@ -470,7 +470,7 @@ static void intel_hda_parse_bdl(IntelHDAState *d, IntelHDAStream *st)
     addr = intel_hda_addr(st->bdlp_lbase, st->bdlp_ubase);
     st->bentries = st->lvi +1;
     g_free(st->bpl);
-    st->bpl = g_malloc(sizeof(bpl) * st->bentries);
+    st->bpl = g_new(bpl, st->bentries);
     for (i = 0; i < st->bentries; i++, addr += 16) {
         pci_dma_read(&d->pci, addr, buf, 16);
         st->bpl[i].addr  = le64_to_cpu(*(uint64_t *)buf);
-- 
2.14.2


