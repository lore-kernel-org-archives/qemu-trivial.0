Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hoSit-00084B-2b
	for mharc-qemu-trivial@gnu.org; Fri, 19 Jul 2019 09:14:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60664)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hoSip-0007kl-5R
 for qemu-trivial@nongnu.org; Fri, 19 Jul 2019 09:14:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hoSio-0000TE-6t
 for qemu-trivial@nongnu.org; Fri, 19 Jul 2019 09:14:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:9935)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1hoSii-0000Oh-1o; Fri, 19 Jul 2019 09:14:44 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4E3D42E97CC;
 Fri, 19 Jul 2019 13:14:43 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.153])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 862AE19C79;
 Fri, 19 Jul 2019 13:14:37 +0000 (UTC)
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
Date: Fri, 19 Jul 2019 15:14:19 +0200
Message-Id: <20190719131425.10835-2-philmd@redhat.com>
In-Reply-To: <20190719131425.10835-1-philmd@redhat.com>
References: <20190719131425.10835-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.29]); Fri, 19 Jul 2019 13:14:43 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH-for-4.1? 1/7] json: Move switch 'fall
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
X-List-Received-Date: Fri, 19 Jul 2019 13:14:53 -0000

Reported by GCC9 when building with CFLAG -Wimplicit-fallthrough=3D2:

  qobject/json-parser.c: In function =E2=80=98parse_literal=E2=80=99:
  qobject/json-parser.c:492:24: error: this statement may fall through [-=
Werror=3Dimplicit-fallthrough=3D]
    492 |     case JSON_INTEGER: {
        |                        ^
  qobject/json-parser.c:524:5: note: here
    524 |     case JSON_FLOAT:
        |     ^~~~

Correctly place the 'fall through' comment.

Reported-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 qobject/json-parser.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qobject/json-parser.c b/qobject/json-parser.c
index 7d23e12e33..d083810d37 100644
--- a/qobject/json-parser.c
+++ b/qobject/json-parser.c
@@ -519,8 +519,8 @@ static QObject *parse_literal(JSONParserContext *ctxt=
)
             }
             assert(ret =3D=3D -ERANGE);
         }
-        /* fall through to JSON_FLOAT */
     }
+    /* fall through to JSON_FLOAT */
     case JSON_FLOAT:
         /* FIXME dependent on locale; a pervasive issue in QEMU */
         /* FIXME our lexer matches RFC 8259 in forbidding Inf or NaN,
--=20
2.20.1


