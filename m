Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jBK3c-0001JI-P0
	for mharc-qemu-trivial@gnu.org; Mon, 09 Mar 2020 11:11:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34497)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1jBK3W-00018K-B1
 for qemu-trivial@nongnu.org; Mon, 09 Mar 2020 11:11:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1jBK3S-0008VE-1z
 for qemu-trivial@nongnu.org; Mon, 09 Mar 2020 11:10:58 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:50775)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1jBK3H-0008Nh-Vi; Mon, 09 Mar 2020 11:10:44 -0400
Received: from localhost.localdomain ([82.252.135.106]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MHX3X-1j7DQJ1NK5-00DXxH; Mon, 09 Mar 2020 16:09:46 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Greg Kurz <groug@kaod.org>, qemu-block@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <rth@twiddle.net>, Jason Wang <jasowang@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Michael Tokarev <mjt@tls.msk.ru>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Fam Zheng <fam@euphon.net>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-arm@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Andrzej Zaborowski <balrogg@gmail.com>, Helge Deller <deller@gmx.de>,
 qemu-trivial@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, John Snow <jsnow@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Chen Qun <kuhn.chenqun@huawei.com>,
 Euler Robot <euler.robot@huawei.com>
Subject: [PULL 27/33] block/stream: Remove redundant statement in stream_run()
Date: Mon,  9 Mar 2020 16:08:31 +0100
Message-Id: <20200309150837.3193387-28-laurent@vivier.eu>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200309150837.3193387-1-laurent@vivier.eu>
References: <20200309150837.3193387-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:mSpcBTj2bTDlqfXdcTqlzwKJrASnzNpVL6kBP620e3BDhSzp/nt
 SCT2fJslwug8fAUIkbTgpLnzj4rJx3bIA87lX1JcuNAJL24xbH+HB3XsJYYGaFshR2lw3xd
 Crkl5nbnzTnRNt14eITHpNgRvlwCRvP3hBXlgY84WMKbo3QX3VglkhtgwLz4iU7x2GmmEOH
 px7VJllKx8ax5XwROHneg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:+ZDXbp4X3g4=:hA3xFJcUFHe/dEK1jREM2O
 rmVrX8XkNiBeUws7gizDWtL7wK7Mek7F+51UjraqGjYN0HprYuVfqDY1pJGUC6wkm/8WX0wSS
 knpNnSl5RNG6zX+16WyWzu/cg56x9o3RcbT+O5gfktn/OIhmQxUG+JD6ppKSJPLCLG/7OJ96o
 eDUczil1VLOLJhuMlWya+I9P0Rq3+A6zepcNHWFP49cM31CGUaYN86bAJGv1nyPI9dUlCWpXD
 YEZJkvt2HNk2vHKkWPIvZBORG61UB/RyRd8K15L500DMC5XdRfavEfEAeCgHzgxoUGM4Eo5aY
 4NnJYSKCcCSX3CA6YQ34RUOSdsIXYFTq5h7qHxguDBTv9a7gVtMkmT+vfcvp+nmnbHPBSVj0R
 r+9BFMVhGuLfLW5KbnYaxAGoR+HKWj9Wq+4kIoJk+Uf+KatfZIQniHZp0WUOu1hud8ODUirRl
 ikmNjEKcbGjPcS9qPVCKsLHYuDiF02RYyatxWg9+KP+lZ2HW3cF7GkFPkTtci8Fh/eg+zSc6w
 HDUPl36hEUoe+WfhDxZNL+CVRuySNCSHqgdqlybRKDRDb6kVICxr+8sq4KP2ywfp0TV8/wf4Q
 ByInDX0/ugwEqDs9cgkD3ketYSbqgz1XakEUOCOY+L5blaMXzIFjcFINBmuJmc+L1T2YJnLZ0
 iyLMZNBJkPdl40DbK5M5aa8kjYgM+cg8P1A/6aD6B+X+4lfrBmaSbuSGL8opg9A2GMqrvdw1A
 hf3ooLntH3YWW7dXQOBiqzisToXI5Rn9N4Eh1NOlKR/IN6bADtGU3PKsC0CLQnJPIn/aPZKtJ
 Q+Kp4VxelDF7LtIX7+szE+kIFCdACmAr9Mt5TflfhjwARfidYYnIdx+PaD7a16+osWR/TWB
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.10
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
X-List-Received-Date: Mon, 09 Mar 2020 15:11:00 -0000

From: Chen Qun <kuhn.chenqun@huawei.com>

Clang static code analyzer show warning:
  block/stream.c:186:9: warning: Value stored to 'ret' is never read
        ret = 0;
        ^     ~
Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
Reviewed-by: John Snow <jsnow@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20200302130715.29440-3-kuhn.chenqun@huawei.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 block/stream.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/block/stream.c b/block/stream.c
index 5562ccbf577a..aa2e7af98e37 100644
--- a/block/stream.c
+++ b/block/stream.c
@@ -114,7 +114,6 @@ static int coroutine_fn stream_run(Job *job, Error **errp)
     int64_t offset = 0;
     uint64_t delay_ns = 0;
     int error = 0;
-    int ret = 0;
     int64_t n = 0; /* bytes */
 
     if (bs == s->bottom) {
@@ -139,6 +138,7 @@ static int coroutine_fn stream_run(Job *job, Error **errp)
 
     for ( ; offset < len; offset += n) {
         bool copy;
+        int ret;
 
         /* Note that even when no rate limit is applied we need to yield
          * with no pending I/O here so that bdrv_drain_all() returns.
@@ -183,7 +183,6 @@ static int coroutine_fn stream_run(Job *job, Error **errp)
                 break;
             }
         }
-        ret = 0;
 
         /* Publish progress */
         job_progress_update(&s->common.job, n);
-- 
2.24.1


