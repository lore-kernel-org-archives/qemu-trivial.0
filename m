Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j4MQ6-00046d-NY
	for mharc-qemu-trivial@gnu.org; Wed, 19 Feb 2020 05:17:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53763)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1j4MQ1-0003pJ-82
 for qemu-trivial@nongnu.org; Wed, 19 Feb 2020 05:17:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1j4MQ0-0005gH-69
 for qemu-trivial@nongnu.org; Wed, 19 Feb 2020 05:17:25 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:47379)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1j4MPk-0005Cd-Fh; Wed, 19 Feb 2020 05:17:08 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MeTD8-1jcbIM37AK-00aUpn; Wed, 19 Feb 2020 11:16:35 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Marek Vasut <marex@denx.de>,
 Thomas Huth <thuth@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Jiri Pirko <jiri@resnulli.us>, qemu-arm@nongnu.org,
 Alistair Francis <alistair@alistair23.me>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>,
 Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 qemu-trivial@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Thomas Huth <huth@tuxfamily.org>,
 qemu-block@nongnu.org, Chris Wulff <crwulff@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>, Max Reitz <mreitz@redhat.com>,
 Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: [PULL 08/17] hw/vfio/display: Remove superfluous semicolon
Date: Wed, 19 Feb 2020 11:16:03 +0100
Message-Id: <20200219101612.1033925-9-laurent@vivier.eu>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200219101612.1033925-1-laurent@vivier.eu>
References: <20200219101612.1033925-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:zTkAU/Y8DhwEahyBf+WI8UH2+PM9/HQTnyCeb+8pYDSKsPZVc8R
 UdeMGG5+v8QDNdoLf8CpwFv7IWZPpPW437QYyWwINbsgHsv/vzz7OQQFxbkmgpySroP32k5
 tTIb57Kebi2NxYeHdZXn/Pgq7YOxe3lbvfNKd/Rk/vdZSwJX70BZBvZvVHEb/dQYktbC/LO
 EQoYavwKZwfRddx39/FUQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:CMWDfnhlzHo=:Fk6+tD8YC2b79OdA3FSIAY
 Qr9u7JHF/1bwjF4205hQIME/Kv1eSl1wTsDsPprrhvzmsYT5QLCQuNjR/gYNj/s8dl+Gggf6y
 gYJxb/iR0BDR2gObls55LSi3NGnHXpXX+GFwvczFvqtJrc6zjTTjcKivk+D+Ul65PhDBqxDFe
 K1pPT7Q95IFuvbL2X0zwiA0KOAAoprPdktxYPalrbuJ9XMhLjrJFvswQt6AbPVBjQgyaPc+qb
 tMUidHOVAyGqmA8nxjQqAn11RNlnoFhBEjDTjkqVKkFYXAqZWMz5pLZlMxVzZiKHUhlb7hBON
 j9mTS+Hdqdg3tAfAJxYj6+v+kEu2ijAJJHJZe/ZJIjS2ZRkpFqwr8IIZszUcB46Mqhz6ryGsZ
 xsZBuSQPui+iIF6pcWESPZRDAuWHROE0kpKoVryX1+s5jIBJ7X/nRMZRizP5xt83EhSATRy4V
 u8YKu28FC0zRUmkhCT1MeU8+BQhO1kWnC7N8SgSTKKkGlRknNfZC/DWs3PjLfx6oymwMtkzwp
 fa4VNj5zGIqvhnGcIkB11deuu8ggOOyLiTpvz2IX376ZCyKps3EHQgSkGRJeuftB/z3Drz2rV
 O33qqdZLtdhFZEfJP8NDCFwN+ykNbysnM4G8p42R/Cc+RdUnhdAlWd5+cyUBL/0jnGHcPFJnM
 MbziFqHCsvsUvpC6ZW3eXV1yZSaj72UF5CZa6Mgwc6bkgBrYK+G3fQcNAnDyflzoa3VlrS9Fg
 PPyq38I0xtNbA4QDIVNtEyzm0xBTd02LDTsxUt4Y1uejXw8oUTlFMg1TJ8yyeyu6jC2RmdMSy
 3UrePCuTW9EvMlR/yo9enR/J5PLAGytjfO6P3L03rfVhtRYPEou/OdBrbWUu5sLx2Hx981P
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.74
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
X-List-Received-Date: Wed, 19 Feb 2020 10:17:27 -0000

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Fixes: 8b818e059bf
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Message-Id: <20200218094402.26625-9-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/vfio/display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/vfio/display.c b/hw/vfio/display.c
index a5a608c5b226..f4977c66e1b5 100644
--- a/hw/vfio/display.c
+++ b/hw/vfio/display.c
@@ -287,7 +287,7 @@ static void vfio_display_dmabuf_update(void *opaque)
     VFIOPCIDevice *vdev = opaque;
     VFIODisplay *dpy = vdev->dpy;
     VFIODMABuf *primary, *cursor;
-    bool free_bufs = false, new_cursor = false;;
+    bool free_bufs = false, new_cursor = false;
 
     primary = vfio_display_get_dmabuf(vdev, DRM_PLANE_TYPE_PRIMARY);
     if (primary == NULL) {
-- 
2.24.1


