Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1koqEv-0008Iy-O1
	for mharc-qemu-trivial@gnu.org; Mon, 14 Dec 2020 10:58:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1koqEj-00086M-DT; Mon, 14 Dec 2020 10:58:09 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:54421)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1koqEd-0001Tk-85; Mon, 14 Dec 2020 10:58:09 -0500
Received: from localhost.localdomain ([82.252.135.218]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1N4i7l-1k4t0W0EB5-011fGC; Mon, 14 Dec 2020 16:57:47 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Pan Nengyuan <pannengyuan@huawei.com>,
 Euler Robot <euler.robot@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, Chen Qun <kuhn.chenqun@huawei.com>
Subject: [PULL 12/19] block/file-posix: fix a possible undefined behavior
Date: Mon, 14 Dec 2020 16:57:26 +0100
Message-Id: <20201214155733.207430-13-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201214155733.207430-1-laurent@vivier.eu>
References: <20201214155733.207430-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:qLDPQrEQtWG2Dg8c4z8b4jPx7wioZRQYyfh02lniGNRyZgW6mcH
 yhMzXtwahF9OUjwU9OMfdyrh4hmSD2pnjckaIx0kDeS8plhW4OPaQJJmXCCBJ9p2c625S6j
 hb7CAJq8hMjzsthFFp78RH7aKlmfwCy0BWXtM1pWc0OSuhiBqxK5HkUX0OemwtvmD63H1fL
 HCGKR3AnaIwPCkUPRbHFw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:3mjSvXPmnhs=:NPP9GK/c2W8/WX3hkIKezS
 cDOIlq2Ng7CrvMIsf4AQtoLGzRzJ0edp5v0rhpiEWWrTmELQ/2O7IBnJWuBik8QPNKucnHsvT
 gixjUh6YRgFMhFVwETcuDkLXJv2Upp9PTxxTCVCxUQ9XbGV3HoaNWjCevKOyxRgo6V4Gtkwe7
 n710NQgNL7FxranOuJK8o5K9h+Bst5aBys6Ly9tPcTXanSIX7BmZwkd6lU49ucggCY9LOrrSG
 cQBFWsQlkcEts2TjGEJTBgu9wCYne+NTI0reoss4/fnAg0Za7y+tekXHNCp+en2gNnnkDoqRI
 +ssJFxsUKFtKdQsDgRllRf+eRYn/yWgyNrHaKHvfXW9ZIIPIB2e8/PBSAPObYOdWbCoLOn6oY
 do4DarAO0QerLAGWDBSNtgfkIkg3xbmuMiEN7/D80X3qPcAC6C5A67sPDNL4cTIRI8EPeQ93p
 Ywz04Wcu7Q==
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
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
X-List-Received-Date: Mon, 14 Dec 2020 15:58:09 -0000

From: Pan Nengyuan <pannengyuan@huawei.com>

local_err is not initialized to NULL, it will cause a assert error as below:
qemu/util/error.c:59: error_setv: Assertion `*errp == NULL' failed.

Fixes: c6447510690
Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Li Qiang <liq3ea@gmail.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
Message-Id: <20201023061218.2080844-8-kuhn.chenqun@huawei.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 block/file-posix.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index 83e2cc55306c..9804681d5c44 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -2111,7 +2111,7 @@ static void raw_aio_attach_aio_context(BlockDriverState *bs,
 #endif
 #ifdef CONFIG_LINUX_IO_URING
     if (s->use_linux_io_uring) {
-        Error *local_err;
+        Error *local_err = NULL;
         if (!aio_setup_linux_io_uring(new_context, &local_err)) {
             error_reportf_err(local_err, "Unable to use linux io_uring, "
                                          "falling back to thread pool: ");
-- 
2.29.2


