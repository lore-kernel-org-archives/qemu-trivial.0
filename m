Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dz0kT-0003Oo-0I
	for mharc-qemu-trivial@gnu.org; Mon, 02 Oct 2017 09:27:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33655)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthoine.bourgeois@gmail.com>) id 1dyvn2-0005Yr-6y
	for qemu-trivial@nongnu.org; Mon, 02 Oct 2017 04:09:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <anthoine.bourgeois@gmail.com>) id 1dyvn1-0005nT-CB
	for qemu-trivial@nongnu.org; Mon, 02 Oct 2017 04:09:24 -0400
Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243]:56936)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <anthoine.bourgeois@gmail.com>)
	id 1dyvmu-0005iu-FU; Mon, 02 Oct 2017 04:09:16 -0400
Received: by mail-wm0-x243.google.com with SMTP id e195so5054900wma.5;
	Mon, 02 Oct 2017 01:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=m7lUxMQowDA06v2jRVxPP5F8VipmBDG8Bgi9g2IZseE=;
	b=LKO3Ou61r57XaanzMLtxaB7RnWE2hfTDj6E5KyHkvdk1aDzCy4o7D1n/ehB/+Z2UTa
	wCxKSfHSNofnEDtMjW9gPXeNmk5/Hg8dQg1Shena9ffj2mjOAtWdY8OoykzUb7m7Qdv5
	guSOobcTOOxQrjA3XxYKlv9iLckuYbasBDrJVSvNfzth334LCiDJMqKlAtvXdlAahlFc
	EmvvFirLvBqg8ogtjVx2NSgIxaJDJBS7Fwx8MB3hZ9jDn6/xkk75aKNtGOxKERpMfpeQ
	pHg+oCRH9bjLZ1nw0je523lBFFUka5kgtPmDl/GmELH9MiJinkrl7fxknsyo0439MwEH
	6CLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=m7lUxMQowDA06v2jRVxPP5F8VipmBDG8Bgi9g2IZseE=;
	b=VieXFc0PgeWF9tbqzlow+JWFIRMyx9SjpbIgXsT6NfSRLmgL53kSD/E7hxKNulIieb
	Oe4FMFAGEfVFo2ZVvzRZI1xnFKAJ5XsA/T8Z21EBrjyRG891nVVhBsmffdVMH4W1f2Ou
	34KAY9vdSWJJGVn7GLCvtqSBzyL12SY+EuzJe+BNabh/ZAoOiZoHcAsylbIhJfSXFRwg
	qB59WDw68rrujynNWQC7I1VoTZGAWl/1ugXCddtDJ2YnuCt7ITd+rFEOuRdVC/ZU2Kji
	5ddQyo+Zuk8ZxAC29cI579vtCWC6yqtbnFUwb+kxvnp6WkOXi8d5dTtIGqEaNMP5HF1b
	WS7g==
X-Gm-Message-State: AMCzsaV4fRIKV0rxShDuosfNNjnc2aiOK7yjKn2MNu7iIjvPl9AArZ45
	fOx59Wjlgia1z9a04PDMemw=
X-Google-Smtp-Source: AOwi7QAMElM3O4yT379IjZhuKyvhClNwB137ZuwNKRLSoK9FnAR79nz13doeP/rJPBT5TIa0d1HmXw==
X-Received: by 10.28.30.22 with SMTP id e22mr9697139wme.121.1506931754189;
	Mon, 02 Oct 2017 01:09:14 -0700 (PDT)
Received: from localhost.localdomain ([178.208.16.32])
	by smtp.gmail.com with ESMTPSA id 133sm8687969wmu.4.2017.10.02.01.09.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 02 Oct 2017 01:09:13 -0700 (PDT)
From: Anthoine Bourgeois <anthoine.bourgeois@gmail.com>
To: Gerd Hoffmann <kraxel@redhat.com>,
	qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Anthoine Bourgeois <anthoine.bourgeois@gmail.com>,
	Anthoine Bourgeois <anthoine.bourgeois@blade-group.com>
Date: Mon,  2 Oct 2017 10:09:06 +0200
Message-Id: <20171002080906.4682-1-anthoine.bourgeois@gmail.com>
X-Mailer: git-send-email 2.9.3
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::243
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
X-List-Received-Date: Mon, 02 Oct 2017 08:09:25 -0000

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


