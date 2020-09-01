Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kD6zj-0006d7-NK
	for mharc-qemu-trivial@gnu.org; Tue, 01 Sep 2020 10:10:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1kD6zb-0006E5-8d; Tue, 01 Sep 2020 10:10:35 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:50439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1kD6zY-00040g-Ql; Tue, 01 Sep 2020 10:10:34 -0400
Received: from localhost.localdomain ([82.252.135.186]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1Myb8P-1kW8uZ1oGz-00z1Ps; Tue, 01 Sep 2020 16:10:22 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, qemu-trivial@nongnu.org,
 Chen Qun <kuhn.chenqun@huawei.com>, Euler Robot <euler.robot@huawei.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 "Michael S . Tsirkin" <mst@redhat.com>
Subject: [PULL 37/44] hw/virtio/vhost-user:Remove dead assignment in
 scrub_shadow_regions()
Date: Tue,  1 Sep 2020 16:09:47 +0200
Message-Id: <20200901140954.889743-38-laurent@vivier.eu>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200901140954.889743-1-laurent@vivier.eu>
References: <20200901140954.889743-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:fHDxDkU2JPw6dE9t8b8F4PHzV3yVfSYjKGTRPDjQRQXzP3eP3q1
 WJqL2BVmt4/vKoOR2m9opkFLV7ABY3bCRoUH/325/cJ01t/vCv8veEEbtda31L4uB5Tu80p
 vlml08qkt4TTWO3VxU3nfJlE3KIK3krSdQvP5DOECNW/kforhCr82Ydyu94Cah+RIQLDj1y
 2evz4eJ+1VWs4aOLmUr6w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:4iRK4LVdoss=:fkLmCagZ7QsGJ3gLJPVOQq
 yd68jVHacc/qgGAi4sIt+yupdyoSpGff3KeLGoemt3KZBOGW+iVtx5OBPKl2CQF6yD44g5mZn
 M2DMcR6NRrJr07+bg6LneIRRNBqzNA87zKFc4Fwej/vJYf8OQPU55gyEFWioAoSUDFsdRC7i6
 Rzy3cJcq3gCUedXgPYgQSGe4TSXfV8i6KT84VbG7G64hTekGbn7vwfR3FbMhZWFXZDAOwHjAG
 GzE1CeaKaie3KbIu/kJBQS7pTaNhSmJ4fuffgHw5nB8W/HUaFglEi97CrhUqmGiGL4yKNNUO8
 UicZz5EWK0WbkqJSYcp1K6UFTdqeb4WQYrxxP3l7xN0ssjSTtqnxtN2BWULT5arU+ed5bBUrg
 JfJBoYZhHE+U+8I+/s3CK6FOJ2SKq9Ujba3VGoFpBmL+h1OY906W0kIXp3CWscmeMV+P+/AS2
 /81aViOfFw6HdZHW0YdwK1VO922gouRQ4Yh0ZLGsUlFJsXtUymC0ko8jLUNa2uyHmN14VmjWu
 MqD5YZSMPPiLReAO1N2/d5SeB1XPQX3Ub2wKInJarWOYMraFi3lCqabqtqpei40lti31pqzc4
 0OSlTVvrPvFOIbtSTNNcsvbwdp0e8T26NqQKr1m6wsJdYfvlyhte0Uso+vE5PoMeHGbqVCDe3
 LaCJjofukIxSQrT1D8dp1X41PBtTVmCKyetwVNPZiJhOk2JwD/8tWfgovuB638rOT6Lcb0EoB
 dLHI+Hp62o+ktIg9t4MuUQ3Fhw9p6EXFiSn4TtAZH9auLjC85i8z2DxciSxuU+I59zx3ics18
 7GhBDiTDCzoToimCUiWENMiAfotPzCCZnItZEbEC6kl0F4eT7jTxAE5uoRilnfHNRIVN3ha
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/01 10:10:07
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
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
X-List-Received-Date: Tue, 01 Sep 2020 14:10:36 -0000

From: Chen Qun <kuhn.chenqun@huawei.com>

Clang static code analyzer show warning:
hw/virtio/vhost-user.c:606:9: warning: Value stored to 'mr' is never read
        mr = vhost_user_get_mr_data(reg->userspace_addr, &offset, &fd);
        ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
Reviewed-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20200827110311.164316-6-kuhn.chenqun@huawei.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/virtio/vhost-user.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index d7e24237625f..9c5b4f7fbcda 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -603,7 +603,7 @@ static void scrub_shadow_regions(struct vhost_dev *dev,
      */
     for (i = 0; i < dev->mem->nregions; i++) {
         reg = &dev->mem->regions[i];
-        mr = vhost_user_get_mr_data(reg->userspace_addr, &offset, &fd);
+        vhost_user_get_mr_data(reg->userspace_addr, &offset, &fd);
         if (fd > 0) {
             ++fd_num;
         }
-- 
2.26.2


