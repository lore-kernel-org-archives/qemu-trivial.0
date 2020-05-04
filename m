Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jVdWM-0001lV-Ef
	for mharc-qemu-trivial@gnu.org; Mon, 04 May 2020 12:00:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1jVdW4-0001Xj-6g; Mon, 04 May 2020 12:00:32 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:41617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1jVdW2-0005vM-UT; Mon, 04 May 2020 12:00:23 -0400
Received: from localhost.localdomain ([82.252.135.106]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1M89bP-1jS30z2dMp-005MI8; Mon, 04 May 2020 18:00:11 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>, Max Reitz <mreitz@redhat.com>
Subject: [PULL v2 11/19] block: Avoid dead assignment
Date: Mon,  4 May 2020 17:59:48 +0200
Message-Id: <20200504155956.380695-12-laurent@vivier.eu>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200504155956.380695-1-laurent@vivier.eu>
References: <20200504155956.380695-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:wjbZekFVd4AkavH5+JmTqVCPmGJX0WgY9p/LrSaZFwnmTM1VvtI
 5gut4ghCyk5HKRwG8JoJ2vXgwNOrvB9T93E5yYMDNrE0z2Z7/FD/sd0iqUZIFoF120g80xL
 OyA4efYpyN1muvywIAWyLE/KCPZczGYwDmgs8wnlKwFNUcJ3j8B47ifai7VpOXfo09H5cgt
 Iq54vC0d0+ssIMrvLxTqg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:QAy3hNWbORI=:WJsPiZTOctC0R0fb9aSIIA
 3OOLthmg8m4kDP+sLN5zIcgk/2HARA0zsC7n1VCh3e8QAtOuPaOSpHqWScTnXhkzp54k0H1NM
 9KTk4wdqket3n0cwhZeYysSLRN1cfDwOWRMFGEefKKKQTqF/zeAgW6wnKiEHV/e/y+Mheb/hF
 03E3BAN10p/FvunyZmU55cJDEEc3zP1hohuxLrf9yrDavpc9EIbt4gR20ZXjw4wUoq2jeczYr
 bISQdfFBwSb9VPbBTG+L5N3tGgSif8ld5SEtYD+Y2trNBk41H0K9fsz47bzZKkMfX/ozEnVda
 fvZBWky4+XZimVwUQO1LiyBLoom1GAnoFtCL8XYuljbRrGi2auYyEIqGMi4ryXwGFt94sFuAJ
 MgHW+h9mOhOcys4zjfoBuLv86BBMCZ9q+6aqKim/WI/LenLKrI/a1llmWxady/051Cyx16bPv
 XktY4DhCzW8iOSNH6mUEcQ+YJWw12zgfenPcpQ+/0XK18oZxR5zuZME/i6Q/6cn55tzfu+GIO
 vAnv6VGuCFbtDLO9VQeX41RdCV1VMb9ulWErTIaFT24fwD87991LFOmWPtiDxQ/LjnvQJ5U2M
 4rMoPjytuQffwrnsTtszb27WV/foZBjS6CtZzgu/YjcsT89wcCEH8d8QQwFbDomeHjZd/S2PR
 4vqcn1ilHdTgvbwd9Bh0bpKl9Agx5gvngHBxdKgjUxE4pI1ZjRMQzfeqQqPc4BTwiWfaa05Xo
 8yH81H5lpbcBj575WLxpLqIm/eopGSnUCEHYoKRvG78gIicir1LTJ2rG3O8WX958kyAKHchO+
 +JsUwpp0jLzkD+C/n//uOJn0JWQCEtFYsURXjkxUN5AgD0jEnZgP4sdfbHYi1PLc6IQvYEx
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/04 12:00:18
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
X-List-Received-Date: Mon, 04 May 2020 16:00:32 -0000

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Fix warning reported by Clang static code analyzer:

  block.c:3167:5: warning: Value stored to 'ret' is never read
      ret = bdrv_fill_options(&options, filename, &flags, &local_err);
      ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Fixes: 462f5bcf6
Reported-by: Clang Static Analyzer
Suggested-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20200422133152.16770-2-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 block.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block.c b/block.c
index 301ec588bda2..cf5c19b1db49 100644
--- a/block.c
+++ b/block.c
@@ -3165,7 +3165,7 @@ static BlockDriverState *bdrv_open_inherit(const char *filename,
     }
 
     ret = bdrv_fill_options(&options, filename, &flags, &local_err);
-    if (local_err) {
+    if (ret < 0) {
         goto fail;
     }
 
-- 
2.26.2


