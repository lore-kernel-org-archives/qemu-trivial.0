Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lhr9E-0005w5-Lg
	for mharc-qemu-trivial@gnu.org; Sat, 15 May 2021 06:03:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lhr9B-0005n9-PI; Sat, 15 May 2021 06:03:49 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:60647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lhr99-0006Mw-2Q; Sat, 15 May 2021 06:03:49 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue109
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1N79q6-1lRIDX3YEe-017Xqn; Sat, 15
 May 2021 12:03:40 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Subject: [PULL 02/16] hw/virtio: Pass virtio_feature_get_config_size() a const
 argument
Date: Sat, 15 May 2021 12:03:21 +0200
Message-Id: <20210515100335.1245468-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210515100335.1245468-1-laurent@vivier.eu>
References: <20210515100335.1245468-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:F4pdN0aAaNmH/CNBgA3QFvEAkLGXx69NiRBYiLkHyltoRajX5QW
 t37Pb3172utJFE6h40BVgsMqaLaEJbYrEkamWvnMuyjoTNB0RlzGQ/U8fH94FZR6kdyEUrU
 0ccPeiku9VK4WwL8wS6AJDCM+JH71cLrZsMskNYQA9o8ktSS6jkpAH+RljjoDrL8UtCPcJq
 Hlh+7rcN88dBlIb2Ab++Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:3652nFo72+s=:1MT1pscSZlh1ipP76z2UVm
 tyDzn7B8nEX/x3cNtg9EeoeINwqXwsj9FYW53ciKXRLh5ne88S00+018y2gAudLHuV6WRCV2q
 MQvSu+5kM3JIpIv/Xetv5sW5CQkNJ9ntwZwlmTekfmLW35rMSAnG8b+6bWvzazMEfqdVPSZJc
 Y8Ruh/JCBsBAEksDoFNsBS42nPx6GBfstcgudnNx5hOG5A+Flmj2FeVpyWui0dLnjwWPACXcc
 K4LZK1czvjo2sVUhglHuFumZmgab0LomL+GV3x1vDi8PvI7lgWd5qGz+dzmmz91wG+wpa/Zgz
 mriyTs7FtSUFsLbApRUkok2mZqHmPMCG6lpA0EHwXzZgelM/UTKXJDoTZdOjf2+JE3zqlkbB1
 3/e2ecMaCm7KErPwfywn+A0Of3Vtwc/R4K09Fs9w9Tt6WzxFvsBFZlVHxX1iEggBX9Fe7at6+
 67omuHGZaZJBnFzhYOhpoX7pFY0/toRUFgeEzd6SzlRjphInROGpOv2ALYruKc8FXo3NKO8GZ
 hMT1vt5fw/RtACIYAIFJOQ=
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
X-List-Received-Date: Sat, 15 May 2021 10:03:50 -0000

From: Philippe Mathieu-Daudé <philmd@redhat.com>

The VirtIOFeature structure isn't modified, mark it const.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Message-Id: <20210511104157.2880306-2-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/virtio/virtio.c         | 2 +-
 include/hw/virtio/virtio.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 9e13cb9e3adf..e02544b2df76 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -2981,7 +2981,7 @@ int virtio_set_features(VirtIODevice *vdev, uint64_t val)
     return ret;
 }
 
-size_t virtio_feature_get_config_size(VirtIOFeature *feature_sizes,
+size_t virtio_feature_get_config_size(const VirtIOFeature *feature_sizes,
                                       uint64_t host_features)
 {
     size_t config_size = 0;
diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index b7ece7a6a891..8bab9cfb7507 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -43,7 +43,7 @@ typedef struct VirtIOFeature {
     size_t end;
 } VirtIOFeature;
 
-size_t virtio_feature_get_config_size(VirtIOFeature *features,
+size_t virtio_feature_get_config_size(const VirtIOFeature *features,
                                       uint64_t host_features);
 
 typedef struct VirtQueue VirtQueue;
-- 
2.31.1


