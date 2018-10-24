Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gFPWm-0005f9-1Q
	for mharc-qemu-trivial@gnu.org; Wed, 24 Oct 2018 16:13:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34575)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kristopher@connectfree.jp>) id 1gFMqQ-0000ov-MW
	for qemu-trivial@nongnu.org; Wed, 24 Oct 2018 13:21:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kristopher@connectfree.jp>) id 1gFMqP-0002XL-6c
	for qemu-trivial@nongnu.org; Wed, 24 Oct 2018 13:21:22 -0400
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143]:34184)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <kristopher@connectfree.jp>)
	id 1gFMqO-0002SJ-GV
	for qemu-trivial@nongnu.org; Wed, 24 Oct 2018 13:21:20 -0400
Received: by mail-lf1-x143.google.com with SMTP id n26-v6so4609789lfl.1
	for <qemu-trivial@nongnu.org>; Wed, 24 Oct 2018 10:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=connectfree-jp.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to;
	bh=GW2MRNrJ61ET1rc5t/Z9HXJ8PXkKa5uRZt1sUR2TAHM=;
	b=ToYn6YLq/4K9ZqGCLLNlfWXH47oPbnMWjwLvuRZ6lKl2Af+cIclsYgHzcE5AOqI2ZA
	AcFHbhHJ46xJYLaXP8NIVQ0u0f4HAmQCTkc+oRGDQXzK4bQTgiRntUKpyeC7VHnzSRuN
	k5SNQJcXCUbQWuESLqXg8W1s7gYOGm5t1Dw9OLN2hyLHSVqZt+SiMGFVDU8AvqbdUIDg
	zCXgfNiu3lyVOi9WmGRUqtkQr7blTmRRsbBe75RauTaOWeZ6zVwqF0N+bY8gA4wKus9o
	zbWia9ELSuk5ZxiZMTuZYOpeiAC+u2UE6kFluM/wXn8g0v2QY5vSWZwf7ldDNZZIKXR0
	UoEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=GW2MRNrJ61ET1rc5t/Z9HXJ8PXkKa5uRZt1sUR2TAHM=;
	b=ZhHbRUcGObcCJ+G9pPfpUfLbYS8/xqodOSBB/BX6vLZBVt8VIctQbLwb/R5G3JhIJ/
	xbu9zO+ht9ZmZknBOUQgZZH9AJMG7dwaYSZYpG6e35cAzxgvaZa2zSu+41+VPjvGEOLH
	fURu1sXuwshBFVmaGo3xINLmRYZ2RSmfnKVZj5qdqD0KTP/KqcyH/stUzgNW+Z8W8Lnc
	oeWwx/rfnOwBn0bFDz9owhgqgiRGt3IQ9VHLI+R5XF98Lgz3YEswL7uIRM3SeZA9wpVr
	RLQFH+GWIwrT73ggRXjexdBdTqha2RKX8ZwrF0FBiGrEScm6UTRmgxSsl6APlUgDK6aI
	z8ng==
X-Gm-Message-State: ABuFfoj9DeNWy0vKvPr5KXzYdcqWTOURthTxBEGFKMWVkgNVPX2FzcbG
	48JMI1BPbiyUV57EsE1Vx141+eRMmbFcZWSzIkRpEQ0p3dU=
X-Google-Smtp-Source: ACcGV611IHJdqjpEJYB6Ofu3Nm0dlFhVSpBidw0qPfbFKZ7Fp4GKA7xTAZiB0pKcTpKPv+92NfyAl95G4N7P3k6d18o=
X-Received: by 2002:a19:5f1e:: with SMTP id t30mr7584266lfb.76.1540401677423; 
	Wed, 24 Oct 2018 10:21:17 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?5bid6YO9IOS5heWIqeWvvw==?= <kristopher@connectfree.jp>
Date: Thu, 25 Oct 2018 02:21:06 +0900
Message-ID: <CABnLni0KVQZpgEA5ShShycKizKJ_ULieq365FDcJFDrNqdOL0g@mail.gmail.com>
To: qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::143
X-Mailman-Approved-At: Wed, 24 Oct 2018 16:13:14 -0400
Subject: [Qemu-trivial] [PATCH] ui/sdl2-2d.c: macOS Mojave checks for UI
 running off the main thread -- run sdl2_window_resize on the main thread
 via dispatch_async; 
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
X-List-Received-Date: Wed, 24 Oct 2018 17:21:23 -0000

Signed-off-by: kristopher tate <kt@connectfree.co.jp>
---
 ui/sdl2-2d.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/ui/sdl2-2d.c b/ui/sdl2-2d.c
index 091ecfc..4b931c9 100644
--- a/ui/sdl2-2d.c
+++ b/ui/sdl2-2d.c
@@ -29,6 +29,9 @@
 #include "ui/input.h"
 #include "ui/sdl2.h"
 #include "sysemu/sysemu.h"
+#if defined(__APPLE__)
+  #include <dispatch/dispatch.h>
+#endif

 void sdl2_2d_update(DisplayChangeListener *dcl,
                     int x, int y, int w, int h)
@@ -87,7 +90,13 @@ void sdl2_2d_switch(DisplayChangeListener *dcl,
     } else if (old_surface &&
                ((surface_width(old_surface)  != surface_width(new_surface)) ||
                 (surface_height(old_surface) !=
surface_height(new_surface)))) {
+#if defined(__APPLE__)
+        dispatch_async(dispatch_get_main_queue(), ^{
+          sdl2_window_resize(scon);
+        });
+#else
         sdl2_window_resize(scon);
+#endif
     }

     SDL_RenderSetLogicalSize(scon->real_renderer,
-- 
2.17.1 (Apple Git-112)

