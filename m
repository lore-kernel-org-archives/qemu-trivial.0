Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iNv52-0000ou-Po
	for mharc-qemu-trivial@gnu.org; Fri, 25 Oct 2019 04:36:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49860)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1iNv4y-0000hq-Dp
 for qemu-trivial@nongnu.org; Fri, 25 Oct 2019 04:36:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1iNv4x-0007qj-82
 for qemu-trivial@nongnu.org; Fri, 25 Oct 2019 04:36:16 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:39421)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1iNv4l-0007fP-Jw; Fri, 25 Oct 2019 04:36:05 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MGzI3-1iAOHL1E8J-00E7YF; Fri, 25 Oct 2019 10:35:28 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Artyom Tarasenko <atar4qemu@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 Joel Stanley <joel@jms.id.au>, "Michael S. Tsirkin" <mst@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Laurent Vivier <laurent@vivier.eu>, Michael Tokarev <mjt@tls.msk.ru>,
 Richard Henderson <rth@twiddle.net>, qemu-block@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-arm@nongnu.org,
 qemu-trivial@nongnu.org, Fam Zheng <fam@euphon.net>,
 Aleksandar Rikalo <arikalo@wavecomp.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Andrew Jeffery <andrew@aj.id.au>, Helge Deller <deller@gmx.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-ppc@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Frediano Ziglio <fziglio@redhat.com>
Subject: [PULL 04/19] event_notifier: avoid dandling file descriptor in
 event_notifier_cleanup
Date: Fri, 25 Oct 2019 10:34:56 +0200
Message-Id: <20191025083511.11463-5-laurent@vivier.eu>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191025083511.11463-1-laurent@vivier.eu>
References: <20191025083511.11463-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:/ygMbVZUdrFShG2v+IwnlPx6NIe+igwbNnW32CPAFZuGdtiUZh9
 0Ag7mN+G3qOA/JlMXTSSzZMY2YZxxMu+jxcdUV3RBC7q7YF4hZCrD2ewOCsG35HyemMQOH0
 s0OumAT5NnUORhCIcj+oZsgEWy/CdihNGmfwGmsa+EE/XjFUElfWapjzoTvtvcHW/qPABLp
 6f9lJd4xJqi8TuaIrEc1w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:5TrCoAdjS+w=:JrwOcPzSsGryCaoDQey2WN
 BPSyYWdhIqoa2zPIH+8m0tRxMWYzgJeURfgN80r3PI55IGpPXSaQVKckmk2aw2FakezM1KNvR
 iaL4KW4/ESiWbew9xuUkGWBIlNsDtXFo1rUm5ETB2o+zwg2WJS5Y7fpnBvNBof5p2ntYqYcYH
 2oUdz0ZC08JmvE0Uorr9MKPnAgyVhOe51awoiAx69gQ+jZtduR2RARiNL3+WAdA6TvFPlmtEE
 zScXw3SnBZcSq2yngSGSz5CojOq+DjWNSYx64PoY2OaZxilz77wwNxaLbWQITVscS8ij2I0zO
 RZV4+/fft28sCQ0g7echHzRsio77eFLJ21ZcAungNlpoiRYe665tM9yi/0IsEbBY7+R3qCLAl
 hBOHSDzhpnzItNTYSUrE00CK6sMb5XJfSKZAOCifukifEcQpXnsMYP0fZeT42VtLFAHeThLEf
 biJTxCnF43gHscNjwlkVZCGtQ5ZXXEHX8gJGsIHQZckdS9cHZYUKXBgSgmKAkJ4eiDd6yLpsY
 O6ozRs2rtdX6ZZoJe/4W0Zk2VbSCErwPOtzKMvu5NcfgBIozzzwftvChf54tfL5Be98lH5RNJ
 U/kcZNIO4iD+lUokltU4qnXR+TuC5jgAc9mz3j+vZ5uHKvCbYsqFIIWBeSIEOI5q4dyciz7Av
 rUG1DPiITW5Z6SsUwNyr75tW7wiRQj/vTZEybtmCWRQB1RfT0+FkHheGDOwvSuZuytzHOGbwy
 V/iRz6zkE/7JTv/WY4IUYXcBnzqVPXcWPyCs5siSV/9yjkTqtiFzSOUht7EmqvES4tkATwg7T
 pSyk4iZJtGvt1Hx0rJOXL4UeBAOJKlbnvXC65JhX+VkTjHJ/4wIn7N9+IdfU/KeRGF1l7wTlQ
 dQvEq5Ok5NvynbHdU6tw==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 212.227.126.134
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
X-List-Received-Date: Fri, 25 Oct 2019 08:36:19 -0000

From: Frediano Ziglio <fziglio@redhat.com>

If rfd is equal to wfd the file descriptor is closed but
rfd will still have the closed value.
The EventNotifier structure should not be used again after calling
event_notifier_cleanup or should be initialized again but make
sure to not have dandling file descriptors around.

Signed-off-by: Frediano Ziglio <fziglio@redhat.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20191023122652.2999-2-fziglio@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 util/event_notifier-posix.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/util/event_notifier-posix.c b/util/event_notifier-posix.c
index 73c4046b5871..00d93204f988 100644
--- a/util/event_notifier-posix.c
+++ b/util/event_notifier-posix.c
@@ -80,8 +80,8 @@ void event_notifier_cleanup(EventNotifier *e)
 {
     if (e->rfd != e->wfd) {
         close(e->rfd);
-        e->rfd = -1;
     }
+    e->rfd = -1;
     close(e->wfd);
     e->wfd = -1;
 }
-- 
2.21.0


