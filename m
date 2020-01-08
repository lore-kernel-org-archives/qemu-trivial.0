Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ipDnl-0006JG-An
	for mharc-qemu-trivial@gnu.org; Wed, 08 Jan 2020 11:03:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36725)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1ipDnZ-00062s-NT
 for qemu-trivial@nongnu.org; Wed, 08 Jan 2020 11:03:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1ipDnY-000270-F1
 for qemu-trivial@nongnu.org; Wed, 08 Jan 2020 11:03:09 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:37357)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1ipDnJ-0001sl-TQ; Wed, 08 Jan 2020 11:02:54 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MSswA-1jH9k041Ms-00ULNl; Wed, 08 Jan 2020 17:02:39 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Eric Blake <eblake@redhat.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org,
 Pan Nengyuan <pannengyuan@huawei.com>,
 Euler Robot <euler.robot@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 3/5] nbd: fix uninitialized variable warning
Date: Wed,  8 Jan 2020 17:02:31 +0100
Message-Id: <20200108160233.991134-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200108160233.991134-1-laurent@vivier.eu>
References: <20200108160233.991134-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:/EYbbloMlE/mMInqy/wdNfBC3RP04ti36AzGOyWwDHvqGvzbFHS
 v208escUAmxXixQMpRzprBjxVZjUoGNrRCODviDRVNYwEugYcBQieTDNwHOOD/6ZIIlIaYw
 KA+Be91bIDGmuZ0G/UBFArstWuyyb2NLijwwhX6UPa+txMmfD9lRrMyQY5cjXKCQW9iu26V
 iF8KcNVXo2nNpXAzErDhQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:iOjUjdSmKnQ=:6tycorvo7+rtQ6XdOUOAUt
 H+pbOWqu7gT3UNfWGYuxNfdl6c2ZUoBAoErARBoEQU72X49+mIsnESZ0U7/bB4nvctT/LOOuv
 B3t5mpG7hmAxMXWw4vTM3y9S+kAToNaKwHRW3Az8rnEX7iDQy9ONUCHT5YJVDAC6waMnsoJiG
 NgEqnYDMfGq9IKDtd1Tr3Ga0FVO8FnoSEvb9RYjg2j1WeKHSfLWCCovmONA8pImZB4q0uU7rG
 x5LfCWSBIPmAkAA78x+7NUPWkIgrlE0Vy+PCJIbWNGZuZmzdUsKKa2xUmKFAY0Rj2/EwC7MUZ
 Evb1vtFiJspXYnYPmiXIlcwKT0OlvgS6mVPJyTQKA8FoGjZqDC05AG9xp/TBn24DtgnNx94oZ
 TSHXX8xuZNBrmKP7tqhEz3xc4LLQN5IMHB55125TZZQ+FPCDZfCRhzLZBOVaZgtoAsT5s+VV5
 cE5DSjvWk0sMLo8FtfS79ZVMQaSmRX56H+/YiHN7mgl1mV3RGkuglaPmGr+zq+Y+PTPKbQ8oB
 Usdkw70/6UqQqARMiLbrZMp17tVyuWlA9anI/HDiJUGmvw3Tfg09GpYWANiUsiA7/KYgjDMsd
 mboQq8U4UzTSXSjBtm8ByH8I/WSJjDIjFkGpUsSjhCJnlm386Xg7sq0DIxZt8vgmfa6Xy9cob
 TQV+lDvuhgwu1ntcEmoBcpl7yhzVyjYHM9xc4YQt6SEJHjsxKfHrswa7GPOOejC3egv4pRIR+
 sxnylE6ZOMNmqZFaKxx/yuLmAxZOef///mCsX36rK35jvrZSirGgkh46ckbqXKnF05ACGgGZd
 TLLWSonKCtqnm7JaZ+gBsY2Nse5odRhUAa/ZHlQ9Y7CVjd8/r3b94O9ithaZrZdTBUYqOKy0d
 ZHuvl/3lstAYoyDKpsjA==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 212.227.126.187
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
X-List-Received-Date: Wed, 08 Jan 2020 16:03:15 -0000

From: Pan Nengyuan <pannengyuan@huawei.com>

Fixes:
/mnt/sdb/qemu/nbd/server.c: In function 'nbd_handle_request':
/mnt/sdb/qemu/nbd/server.c:2313:9: error: 'ret' may be used uninitialized in this function [-Werror=maybe-uninitialized]
     int ret;

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20200108025132.46956-1-pannengyuan@huawei.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 nbd/server.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/nbd/server.c b/nbd/server.c
index 24ebc1a80571..87fcd2e7bfac 100644
--- a/nbd/server.c
+++ b/nbd/server.c
@@ -2384,20 +2384,12 @@ static coroutine_fn int nbd_handle_request(NBDClient *client,
                                                !client->export_meta.bitmap,
                                                NBD_META_ID_BASE_ALLOCATION,
                                                errp);
-                if (ret < 0) {
-                    return ret;
-                }
-            }
-
-            if (client->export_meta.bitmap) {
+            } else {              /* client->export_meta.bitmap */
                 ret = nbd_co_send_bitmap(client, request->handle,
                                          client->exp->export_bitmap,
                                          request->from, request->len,
                                          dont_fragment,
                                          true, NBD_META_ID_DIRTY_BITMAP, errp);
-                if (ret < 0) {
-                    return ret;
-                }
             }
 
             return ret;
-- 
2.24.1


