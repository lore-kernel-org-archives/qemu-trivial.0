Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fbnV5-00082X-1Z
	for mharc-qemu-trivial@gnu.org; Sat, 07 Jul 2018 09:43:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60619)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hqm03ster@gmail.com>) id 1fbjnP-0002nz-Qr
	for qemu-trivial@nongnu.org; Sat, 07 Jul 2018 05:46:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <hqm03ster@gmail.com>) id 1fbjnP-0004hn-8u
	for qemu-trivial@nongnu.org; Sat, 07 Jul 2018 05:46:27 -0400
Received: from mail-pl0-x22b.google.com ([2607:f8b0:400e:c01::22b]:34442)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <hqm03ster@gmail.com>) id 1fbjnP-0004hH-2d
	for qemu-trivial@nongnu.org; Sat, 07 Jul 2018 05:46:27 -0400
Received: by mail-pl0-x22b.google.com with SMTP id z9-v6so3925087plo.1
	for <qemu-trivial@nongnu.org>; Sat, 07 Jul 2018 02:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=D/FfXgPWWoJe/9bTHYP2ZHajoH2z1qIuqnR/qbrvX+s=;
	b=m3CnYNS2+EZTBqpORqZIXB7slezdfRROvk55GKCVS5+Pbw9Y04o8Apbag6NJQrWWs8
	U2G1EbiVIJb07oKhIpWWZqf8GXABrGpo5ZYdAEwg6taf9GcBpkEjm8gNzVfX7F0VA9zz
	8TkG4Ndto/CH1P3ZENvPK9SWEJ7gnQbsvYho1QmFj6px6PkX51e+5dc4f8r7W6KNb+/q
	t1RPtg4dTRRNQ0qzrtMwPxvTB/rE4/ycWf6cfDGPPCosj/ISxI2aFJtSyhqq0l3B5RqW
	k32yxGM89J5XnNS0oyBKrwJQmInCJkKjBRPVkEa3i7H+wVepsBtkby2rew72azrHYr+A
	A4EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=D/FfXgPWWoJe/9bTHYP2ZHajoH2z1qIuqnR/qbrvX+s=;
	b=RzjWD9rKraSvnFLSL1KiTM7/U6Iyot+o6MPNqfHcHCZ/6iRedI45eH1N+4DOUv7jRv
	Z4w4N6hbn3AWI5L+XPiSBxEEf7xf8HIHvKSJBIwsPCn9sBoUmPqZKMuySXFoP1n0j0fK
	MY289vvkjDLZDX0VkcR0ibu1LSUJ1WPd6NXozbUY8FpwrJBb/L0jhGcIoH6yEX+cwakm
	Eq7dTNLzPLjuTE/ghsg+1dVDk5jRtJUnxg6zSOf+cYAOG3PAEdvl+k3AFM8gmitDjKEb
	fIl9QuQB8ZIn1OW+MLNriPOePfwVZGqW2dK8eUMmZIOUKRtYW5a+QHnY1V3SlVmo1YbZ
	IouQ==
X-Gm-Message-State: APt69E2kowJOnNF+G2qs1TSh2r0Q2PAOhRkLVtGeRJyW5Vxbs6zkHYwq
	O+oK53PKd52xF1Cl4/VFRiE=
X-Google-Smtp-Source: AAOMgpfuC2MTh6yeRfx5aK4gPDAA2nSRzM6lRBo2DfYBv5kMowT6ltW+ep3dppguF7AgpWmAcwg6lA==
X-Received: by 2002:a17:902:8645:: with SMTP id
	y5-v6mr13245550plt.334.1530956785895; 
	Sat, 07 Jul 2018 02:46:25 -0700 (PDT)
Received: from localhost.localdomain ([45.58.38.15])
	by smtp.gmail.com with ESMTPSA id
	v15-v6sm16006421pff.120.2018.07.07.02.46.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 07 Jul 2018 02:46:25 -0700 (PDT)
From: Qiming HOU <hqm03ster@gmail.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-trivial@nongnu.org,
	Qiming HOU <hqm03ster@gmail.com>
Date: Sat,  7 Jul 2018 17:45:27 +0800
Message-Id: <20180707094527.8248-2-hqm03ster@gmail.com>
X-Mailer: git-send-email 2.17.1.windows.2
In-Reply-To: <20180707094527.8248-1-hqm03ster@gmail.com>
References: <20180707094527.8248-1-hqm03ster@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::22b
X-Mailman-Approved-At: Sat, 07 Jul 2018 09:43:45 -0400
Subject: [Qemu-trivial] [PATCH 1/1] hw/gtk-egl: fixed dmabuf cursor location
 when the main buffer is scaled
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
X-List-Received-Date: Sat, 07 Jul 2018 09:46:28 -0000

Signed-off-by: Qiming HOU <hqm03ster@gmail.com>
---
 ui/gtk-egl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ui/gtk-egl.c b/ui/gtk-egl.c
index fb00ad1..e3722c0 100644
--- a/ui/gtk-egl.c
+++ b/ui/gtk-egl.c
@@ -272,7 +272,7 @@ void gd_egl_scanout_flush(DisplayChangeListener *dcl,
                          vc->gfx.y0_top);
         egl_texture_blend(vc->gfx.gls, &vc->gfx.win_fb, &vc->gfx.cursor_fb,
                           vc->gfx.y0_top,
-                          vc->gfx.cursor_x, vc->gfx.cursor_y);
+                          vc->gfx.cursor_x * ww / vc->gfx.w, vc->gfx.cursor_y * wh / vc->gfx.h);
     } else {
         egl_fb_blit(&vc->gfx.win_fb, &vc->gfx.guest_fb, !vc->gfx.y0_top);
     }
-- 
2.17.1.windows.2


