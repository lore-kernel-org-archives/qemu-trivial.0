Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dz0kS-0003Nj-3R
	for mharc-qemu-trivial@gnu.org; Mon, 02 Oct 2017 09:27:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33698)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthoine.bourgeois@gmail.com>) id 1dyxe5-00020K-Nq
	for qemu-trivial@nongnu.org; Mon, 02 Oct 2017 06:08:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <anthoine.bourgeois@gmail.com>) id 1dyxe2-0004SB-6k
	for qemu-trivial@nongnu.org; Mon, 02 Oct 2017 06:08:17 -0400
Received: from mail-wr0-x242.google.com ([2a00:1450:400c:c0c::242]:32944)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <anthoine.bourgeois@gmail.com>)
	id 1dyxds-0004NA-5V; Mon, 02 Oct 2017 06:08:04 -0400
Received: by mail-wr0-x242.google.com with SMTP id z96so2156142wrb.0;
	Mon, 02 Oct 2017 03:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=j+n4Xwly6Cn8tkInFU2v79SklVcn+Oyr370/h5yntjc=;
	b=Gw+aD6ywtR70+YYAnvBqDmIVQrrjaJs4KCGbpcwvX7Dg1i8OFyEayHQ5f/8UrO7/T5
	qqGkB5+eYdRyFt6bydyID9pv5Y6XmoLcTfhtHWx9w5qBZ43y9tV7LFPBTDJI7crnyLV2
	eNAG5HP0+RYJmZZcFJ2iGXQ6Wpn3sLl7qWHw5hYCCJLFgWlBqErAQ28vRJCR1bgfv5AN
	k+W/pnGxzrIaxqMxqlSLFMuy/z/WcJeTFmTS36eSZwHyLoS3V/v6jIR7immD0lqq4XRy
	psGOj8dMqmjtAF9mQLHs8y2syPG+KxT5q7QAV2s8Uc7o7O0mQ+H4x+wENy3Bz/agF6kC
	UXQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=j+n4Xwly6Cn8tkInFU2v79SklVcn+Oyr370/h5yntjc=;
	b=jJOaZ4rKi+TMI1WtY7/3TuzX0amHiSC22leXoa9LITVgj1mmssoC9fl4TyOdm6Gb8j
	EWTqH0hDqXX3/K+iOYpplkN4NJS7gIn5xgSdz26lGX0kDM+xPVgN0XRjr6dq6QDeMGNI
	Xcsef8Kq2SxBfI4GKvCXXNWB0m0X0+pF0aRB5bXnLfAAScmrzXx/lm+Pi4pfEQ9gvX/t
	yRV0zEnnWgJ1jawREGtX6pgFgo/6KoIuq9ARXRU+EnyPM8a/FuxZgw4jIjK93A/xkLlz
	DIYFOfEvsjzFdszRb8bf+6n5itA9I73ulzitsrX7LmMPbX1DqxDsga921PFCpwycCHH2
	mRnQ==
X-Gm-Message-State: AHPjjUjPzGq7I+0DuWqgMoiTtlthHKgbSDQnBfOecPqzw9EGajP/4oWZ
	TZbY2Jbphs46prLt9jypF0M=
X-Google-Smtp-Source: AOwi7QCb201wILyH/JOrdr5Jdv5e8WTQCrdCDcmVhQ2+EqU2AuU8EdVUWFtovL79MtkB3oTlGk4+TQ==
X-Received: by 10.223.187.80 with SMTP id x16mr14453041wrg.33.1506938882960;
	Mon, 02 Oct 2017 03:08:02 -0700 (PDT)
Received: from localhost.localdomain ([178.208.16.32])
	by smtp.gmail.com with ESMTPSA id o3sm10118024wmg.3.2017.10.02.03.08.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 02 Oct 2017 03:08:02 -0700 (PDT)
From: Anthoine Bourgeois <anthoine.bourgeois@gmail.com>
X-Google-Original-From: Anthoine Bourgeois <anthoine.bourgeois@blade-group.com>
To: Gerd Hoffmann <kraxel@redhat.com>,
	qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	Anthoine Bourgeois <anthoine.bourgeois@blade-group.com>
Date: Mon,  2 Oct 2017 12:07:46 +0200
Message-Id: <20171002100746.9408-1-anthoine.bourgeois@blade-group.com>
X-Mailer: git-send-email 2.9.3
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::242
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
X-List-Received-Date: Mon, 02 Oct 2017 10:08:18 -0000

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


