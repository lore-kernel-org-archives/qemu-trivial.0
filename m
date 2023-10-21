Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1quAjv-00039f-TE
	for mharc-qemu-trivial@gnu.org; Sat, 21 Oct 2023 08:05:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1quAji-00034e-L8; Sat, 21 Oct 2023 08:05:47 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1quAje-000112-4X; Sat, 21 Oct 2023 08:05:44 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id CDD5A2C335;
 Sat, 21 Oct 2023 15:05:52 +0300 (MSK)
Received: from tls.msk.ru (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with SMTP id BD38C30683;
 Sat, 21 Oct 2023 15:05:27 +0300 (MSK)
Received: (nullmailer pid 220796 invoked by uid 1000);
 Sat, 21 Oct 2023 12:05:25 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Eric Farman <farman@linux.ibm.com>, qemu-trivial@nongnu.org,
 Claudio Imbrenda <imbrenda@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>
Subject: [PULL 07/17] MAINTAINERS: Fix a couple s390 paths
Date: Sat, 21 Oct 2023 15:05:09 +0300
Message-Id: <20231021120519.220720-8-mjt@tls.msk.ru>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231021120519.220720-1-mjt@tls.msk.ru>
References: <20231021120519.220720-1-mjt@tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sat, 21 Oct 2023 12:05:50 -0000

From: Eric Farman <farman@linux.ibm.com>

These are simple typos, since the directories don't exist but the
files themselves do in hw/s390x/

Fixes: 56e3483402 ("MAINTAINERS: split out s390x sections")
Signed-off-by: Eric Farman <farman@linux.ibm.com>
Reviewed-by: Claudio Imbrenda <imbrenda@linux.ibm.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 27e5b882ae..167f0fe3ac 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2602,7 +2602,7 @@ M: Halil Pasic <pasic@linux.ibm.com>
 M: Christian Borntraeger <borntraeger@linux.ibm.com>
 S: Supported
 F: hw/s390x/storage-keys.h
-F: hw/390x/s390-skeys*.c
+F: hw/s390x/s390-skeys*.c
 L: qemu-s390x@nongnu.org
 
 S390 storage attribute device
@@ -2610,7 +2610,7 @@ M: Halil Pasic <pasic@linux.ibm.com>
 M: Christian Borntraeger <borntraeger@linux.ibm.com>
 S: Supported
 F: hw/s390x/storage-attributes.h
-F: hw/s390/s390-stattrib*.c
+F: hw/s390x/s390-stattrib*.c
 L: qemu-s390x@nongnu.org
 
 S390 floating interrupt controller
-- 
2.39.2


