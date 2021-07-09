Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m1x70-0006CB-Ab
	for mharc-qemu-trivial@gnu.org; Fri, 09 Jul 2021 16:28:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1m1x6y-00066x-Dn; Fri, 09 Jul 2021 16:28:36 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:43969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1m1x6w-0007UH-I4; Fri, 09 Jul 2021 16:28:36 -0400
Received: from quad ([82.142.13.34]) by mrelayeu.kundenserver.de (mreue109
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MLi4c-1lkQE00oIS-00HdTf; Fri, 09
 Jul 2021 22:28:28 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, qemu-trivial@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>, Markus Armbruster <armbru@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Subject: [PULL 1/9] qemu-option: Drop dead assertion
Date: Fri,  9 Jul 2021 22:28:16 +0200
Message-Id: <20210709202824.578187-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210709202824.578187-1-laurent@vivier.eu>
References: <20210709202824.578187-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:C85UoByGekINlbVDkwSfQpHnZimm1VjD1LIr83d6DbrBOeF4xjG
 WyFE4fASbiFJoV3e8ZzKwG49xZQiV6RPsJE0VSiJM7rxVegiQt7arG7uGTn8t5X+Q/ZC1jl
 7sanuohN/pnquftTsMB3O9rqpttjysm2/YlKLxDyoWW/q178g375+wW0+3I5jyE+dv5FlhH
 RUZ1MaqN29Q5zM0d0qGSQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:wa+IYLq7/vE=:4PYa1i1jXL9JzyckMVveNo
 jCrati/28tczNPfVrA9uL3yQ0DrBhDlyAKjEtDDWgTzL4DrARuPGuvvcjxgMXUKZuqPXXbyT6
 YEzB1ztGNmf5mQG00rCLDlpzzfgrKyxQvAm7/aZneDTGNh9TT2RboaLxshs8OTCWwRJLH3+5A
 R9y06WLJNA5djVhzgOvZ6XJPQxqvulu8Ch5oUS1NGPvS8M5cvinN4KePgoF2Rd8OSWGgzdNN8
 VWGM04gNbN+ppeSoGwpUl+RQbA/dyF4yHtbfhSlmbGecjA6HQ8yzt8G1XVPdihBQ6fe5b4rey
 qcqC9JCSYIt2aQgok3j0zPN+xwn3FBprlUE3ZW9ZIPP0+Rd3UPqG//Zayqyc9oOAPFBxqha1f
 Ojml44VGZ93bN3B9bkWAlLkOImyNlljrobEnBjQOEe8ShAT60yM4r1esYn7omzBY88T9ZKXvg
 i+ogKMatLbI6SaH/mimjAY3zpqGgaO8dYwTE1sDuBLzJwVUnq8u3NlafdzET/5FIUDhbdmcW3
 X8RfRpkz9ZQE+0SvX/UD9sHDCLGAYryN1X9kRl/qJ6b7mcQXbF1g+pWdPk5xUhW9cOA2yjLZH
 ujoLRxdq32YNOqzxvJjCQ/ai2DAwcoqhghnt5JSGfmQgodPRPiqOQfOliQvudOva+G0mQ3Fz5
 WGR+opjEy4pfhT/8b2fJvRO7hf9SCqkGZZX1+8u5oAYCDnoNElYikoiQ5HmzGAZLVeow2TQ2Z
 wPq60EZUGfWXfWZokvgPvJEKqmBZhVXidb1r7P0c/pgSVNNsp06uQVjku56R9K9YHH5hGTxiw
 FDvo4eDb+4asx5v1Hqb1ikpVKHa93RumLgJ6rTBa6rzU6Nq/I3Y0EojTFtjjfcYVE1Z4tng
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 09 Jul 2021 20:28:36 -0000

From: Markus Armbruster <armbru@redhat.com>

Commit c6ecec43b2 "qemu-option: Check return value instead of @err
where convenient" simplified

    opts = qemu_opts_create(list, qdict_get_try_str(qdict, "id"), 1,
                            &local_err);
    if (local_err) {
        error_propagate(errp, local_err);
        return NULL;
    }

to

    opts = qemu_opts_create(list, qdict_get_try_str(qdict, "id"), 1, errp);
    if (!opts) {
        return NULL;
    }

but neglected to delete

    assert(opts != NULL);

Do that now.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20210610085026.436081-1-armbru@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 util/qemu-option.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/util/qemu-option.c b/util/qemu-option.c
index ee78e42216cc..61cb4a97bdb6 100644
--- a/util/qemu-option.c
+++ b/util/qemu-option.c
@@ -997,8 +997,6 @@ QemuOpts *qemu_opts_from_qdict(QemuOptsList *list, const QDict *qdict,
         return NULL;
     }
 
-    assert(opts != NULL);
-
     for (entry = qdict_first(qdict);
          entry;
          entry = qdict_next(qdict, entry)) {
-- 
2.31.1


