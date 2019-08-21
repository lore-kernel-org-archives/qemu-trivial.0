Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i0Ofe-0005R5-O8
	for mharc-qemu-trivial@gnu.org; Wed, 21 Aug 2019 07:20:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53532)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1i0OfQ-00053P-T0
 for qemu-trivial@nongnu.org; Wed, 21 Aug 2019 07:20:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1i0OfO-0006cR-TY
 for qemu-trivial@nongnu.org; Wed, 21 Aug 2019 07:20:40 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:42335)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1i0Of6-0006Pq-Q6; Wed, 21 Aug 2019 07:20:21 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MWBGG-1hlanV1wyI-00XblI; Wed, 21 Aug 2019 13:19:59 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Michael Tokarev <mjt@tls.msk.ru>,
 "Michael S. Tsirkin" <mst@redhat.com>, Corey Minyard <minyard@acm.org>,
 Juan Quintela <quintela@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <rth@twiddle.net>, Jason Wang <jasowang@redhat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, Markus Armbruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-trivial@nongnu.org,
 =?UTF-8?q?Carlo=20Marcelo=20Arenas=20Bel=C3=B3n?= <carenas@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Date: Wed, 21 Aug 2019 13:19:36 +0200
Message-Id: <20190821111947.26580-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190821111947.26580-1-laurent@vivier.eu>
References: <20190821111947.26580-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ZV7dLwTZZz5R+wuccd172/uspKnkVx3+luV7blIDhC72uT07rni
 R8CpCIws4VISkdZq/3xxqth6IJA9AyGo7IbTVcDtHzY+u/CzoFe0GmRiTWDN/hjxmdhkUNp
 P6vCRc56N3ylwfIHhItTV+42TJ0sHCigl1XZDiqOMyM3caGXZWNK5MIo9EXcCCXZVpXxhfo
 EKgzDQAmDsHwAB4kX8R0g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:xjV6d8eXXZY=:9ZScjLxS+qktx/ZdKggwCz
 DPH/XYmvR7iPh9kTh0z/r1dSHQGu8BOH3QpaUns722Q5sClPJ3hSvQN2+nImbH9ArwPwVa4an
 zkxYRppsz+C2Akyw8JWLx8EOeCLACP+l2F8UIHP1FZx+X3TCCjbJxeq5SI5dkVRqJZenw1FyZ
 EMqefvVr9Ofl2ld5hWDAe23fIHeDpa3Fwbc0q06o1xW7AKyhR0+5s5KdiFSsARkH0ljmkw8Am
 yQRrffxj+LrfSOR6mPq2uSYLTdbsOpmZs8nAlRpIvMytQzYVa3EyXF/9QJsZErCC62F4Ae9LK
 ITaqr2wnRqbwPiR3Jpca/rlsYszqkMWRy9V9gcpbjCk+KyDHoonnH6saNpDsZBr1FqyK8HKvL
 HS7wzYZbwXLy8VA3quxHvQMniIfW8R8fPDPiRFXEOgQjo4ECbthC8vzcmAj7IR11aasa/PDUK
 utuZVfP6sM06FJMqRbuHEn82Q3ObXZcFtKbODnGDAglEFWaYmx3BF7DOpzvmoVEeFW7cvI7ly
 MxyAi8kQW9cY0DvS8FkCDWGRqikgIKfJqgBTU8P+F1gj8yPSgZCTQ0OpMN+ov7tTo3csaPpqN
 LoKjKCgFsTtX5JwjxgTHAInhvuND9P2xOFZ9ov7eOZ3GWwexwhvzHZ9u1ZBb1EZQv7r8dPSDQ
 +A+5FTOJl6Uw0jDhcdUSP8FnR97WqERkrIwHcUu+Rr/tjq02ieoVIrKL7wQoHMBXIi5fUqf3k
 NE5xaj6U7m6q9SjsqdbWrzmIdomKxI16awQqK0vpZhqYNC2o7wRVlH3yQho=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.74
Subject: [Qemu-trivial] [PULL 03/14] configure: remove obsoleted $sparc_cpu
 variable
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
X-List-Received-Date: Wed, 21 Aug 2019 11:20:45 -0000

From: Carlo Marcelo Arenas Belón <carenas@gmail.com>

9b9c37c364 ("tcg-sparc: Assume v9 cpu always, i.e. force v8plus in
32-bit mode.", 2012-09-21) removed the need for this variable and
most of the references to it, but this one.

Remove defunct code, no effect or functionality change expected.

Signed-off-by: Carlo Marcelo Arenas Belón <carenas@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20190709234330.89699-1-carenas@gmail.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 configure | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/configure b/configure
index 714e7fb6a1fb..4e7b79c826a2 100755
--- a/configure
+++ b/configure
@@ -6384,9 +6384,6 @@ if test "$vnc" = "yes" ; then
     echo "VNC JPEG support  $vnc_jpeg"
     echo "VNC PNG support   $vnc_png"
 fi
-if test -n "$sparc_cpu"; then
-    echo "Target Sparc Arch $sparc_cpu"
-fi
 echo "xen support       $xen"
 if test "$xen" = "yes" ; then
   echo "xen ctrl version  $xen_ctrl_version"
-- 
2.21.0


