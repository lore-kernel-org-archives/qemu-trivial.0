Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gG4JN-0004xA-BA
	for mharc-qemu-trivial@gnu.org; Fri, 26 Oct 2018 11:46:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49850)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gG4JI-0003mJ-I9
	for qemu-trivial@nongnu.org; Fri, 26 Oct 2018 11:46:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gG46p-0005N3-O9
	for qemu-trivial@nongnu.org; Fri, 26 Oct 2018 11:33:13 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:44053)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gG46c-0004yJ-1q; Fri, 26 Oct 2018 11:32:58 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1MuF4v-1fSVlz3MEf-00uabe; Fri, 26 Oct 2018 17:31:51 +0200
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1MuF4v-1fSVlz3MEf-00uabe; Fri, 26 Oct 2018 17:31:51 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
	Jason Wang <jasowang@redhat.com>, qemu-arm@nongnu.org,
	Michael Walle <michael@walle.cc>, Laurent Vivier <lvivier@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, Cleber Rosa <crosa@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>, xen-devel@lists.xenproject.org,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
	Fam Zheng <famz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Aurelien Jarno <aurelien@aurel32.net>, Kevin Wolf <kwolf@redhat.com>,
	qemu-block@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
	qemu-trivial@nongnu.org, Riku Voipio <riku.voipio@iki.fi>,
	Eduardo Habkost <ehabkost@redhat.com>
Date: Fri, 26 Oct 2018 17:31:10 +0200
Message-Id: <20181026153125.24738-6-laurent@vivier.eu>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20181026153125.24738-1-laurent@vivier.eu>
References: <20181026153125.24738-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:AHIYzvZ0k2AaXsDkHzyH3mfSFFsxCdqJRBeK+MP9hZPehMjxUA5
	eGWZ82GiJJn0o7a+gzV3bkC3phsf/nyn3w2kiRrkal4eHCM1+CBGa+6eSV48Rp0EbJrJaBP
	69+ksD/WCvbxM6QJg4wt40DWgit+xvppkxtX8mfuNUPyyYaiUEamF54ab7ID27sfRInL+b8
	Dcn6lFU8pDiyUJrNXA2Mg==
X-UI-Out-Filterresults: notjunk:1;V01:K0:a079i6mtQvY=:mXM+exP3XoS8LPq93wsz7g
	mW0aRzKSCQk5ysSjcpRMVQW7FCYBEGhf9KStCMzo8U4B2YL/MzIZUT2LDozfBjzq+OUBaU3Sw
	lTpFZW8aEK5qasOYh8zUZ3DePbSp0D30BmroEqxD9d+jPYUejS4O0ZV+M41X3mH33xr/f9eDo
	0guOYHzqAtf8CR9PRgIqIXZodBMu9bZzHXleI95vhtePv8GxCWQUWrTv8nHdhnBDllB8z+d7w
	hbb9qVWSJebZLv6Yc+3o/H8E33sZIA8yia7Kl7VNrVf3L4Lh7S8PwpsVgqRn+MFScKIzmp59F
	BPwbLDQ6qMwgAwYp76WR4w5M/mf1XLrT5qCmT06F3zrNVk3wfKZftPVUwyhdpQXiwB1HMOFmF
	pqxYPNFr2rLDFFUXF/X34AIWuyRR2jt3yadBmsgcSiF9lQ0RDoYZM3VGlRv98R2ia6dbuzSzj
	BjfFM03oUVNu1BX4CMl3hCr1t1v4+VP4DwWjYpGojts722TfTVf9MsLKbWN96AHtg10bE1n3u
	RvYEyj3GXOz+ivlYMdHixAGnJsj/Ug0xM/sS70M98aQLX24e1+863VqKzLJ2XO836CDrHmhHu
	gNsDFrB+LRXiIJKxNmznQkTeXl2LXAraOjeLPMbTCfF9tR8ek+m6j6X8/9nquenwzvZsbtAeI
	6viJrksGHumC2QWFJnxcF3tvlSJAGuCOWQCI/XY05MW8QbSz0ZFFlfG5RMwpK7cE/guEfmbuh
	giCVff7Z8XZ0mARP
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.187
Subject: [Qemu-trivial] [PULL 05/20] qemu-iotests: fix filename containing
 checks
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
X-List-Received-Date: Fri, 26 Oct 2018 15:46:05 -0000

From: Cleber Rosa <crosa@redhat.com>

Commit cce293a2945 moved some functions from common.config to
common.rc, but the error messages still reference the old file
location.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20181004161852.11673-5-crosa@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 tests/qemu-iotests/common.rc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/qemu-iotests/common.rc b/tests/qemu-iotests/common.rc
index 44bee16a5e..70ca65b49b 100644
--- a/tests/qemu-iotests/common.rc
+++ b/tests/qemu-iotests/common.rc
@@ -170,7 +170,7 @@ if [ ! -e "$TEST_DIR" ]; then
 fi
 
 if [ ! -d "$TEST_DIR" ]; then
-    echo "common.config: Error: \$TEST_DIR ($TEST_DIR) is not a directory"
+    echo "common.rc: Error: \$TEST_DIR ($TEST_DIR) is not a directory"
     exit 1
 fi
 
@@ -179,7 +179,7 @@ if [ -z "$REMOTE_TEST_DIR" ]; then
 fi
 
 if [ ! -d "$SAMPLE_IMG_DIR" ]; then
-    echo "common.config: Error: \$SAMPLE_IMG_DIR ($SAMPLE_IMG_DIR) is not a directory"
+    echo "common.rc: Error: \$SAMPLE_IMG_DIR ($SAMPLE_IMG_DIR) is not a directory"
     exit 1
 fi
 
-- 
2.17.2


