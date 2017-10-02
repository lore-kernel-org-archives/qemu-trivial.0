Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dz0kS-0003Nu-9D
	for mharc-qemu-trivial@gnu.org; Mon, 02 Oct 2017 09:27:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41593)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthoine.bourgeois@gmail.com>) id 1dz025-0001O1-HS
	for qemu-trivial@nongnu.org; Mon, 02 Oct 2017 08:41:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <anthoine.bourgeois@gmail.com>) id 1dz020-0007lS-0s
	for qemu-trivial@nongnu.org; Mon, 02 Oct 2017 08:41:13 -0400
Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242]:52841)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <anthoine.bourgeois@gmail.com>)
	id 1dz01t-0007in-Iv; Mon, 02 Oct 2017 08:41:01 -0400
Received: by mail-wm0-x242.google.com with SMTP id k4so8181377wmc.1;
	Mon, 02 Oct 2017 05:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=m7lUxMQowDA06v2jRVxPP5F8VipmBDG8Bgi9g2IZseE=;
	b=FqCZvSU69MazZEkCEihhCZtM/T/jOB7Y/upNxmo0Zf1NXzAAM/mmM/hXDDQM80L/6p
	e+D5mMKs8nEqjVCtxYWGr1J4eH/Ik3ccF7X3b5gbdkv6btq9u6SS9v7OvM0Th+HcDRO9
	aP4teI3xiMlei2h99mFmitlAfbpcMT9sQ35FrWKC6M2cNAzLRl/PdfaMP5G3klM+Wbt/
	mANys6iWB7PzucyTyp/d/ljMtIMUNhi0jXEffEYa8LY4GF1/09MQSE04GWNcwRIewWtH
	rODsJZkEkWxYuePRMf4QHz5RrSXKZdSRqH9tYr6Zk+L3SDYRhv1S5ziKBsiKwROfOl1z
	zdJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=m7lUxMQowDA06v2jRVxPP5F8VipmBDG8Bgi9g2IZseE=;
	b=pFIj4D5PZqX7XkNdu0v/NtSlqn85Xmiw/Ve86GrFbZULa6khRO0lqMFGqYdOkfi2Y2
	zOnYRZ+v1tslHZ+0ZZUQYqq3lpOq84MyG0AAUZwo/LQCbG2VuAW2T/7U16g6ihrNief0
	FDg2EGF2j0CleD+s3h0nDeC7LTl9O2jhO/bvc4Hqw4XLcDAsgsSEfl2fu6NX2rzhWHHi
	P5X5kkMcXq0LirvdfeZoYCddyhKmUJxEm0YSTWSM5jUHu9at3upuUI3u52G1k4qMK52V
	QaAhiK4ikB17iQ8y8/PkEBRSR0DdS78zBVfm9QF/QQ/nuC8chM83MszNAr9MC4R6ihlJ
	C00Q==
X-Gm-Message-State: AMCzsaV0Lb9celWy9c1jdhElzEmfwm81N9tnxh9pC5/ly8iy9FfqJVZK
	RF7I4umQdsdqH6ejRXRDLOSorw==
X-Google-Smtp-Source: AOwi7QDqSvwItfAIgNdKCow7V6XVINIwDXMgI84hpztyxwSzWzc/c+vjRZyhnDu/BZURkT1bXIzAvg==
X-Received: by 10.28.68.130 with SMTP id r124mr9394451wma.96.1506948059856;
	Mon, 02 Oct 2017 05:40:59 -0700 (PDT)
Received: from localhost.localdomain ([178.208.16.32])
	by smtp.gmail.com with ESMTPSA id
	j73sm26719718wmf.15.2017.10.02.05.40.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 02 Oct 2017 05:40:59 -0700 (PDT)
From: Anthoine Bourgeois <anthoine.bourgeois@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	Anthoine Bourgeois <anthoine.bourgeois@blade-group.com>
Date: Mon,  2 Oct 2017 14:40:52 +0200
Message-Id: <20171002124052.13829-1-anthoine.bourgeois@gmail.com>
X-Mailer: git-send-email 2.9.3
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::242
X-Mailman-Approved-At: Mon, 02 Oct 2017 09:27:02 -0400
Subject: [Qemu-trivial] [PATCH] gtk: fix wrong id between texture and
 framebuffer
X-BeenThere: qemu-trivial@gnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.gnu.org>
List-Unsubscribe: <https://lists.gnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@gnu.org?subject=unsubscribe>
List-Archive: <http://lists.gnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@gnu.org>
List-Help: <mailto:qemu-trivial-request@gnu.org?subject=help>
List-Subscribe: <https://lists.gnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@gnu.org?subject=subscribe>
X-List-Received-Date: Mon, 02 Oct 2017 12:41:18 -0000

From: Anthoine Bourgeois <anthoine.bourgeois@blade-group.com>

The gd_gl_area_scanout_texture must destroy framebuffer if there is
no texture id instead of no framebuffer id.
The effect was a black screen with "-vga virtio -display gtk,gl=on"
options.
The bug was introduce by a4f113fd "gtk: use framebuffer helper functions."

Signed-off-by: Anthoine Bourgeois <anthoine.bourgeois@blade-group.com>
---
 ui/gtk-gl-area.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/ui/gtk-gl-area.c b/ui/gtk-gl-area.c
index 18b298f..026b7d7 100644
--- a/ui/gtk-gl-area.c
+++ b/ui/gtk-gl-area.c
@@ -178,8 +178,7 @@ void gd_gl_area_scanout_texture(DisplayChangeListener *dcl,
 
     gtk_gl_area_make_current(GTK_GL_AREA(vc->gfx.drawing_area));
 
-    if (vc->gfx.guest_fb.framebuffer  == 0 ||
-        vc->gfx.w == 0 || vc->gfx.h == 0) {
+    if (backing_id == 0 || vc->gfx.w == 0 || vc->gfx.h == 0) {
         gtk_gl_area_set_scanout_mode(vc, false);
         return;
     }
-- 
2.9.3


