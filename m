Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j9ptM-0007fP-5S
	for mharc-qemu-trivial@gnu.org; Thu, 05 Mar 2020 07:46:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41841)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j9ptI-0007bn-5F
 for qemu-trivial@nongnu.org; Thu, 05 Mar 2020 07:46:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j9ptH-0001n5-4l
 for qemu-trivial@nongnu.org; Thu, 05 Mar 2020 07:46:16 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:35212
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j9ptH-0001mT-1i
 for qemu-trivial@nongnu.org; Thu, 05 Mar 2020 07:46:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583412374;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bHjWSXQJGHXqNSVRp2m+ndgaVWWtzd8pKBpNi2noriY=;
 b=icWHILUMfHGiRIMH+8LQ3lLAU9/Eq+mopmOdCsFMeCQwDyF3iD0r9NA/0p5X7xWW6WohBn
 QmvP//+7PpyZQkY0VVqoz4hyjwGe42pdKJkqrdI+GTDsHuu5Ak8hQdeZp5ca1MHtMOJyd8
 c+apTWfqv7zW4T5Lh1GaZmpvCoUAEdw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-94-BTNNcA2ZP0Oy2B9ZbXKUiQ-1; Thu, 05 Mar 2020 07:46:13 -0500
X-MC-Unique: BTNNcA2ZP0Oy2B9ZbXKUiQ-1
Received: by mail-wm1-f71.google.com with SMTP id w12so1535812wmc.3
 for <qemu-trivial@nongnu.org>; Thu, 05 Mar 2020 04:46:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=37TekRuQ1Sj7bzipU9xMQGxHx7Oe/Uk9FNfgupkTT1U=;
 b=tFFqiOd9lIO2VMczDF0bel0YRUHmXljauVtADoYTMaxmTLt7beC9tIGMTyeY/V3ReT
 nTeF24I8SBLRQgPKnnt/xVT8HCc18uKjk/6zwB0OLA020VffsmUh5NwhF2SgPUV61YO+
 RimKnQvgOPYtisgerngHBITo8r4H9xe9TXcQILG1SKF3MnRYZLgsL1S+9c3cqj7nYDFf
 QoAVzNCwEaeEzJ9pTAfpjp/iH75yDe0q/SiP+8ZdIitqi6YDNWkRWdQGRzhhP1dpTQIn
 05SQi2LUwr26V1u38Qbje+O7hjeI4vkHfbFTNeKW76o/3tYn8qwXTGQxHeWESDJf1zA9
 mTqA==
X-Gm-Message-State: ANhLgQ1dUkmsTO27Yd9zf1r76qtBuOXq6iIi7eNoDW4mcTSlUpfJN4DI
 6Sgqna1HrTvfr2dHN1Kk5YGMW6T0CH1Z2LFTrIrY3w7/PiCg7z0NuIEDpFpHdyCG7DeV1rFyVn2
 2lglaST8fxH9JtE+LSA==
X-Received: by 2002:a5d:6544:: with SMTP id z4mr9651521wrv.31.1583412371625;
 Thu, 05 Mar 2020 04:46:11 -0800 (PST)
X-Google-Smtp-Source: ADFU+vvVrt/Sswq4FSHm0E1EBtr0g0kjYs6V37K0HOy2fXC7aQIxGtsR2optAa52Vkzx0QP0QDKzXQ==
X-Received: by 2002:a5d:6544:: with SMTP id z4mr9651493wrv.31.1583412371400;
 Thu, 05 Mar 2020 04:46:11 -0800 (PST)
Received: from localhost.localdomain (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id r12sm9493551wrw.77.2020.03.05.04.46.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2020 04:46:10 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v2 8/9] ui/curses: Move arrays to .heap to save 74KiB of .bss
Date: Thu,  5 Mar 2020 13:45:24 +0100
Message-Id: <20200305124525.14555-9-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200305124525.14555-1-philmd@redhat.com>
References: <20200305124525.14555-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Mar 2020 12:46:18 -0000

We only need these arrays when using the curses display.
Move them from the .bss to the .heap (sizes reported on
x86_64 host: screen[] is 64KiB, vga_to_curses 7KiB).

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 ui/curses.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/ui/curses.c b/ui/curses.c
index 3bafc10c1c..a59b23a9cf 100644
--- a/ui/curses.c
+++ b/ui/curses.c
@@ -54,13 +54,13 @@ enum maybe_keycode {
 };
=20
 static DisplayChangeListener *dcl;
-static console_ch_t screen[160 * 100];
+static console_ch_t *screen;
 static WINDOW *screenpad =3D NULL;
 static int width, height, gwidth, gheight, invalidate;
 static int px, py, sminx, sminy, smaxx, smaxy;
=20
 static const char *font_charset =3D "CP437";
-static cchar_t vga_to_curses[256];
+static cchar_t *vga_to_curses;
=20
 static void curses_update(DisplayChangeListener *dcl,
                           int x, int y, int w, int h)
@@ -405,6 +405,8 @@ static void curses_refresh(DisplayChangeListener *dcl)
 static void curses_atexit(void)
 {
     endwin();
+    g_free(vga_to_curses);
+    g_free(screen);
 }
=20
 /*
@@ -783,6 +785,8 @@ static void curses_display_init(DisplayState *ds, Displ=
ayOptions *opts)
     if (opts->u.curses.charset) {
         font_charset =3D opts->u.curses.charset;
     }
+    screen =3D g_new0(console_ch_t, 160 * 100);
+    vga_to_curses =3D g_new0(cchar_t, 256);
     curses_setup();
     curses_keyboard_setup();
     atexit(curses_atexit);
--=20
2.21.1


