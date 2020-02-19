Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j4MQ5-00042f-8p
	for mharc-qemu-trivial@gnu.org; Wed, 19 Feb 2020 05:17:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53664)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1j4MQ0-0003kp-69
 for qemu-trivial@nongnu.org; Wed, 19 Feb 2020 05:17:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1j4MPx-0005bQ-0w
 for qemu-trivial@nongnu.org; Wed, 19 Feb 2020 05:17:22 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:57205)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1j4MPl-0005Cn-Hs; Wed, 19 Feb 2020 05:17:09 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1N8G6I-1jZPnm3yCm-014DQd; Wed, 19 Feb 2020 11:16:27 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Marek Vasut <marex@denx.de>,
 Thomas Huth <thuth@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Jiri Pirko <jiri@resnulli.us>, qemu-arm@nongnu.org,
 Alistair Francis <alistair@alistair23.me>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>,
 Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 qemu-trivial@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Thomas Huth <huth@tuxfamily.org>,
 qemu-block@nongnu.org, Chris Wulff <crwulff@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>, Max Reitz <mreitz@redhat.com>,
 Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: [PULL 04/17] audio/alsaaudio: Remove superfluous semicolons
Date: Wed, 19 Feb 2020 11:15:59 +0100
Message-Id: <20200219101612.1033925-5-laurent@vivier.eu>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200219101612.1033925-1-laurent@vivier.eu>
References: <20200219101612.1033925-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:YLibFIpZuSQgUlfjKxWHzCGGzkzdZqeA+J1NPtaqKX3dof7T9YQ
 atnabY9tD6WWwlISncER7PKliwcQz8ZEfu31p7eb3muO7uiSkG/MiFtWKBwDzARgQtkyQqq
 iLNbN85O5fe4CzRYOMUiEQ/1Ka2p1ZpgOzHtCYLs/o7hW9mAajgu2vTnn+bJx0lbgt6uvVF
 C76EO0Z4ERETqoIp868nw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:3I0iL+lMVTY=:VCzKQXR5Xg/eAVWb074EU1
 PyX03r8ReNRQpHWI+8HEZbOMe5aNlySG1/kHRsHSpo2T7ZAurz7dUkCs4QvtDW5pAEP+1wrxs
 2uh3+A7sl4nS483hdhPapjgHDqv091x9Y5cMufdRE9dm6KEHC6Xjt7Kk0NKylXGgRJbbj3rq1
 ouckDsNL9nHl0rL69ip+TXPSTHQeqpm0LDiS7LBQvCSgqo6Ty1lyAKAz2h33H8Cz870EC7aFw
 egISIpgTy7TMpVY6tPmNP18V9KTkqIJcP7tkh2V6fzG3zxInJiQQqrNd7BDTz+GfKk8kzgl9B
 1DUTbfuYjhZwDJ+OOJSSa1DlaCS+MW9DqTBLMSN6bN4jv6AXkFEkqMzjJiqR3DU2IpgN3X412
 lHarYtfXAi50yNZvHWiLf+Oez6Pmh0kzJaksVUPdrP5wQwrfVZUqoZaoVD31g27ZFLRkxCInQ
 Jg/6Be2vFkmCTHhY+JgmzqwkwnLqy7jTmHoNbGfN+Tn1WSSgcpd2eqiT7MchSBQyCIAKZnhAP
 3iDCMoRVpv+aXI0+0uRjQrNpDQGzNkEviSj2OyAtsAQ5rJ7okkxJYuAjGQPgsoeNRVuFoIYcx
 qIIvLzw1UR9Q1GqLSSk3ejPTt8o8y3dD9PcRYZXIMwL0KVnOgeBNgwNqIghYC2xiE0NyvXgUk
 g2kQd2+6RAthmnhSrEEl3jDecnmbndB2ygzxxbMyOyHIN9iG5XlHAMB/X3SbFugilHPMHlc91
 wo5iw9aId9jzu5ab1bVDBbhEFHtZNcLBg+db1zQXW9Rwube8n0KgvX5AzTpBwVYRwfADTncPS
 rATP9/fLxGHY2OseOtVLnnUrgwN9ROMfZx6kVDWYJ+UEwwAPPyqL2RRsElaO5JhjWk9jbvw
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.13
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
X-List-Received-Date: Wed, 19 Feb 2020 10:17:25 -0000

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Fixes: 286a5d201e4
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Message-Id: <20200218094402.26625-3-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 audio/alsaaudio.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/audio/alsaaudio.c b/audio/alsaaudio.c
index a23a5a0b60a1..a8e62542f97e 100644
--- a/audio/alsaaudio.c
+++ b/audio/alsaaudio.c
@@ -819,7 +819,7 @@ static size_t alsa_read(HWVoiceIn *hw, void *buf, size_t len)
             switch (nread) {
             case 0:
                 trace_alsa_read_zero(len);
-                return pos;;
+                return pos;
 
             case -EPIPE:
                 if (alsa_recover(alsa->handle)) {
@@ -835,7 +835,7 @@ static size_t alsa_read(HWVoiceIn *hw, void *buf, size_t len)
             default:
                 alsa_logerr(nread, "Failed to read %zu frames to %p\n",
                             len, dst);
-                return pos;;
+                return pos;
             }
         }
 
-- 
2.24.1


