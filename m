Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gFLjF-0005nL-TR
	for mharc-qemu-trivial@gnu.org; Wed, 24 Oct 2018 12:09:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52310)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <seba.dos1@gmail.com>) id 1gFKXp-0000cq-Lx
	for qemu-trivial@nongnu.org; Wed, 24 Oct 2018 10:54:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <seba.dos1@gmail.com>) id 1gFKIG-000328-TJ
	for qemu-trivial@nongnu.org; Wed, 24 Oct 2018 10:38:01 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:42978)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <seba.dos1@gmail.com>)
	id 1gFKID-0002zG-TB; Wed, 24 Oct 2018 10:37:54 -0400
Received: by mail-lj1-f195.google.com with SMTP id z9-v6so169765ljk.9;
	Wed, 24 Oct 2018 07:37:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=4plvH/cr3X+I0G5yEN4wdOhTXgMZK0fRnYvqcoDUJTA=;
	b=dhg6tLjTvp55TK+SnWGyj45JUEVXRquACQf6Q0I8fnFTl+43J9F2XeKR7oEaIx1+ws
	rudlmIq8tJNbFCZtTZvnuKfFmnH/idvuwRSz7d+cCFMuqAyKkjCd/Kd2EmUnj6eGGNCD
	O6e8ZDrLm+RGAy18g3V3aI6+krdRrkjRHc+27g/bVW0bPvCF/qyTYL4eq9CU8RdF7gs5
	hF8j+YbYr6v6PIH8jfGwbUgTl0kWYYMUrUsrvI7BTQUeYkjxyJNV3LcbMcL1TvUscyDR
	ZwDypKknrMR9ZEfyIxubrcdecpYpfvYUSKbE9TKUPDxvdo3sqAJ/qMJNrBSvzr2jywzi
	Mpzg==
X-Gm-Message-State: AGRZ1gJV1PBc2QiRiYwK9QTGNtbKnlREo7yKjp4D6sFqYRvLw82gTRwz
	2u3rT1dg2mcLKu2+fILg9iI=
X-Google-Smtp-Source: AJdET5frcZS91lSOzz2Br+zPZCh4pgmWjuaRbe1932hc4zDPFsQLWrIaZrd1pB5QO7HAr59Aorce5A==
X-Received: by 2002:a2e:a28b:: with SMTP id
	k11-v6mr1990811lja.24.1540391872217; 
	Wed, 24 Oct 2018 07:37:52 -0700 (PDT)
Received: from localhost.localdomain (77-254-1-82.adsl.inetia.pl.
	[77.254.1.82]) by smtp.gmail.com with ESMTPSA id
	w19-v6sm679750lji.73.2018.10.24.07.37.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 24 Oct 2018 07:37:51 -0700 (PDT)
From: Sebastian Krzyszkowiak <dos@dosowisko.net>
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org, dos@dosowisko.net
Date: Wed, 24 Oct 2018 16:37:48 +0200
Message-Id: <20181024143748.4425-1-dos@dosowisko.net>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.208.195
X-Mailman-Approved-At: Wed, 24 Oct 2018 12:09:53 -0400
Subject: [Qemu-trivial] [PATCH] SDL: set a hint to not bypass the window
 compositor
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
X-List-Received-Date: Wed, 24 Oct 2018 14:54:06 -0000

Without that, window effects in KWin get suspended as soon as any
qemu-sdl window becomes visible. While the SDL default makes sense
for games, it's not really suitable for QEMU.

Signed-off-by: Sebastian Krzyszkowiak <dos@dosowisko.net>
---
 ui/sdl2.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/ui/sdl2.c b/ui/sdl2.c
index 2696b95c79..a10b6e3a08 100644
--- a/ui/sdl2.c
+++ b/ui/sdl2.c
@@ -786,6 +786,9 @@ static void sdl2_display_init(DisplayState *ds, DisplayOptions *o)
                 SDL_GetError());
         exit(1);
     }
+#ifdef SDL_HINT_VIDEO_X11_NET_WM_BYPASS_COMPOSITOR /* only available since SDL 2.0.8 */
+    SDL_SetHint(SDL_HINT_VIDEO_X11_NET_WM_BYPASS_COMPOSITOR, "0");
+#endif
     SDL_SetHint(SDL_HINT_GRAB_KEYBOARD, "1");
     memset(&info, 0, sizeof(info));
     SDL_VERSION(&info.version);
-- 
2.19.1


