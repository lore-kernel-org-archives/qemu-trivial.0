Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hMGvo-0003m3-MC
	for mharc-qemu-trivial@gnu.org; Thu, 02 May 2019 14:59:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36267)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hMGvm-0003jk-Aa
	for qemu-trivial@nongnu.org; Thu, 02 May 2019 14:59:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hMGvk-00034z-1D
	for qemu-trivial@nongnu.org; Thu, 02 May 2019 14:59:41 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:51429)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1hMGvi-000345-00; Thu, 02 May 2019 14:59:39 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA
	(Nemesis)
	id 1MbjBo-1glYC01KHe-00dHYJ; Thu, 02 May 2019 20:59:02 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Fabien Chouteau <chouteau@adacore.com>,
	Viktor Prutyanov <viktor.prutyanov@phystech.edu>,
	Richard Henderson <rth@twiddle.net>, Thomas Huth <thuth@redhat.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Laurent Vivier <laurent@vivier.eu>, Eduardo Habkost <ehabkost@redhat.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>, Jason Wang <jasowang@redhat.com>,
	qemu-trivial@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>, Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Michael Roth <mdroth@linux.vnet.ibm.com>, Eric Blake <eblake@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Date: Thu,  2 May 2019 20:58:32 +0200
Message-Id: <20190502185835.15185-11-laurent@vivier.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190502185835.15185-1-laurent@vivier.eu>
References: <20190502185835.15185-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:emdVrM76Q9ZEwCt3gx+FcPMEVNlFoFdGjNYiDdUfivFiNUywUmo
	Pdm93O77b65iwG8WV78xD0AOErIyYJek7OJKojo8+TDeBLZsV+aLxMDL9Mm82nDhEeiNsiP
	ficUJejGofvek/lDs7yvaOygFoMjShIcNFToa+y1fbYIwpeCVef1R8koBbBb2A2B4uEFpjk
	eWXrl06DqhqnSdM36vljQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:un3pcgT1kvc=:Ee2aYE/fsfQN4vI90Ph2Ut
	Eq2QcByaDVoRJCK+dRQsZg6yt04d2dgJVNTDnJkz9YIw62S6rM9lK4mbZfjgW3Fq1QLT9x3rs
	pgiFgXXqhP6fu755rVnzGIAZPrhk7zkgLln8SVU7EjVPY1DXJOWL8BWKRhfZJkDhp6dWyhKFE
	CkRIMBPtHlFuFg+PEZPtz8hbrO+/1E2ETa2xQ7B795T/EDLEUDyPv1RLma6VR9wlNZW60dvqi
	uxvTvJUKbXTRcGDX/ZwtCgkImGvcD6sSuB8dPZieg5lGDtmUQ2rUZ2zn4+OZzVncSozbOlYSb
	2KBdjEYDFrC/WwsLzbLPCWWsMLHaLXfLye33fDocHkOVcL68zd3ZU3ANjDXNSSWt2IsUw1liq
	ny63RRxP8lMDImZj0Jpa8w+4l6j2HRFm7uSWwCtXf4WLSB88Mfg6aTHB9aXUtywBB2KFrNqkN
	pSasz/xVu1Erb+emN8YCuttjPvM3mYeIXdn6fs/j/l+4nAofjnRiQwE6MsedaqDFwimszSwcK
	KQV0eOdfT6xtFBdKYgAJz/1sb0lCvX1NMG34VMY7EptGh7H+Ppt51Yey4mWJ1qmI2Pcg94mxR
	N29KuI3QoMtLwhd2ULna9VimbM7KOsSlwbYJ2cPRVb4TK85qo4qJuYehRehzIoJPc0ywX+5fX
	sTMi1lIuqm83hbEUAciuDBhr9wIJx6mwXk65XJVxzvDYCYeZ+LvsoKGoroaT+z2vClaVJaZxO
	pWzfOaMvLCfijWIGR3Tw0dsXf9Uewqc2cYfjBBRbWDCRTM56IwIBSDQhDqE=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.13
Subject: [Qemu-trivial] [PULL 10/13] net: Print output of "-net nic,
 model=help" to stdout instead of stderr
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 02 May 2019 18:59:43 -0000

From: Thomas Huth <thuth@redhat.com>

We are printing all other help output to stdout already (e.g. "-help",
"-cpu help" and "-machine help" output). So the "-net nic,model=help"
output should go to stdout instead of stderr, too. And while we're at
it, also print the NICs line by line, like we do it e.g. with the
"-cpu help" or "-M help" output, too.

Buglink: https://bugs.launchpad.net/qemu/+bug/1574327
Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20190423160608.7519-1-thuth@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 net/net.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/net/net.c b/net/net.c
index f3a3c5444cc3..2cf5e7646997 100644
--- a/net/net.c
+++ b/net/net.c
@@ -837,9 +837,10 @@ int qemu_show_nic_models(const char *arg, const char *const *models)
         return 0;
     }
 
-    fprintf(stderr, "qemu: Supported NIC models: ");
-    for (i = 0 ; models[i]; i++)
-        fprintf(stderr, "%s%c", models[i], models[i+1] ? ',' : '\n');
+    printf("Supported NIC models:\n");
+    for (i = 0 ; models[i]; i++) {
+        printf("%s\n", models[i]);
+    }
     return 1;
 }
 
-- 
2.20.1


