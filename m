Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j4MQ5-00044e-VX
	for mharc-qemu-trivial@gnu.org; Wed, 19 Feb 2020 05:17:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53751)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1j4MQ1-0003on-18
 for qemu-trivial@nongnu.org; Wed, 19 Feb 2020 05:17:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1j4MQ0-0005fo-0o
 for qemu-trivial@nongnu.org; Wed, 19 Feb 2020 05:17:24 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:51497)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1j4MPl-0005Db-HH; Wed, 19 Feb 2020 05:17:09 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1N9d91-1jY2sr2w4b-015aL4; Wed, 19 Feb 2020 11:16:36 +0100
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
Subject: [PULL 09/17] ui/input-barrier: Remove superfluous semicolon
Date: Wed, 19 Feb 2020 11:16:04 +0100
Message-Id: <20200219101612.1033925-10-laurent@vivier.eu>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200219101612.1033925-1-laurent@vivier.eu>
References: <20200219101612.1033925-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:dCKqb1vUoCcOnVsEoFGgPBNlgZjVP79jxRfrS4mjxXL8SqMpwsI
 xWH2CzHFJQI6TATjV2J9uuYb9DdLUKoroR/PRigg65uVjxB0cJSaGRbypHneZZA/TJ2pYAf
 vZShdwYCffI27wnIZlrCx4u2+YDWgbBzfDLZMxhScfvb//RMH2Wv8HMumhCEsoEMqcn8yko
 wg5P2CAofkgcrmsCVc3Xw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:KmzcAQTGE2k=:DKepF76/00oaWArlojOmNU
 2mIgrgJrQZSaCDaFoNR8PDhyXXHgDahlgFrx34k5tt//WHFQYkHbbqiU2j+MQpPWMD4QSNwDx
 LPXFm3f2h4FTzIX2O8bKNyhQG1y+2eIleY/qocx7SYN4uctXAQXPRXLBBjJHQzLadpK5z5imd
 REarmrPP3SFwbCrwL0YNO/MloEY7K7fuvEBispu4Nm+CuieGu/p4Y/gVnjWnjP+zA4PxD23ba
 M2T0dJMOutyfunu7ZqCyPfTUHhdhgZSh6ZuXO5gE73xyyRCPLoy9duyv0L17m2IUL+Z65uLo6
 kEgeuwiyfSu3tJGx3HGrQ49pofLhK7ktgDQPBYpLowY9v3LPpq345dB8pz3twxTF8/iFr3Bfg
 XVC2LDRnsx2Sa3B+MBIyxJXmZHEJFPf4llGBB4xoP88N0pG8Zt4F/1RqnBO81YABFxXdtXfTt
 0nJlzgrxKaMAzQZQbHvcsziPfZHyNVnamkKgzXvrEFUzfuuDcz2PobfY1owaatVwmTjWj7kKP
 V/pm+Qmoc5K3OZiYdrqZPS2TSItfCemdgA8L9i/5czkUQxA78aneLTZr5QsrihVYYQ55IfyVH
 fX35Sb831XqPYgRZA6z/10q627ILrs4Aikai2IDnj4395v8r2lwMY/Op+bWKHNBYQ5qdNZ7it
 Wb19erUBBquQNHfphDU9Zbz5AQUM6zaQTARtMpfO78gd4D2/HHTxV1xnn/+grn0GIfPxxl7mr
 +kLUvGMfYayQYmNS0Ku2c++5T7XhnbEZ75WlqvB+7nR41szzCE3uG2H2fArDxJow+8PY2yqdz
 afDc+1mp3BNAQ4h9RfjFF6H9YqMT30PTZ+LdoKgjWQ7daMTmBIjnsZZAOwbBVskDY2IvWTm
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.10
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
X-List-Received-Date: Wed, 19 Feb 2020 10:17:26 -0000

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Fixes: 6105683da35
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Message-Id: <20200218094402.26625-11-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 ui/input-barrier.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ui/input-barrier.c b/ui/input-barrier.c
index fe35049b83a2..527c75e130ee 100644
--- a/ui/input-barrier.c
+++ b/ui/input-barrier.c
@@ -455,7 +455,7 @@ static gboolean writecmd(InputBarrier *ib, struct barrierMsg *msg)
         break;
     default:
         write_cmd(p, barrierCmdEUnknown, avail);
-        break;;
+        break;
     }
 
     len = MAX_HELLO_LENGTH - avail - sizeof(int);
-- 
2.24.1


