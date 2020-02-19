Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j4MPh-0003bJ-Id
	for mharc-qemu-trivial@gnu.org; Wed, 19 Feb 2020 05:17:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53157)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1j4MPZ-0003Nk-LH
 for qemu-trivial@nongnu.org; Wed, 19 Feb 2020 05:16:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1j4MPY-0004wi-1E
 for qemu-trivial@nongnu.org; Wed, 19 Feb 2020 05:16:57 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:48843)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1j4MPS-0004nj-4N; Wed, 19 Feb 2020 05:16:50 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MX0Xf-1ixb8x3bzt-00XLSA; Wed, 19 Feb 2020 11:16:31 +0100
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
Subject: [PULL 06/17] hw/m68k/next-cube: Remove superfluous semicolon
Date: Wed, 19 Feb 2020 11:16:01 +0100
Message-Id: <20200219101612.1033925-7-laurent@vivier.eu>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200219101612.1033925-1-laurent@vivier.eu>
References: <20200219101612.1033925-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:YwU/YVllBHraEo0Cl8lzUR9IjE0X30kvnGnRfWTuXIFMN2jYT7O
 XrRa4UbDum2mg5AgM704YkBwjUL7jVd7UXk5rBz3BWJQlaFpZ5EwIQs4N5qr0d106HQtpUn
 LMkn+IN+eRdJBgxUOeW/jBH8U0FjMbuD4qT46mC46Zuhzi3qBYJnrdIIhuJSj+mo23nW7Ue
 CGcxfihqg5LiTzw7PX/hg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:GditWF4XCtQ=:lufd1/0JL3gK9oH6/mi4XW
 n/nIxxMlhQP6oUwHoFT6KhXpVzEZMd5hV52T6YO1hd2mVuJ3JkCuSlB5V/wzj5TUtF5Ar3EB9
 8ma888wx0hkbC0SlRC5n4Z1N8TUMVlWzS+2t3YrA/6Ggj0EO8rSU06xzfZBEgFO+/rqWKR7PO
 qpVudWx/PItAVnk1z9PtdzTMa9VmQOzTFdHYOt1f7Aif/fvE2qMYcExF1l30SxVW2YK4YZhv/
 dM+X0jCtT6MdWKA3Ci5IqfK4Eq3Fu2e2H4fobysDmYf8ImaFG083KETrNurgRavkpetbxmk32
 bwB0glkkvx7H7Y/gK74mLVD+id31/3iaZ//caUCUqYFBu4AmOeEv/Unv2FnEQ5VD7K9ymNVVM
 /TUB5UAahLSujwjnoVkobFyc0GjmwVYOy0KogqW03zBGIskT9NOWVibdUkSkQUzvVFyhjFvyg
 nr3DC6IkcSwAUkXwsHq3RAWvCm77nsF5ljN66IJ5nkwPvtbynn3VX5KJ2RLRZUvxKlpRNGCiU
 aAxSOzXwl9BxkCNDCDApct6iLN+uAO20P3Nci6zLZAeVvhiAASzJ/rkdQxAEUxmX/a0Ak8SHw
 4jcYWo9y7wzMAmK9XC7ukOBL+vp1g9bn9Kmr8hwRS0ORCipP5zof05FWG2IBq8TRcYF5Tq6Ap
 gii4VdzQbsoqV8aKCqz0lnECnDk6/2z66JuvQAJs/oL9AUi/37vvUSD8ohIL/sdTb7951YDTW
 XXJncEPhNolYEP8CK7Q0hEK5ECPmOfSFs5k5Iu63+/My8V+XH+cEhYw80q2E+/Ukpdzkk72n0
 yTVwzDHyU4C8zUK+aWJiw1GGH5IabmOLn7xOq2oP7Mu/SuNynbsPNVV1GKmYa/4fc7jns3I
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
X-List-Received-Date: Wed, 19 Feb 2020 10:16:59 -0000

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Fixes: 956a78118bf
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Message-Id: <20200218094402.26625-7-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/m68k/next-cube.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/m68k/next-cube.c b/hw/m68k/next-cube.c
index e5343348d076..350c6fec78f9 100644
--- a/hw/m68k/next-cube.c
+++ b/hw/m68k/next-cube.c
@@ -734,7 +734,7 @@ void next_irq(void *opaque, int number, int level)
     switch (number) {
     /* level 3 - floppy, kbd/mouse, power, ether rx/tx, scsi, clock */
     case NEXT_FD_I:
-        shift = 7;;
+        shift = 7;
         break;
     case NEXT_KBD_I:
         shift = 3;
-- 
2.24.1


