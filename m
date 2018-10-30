Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gHS9H-0002HK-51
	for mharc-qemu-trivial@gnu.org; Tue, 30 Oct 2018 07:25:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58677)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gHS9E-0002EP-GM
	for qemu-trivial@nongnu.org; Tue, 30 Oct 2018 07:25:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gHS98-0003aZ-N8
	for qemu-trivial@nongnu.org; Tue, 30 Oct 2018 07:25:22 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:49445)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gHS8n-0002r2-94; Tue, 30 Oct 2018 07:24:57 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1M7aqD-1gCCGc44Td-0085WZ; Tue, 30 Oct 2018 12:23:56 +0100
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1M7aqD-1gCCGc44Td-0085WZ; Tue, 30 Oct 2018 12:23:56 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Cleber Rosa <crosa@redhat.com>,
	Jason Wang <jasowang@redhat.com>, qemu-arm@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Thomas Huth <thuth@redhat.com>, Anthony Perard <anthony.perard@citrix.com>,
	Aurelien Jarno <aurelien@aurel32.net>, Max Reitz <mreitz@redhat.com>,
	Fam Zheng <famz@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
	Kevin Wolf <kwolf@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Stefano Stabellini <sstabellini@kernel.org>, qemu-trivial@nongnu.org,
	qemu-block@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
	xen-devel@lists.xenproject.org, Gerd Hoffmann <kraxel@redhat.com>,
	Riku Voipio <riku.voipio@iki.fi>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <lvivier@redhat.com>,
	Michael Walle <michael@walle.cc>, Markus Armbruster <armbru@redhat.com>
Date: Tue, 30 Oct 2018 12:23:22 +0100
Message-Id: <20181030112337.17973-6-laurent@vivier.eu>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20181030112337.17973-1-laurent@vivier.eu>
References: <20181030112337.17973-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:HGf3vO88OS9YjExxl3IHlSCxaolOWWZDr/ZpH95+T9lkzF5OCnR
	OOZAhze5Ahl5x3FuY/VbrS6OcOQBYpBe2s+y49rJLQ3YRAXf8TipWZYqMR8we7MLUtr3ByR
	523u1xENy0P0bKNoXDJyVebtP0pGanvRJVBIUJo5ZExF7Hhj3RbTcBqDE0hy0VX2amu7IC2
	jMiWW1a1tQzP9WQsIcJ8A==
X-UI-Out-Filterresults: notjunk:1;V01:K0:EO6XVGOJqlo=:wvXON1J+jwCx85xUT939P0
	pBNcPmcjzCbU7hD45t48L+tmCLO+rtJV73Q4RlsLbncMoxuo+SobB0zPxqrrHm1+vzDjfooiA
	1k/YaC7M06EJx/Z6vAJdXaMdCzUjFRsy3mgTUSTyk+5W3z7fgpla1fvmQhH0dAX2jT0ckS2iP
	2TL0cv3zvNeZOI/dHgAS/ANL33JYJGqb9LqNlNMLGbuvIDjCZXvGQaIaD9BMBbKJmWm/5v8Bv
	aEPzXo1bhruFsKEbEIT/ojbZYakbNtwwiXyqUYJ3NOVlZ8Xep0gh9ZbM9JGTC/JgmSu1O0FrV
	2e6gSEmzDhDhUJhNRU5TCLmY/3AT4umHAgfp5KwO+nDHtdH1JJVqmYkG8ApDoBBa7Fqo1zJOz
	08INLuzhOBs1cRSoZwjBvSwncRayNMAuiaCdJKO0cfLpk46fxOs3pU3gXByytCevib/JsQTWN
	lM/47/WugFW3Cahh3c/HfmRwgefqIyMEde9TtZMd57wUfSv4qvu6CwMEIR+CXsDtFIzaDrl0G
	59s/r1lskp7p+CcNspJl/ZXSF+x0VZ0Rz08tcm4njBw1ABorJ+LiNhIFHBMl0G7n9C9M5nQNJ
	qwkk3spqSbdXHX6eWgIfkP8LtK5nZRFfgxDBsPDZtWATn1jeogQ2tZeqfjz3wqj7qsgVMFi1s
	+G+rATUi12Lw+pCJD1nOS+fmvRsCeDXtbxq5iZG8sJ60y74CsNi9TE/z+TAt+I6n1upa682NB
	ZYT5xr2qSKX/ay9O
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.135
Subject: [Qemu-trivial] [PULL v2 05/20] qemu-iotests: fix filename
 containing checks
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
X-List-Received-Date: Tue, 30 Oct 2018 11:25:25 -0000

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


