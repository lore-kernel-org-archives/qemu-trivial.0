Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gWmOf-0007jX-2R
	for mharc-qemu-trivial@gnu.org; Tue, 11 Dec 2018 13:04:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42678)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gWmOd-0007i4-Ee
	for qemu-trivial@nongnu.org; Tue, 11 Dec 2018 13:04:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gWmOY-0007AI-Fy
	for qemu-trivial@nongnu.org; Tue, 11 Dec 2018 13:04:39 -0500
Received: from mout.kundenserver.de ([212.227.126.131]:50693)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gWmOY-00079g-65; Tue, 11 Dec 2018 13:04:34 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1Mbkac-1h1yo21QXm-00dHwR; Tue, 11 Dec 2018 19:04:08 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>, Richard Henderson <rth@twiddle.net>,
	Eduardo Habkost <ehabkost@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
	Paolo Bonzini <pbonzini@redhat.com>, Li Qiang <liq3ea@gmail.com>
Date: Tue, 11 Dec 2018 19:03:31 +0100
Message-Id: <20181211180352.19644-10-laurent@vivier.eu>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181211180352.19644-1-laurent@vivier.eu>
References: <20181211180352.19644-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:68z1m1htApw8UP8hUsasHO9uOzDAZnnw9h804ukKuhitT4NIw58
	Vh/E9Dexcz6ZNQaUMJQEKA74ISkkcp1fUuTBEhLWt4LsSvskMCmLEeRQa/8ZQJUvC704cV+
	rcnSypPBGHLrzU41D2DA3rIk+Sv0Y2EczSY10Ga2yJ8MJQz46MPD6x/dxaPnaSKmVOI9lFG
	QIcAJam2D8GktE70up9lA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:4hqAJ23Suzc=:ja9yXWHqsyENUx13wUOovX
	sV1Vf3kUMy2vx+0jFWtl1rYxVQFBu7/SCCTIKkx99edI5cm9RJfOFlxTQYJ1Jq+wSxVDnGHYu
	3dQMBkz/EjzbLjBAT0L9rwz8bnSPwTti14GI36HX4yLxhSax7WJujvQ4S04acO2cxocIBNcCJ
	JwokaRhyPDj383LFWjuqWioV+PzuaxILd1AvGZ7xX8RZUDpYUdMDKABElVcwBfmUK6fD1sk7L
	nVs6X3Ic8b+07O5t0jfQGuBGZRLRORwmNwe43rW48euGcPg2WHCUfjWSHjdX+MeUjzh+mmEIC
	1qwj8mG84F1ckjbMW4olYSZeTAOYA21Ots4QH+KWS2klEY5iTNmDPIxgqwHSwikCdyFxhVqPV
	U8CcBM5RPw3rrrzQi5ZJ64iIJ3PYNhj5hZkmuAicxi46FxU3uW0VSn/x8EVC+ABGQOaGkGDRS
	0EJ055caG4oYWOXcvgpyLmBUcexQQurc5R/lq+S3KlaHcaaRQ0vozuYM4Oc1HFwdx3WcccStU
	r8aQkiQn5Wt+uVRCLpedZdtkSwc3xBdcPPcP3TnBBWpzOyBZBWJF9GP5VN0N4kjGrUThXb8vj
	s7ZiiM6xEz6/LLnd7Rtg4neKCwXHY64ZBnJz5iNdf6zn9RGl1zUiOoOEVxPeW3JkBKO1NjtgD
	vqgBGtNp4cYcBmYwaZj+MA+fKDlmXhgmUXPz1FcsIKNYRaJYfYQAkx54cjcjD/+FVECjqtwAF
	+ZMTa23gf9GqQ8FwTkuhxEWIXPLxyveqsQ+FgO84fqRbxVPH6sH4g01cfS0=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.131
Subject: [Qemu-trivial] [PULL 09/30] target: hax: replace g_malloc with
 g_new0
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
X-List-Received-Date: Tue, 11 Dec 2018 18:04:40 -0000

From: Li Qiang <liq3ea@gmail.com>

And also the g_malloc doesn't need check return value,
remove it.

Cc: qemu-trivial@nongnu.org

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Li Qiang <liq3ea@gmail.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <1543226179-5135-1-git-send-email-liq3ea@gmail.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 target/i386/hax-all.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/target/i386/hax-all.c b/target/i386/hax-all.c
index d2e512856b..502ce6f0af 100644
--- a/target/i386/hax-all.c
+++ b/target/i386/hax-all.c
@@ -154,13 +154,7 @@ int hax_vcpu_create(int id)
         return 0;
     }
 
-    vcpu = g_malloc(sizeof(struct hax_vcpu_state));
-    if (!vcpu) {
-        fprintf(stderr, "Failed to alloc vcpu state\n");
-        return -ENOMEM;
-    }
-
-    memset(vcpu, 0, sizeof(struct hax_vcpu_state));
+    vcpu = g_new0(struct hax_vcpu_state, 1);
 
     ret = hax_host_create_vcpu(hax_global.vm->fd, id);
     if (ret) {
@@ -250,11 +244,8 @@ struct hax_vm *hax_vm_create(struct hax_state *hax)
         return hax->vm;
     }
 
-    vm = g_malloc(sizeof(struct hax_vm));
-    if (!vm) {
-        return NULL;
-    }
-    memset(vm, 0, sizeof(struct hax_vm));
+    vm = g_new0(struct hax_vm, 1);
+
     ret = hax_host_create_vm(hax, &vm_id);
     if (ret) {
         fprintf(stderr, "Failed to create vm %x\n", ret);
-- 
2.19.2


