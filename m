Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lhr9V-0006BX-OA
	for mharc-qemu-trivial@gnu.org; Sat, 15 May 2021 06:04:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lhr9G-0005zy-DU; Sat, 15 May 2021 06:03:54 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:46649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lhr9E-0006Rf-L0; Sat, 15 May 2021 06:03:54 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue109
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1N8GIg-1lUbb72SAa-014Ezx; Sat, 15
 May 2021 12:03:45 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Michael Tokarev <mjt@tls.msk.ru>, Stefano Garzarella <sgarzare@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: [PULL 10/16] cutils: fix memory leak in get_relocated_path()
Date: Sat, 15 May 2021 12:03:29 +0200
Message-Id: <20210515100335.1245468-11-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210515100335.1245468-1-laurent@vivier.eu>
References: <20210515100335.1245468-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:hQgSLniPSPIkFasef2ucT2q7fNqhdgkXoz4XL/29Gek8tIhn7cg
 xVfStAtiuhiGqhev85LW0FNnThLPc3Stp3L2++2m6rG4uTdBhTteMpP0zgonMc4eHRlp20C
 ximVuLcf0zpflqIwPNg0wJIH7O891SzqStY4ptGEJrG1T2cBh820jlNbtKGcqhCCWozl/G4
 8qJyoaFTapqFYO3CtT8Xw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:3nS4Wi9fYB4=:OhBA2UU0B2/qCSx2xObyLJ
 wcakKu98mWJM7U2+VltgXC4ZGk7XTvIlqX+B2tkUTw4ubpbb22BOZohCZDDTUQrHOf0Vxwohn
 n8f9QJeEb6l/kA3tIMnsIBKoS/w5Ox7LFndifIjXgwSjLI5Dkl8G5ZfKw8O94QMbKjhGWTnGd
 cta+XAbp84ZQ/2Eu6evo6po4f1hNzVjNjPZO7y5Uz8zkZl4aFms8uQeO1+ogWG2M4xYqYT9gr
 12/egMMuIISUtiL0X0fSGq9WHF1V16l27rhBMp/X1EFycEs4ZU0OKNjOUuqnZUdj8iSl3qCZu
 CUtZp4C9wrS5/b85kr3B1/L+LdmMii2MubVyAD16DW34AvSNz1jql8ZTZvZm6iHQ8uMtU6s1S
 gUdzcIHYWLE7KxEu2j9WVbcATOt8ce7OPQ6koR6/cHZzJTFF1BMi95i76cr7tQiugmGsfGXlS
 oASbGtj656ozNZ2SnSFMK8qIm9aOLJCQnrxmaD8XamIfEu7j6lQ3HrpfiZtwQiiOlETo/7GPt
 pTP5kkDy8VVjORs2s9P2Vc=
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sat, 15 May 2021 10:04:00 -0000

From: Stefano Garzarella <sgarzare@redhat.com>

get_relocated_path() allocates a GString object and returns the
character data (C string) to the caller without freeing the memory
allocated for that object as reported by valgrind:

  24 bytes in 1 blocks are definitely lost in loss record 2,805 of 6,532
     at 0x4839809: malloc (vg_replace_malloc.c:307)
     by 0x55AABB8: g_malloc (in /usr/lib64/libglib-2.0.so.0.6600.8)
     by 0x55C2481: g_slice_alloc (in /usr/lib64/libglib-2.0.so.0.6600.8)
     by 0x55C4827: g_string_sized_new (in /usr/lib64/libglib-2.0.so.0.6600.8)
     by 0x55C4CEA: g_string_new (in /usr/lib64/libglib-2.0.so.0.6600.8)
     by 0x906314: get_relocated_path (cutils.c:1036)
     by 0x6E1F77: qemu_read_default_config_file (vl.c:2122)
     by 0x6E1F77: qemu_init (vl.c:2687)
     by 0x3E3AF8: main (main.c:49)

Let's use g_string_free(gstring, false) to free only the GString object
and transfer the ownership of the character data to the caller.

Fixes: f4f5ed2cbd ("cutils: introduce get_relocated_path")
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20210412170255.231406-1-sgarzare@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 util/cutils.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/util/cutils.c b/util/cutils.c
index ee908486da44..c9b91e7535a8 100644
--- a/util/cutils.c
+++ b/util/cutils.c
@@ -1055,5 +1055,5 @@ char *get_relocated_path(const char *dir)
         assert(G_IS_DIR_SEPARATOR(dir[-1]));
         g_string_append(result, dir - 1);
     }
-    return result->str;
+    return g_string_free(result, false);
 }
-- 
2.31.1


