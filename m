Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hoSjc-0002cg-4Q
	for mharc-qemu-trivial@gnu.org; Fri, 19 Jul 2019 09:15:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32862)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hoSjY-0002Nj-DT
 for qemu-trivial@nongnu.org; Fri, 19 Jul 2019 09:15:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hoSjX-00019r-At
 for qemu-trivial@nongnu.org; Fri, 19 Jul 2019 09:15:36 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60622)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1hoSjQ-00010P-U9; Fri, 19 Jul 2019 09:15:29 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 295F430BD1B4;
 Fri, 19 Jul 2019 13:15:28 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.153])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3367E26DF0;
 Fri, 19 Jul 2019 13:15:20 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-block@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org,
 Corey Minyard <minyard@acm.org>, Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>, Kevin Wolf <kwolf@redhat.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Weil <sw@weilnetz.de>
Date: Fri, 19 Jul 2019 15:14:25 +0200
Message-Id: <20190719131425.10835-8-philmd@redhat.com>
In-Reply-To: <20190719131425.10835-1-philmd@redhat.com>
References: <20190719131425.10835-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Fri, 19 Jul 2019 13:15:28 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH-for-4.1? 7/7] spapr_events: Rewrite a fall
 through comment
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
X-List-Received-Date: Fri, 19 Jul 2019 13:15:39 -0000

GCC9 is confused by this comment when building with CFLAG
-Wimplicit-fallthrough=3D2:

    CC      ppc64-softmmu/hw/ppc/spapr_rtc.o
  hw/ppc/spapr_events.c: In function =E2=80=98rtas_event_log_to_source=E2=
=80=99:
  hw/ppc/spapr_events.c:312:12: error: this statement may fall through [-=
Werror=3Dimplicit-fallthrough=3D]
    312 |         if (spapr_ovec_test(spapr->ov5_cas, OV5_HP_EVT)) {
        |            ^
  hw/ppc/spapr_events.c:317:5: note: here
    317 |     case RTAS_LOG_TYPE_EPOW:
        |     ^~~~
  cc1: all warnings being treated as errors

Rewrite the comment using 'fall through' which is recognized by
GCC and static analyzers.

Reported-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/ppc/spapr_events.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ppc/spapr_events.c b/hw/ppc/spapr_events.c
index ae0f093f59..0a98894ad6 100644
--- a/hw/ppc/spapr_events.c
+++ b/hw/ppc/spapr_events.c
@@ -313,7 +313,7 @@ rtas_event_log_to_source(SpaprMachineState *spapr, in=
t log_type)
             g_assert(source->enabled);
             break;
         }
-        /* fall back to epow for legacy hotplug interrupt source */
+        /* fall through back to epow for legacy hotplug interrupt source=
 */
     case RTAS_LOG_TYPE_EPOW:
         source =3D spapr_event_sources_get_source(spapr->event_sources,
                                                 EVENT_CLASS_EPOW);
--=20
2.20.1


