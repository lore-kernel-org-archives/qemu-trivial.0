Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kD6zm-0006mx-O3
	for mharc-qemu-trivial@gnu.org; Tue, 01 Sep 2020 10:10:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1kD6zY-000666-Id; Tue, 01 Sep 2020 10:10:32 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:59677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1kD6zW-0003zt-NN; Tue, 01 Sep 2020 10:10:32 -0400
Received: from localhost.localdomain ([82.252.135.186]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1N6bsM-1ke9Gf1l1C-0183pD; Tue, 01 Sep 2020 16:10:27 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, qemu-trivial@nongnu.org,
 Stefan Weil <sw@weilnetz.de>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 44/44] docs/system: Fix grammar in documentation
Date: Tue,  1 Sep 2020 16:09:54 +0200
Message-Id: <20200901140954.889743-45-laurent@vivier.eu>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200901140954.889743-1-laurent@vivier.eu>
References: <20200901140954.889743-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:7L1YI38AnTxw8KGs1szZB3nJpEddnBvc3/Yy/tk98nSmivRkKzW
 NRoBAe7hIrdpBwO+0keWhvVKogCZ+DZgks69Z3HwLyfRsnb24YFwgXtjmnaugxw55T+ehI5
 n/g/zyXHbXBMxZdsq02QMeL48tqzottUReKPFoWzikYJP+d/VRoVaXdh8i/D5VVomxykPCM
 eZfKSgOrJCChuoicfHcpg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:TzroLXl3Brg=:lKGWd3nt6vvRvdwA8n39sO
 NKrZbk0uwYSGDwWnlXnQQkMatoDj0eY7Ulvrfk/3RkqkxaG/qCW8oL9RSl7KuGvJ368FKaBv1
 qbW56xSi5dn/z1BZOkHyGpU5KgD9yaR7NH3tnuK1uh1TpnYDIlVCUvcEt0epUWp9cWzTRnp7C
 MVmg5GpgZF/WTXXiXxV3Hv5kBpTmRRiKPWoudE7vvkXmTf7gjH5QRoh//hLlaxyvySVd6Ynim
 RhaW2NtUPoQ60FKbvMlQiCIRUMmYomsgZT4KTvrNXfHM2+6QlC3RFky9ICwoWNWvcVH9xMaT3
 oNVl6D2R+q8jw9SYSrAfxC6k9TAT5SruQfXmSJ5uwfbqs3YxbHTIQlt0w5kCb+BTKt5CLph4C
 nonabsvy8PLJN8xHnlF+wJ7COr4t3Mk/lcXn8RG3hvyCrRtpP/LQmzYFVw7h3XGWy+x5LkmsR
 X2wlsSDMRLpe0FAa/SgsFZp5yC6UGDnGknlykeItkmehHtJW+CoWwYl3AFXjJ4W5O3EUdXxZm
 po0qD8aCkbMM+VRXxLSuAqtM1UzPouIxxWO96RMxghIUwTXLJYeAleuE+fQvFPfSa5r7PT9J5
 rlundj79jXJFLxDEcZwClO4B4qvxLMy9OkJ/olZql9BFiuvmyOjDiZEkSD7J6n3YU8apQnPm3
 fXUc1vojz5OTA6IO9tssfNeFTo7ZAYVAgYh7bJq9jQ34CQ6KmoD3/53uuyohqsM376LBIymab
 Ze2iOl6Azp7mJ7/oxI3iKCUQf9WXOsiw8CwFwq8iH0d5sHFAzUT7o4zq+fUMUijmow1RSBeZh
 s6paYKCkLi6asfuGxvAO4+4qElJekS/DphaUECOji9PPmj+unI93cITnb/zn/eWT/l1oqi6
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/01 10:10:08
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
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
X-List-Received-Date: Tue, 01 Sep 2020 14:10:34 -0000

From: Stefan Weil <sw@weilnetz.de>

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20200827173051.31050-1-sw@weilnetz.de>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 docs/system/build-platforms.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/docs/system/build-platforms.rst b/docs/system/build-platforms.rst
index c2b92a96987c..9734eba2f180 100644
--- a/docs/system/build-platforms.rst
+++ b/docs/system/build-platforms.rst
@@ -57,12 +57,12 @@ macOS
 -----
 
 The project supports building with the two most recent versions of
-macOS, with the current homebrew package set available.
+macOS, with the current Homebrew package set available.
 
 FreeBSD
 -------
 
-The project aims to support the all the versions which are not end of
+The project aims to support all versions which are not end of
 life.
 
 NetBSD
@@ -75,5 +75,5 @@ new major version is released.
 OpenBSD
 -------
 
-The project aims to support the all the versions which are not end of
+The project aims to support all versions which are not end of
 life.
-- 
2.26.2


