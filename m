Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i0Ofa-0005MA-Vh
	for mharc-qemu-trivial@gnu.org; Wed, 21 Aug 2019 07:20:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53507)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1i0OfP-0004y9-3O
 for qemu-trivial@nongnu.org; Wed, 21 Aug 2019 07:20:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1i0OfM-0006aw-VE
 for qemu-trivial@nongnu.org; Wed, 21 Aug 2019 07:20:38 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:41083)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1i0OfK-0006Yo-Tc; Wed, 21 Aug 2019 07:20:35 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MBV2f-1i68Tj3duR-00D2Vp; Wed, 21 Aug 2019 13:20:13 +0200
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
Date: Wed, 21 Aug 2019 13:19:45 +0200
Message-Id: <20190821111947.26580-13-laurent@vivier.eu>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190821111947.26580-1-laurent@vivier.eu>
References: <20190821111947.26580-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:6ipEDEcf1Ck2g1S/2T5QDfUmWvcuh7rLUy0thWBMmKgkr/N+jy1
 Ybak3/nPxJmyHlHnCx5c6BXVpxx1374Z3SOvYs+KdQAz07Doe2mtfJyevTsKCgJ5QzPKf/X
 IwPYYqfooIabtrLUTh6pxtFN7EQhvYZvly+ByKaYneUXipiJzhv0vA8FtAdK85bKnmtRgvN
 vntQWrHDpJeHtE9O0vV4w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:DwWjJYGGRN4=:0isE0L0d1QA40v1eJkR/lK
 sVjek+lCcppBL/cb0uvibM1wjQZffouxlGFFgJl64PnWdAjWdRGy7IQtfH8zmh2uXv1QM3v5t
 5LEsKGaGM9LrFqFXttszEOS6/KZF03P3gQaDpfk3l3EA/xy4qk1obGFZgBJFIzLgYkZ0EKAIP
 Iw+rEbTo1aN5kSqgSJL6uN7ABRba3WjkSel/5UtVOfHfVo2y94S0eItGI/YlPFBlwO+BnyyFw
 saaXtgMPf2wyJB1TBbagLLX4a8Q6Kz4uFuzCdJfp/4o58EYBC8tmq/QF4KlE946WmK7Fy+sRO
 fwlFDUhPZJGFECUKHJTo+CrPKkC5Mq561UlUif2qv5U+wby1Z+oBt07Yp/OhPNqBq2+SvSOK9
 koD0lS4ArB/FlzHmx5SKJ8VwEPuiM4N6FOHIeXlb8QYPnKWnp+/nY/AVBTXJmjttZExROM25C
 7SFVXg+0BZ9fLmaZLbaocUfvS1AYVwqFAsn5jnyXA9X0loe6fmD4UDYgfA7SnXldp/ttrXcGy
 Q8NbmGf2umfEUK3MFv5t3KytZq6xgeGGP+BCrt0spAGYM2kYaq7Kk2J/fpTxu77AXLFg83JXp
 wfuxysMMvb6Dd1Nf3Idi+DSth38ffeH/NUlceIDSyKQY9aXtYpecIaNy2hXPzdrY2XRiBx0hY
 4RqRRptC4wYZTbzoJOC5+FhHkk8IOSs+la/Gc2VcuHh86kwevlFdhj0z0ThI65UumfEncdYh/
 SFe3b+SO/kq+R2u/yiIgABY264zhWutoJ6nLHjKMC4MyZAyjcW/PTY0jaF4=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.73
Subject: [Qemu-trivial] [PULL 12/14] spapr_events: Rewrite a fall through
 comment
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
X-List-Received-Date: Wed, 21 Aug 2019 11:20:41 -0000

From: Philippe Mathieu-Daudé <philmd@redhat.com>

GCC9 is confused by this comment when building with CFLAG
-Wimplicit-fallthrough=2:

    CC      ppc64-softmmu/hw/ppc/spapr_rtc.o
  hw/ppc/spapr_events.c: In function ‘rtas_event_log_to_source’:
  hw/ppc/spapr_events.c:312:12: error: this statement may fall through [-Werror=implicit-fallthrough=]
    312 |         if (spapr_ovec_test(spapr->ov5_cas, OV5_HP_EVT)) {
        |            ^
  hw/ppc/spapr_events.c:317:5: note: here
    317 |     case RTAS_LOG_TYPE_EPOW:
        |     ^~~~
  cc1: all warnings being treated as errors

Rewrite the comment using 'fall through' which is recognized by
GCC and static analyzers.

Reported-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: David Gibson <david@gibson.dropbear.id.au>
Message-Id: <20190719131425.10835-8-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/ppc/spapr_events.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ppc/spapr_events.c b/hw/ppc/spapr_events.c
index 163a6cd25b45..0e4c19523aea 100644
--- a/hw/ppc/spapr_events.c
+++ b/hw/ppc/spapr_events.c
@@ -314,7 +314,7 @@ rtas_event_log_to_source(SpaprMachineState *spapr, int log_type)
             g_assert(source->enabled);
             break;
         }
-        /* fall back to epow for legacy hotplug interrupt source */
+        /* fall through back to epow for legacy hotplug interrupt source */
     case RTAS_LOG_TYPE_EPOW:
         source = spapr_event_sources_get_source(spapr->event_sources,
                                                 EVENT_CLASS_EPOW);
-- 
2.21.0


