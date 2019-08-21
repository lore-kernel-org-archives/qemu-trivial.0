Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i0Ofj-0005dc-Rm
	for mharc-qemu-trivial@gnu.org; Wed, 21 Aug 2019 07:20:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53789)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1i0OfZ-0005IN-0t
 for qemu-trivial@nongnu.org; Wed, 21 Aug 2019 07:20:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1i0OfY-0006jp-1Z
 for qemu-trivial@nongnu.org; Wed, 21 Aug 2019 07:20:48 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:48679)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1i0OfV-0006gn-Gs; Wed, 21 Aug 2019 07:20:45 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1M3DaN-1hwop93Vi1-003erP; Wed, 21 Aug 2019 13:20:07 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Michael Tokarev <mjt@tls.msk.ru>,
 "Michael S. Tsirkin" <mst@redhat.com>, Corey Minyard <minyard@acm.org>,
 Juan Quintela <quintela@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <rth@twiddle.net>, Jason Wang <jasowang@redhat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, Markus Armbruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefan Weil <sw@weilnetz.de>
Date: Wed, 21 Aug 2019 13:19:41 +0200
Message-Id: <20190821111947.26580-9-laurent@vivier.eu>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190821111947.26580-1-laurent@vivier.eu>
References: <20190821111947.26580-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:XFqrSYgzKdwKE3NPvAuk+SvzM02d7ufxqsFdJGzCeHSMLpORSLn
 hOaoH18TBeUFKEOqe3kZEuKxWQsFcDgwardSBNpB4BbxkA1tzet0+18ZOlZ9wm2YKxjHRE/
 keydpj3DygWBQcPjR+JV6jfGjFD8aLlKx/Z24kcu8+bf+34n1apyE8Cbe59qVJCFY2tz6EH
 cPSlLZmIG8O0XOW2P4QLQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:tDAYKQHj5uQ=:DqYl+QOv/59V1ZJO1dSUbz
 T6aMBrvT4MQDmoPZnH0be3fwob8cZff/VfEic0PbFHrUtfEDspdAPv6Djxkh+5cmZAkMHDhCp
 1a652DfC7HfxVAs+hPSmLjb7HylEszSxzqwXQ2NN9xkZTZgxdZVsePff1euNTimDgSQny9lNo
 PrE8Tf9vKs8pKRNLO2t9MI+Ymh9s3xTgza1EWAWoe6F4s2/4uT+s18y28LF2nrk/FjIIG6crj
 o6ROuzogfAo/LVwAKK49rLrxW9d6Fo0TqoHT1TTZoeSS6iy++2lvomo8ZmvffSwHyHHVkeBRh
 yQg36ROkzfdmLMKhK6/v07Kji+ZhtjWUYs7WoCmflSyKrCjPHdFpDdY0rTmqKIdhHG4ACcyb6
 X12Mb6ztM2DhfGf1ytxHStNOT0QlRxa5v3bQewyEMlaEbIS4SayjIawhRk2jLpoKeB3r8Ylsm
 se182xzBu4F2zDiPcv9wU4BBaIKCOm60ajqnmylfQdNc3UvKGl3A+cOl9aMX2xO6WjIc9Nf1b
 Y0s4f7aLuds+qgljK/0cUJKVIQ6UgjpHGC3VAPboLT54k8HNQ+gLsMVF+BnJ1SHvG5XMjSCbh
 h8dJniGBEFJJ2c6bOGn9JBad4Ro1MLgqE9u4utSAf8iUu0AhSignlKPSG+jUhsqds5+ADwWR/
 gWdYofcNJIT9M0HvYjpcRAJS2xdPaGjmA9P2zTgUPtXi3IsQRhAbEc68kD05b02JmLCybehu/
 sQ3C26jHD+wuFyRODlszeXIgJW/6DaixHa8f8IfPpaAjQNcEcl1YrkZj6tE=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.73
Subject: [Qemu-trivial] [PULL 08/14] hw/dma/omap_dma: Move switch 'fall
 through' comment to correct place
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
X-List-Received-Date: Wed, 21 Aug 2019 11:20:50 -0000

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Reported by GCC9 when building with CFLAG -Wimplicit-fallthrough=2:

    CC      hw/dma/omap_dma.o
  hw/dma/omap_dma.c: In function ‘omap_dma_write’:
  hw/dma/omap_dma.c:1532:12: error: this statement may fall through [-Werror=implicit-fallthrough=]
   1532 |         if (s->model <= omap_dma_3_1)
        |            ^
  hw/dma/omap_dma.c:1534:5: note: here
   1534 |     case 0x400:
        |     ^~~~
  cc1: all warnings being treated as errors

Correctly place the 'fall through' comment.

Reported-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20190719131425.10835-3-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/dma/omap_dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/dma/omap_dma.c b/hw/dma/omap_dma.c
index eab83c5c3a16..6677237d42a4 100644
--- a/hw/dma/omap_dma.c
+++ b/hw/dma/omap_dma.c
@@ -1531,8 +1531,8 @@ static void omap_dma_write(void *opaque, hwaddr addr,
     case 0x404 ... 0x4fe:
         if (s->model <= omap_dma_3_1)
             break;
+        /* fall through */
     case 0x400:
-        /* Fall through. */
         if (omap_dma_sys_write(s, addr, value))
             break;
         return;
-- 
2.21.0


