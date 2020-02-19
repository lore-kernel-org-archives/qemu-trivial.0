Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j4MQ4-0003zm-AZ
	for mharc-qemu-trivial@gnu.org; Wed, 19 Feb 2020 05:17:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53659)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1j4MPz-0003kk-2r
 for qemu-trivial@nongnu.org; Wed, 19 Feb 2020 05:17:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1j4MPx-0005ba-1X
 for qemu-trivial@nongnu.org; Wed, 19 Feb 2020 05:17:22 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:42177)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1j4MPl-0005E5-Hi; Wed, 19 Feb 2020 05:17:09 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1Mg6qO-1jfMBg2Api-00hce9; Wed, 19 Feb 2020 11:16:42 +0100
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
Subject: [PULL 12/17] contrib/rdmacm-mux: Remove superfluous semicolon
Date: Wed, 19 Feb 2020 11:16:07 +0100
Message-Id: <20200219101612.1033925-13-laurent@vivier.eu>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200219101612.1033925-1-laurent@vivier.eu>
References: <20200219101612.1033925-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:tJgVAAVMMn3+c37OfdxkHmZOyXt9X6EcTglyXr1fuQBoEdhAVfv
 sSAEFbkmOLKx1MnWQuebAB/3B/0J1g0b3XB+l8Hky2y8nK91SwawqTEPLuaCK+KSF7YPdmP
 A23tOegJ5ZIBBgxNy15tTrCt2Ajt7w3rlgj3AB6RcfFNWVsLeZFZx68tuWElhhwQH5PPgCY
 V1RLYHRHd6aCYzkxo2LTA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:+QcXR4QTgtk=:U6b93kl51Kv7yde5H/nmOK
 LI3W02JsmyYCzCE5C/Wv6oSfKt+ph00XatFeyBNZ9azvK1z1qgQtyMAPj6Mz8hlDB0UBLRtz2
 YpygeQWm/mvyaL5YCLSE4dQMPphlgJCTo8jQ3EXqghKbn4lX6p+HSjyMT78PxgXXTAmZmQsGE
 RZz1ai2Ge0cm+clsaC5Qk1Q3nN3r3kLHaHxhXEXDSl9IcIvJyG0m6wASsTAsAAQrFhDR50cr6
 lQ7Zmvv2KeUApCX23RoAePtD0xXZEdtrC6+VasDNKio7yWW0zMLygYhvHsA796Tncf+r9svtm
 oPBg4Z0DwJD5Rn7lhCDmByHzvjUI7JaOncoaeUMDg5Rhg7x+8w0bPV2dGXH9yf21xJVMt8tfC
 XMuZh/t+IsRrQ8B9bZzluPKGrqlVaMQtOM9vb+qm/lg+b1gPbFMlRgPdVk4W75fEAG2hiQaLj
 A2zeSAtyk1FBZ2QhAxiyC+e5h0vKJhxbAuu6XP1mU6usilBl27BdIrl9vEmg6yL0S78nzEvT/
 XMwfWNzwHpIIWTHXb+/4QJFiqW3H0gd4sY96DPslyCp+l7ehy/4q7vk1X3OgknRT0SET8zll9
 JOK/eW8knT6dmSVY2PLtXBehJGTGp5YXSXbFRuhekrXrGuOYNYzj1Cv+syUv0s0v8kKDxQufH
 2QcARE2HXtwKFn2pJBf2ekjWTdAyyP+3Ip4zH0LeoPSXxl6DudW9BAA6vxfLp1hVmNYZFpb3d
 hTmMkJC7F0Get90/vxWIa/SFpJllSfo1x0EKxtz8rMBXjG0edb/vY1bH9sAmmF4xgdMMpAVwK
 STqjqGmInJXjII8NbF31OvxjnxE+ADJxCaQKNUP3u5QFJYn3dkoXK2kxPlp6BWwWRm2ejLm
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
X-List-Received-Date: Wed, 19 Feb 2020 10:17:24 -0000

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Fixes: a5d2f6f8773
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Message-Id: <20200218094402.26625-14-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 contrib/rdmacm-mux/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/contrib/rdmacm-mux/main.c b/contrib/rdmacm-mux/main.c
index de53048f0619..bd82abbad35e 100644
--- a/contrib/rdmacm-mux/main.c
+++ b/contrib/rdmacm-mux/main.c
@@ -490,7 +490,7 @@ static int read_and_process(int fd)
 
 static int accept_all(void)
 {
-    int fd, rc = 0;;
+    int fd, rc = 0;
 
     pthread_rwlock_wrlock(&server.lock);
 
-- 
2.24.1


