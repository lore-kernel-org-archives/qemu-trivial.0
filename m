Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i0OfX-0005Fs-VG
	for mharc-qemu-trivial@gnu.org; Wed, 21 Aug 2019 07:20:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53591)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1i0OfS-00057M-Rv
 for qemu-trivial@nongnu.org; Wed, 21 Aug 2019 07:20:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1i0OfO-0006c8-SJ
 for qemu-trivial@nongnu.org; Wed, 21 Aug 2019 07:20:42 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:36673)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1i0OfA-0006Re-Ak; Wed, 21 Aug 2019 07:20:24 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MXHBo-1hkUrl3R8w-00YiE0; Wed, 21 Aug 2019 13:20:04 +0200
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
 Stefano Garzarella <sgarzare@redhat.com>
Date: Wed, 21 Aug 2019 13:19:39 +0200
Message-Id: <20190821111947.26580-7-laurent@vivier.eu>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190821111947.26580-1-laurent@vivier.eu>
References: <20190821111947.26580-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:u2atPAoeKpCu5Yo8clBe1Kcd3F6j4dMNP1n92CWUCIMF4iVFIN0
 HB3W5V2tXHG2XG9Zm+Pa8nQINXF2pbWxvfvh2RAM8NfvoZXbQtpe9szEYfiXEwdj9YjqWIB
 PHDnBafwblquxKDujYqeU0nulnO7JcGY8tW4sRoULOwhlj/LEw08cbFsSm0YsDzpYrcA8TN
 zJZL6suIPqxMmvCij41/g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:+Cos+Wn8A+E=:EWRm5POM6JvWWBgwUC1dty
 XbsDJN4qMDvRF/LC/PQ0lUTQuVf/vtc9MXw12GuA4HIjLerASa2z09iOdqYnl2mmjhKxDDdQb
 Jr4y63PH1lizLwlv5pyVFRxe2xs8CaKUaCAjEJz+PSRrt1XSmJ+kaSDb3OMN7uoWH7B90f13m
 XyB8hZEFcNgs3iqAnogpmoB7ds4wUGjMsxamQBA1YTzz5o6bNNc1g7qZadhYTFIntGvWUzVsX
 PkMiP7I4imrCGVmQQ7GT50nP/QPvsJMnQFX8LqzV5NC7N1KMvNZQadEy3GrQyzEQ/I4maM/4L
 6sw4JaYy6f/sxAHZ5I16+W3EfQV4UuZxlp7ONfNyYKXzUpdtYGLTnk+Uycu4K6OG/rlFxytCc
 hIaN8RRNJHeOJ2xMD0bgR9bU5d7zqnwz7UyEMRG45gUrLIReVjWXxg2uYtclJwMyNgkT8bDnf
 gQWI4vUp91zDKX49cz738GNQB+mdqayZCy4C0cmgvII/suqIZXeiDIuZJdBghBjU7GTKicEEw
 jKaG+4Yct5Jk6XHAoiGLpivJHIJwqJfru5/EMhh91PX9ZSfPxNG3l/lLYzhUxeCjL0mlMy+Fx
 m1AYQY0ScDO9PWywouTom8kzT2LWy4XnV6iPPzcYqyRchK/OGecrpa0ZKoOFn/u8komWXEODX
 jMGwj0apc6wBsmPllCElERy9rxuRtbA8MCZvfB6W1mOyFf3MfKJeCyxMPEi78bw0qRN+I4nBm
 Knmol9q88Z2yEnN5N+dl6bcFCNd2XmUkWSOyeirx7WXDQMdSvCVze041XJk=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.10
Subject: [Qemu-trivial] [PULL 06/14] hw/net/e1000: Fix erroneous comment
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
X-List-Received-Date: Wed, 21 Aug 2019 11:20:46 -0000

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Missed during the QOM convertion in 9af21dbee14.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Message-Id: <20190715102210.31365-1-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/net/e1000.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/e1000.c b/hw/net/e1000.c
index 8ae4e08f1e90..a73f8d404e6c 100644
--- a/hw/net/e1000.c
+++ b/hw/net/e1000.c
@@ -1608,7 +1608,7 @@ static const VMStateDescription vmstate_e1000 = {
 
 /*
  * EEPROM contents documented in Tables 5-2 and 5-3, pp. 98-102.
- * Note: A valid DevId will be inserted during pci_e1000_init().
+ * Note: A valid DevId will be inserted during pci_e1000_realize().
  */
 static const uint16_t e1000_eeprom_template[64] = {
     0x0000, 0x0000, 0x0000, 0x0000,      0xffff, 0x0000,      0x0000, 0x0000,
-- 
2.21.0


