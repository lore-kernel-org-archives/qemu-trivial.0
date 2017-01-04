Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cOmzT-0008Dv-Sh
	for mharc-qemu-trivial@gnu.org; Wed, 04 Jan 2017 09:56:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45580)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1cOmzR-0008AY-2B
	for qemu-trivial@nongnu.org; Wed, 04 Jan 2017 09:56:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1cOmzQ-0005ut-Bv
	for qemu-trivial@nongnu.org; Wed, 04 Jan 2017 09:56:33 -0500
Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243]:36445)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
	id 1cOmzL-0005sL-RQ; Wed, 04 Jan 2017 09:56:27 -0500
Received: by mail-wm0-x243.google.com with SMTP id m203so91848732wma.3;
	Wed, 04 Jan 2017 06:56:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=kHUUX3mPt37IFrzHv0sce82kbI+Uum69RlGBhXFvx/0=;
	b=QoSZ1N83vvn3wAtObzO90/oMH5H/SYXH18/KBheVfY36lKFDREFwAgC/SYl7lTsrmn
	8Fi7TH2v66b23eKRCGtODkXjpGpOYF/S9ay6OkP1on5dOi3acZ3wFjknsjzG7MtMKVB0
	JDYh8luUlGQ6hYRwQxnSd9+kk+WXTxRkknQP1G48XXTiKa2aDREL+DzLzBYEpvmv+p9q
	NNPA56y2Fmry0jY+i0D+8WDVz7Boo8qa9V3QotgKFrLDdJpZvSn/2V7oVlslzDVZsode
	7RDRb5SEP+wnuun1MwOSJ7wSbIyjXhFd+mDY9BFkqLEjqht6nJ/TqYKWv5U6fKV0cKdm
	3OAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=kHUUX3mPt37IFrzHv0sce82kbI+Uum69RlGBhXFvx/0=;
	b=ef7+RYjUVMQPnd/7UnPhuaSRUIZOJkiBps3DlflAvbr3a1npH1sQNIOnt+qzjsA61P
	7qEAvvOvFa8l/ENMC+AZW++ESlavA9ATEKSSyqPVuFwIQ937iwD+rM86pK4i1ilq6MJw
	YBCoCOIYfiMPaUY1sOFgjkakRkXRMWJTn+96JPdvrP1R82t51rlX2RG7yI4DX9eMtUac
	b8WLY3xau7K6Y8axTEmWtFiDovbEHk9p64ROQVM41tVe9QrD++6taRlL9tGtumVH7n43
	SvO8Rwry4nIDpDYfLWfV7NVwGKkHzurPrc99mVCsxpSeDJYstKqQHb42OP/F580kpjmS
	+Bxw==
X-Gm-Message-State: AIkVDXKinITdBx4ifZAOvwML/B2C+7BB1OmHHEJ7G6xCVTyjMbKf1lhGI0GbuL40nhTONA==
X-Received: by 10.28.191.219 with SMTP id o88mr53716472wmi.30.1483541786319;
	Wed, 04 Jan 2017 06:56:26 -0800 (PST)
Received: from donizetti.lan (94-39-158-71.adsl-ull.clienti.tiscali.it.
	[94.39.158.71])
	by smtp.gmail.com with ESMTPSA id n5sm95000420wmf.0.2017.01.04.06.56.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Jan 2017 06:56:25 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Date: Wed,  4 Jan 2017 15:56:24 +0100
Message-Id: <20170104145624.2849-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.9.3
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::243
Subject: [Qemu-trivial] [PATCH] qemu-img: remove dead check
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
X-List-Received-Date: Wed, 04 Jan 2017 14:56:34 -0000

options must be non-NULL here, because it has been checked before.
Reported by Coverity.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 qemu-img.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/qemu-img.c b/qemu-img.c
index 5df66fe..74e3362 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -3455,13 +3455,11 @@ static int img_amend(int argc, char **argv)
 
     create_opts = qemu_opts_append(create_opts, bs->drv->create_opts);
     opts = qemu_opts_create(create_opts, NULL, 0, &error_abort);
-    if (options) {
-        qemu_opts_do_parse(opts, options, NULL, &err);
-        if (err) {
-            error_report_err(err);
-            ret = -1;
-            goto out;
-        }
+    qemu_opts_do_parse(opts, options, NULL, &err);
+    if (err) {
+        error_report_err(err);
+        ret = -1;
+        goto out;
     }
 
     /* In case the driver does not call amend_status_cb() */
-- 
2.9.3


