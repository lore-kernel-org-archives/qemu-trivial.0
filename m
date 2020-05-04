Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jVdW4-0001Xp-6I
	for mharc-qemu-trivial@gnu.org; Mon, 04 May 2020 12:00:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1jVdVz-0001RH-IJ; Mon, 04 May 2020 12:00:19 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:42691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1jVdVx-0005qM-8V; Mon, 04 May 2020 12:00:19 -0400
Received: from localhost.localdomain ([82.252.135.106]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MAOeB-1jPp1k3wt9-00Btk4; Mon, 04 May 2020 18:00:12 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Max Reitz <mreitz@redhat.com>
Subject: [PULL v2 12/19] blockdev: Remove dead assignment
Date: Mon,  4 May 2020 17:59:49 +0200
Message-Id: <20200504155956.380695-13-laurent@vivier.eu>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200504155956.380695-1-laurent@vivier.eu>
References: <20200504155956.380695-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:HYgsKFXXXn5jb8yMhowbBtiXs7B48AJ162XJfhs2pgSxwyfg618
 qSD5/LJEl1z1apY73pcyxemslYuJsJZ23b09qAQa6e06UHbu9FCp3LxMkN+a0HBpvVbT+/n
 RzejGdlY4/mdArEy6qtdXSp2BMaudJXaaEpu3rg2EieVhh4G/1uHdvaDDr2t2M+f8oI1uZ1
 d8EEqOrD+ZjkQjs41n0BQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:D98ZUZ4ikz0=:dN9XYPFem0J+MPhvCTRLR4
 qslSRBaaITbv2PAE69bUXZZciOluUJD/A8d8OHbwA2SvRyg4jpRSXmHJPznDaHls5viWkBmHW
 pfYJysZWOSOQGYDE5lX45DUYIJUT+yGWhaS2Jg0vVxdAWcyQGkgh6erUEsD9h3OmETRKeuOTS
 VqHA5jzT4PceXC878wJFDz1qo6cVFNss4YgDQpIxGMElgPQT6BH+c8VJ9VNEuby/Q+QYb769H
 PgzABVGLKx4hXnaRaFE/BKtka3eL2at2OSWpTW/U4VZLxt6UwwSs1rRuvS9tLr9u5rclwoBpJ
 ZJLmDeFCS8VFQ6rUHRuqc1SyNcFrI9dApBPcSz5L7NCjHieAvI+X7JXcAetP+w2VKtfpxfOIx
 /xbULrptFrMR5BDiMpS2CZ+NYsVmBnT95qJVMEvq9iaqoyug8xGhodNq4kfy/mNKMN2UNCCLc
 a4vkqjI8eQP1hJscKIQxrbvo2p88fXSMlfNLat2vuDLSGVtjJphLIgjQFo6dgy0tO4zyNwaSO
 lf/8HHcanAGbm0XOSmAj4qM/yFEyRzGOfbYiGTRzV3WK2S+ujNggzvigryzCf3ZxkFEj2Vl+r
 sIL+yYeaqb3ZL3IHHkb9NwafBRo+PI2zUYYJhocNo/JPPaa+uvMN+L2sRZ0ufm/or414GIGSY
 v95Sf/I2OmAix9NZ85JWTFriEOQnpY4fw4AqXocWjsC6zZ7gRHhC3/f8z5futGavMCIPgUCUK
 OddrUcnj0zEyNuNIeimvPt+luUwv0w7JBno4LeRRv1pQEIDbrv8ona63Os5P4927U9HiSZ4YU
 I9broP6297RbcBV6TekKfBZNDxAnVUgapx0JDB2TCl8XnQNcRqPybcwP9c4HQV+UBMncn5s
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/04 12:00:07
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
X-List-Received-Date: Mon, 04 May 2020 16:00:20 -0000

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Fix warning reported by Clang static code analyzer:

    CC      blockdev.o
  blockdev.c:2744:5: warning: Value stored to 'ret' is never read
      ret = blk_truncate(blk, size, false, PREALLOC_MODE_OFF, errp);
      ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Reported-by: Clang Static Analyzer
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20200422133152.16770-3-philmd@redhat.com>
[lv: fix conflict because of "Add flags to blk_truncate()"]
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 blockdev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/blockdev.c b/blockdev.c
index dc1a0c7c2fd4..708d0c323fd2 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -2741,7 +2741,7 @@ void qmp_block_resize(bool has_device, const char *device,
     }
 
     bdrv_drained_begin(bs);
-    ret = blk_truncate(blk, size, false, PREALLOC_MODE_OFF, 0, errp);
+    blk_truncate(blk, size, false, PREALLOC_MODE_OFF, 0, errp);
     bdrv_drained_end(bs);
 
 out:
-- 
2.26.2


