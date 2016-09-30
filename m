Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bq2XO-00004y-8N
	for mharc-qemu-trivial@gnu.org; Fri, 30 Sep 2016 14:27:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32802)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <akanksha.dlf@gmail.com>) id 1bq1yq-00030O-JZ
	for qemu-trivial@nongnu.org; Fri, 30 Sep 2016 13:52:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <akanksha.dlf@gmail.com>) id 1bq1yp-0006kw-4k
	for qemu-trivial@nongnu.org; Fri, 30 Sep 2016 13:52:16 -0400
Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242]:35158)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <akanksha.dlf@gmail.com>)
	id 1bq1yh-0006ci-Os; Fri, 30 Sep 2016 13:52:07 -0400
Received: by mail-pf0-x242.google.com with SMTP id 6so5262346pfl.2;
	Fri, 30 Sep 2016 10:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Csm7ntZShCRMwvc6kCQglrl8eUi5LkiF/aEg87so0JM=;
	b=fLn/7W4VA3hCLWuNA6s+zmDbcOJlFUkmesK2FHkpLT2vQxXObsjpdHFGngHI5CvLj1
	4OxUZqpZ0dMWguQMgWQHLZhWd8bxmghhEUEG90rDtZ9tdNKKry3Et8/vy2wLF8EIWf0N
	X5j4jTLLXE32CjJytmCfjWfDRiYqJozihQ0zJzJ2whtN3nx3HJEI3wvd98EM6R2vW77z
	Ilmo73vsfFvlREEMYYDeWyxwK9QtGeiXSPcfr7vW7GLdw18Xx0TOiSgCdRUXWm+PxQr5
	YTqoUYI5DY2XURM41xR4YBOLzJy6nj4gA3gP7pZsWGS+RYYxOet6ywAwRw9LJrjmjLXr
	p6Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Csm7ntZShCRMwvc6kCQglrl8eUi5LkiF/aEg87so0JM=;
	b=PlhwuDbft7u89xSgbUoetGnoIx7APl29kutcbLlFbitdBWikWJ2k5BqFbcbgRkFLzI
	34XsrSymFgiFz3W5fH+PCXtxZhmrPsxU5vvZCNMZBSItFore9y5XCq+WRm0aOLGlBkTh
	liOlkBD1EWNFcweWu+MlUSMQPYjtyi2Cw8uoMPdssKMGr0wXLgyiRqbsK+CzuHFr688O
	dKQG/SiPv4jeMJQmWw1KW1SLf4XdLwr/VpS3GWh5EQVXos+p48Nc6kQuXOyP62yCMmcY
	FhxnYafwjL9h9x/p3zcUCBSDsef+OTgdsc609DFZ4qPTZ3lNAPVAXaQIBQt0dRNwQT5j
	5e/g==
X-Gm-Message-State: AA6/9RmN163+kdY3ihVe3kl/eeZVULvHZ3F93Z06sOm4+xT4wlaOEin8PLEBJHhOuO9lBg==
X-Received: by 10.98.34.221 with SMTP id p90mr13952995pfj.18.1475257926702;
	Fri, 30 Sep 2016 10:52:06 -0700 (PDT)
Received: from akanksha.iiit.ac.in ([14.139.82.6])
	by smtp.gmail.com with ESMTPSA id
	x66sm29397870pfb.86.2016.09.30.10.52.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 30 Sep 2016 10:52:06 -0700 (PDT)
From: Akanksha Srivastava <akanksha.dlf@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, kraxel@redhat.com,
	Akanksha Srivastava <akanksha.dlf@gmail.com>
Date: Fri, 30 Sep 2016 23:21:35 +0530
Message-Id: <1475257895-10762-1-git-send-email-akanksha.dlf@gmail.com>
X-Mailer: git-send-email 1.9.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::242
X-Mailman-Approved-At: Fri, 30 Sep 2016 14:27:57 -0400
Subject: [Qemu-trivial] [PATCH] usb: Change *_exitfn return type from void
 to int
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
X-List-Received-Date: Fri, 30 Sep 2016 17:52:17 -0000

The *_exitfn functions cannot fail and should not be
returning int.
Suggested as a Bite-sized task
Signed-off-by: Akanksha Srivastava <akanksha.dlf@gmail.com>
---
 hw/usb/ccid-card-emulated.c | 4 ++--
 hw/usb/ccid-card-passthru.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/usb/ccid-card-emulated.c b/hw/usb/ccid-card-emulated.c
index 3213f9f..abb2773 100644
--- a/hw/usb/ccid-card-emulated.c
+++ b/hw/usb/ccid-card-emulated.c
@@ -547,7 +547,7 @@ static int emulated_initfn(CCIDCardState *base)
     return 0;
 }
 
-static int emulated_exitfn(CCIDCardState *base)
+static void emulated_exitfn(CCIDCardState *base)
 {
     EmulatedState *card = EMULATED_CCID_CARD(base);
     VEvent *vevent = vevent_new(VEVENT_LAST, NULL, NULL);
@@ -564,7 +564,7 @@ static int emulated_exitfn(CCIDCardState *base)
     qemu_mutex_destroy(&card->handle_apdu_mutex);
     qemu_mutex_destroy(&card->vreader_mutex);
     qemu_mutex_destroy(&card->event_list_mutex);
-    return 0;
+    return;
 }
 
 static Property emulated_card_properties[] = {
diff --git a/hw/usb/ccid-card-passthru.c b/hw/usb/ccid-card-passthru.c
index 2eacea7..2bd9cb2 100644
--- a/hw/usb/ccid-card-passthru.c
+++ b/hw/usb/ccid-card-passthru.c
@@ -364,9 +364,9 @@ static int passthru_initfn(CCIDCardState *base)
     return 0;
 }
 
-static int passthru_exitfn(CCIDCardState *base)
+static void passthru_exitfn(CCIDCardState *base)
 {
-    return 0;
+    return;
 }
 
 static VMStateDescription passthru_vmstate = {
-- 
1.9.1


