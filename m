Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j4MPd-0003We-LS
	for mharc-qemu-trivial@gnu.org; Wed, 19 Feb 2020 05:17:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53156)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1j4MPZ-0003Nj-Kn
 for qemu-trivial@nongnu.org; Wed, 19 Feb 2020 05:16:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1j4MPX-0004wY-Ud
 for qemu-trivial@nongnu.org; Wed, 19 Feb 2020 05:16:57 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:40357)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1j4MPX-0004s3-Lj; Wed, 19 Feb 2020 05:16:55 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1Mjjzx-1jkar72j4F-00lBPA; Wed, 19 Feb 2020 11:16:38 +0100
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
Subject: [PULL 10/17] target/i386/whpx: Remove superfluous semicolon
Date: Wed, 19 Feb 2020 11:16:05 +0100
Message-Id: <20200219101612.1033925-11-laurent@vivier.eu>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200219101612.1033925-1-laurent@vivier.eu>
References: <20200219101612.1033925-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:fkHa02snvuJQT1kC46g80W+yqWWgilAKPwOIMaZZ0rfIXJl3zFW
 BRJvL0sHaJrlWTI636tFdxcZk5MTKE89WpJPgkNQxOo6QmkNuaepT2apNVG15I+aeSNIcKf
 LjjKWDkYdoau+4cpLTeelCwYHvIb9K5rYa34X9tBOxd2+bn556wXIajXdo+idIXme71V8lU
 ZUjWu+EP17IbBWUUsyovw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:6lzzjanm2QQ=:GUiRVkqhwiQKhZZmYv4lUz
 U3WJdTbu7Sm1xzFslXtWrl2dGKXZjuJI/gfSKA3lWa4Djwbn6c1gLkvn4NjLry0/TgoZE5uus
 T+Dkq+9LdXJrZKXyDQ89NSe9e6B1IAK/XfYlZZa4svjg8tlOoU94rJXRO+2IuvDs+c0c8M7yU
 DMGiMjdsvuOknedGzkdVUh3ZkK6l8z+7ESIfizC4efHlnAAT6q8ICGEXbdlFK/j7fUyUp3Z1j
 UKYK2lzZCwtFZVRG6YTIzGq2V/wnOlexUhaoMYAcs9Az/GcC9p8LwdXLjsUPJDfDSZ9JF8Kou
 O2VOGDydoEKmrv9NbqkbxgElieYDApDsS0VnR5GlpR5OgPu0mWg7w/nO4mI/mOTZ9lSYPnGxX
 zV5rREj1/OBGQi6gzN2kUtk1dkWjrOZGrCTbtTgCIoWktELxRRx/f7qCi/bWwYA59e9sPGrbl
 r56Sgj2gxf512cWEXP59/lywJpIyO5IV/ksWtjYIejW9+qtPZtnuldnrAu0LbFVcy1W/FQfrz
 e9NjEj++O60GnQhzzSIYo6111ZYgUwXJtFj7M7ODXM+2h+qYa8kx0ywWJ9NhLpnIr1yWI2HFe
 JBRUjFcqazlogaHqUo5sOTreud4/PxK/2lP44riO3hnsf2HUyGkpel1rfFydlvVb14hnciFeC
 qQ6jBqPgBhpeyVuXNOMNXIqv5GHF1kxguLX4kUy+VP8wTrKHTgoidL1kX/mMBkpVQ6TFioj5k
 BjcdOi7RBDOTJkfh42BuYyUmHz2LCaz/jnptSMV4H3ebAvcW6qEvJcGfO5xJU+F08ocpnECy6
 +Oo47RPX0K+S00CYoNmcaw3I3rVYgdDFvCOlBdCV13c2PqYLFxEy5uXrQNvs5+LA63MBAoK
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
X-List-Received-Date: Wed, 19 Feb 2020 10:16:59 -0000

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Fixes: 812d49f2a3e
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Message-Id: <20200218094402.26625-12-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 target/i386/whpx-all.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/i386/whpx-all.c b/target/i386/whpx-all.c
index 3ed2aa1892a1..35601b81766f 100644
--- a/target/i386/whpx-all.c
+++ b/target/i386/whpx-all.c
@@ -511,7 +511,7 @@ static void whpx_get_registers(CPUState *cpu)
     /* WHvX64RegisterPat - Skipped */
 
     assert(whpx_register_names[idx] == WHvX64RegisterSysenterCs);
-    env->sysenter_cs = vcxt.values[idx++].Reg64;;
+    env->sysenter_cs = vcxt.values[idx++].Reg64;
     assert(whpx_register_names[idx] == WHvX64RegisterSysenterEip);
     env->sysenter_eip = vcxt.values[idx++].Reg64;
     assert(whpx_register_names[idx] == WHvX64RegisterSysenterEsp);
-- 
2.24.1


