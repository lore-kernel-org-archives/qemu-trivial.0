Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jBK3P-00014J-9w
	for mharc-qemu-trivial@gnu.org; Mon, 09 Mar 2020 11:10:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34321)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1jBK3F-0000x0-Tq
 for qemu-trivial@nongnu.org; Mon, 09 Mar 2020 11:10:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1jBK3A-0008GB-WF
 for qemu-trivial@nongnu.org; Mon, 09 Mar 2020 11:10:41 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:45825)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1jBK30-00086s-Eu; Mon, 09 Mar 2020 11:10:26 -0400
Received: from localhost.localdomain ([82.252.135.106]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MTRIg-1ilycF3xAi-00TixO; Mon, 09 Mar 2020 16:09:44 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Greg Kurz <groug@kaod.org>, qemu-block@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <rth@twiddle.net>, Jason Wang <jasowang@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Michael Tokarev <mjt@tls.msk.ru>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Fam Zheng <fam@euphon.net>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-arm@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Andrzej Zaborowski <balrogg@gmail.com>, Helge Deller <deller@gmx.de>,
 qemu-trivial@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, John Snow <jsnow@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Pan Nengyuan <pannengyuan@huawei.com>,
 Euler Robot <euler.robot@huawei.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 26/33] core/qdev: fix memleak in qdev_get_gpio_out_connector()
Date: Mon,  9 Mar 2020 16:08:30 +0100
Message-Id: <20200309150837.3193387-27-laurent@vivier.eu>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200309150837.3193387-1-laurent@vivier.eu>
References: <20200309150837.3193387-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:JrwU5Vff2nH36QqBO4SokSEF69SyLDUjmJiemvsl2Y5FiFoopSF
 qM3/d1v+H+NTqckOknHbdzV3hqYgy0asz4jG+GbS+v2s8EiozVN64Npe2GPZZlCKe5Ou7RS
 caFVun3IuIaz8shA19ArETShfKh5J3hSTou1IF2yjuQiXHQJ7fREbNp0mugBgvBqVpNlXKe
 Y+J7A87RduBOMkp2iHrfg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ibjFkJcPduc=:CiTMwqX4N2Li33mxCvemy8
 ywpgPkYjXqxkZ9eNYfnNzECgJ2yDysKNRe+CsM0yWU2UncSG/e4n5ciycjGBOAyiWthdNszZ6
 5W2SuLjK0Kxe9iPAvaEu9Phl21aKVSkqMorRfd1asAlkVAnN+nfD/DFPQTMQFBalDfAHazamh
 Wbo8OscT6mWPmj9XIT71oS16QI24wFhdLhwHvN8iVw82cekuBxAU6rFxnD7ncue/BfGP7x4rh
 b1qnw9GDVxKM6FkRrjeV++rGPMLFmRj6NkxU28JV0xGg+iqj4LK9R9aUWXRnmlbBPdS54y+F6
 Pz2KrblG+WSY09IjG99DYvSv07uZrfygxaakv+/I+qh4546AerUXAgp6h0dSjrsL3M5y0/o9w
 5KMiggQJVRFNmVp+nV4olWup9nsms2DuToJMA85MPKcbWg7zaSlnIG/WOSE0B2jBvLZdEqCeI
 RVEWQXu4Rrj98u5HsrBTLmhhVjk+Gb95F6WQaIBbINJ2+0APEMVURYWL5yMseYmLXur6S3YFI
 gVZ+xFQc+DTXvSn1qaDf8j37ck5mH6UojnrRbylRck2/23tnEmP1GCg/n6h9nUi9yot6HJP0q
 BR7eW9XKSeGz31y6I7cdCQHalbe/e9tBXy6X9GznZyj86HgCB2Thdry9/q5FtJsCcrkQO6wgf
 fh0We9FTtZdV7DR9WbHCpYMfhO31OC63dfgM57Qz7htfvehHu+GevgOD2mJxYit5hCnt66F7i
 EFb6BmmHtf0FWg45i0v1u3JdLvJSpni36jnKG6vBGbkgve2jo0BlykgiM4oHXbMH97y5fMg5f
 4zKaPMFTrienIGq3OUL1XfWXpC3HLwsVO2Phtljc8tCoEcuvrjGpuqYX9fyUpTPCn2tQc8R
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
X-List-Received-Date: Mon, 09 Mar 2020 15:10:47 -0000

From: Pan Nengyuan <pannengyuan@huawei.com>

Fix a memory leak in qdev_get_gpio_out_connector().

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20200307030756.5913-1-pannengyuan@huawei.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/core/qdev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index 3937d1eb1a5f..85f062def72b 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -557,7 +557,7 @@ void qdev_connect_gpio_out_named(DeviceState *dev, const char *name, int n,
 
 qemu_irq qdev_get_gpio_out_connector(DeviceState *dev, const char *name, int n)
 {
-    char *propname = g_strdup_printf("%s[%d]",
+    g_autofree char *propname = g_strdup_printf("%s[%d]",
                                      name ? name : "unnamed-gpio-out", n);
 
     qemu_irq ret = (qemu_irq)object_property_get_link(OBJECT(dev), propname,
-- 
2.24.1


