Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i0Off-0005Ry-33
	for mharc-qemu-trivial@gnu.org; Wed, 21 Aug 2019 07:20:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53705)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1i0OfW-0005Bq-8Z
 for qemu-trivial@nongnu.org; Wed, 21 Aug 2019 07:20:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1i0OfU-0006gz-Pl
 for qemu-trivial@nongnu.org; Wed, 21 Aug 2019 07:20:45 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:49615)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1i0OfM-0006Yy-T4; Wed, 21 Aug 2019 07:20:38 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MbBUc-1iXWU71nWC-00bcEU; Wed, 21 Aug 2019 13:20:11 +0200
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
 Stefan Weil <sw@weilnetz.de>, John Snow <jsnow@redhat.com>
Date: Wed, 21 Aug 2019 13:19:44 +0200
Message-Id: <20190821111947.26580-12-laurent@vivier.eu>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190821111947.26580-1-laurent@vivier.eu>
References: <20190821111947.26580-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:/oOFEv+k3MPTZ96mUEMj/iCXZ45kRUL3eJQ8HPBaJiqO5J0VmDa
 2k9TwkVRGXjuYvwXElBiKM3v1yh68CFr5ElZUw4QMLhzZnT00TuS9pM0RVWHLCql7N5U/rt
 RLiwj2RyW/m4hHYxtzcmKuagGjgNGtiPLatUFycPIiWpmyOUqN2oBYOQKtRKYMcQbeeS4ZJ
 qPhYDng9Lv9teI7IlUV0Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:BxAiurucm6M=:OTRWXvXQbGGgFzqW+rNfSQ
 on7IFr0c27dgp2X1cDZMDFP4dUJvJOEM7f7v/8Nmi186sFBwMSqcEukgDZcb2vtD8SZvTwAu+
 8hN4B+Wu+dANO6UJDEDWPV6Ot9HzQhHHqmS6t0PlSnkPXyqBl/zLxV6YkPVSLgaqqq4yATFG7
 jMYsX8Q44wndzfNVQyF/UEMYspxqfWipLdp77fl1x7M4yHl2OuUCiBsQ+NPIP16sTCdGjEyqF
 EAhO66A8TEeBJurAGPEcUcLpt7ldpWeTmWGq5NPJdLPD5+eoexnC7yjmN7DmzzH8yazXkfC91
 Pyo0UfKYCRj+JnrtzeDDzzYLdG5UE77ggEcfNFE/tsLAwDxiqlZ6eJNjsuZy9s9Bdk25KD0LD
 8LNDt05YOMSIyct4eTdtYZITA76TmgIcxy5Pqjzo5Uf7pFN4O5W+D4bRq0Dm+jHZEk47+/WnH
 755SmoZniMwwisMkThKcA2yPfGiNZBnsVUdqSkSC9DQhsei9HLRIcqCmGyuoSegTCAP5x2pRh
 UMPojOXps4HC1mlKohK+wWsx9HFIhtPB0dZUp6adsPpA3VlspkUkR31DcwIGMEol+2Ty66iIh
 pQpswTmtkioYLkkzViI6B14hgWUOW9i6IQqRJHMVClAxwIZoUUasAdw9TW+o29/2zgiRwUa3v
 4AqjqR6yQsro7RoZaXiRIahjCGGApxFH8DDznAnr3xDCJlP8juZAEW5MVqX4l79JL6cnEByYQ
 prK/OxiJdNxlCUHtNcUkippyUzJtw0A39wJYu81p+1cf777368FRUWwCCS4=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.73
Subject: [Qemu-trivial] [PULL 11/14] vl: Rewrite a fall through comment
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
X-List-Received-Date: Wed, 21 Aug 2019 11:20:48 -0000

From: Philippe Mathieu-Daudé <philmd@redhat.com>

GCC9 is confused by this comment when building with CFLAG
-Wimplicit-fallthrough=2:

  vl.c: In function ‘qemu_ref_timedate’:
  vl.c:773:15: error: this statement may fall through [-Werror=implicit-fallthrough=]
    773 |         value -= rtc_realtime_clock_offset;
        |         ~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~
  vl.c:775:5: note: here
    775 |     case QEMU_CLOCK_VIRTUAL:
        |     ^~~~
  cc1: all warnings being treated as errors

Rewrite the comment using 'fall through' which is recognized by
GCC and static analyzers.

Reported-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
Message-Id: <20190719131425.10835-7-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 vl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/vl.c b/vl.c
index edd5390110b2..1588dd8fc337 100644
--- a/vl.c
+++ b/vl.c
@@ -772,7 +772,7 @@ static time_t qemu_ref_timedate(QEMUClockType clock)
     switch (clock) {
     case QEMU_CLOCK_REALTIME:
         value -= rtc_realtime_clock_offset;
-        /* no break */
+        /* fall through */
     case QEMU_CLOCK_VIRTUAL:
         value += rtc_ref_start_datetime;
         break;
-- 
2.21.0


