Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jVZk8-0003YS-0v
	for mharc-qemu-trivial@gnu.org; Mon, 04 May 2020 07:58:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1jVZjt-0003BS-Vg; Mon, 04 May 2020 07:58:26 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:53973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1jVZjq-0002Ia-L3; Mon, 04 May 2020 07:58:25 -0400
Received: from localhost.localdomain ([82.252.135.106]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MsZif-1jHDHZ2zWd-00ty41; Mon, 04 May 2020 13:58:14 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Michael Tokarev <mjt@tls.msk.ru>,
 qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>, Max Reitz <mreitz@redhat.com>
Subject: [PULL 12/20] block: Avoid dead assignment
Date: Mon,  4 May 2020 13:57:50 +0200
Message-Id: <20200504115758.283914-13-laurent@vivier.eu>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200504115758.283914-1-laurent@vivier.eu>
References: <20200504115758.283914-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:03Ne1koK0HaDqr7XUYO5Az/zXyQGSOVXkNfUdTSsTFAQaOqrJ/C
 0CQUOCkrCLo+5MUw1MsCdEGaPwJmxgVO1i4LZy9hgBkMSnNzCTC6XHEFhI6N3L22Xd7Z3Uc
 eavPtNqExSvODzxEqrcynmQyOtrQIZbl7jY3QFCxR8NWsaWVGyLYuHX3KkbDVyLPJ433jIk
 Us/qW/oi/4QQyyStn8zlw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:OSJn6/64oNE=:7gJq+oN4AFSNitIRtBwkJm
 oFMAsPOA/DRbPjrdgqWVWw2cuc1T82ViK6wa+ZvYFgCWgn9DhHpD0IJ9WaWAyxiFI8wqEFJsM
 wjFccASv9E4KP/yHUpedREy2oKkHzQP5+YRV7nc1ErA0b81UOA2zRISyNwUNn1GFGhrGtZzEp
 Ob8EDptQSdLl1wlWyfq0AY/uC91lingK+4r/0xm2oIRCnhFvxOZyAYFlLQdVu1bq1INRzboWd
 pNySifc7V4Xsilc8pBJPbkaZ5jK5C5/rUDuABZODGsGfNbiEjbqMurMxT4C+ZLI5zKfY/4F2O
 +bScd0TZnHl/8q67SzNnHJYrDasqyW2XTzUbPtuEiub2JQVDObCgEjamc26leRC6tHnL6EYva
 pXRC6AMKs2Dxeb/Fg/EggvdvDDlpaukSdX+rxRTynYVXc++gcnXQe87zSZ2M5EGxEXrSz4YeK
 VVhIrLwbM+/82hu1akVvivibeJLqZCEUTv2r63ac5MtkymOoXgG0tSCkBhEjTsFKprj8Qdo4M
 wWXv4k4/RS/osJqTE+FTO5gpSr3e6v9a94ZZfcHs10ZensCwQzulWRm4eCrLbFyTs5EtUyTRn
 0VVwvBW9ptNpVFBBBhENBDyXh6V5jVzp8dGW34+jvyI9KToapdMzUcxyHH+Rqk5rbgjoIe/0u
 F2vY8uc605aW/LwPBbwP/Nec71fKISzbAx7JjscvxbnSaHDqwee8NwIV8zm7fAQfzxD9QSM93
 xgvGWxYyD7uDbd5BnKAtyBiOroQLms9UbdEBJ6QZ/UQwA1OqyIsJvWt8MXe6otuaJs4rGUCu3
 o3/2/yKUDBRtbwLWZ6RRJlHsUQhI/roAjZ8gBgmNmI6SzMExa5SdDzHWMYtjv8QCLfx3Fk5
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/04 06:04:59
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
X-List-Received-Date: Mon, 04 May 2020 11:58:26 -0000

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


