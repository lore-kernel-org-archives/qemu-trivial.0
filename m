Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kMpGt-0003zg-Bm
	for mharc-qemu-trivial@gnu.org; Mon, 28 Sep 2020 05:16:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1kMpGg-0003rZ-Fx; Mon, 28 Sep 2020 05:16:24 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:48021)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1kMpGc-0002YB-RE; Mon, 28 Sep 2020 05:16:22 -0400
Received: from localhost.localdomain ([82.252.129.222]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1M2Plu-1kQfoc3G7q-003wD4; Mon, 28 Sep 2020 11:16:08 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Li Qiang <liq3ea@163.com>,
 Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 3/8] virtio: vdpa: omit check return of g_malloc
Date: Mon, 28 Sep 2020 11:15:57 +0200
Message-Id: <20200928091602.383870-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200928091602.383870-1-laurent@vivier.eu>
References: <20200928091602.383870-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:prN8HB6UaU6hDQgdKIbe3aQiPbzmL42/lAKCeIa+G9BG00vDvGC
 N2fTIQz9ux5+8biCr2NGF6pWEL89qCf12kcAwvZiKXIZQVrm8XRPLxN2My5iAgyxtFr9iFC
 vJKtw6jBV6N2VgCMyDHsqj9ktMjMiKcNiYV4IHrpNUzOY6QHM5Q9GvCfQt639qBk82NJExH
 /ymZxiYIybLDEJhKS8wuQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:LEvot/+3Nb8=:/M7mXZzHudAZgOi9PEvtPN
 50zMSNrglY9ZXofj8vZFmYHp+Eo932LtH6d0dsYcmqd7ftR6PKlgxDxLqup2g4bjxGmPpXlsm
 LhC7ktvm7sFDBYE2hiiCM6zes95WU3ThgE43i3SJHzAi/XWgev9xzsQl5GPaFxsXoT8yL0+ke
 26adkRAxnqAxTJ66MEvAJ18ulE09Min8FZ2v17cygKnbfnNTWG17yp1PvXXqzDF97q4rOKEHx
 9nwb8YE95fqr7PEbzovV1YdHFpkYYoC0E+x+eviFN14233eI0CrQk7UZNv8tNlHK6kCYlinI1
 U/CxQOUEa9yEhV5aYQjm7jAv4WygKiDxU3nC9CTTHFLgwDKFhMOVXDyOPmC29U9pkdSkZjmaz
 EEdGjNeSyyP3KuH2EsBlRYircasCQ8G8/CUPBGfwPa7EHUuXpmSBVRrEp5hhb3HxANaOABj4D
 zEGojHhqqEr5y+m235vzroOw3gpzGaTe5VuB4+O7bfNT5be7yEjCCtbzMRF7jVVvIa7P6WsZK
 irflZxLHgcSvpwQreDMhy0w5q2t5WqmBj5i5XfMHoh7XOzSRhD7B24DFeihY3pDeXVS8JYOBs
 qw6/8LysoXlYZmrFbg5ZI0H1rAp/dO6uBz5kp4Kh6ZokxHvjc6lDMC0g2aLg8PaeUakkKgeFA
 5DZ6EkEphcz9+JD1ldwdDFHDc+RFHKCuQwfeiVdQPAltAQ6lFoPJTmbg6HQLHZ8glYwS/MxcP
 LD+aH33l+1na+1T4zZzMdzM3awiIKAPTonbYhASysmklcxLhxCCLuG857bhJjGShEYAypKkUH
 msKFMAGbwdmMCq790AZKK0Bt3gRv1CKm3bgPcl5eo9zplvrhe7bTIp9I2ySyMhevxiFh2iM
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/28 05:16:14
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.462, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Mon, 28 Sep 2020 09:16:25 -0000

From: Li Qiang <liq3ea@163.com>

If g_malloc fails, the application will be terminated.
No need to check the return value of g_malloc.

Signed-off-by: Li Qiang <liq3ea@163.com>
Reviewed-by: Laurent Vivier <lvivier@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20200819144309.67579-1-liq3ea@163.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/virtio/vhost-vdpa.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index e123837a55de..97f4b2e353ab 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -320,10 +320,8 @@ static int vhost_vdpa_set_config(struct vhost_dev *dev, const uint8_t *data,
     struct vhost_vdpa_config *config;
     int ret;
     unsigned long config_size = offsetof(struct vhost_vdpa_config, buf);
+
     config = g_malloc(size + config_size);
-    if (config == NULL) {
-        return -1;
-    }
     config->off = offset;
     config->len = size;
     memcpy(config->buf, data, size);
@@ -340,9 +338,6 @@ static int vhost_vdpa_get_config(struct vhost_dev *dev, uint8_t *config,
     int ret;
 
     v_config = g_malloc(config_len + config_size);
-    if (v_config == NULL) {
-        return -1;
-    }
     v_config->len = config_len;
     v_config->off = 0;
     ret = vhost_vdpa_call(dev, VHOST_VDPA_GET_CONFIG, v_config);
-- 
2.26.2


