Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1axU62-0004sT-LX
	for mharc-qemu-trivial@gnu.org; Tue, 03 May 2016 02:46:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51604)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chrisfriedt@gmail.com>) id 1axOjA-0004td-Kt
	for qemu-trivial@nongnu.org; Mon, 02 May 2016 21:02:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chrisfriedt@gmail.com>) id 1axOiy-0007tu-Sz
	for qemu-trivial@nongnu.org; Mon, 02 May 2016 21:02:11 -0400
Received: from mail-ig0-x243.google.com ([2607:f8b0:4001:c05::243]:33475)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chrisfriedt@gmail.com>)
	id 1axOia-0007kf-57; Mon, 02 May 2016 21:01:41 -0400
Received: by mail-ig0-x243.google.com with SMTP id rc4so706374igc.0;
	Mon, 02 May 2016 18:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=VnMgmeWQNhGPTraN6uLDhFqtQ9KrKpWXn3qpYq38Fho=;
	b=NYWvHBrcLeAvCnMdZ9IbdHknACOgxwnrPNR5xPEBK49caqMaXJryUau+L3sblH8mpj
	d/j/J9bYtf6EOic4rSYAZpQl4k0GvgrFzxsUzng9Sht3idF7hBv+cKw1cBncyltDo9Xw
	hW90zJcdpFxAMBu4UIo5DE/tsi1EoH10hJ6jpfXiPUbQRCJd/qPx+HfrU2rPkmwgmGT2
	dHOuJvKEcWKLYfYSwDfWW8ZgfpbTeB1D5GEsp4GRwKiDqhFsrhaiexPv09E00mCBlvXk
	bOsk3O4FFxaD5KG7J9rzHdVURhExruqHW3l1h04XjwIuGX5Ynir5qYa3tnrtd3ml5RiB
	460Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=VnMgmeWQNhGPTraN6uLDhFqtQ9KrKpWXn3qpYq38Fho=;
	b=gY0xLWA0ns+yQ4ZYaHYN45r17B5UG96ql9rfn26xAJKrkUc7mrTjh6qCvhnumxDuBT
	HQMS6ib+Bu6zwPqFJd5tLQ/2vTQqhFmqis7Bq1482+v0D0ORc/+sBoB8Lt5WUXypg+fG
	na+TjBn89R1muMBWmhB979kRy33PDcHQyEV4villLcqahkgDslYTPqw5ICHAtQi7ZAWc
	t+C8RKZ66GbpcmQwb+HHw15DgsepfS75gyRVY/qLRTMNl+5n4ETlj0AZ0DbYdvkewSdH
	kPsHWk6JIET7B4HB202lAIupnfjIp5aVx/L1K41gr1H+Jv9UY74ONUS6i79pNaCFGB6y
	0D2Q==
X-Gm-Message-State: AOPr4FW0BUoMFWwDVbpbLHhF0fsu+8Nal2BZRv73y/GMgA134dLvmyvKGAIQP3CdeSBcOg==
X-Received: by 10.50.50.229 with SMTP id f5mr160942igo.10.1462237268426;
	Mon, 02 May 2016 18:01:08 -0700 (PDT)
Received: from localhost.localdomain (76-10-180-162.dsl.teksavvy.com.
	[76.10.180.162])
	by smtp.gmail.com with ESMTPSA id i14sm803917iod.34.2016.05.02.18.01.07
	(version=TLS1 cipher=AES128-SHA bits=128/128);
	Mon, 02 May 2016 18:01:07 -0700 (PDT)
From: Christopher Friedt <chrisfriedt@gmail.com>
To: famz@redhat.com,
	mst@redhat.com
Cc: Christopher Friedt <chrisfriedt@gmail.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Date: Mon,  2 May 2016 21:01:05 -0400
Message-Id: <1462237265-61763-3-git-send-email-chrisfriedt@gmail.com>
X-Mailer: git-send-email 2.6.4 (Apple Git-63)
In-Reply-To: <1462237265-61763-1-git-send-email-chrisfriedt@gmail.com>
References: <1462237265-61763-1-git-send-email-chrisfriedt@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4001:c05::243
X-Mailman-Approved-At: Tue, 03 May 2016 02:46:10 -0400
Subject: [Qemu-trivial] [PATCH 2/2] [RESENT-INLINE] Remove unnecessary
 CONFIG_EVENTFD preprocessor conditional to satisfy link
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
X-List-Received-Date: Tue, 03 May 2016 01:02:23 -0000

The file ivshmem.c unconditionally references event_notifier_init_fd() in util/event_notifier-posix.c, even if CONFIG_EVENTFD is not defined. On platforms where CONFIG_POSIX is defined, but CONFIG_EVENTFD is not defined, that results in an undefined symbol referenced from ivshmem.c and the link fails. That applies to Mac OS X, but possibly other BSD-based distros.

Note: there is nothing specific to eventfd inside and event_notifier_init() also fails unconditionally if CONFIG_EVENTFD is not defined.
Signed-off-by: Christopher Friedt <chrisfriedt@gmail.com>
---
 util/event_notifier-posix.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/util/event_notifier-posix.c b/util/event_notifier-posix.c
index c1f0d79..c9bb34d 100644
--- a/util/event_notifier-posix.c
+++ b/util/event_notifier-posix.c
@@ -21,7 +21,6 @@
 #include <sys/eventfd.h>
 #endif
 
-#ifdef CONFIG_EVENTFD
 /*
  * Initialize @e with existing file descriptor @fd.
  * @fd must be a genuine eventfd object, emulation with pipe won't do.
@@ -31,7 +30,6 @@ void event_notifier_init_fd(EventNotifier *e, int fd)
     e->rfd = fd;
     e->wfd = fd;
 }
-#endif
 
 int event_notifier_init(EventNotifier *e, int active)
 {
-- 
2.6.4 (Apple Git-63)


