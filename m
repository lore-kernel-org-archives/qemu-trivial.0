Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1axU62-0004ps-5U
	for mharc-qemu-trivial@gnu.org; Tue, 03 May 2016 02:46:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49305)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chrisfriedt@gmail.com>) id 1axOWU-000670-9m
	for qemu-trivial@nongnu.org; Mon, 02 May 2016 20:49:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chrisfriedt@gmail.com>) id 1axOWI-0005Ao-Mx
	for qemu-trivial@nongnu.org; Mon, 02 May 2016 20:49:04 -0400
Received: from mail-io0-x242.google.com ([2607:f8b0:4001:c06::242]:35444)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chrisfriedt@gmail.com>)
	id 1axOVw-0004xn-Lo; Mon, 02 May 2016 20:48:37 -0400
Received: by mail-io0-x242.google.com with SMTP id u185so760645iod.2;
	Mon, 02 May 2016 17:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version; bh=RD7SE5WBjB8eD5BTCUIWA8YfnSTW1gZ/4EFplEB+2d8=;
	b=cHkwD8fnRBxiDCi7hf3HikSBpMSRX4yjvqL0tbyr17FVccPkgTlqYeq6fYy4jL5o3W
	6/lg/vDzd1jiUZRCNLtNdXQUR+bu/eG4lIlXYAu3pNr5GQdKaEgUD5rcpw4SA0g0uLPM
	UOELhprr1j/l/OFp7TdYm9mr2IYLOVdm4+eHDULCG+iFziHoaBy5WMoKzhAFoEgZIWgy
	rqw8XLhLkMKAUikL/i6vhrFIW2PCOSD9yoh8tb0OC4has6OlSVrJP0y2px4Cb+EHL+w/
	nk8qAzA1vQ7DP9OUmLUxY8l/QbLwYshdfrcswjfuc8jN5vd7iTDbVxcgxz4n1VS7Es1D
	Bjqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version;
	bh=RD7SE5WBjB8eD5BTCUIWA8YfnSTW1gZ/4EFplEB+2d8=;
	b=DOE1O4EtGvDN+s18l81a9BsoeEWTGUmJfErWr0OSO+l8n3i9kSD1TGOth+q7Yc9z/S
	Fh23ILFzXuUdY/5ILt7sgXZgleH2NPuTnM5kOJxU4iQ76yCVM88dT9n0jRoGpOq7iJmc
	Nmu1wsofcDJuy6cWFa2KExDe0f+2C2cqTxtz5tzzOBOBdm7gwTkBwJrfdNcj4EvgVbrQ
	PmbtpxlvRh+pM3AjKAddinlLUW1FrrimT5W4NO8dbGpl4mXrjesJj9jmINSafk3g7eEX
	q7EZuH14f2LhhK4X7b2L/IaT2K9AtFlkX/FARhBCi5+3t0odz3ZNcUffLfxu9UJeZVov
	6ZVQ==
X-Gm-Message-State: AOPr4FX5Tre0MZdfJfwcdg16lxUi6Hh3Vdr6nG5uqZqWDFAYhA+DODSD+b07xeXulSzqUw==
X-Received: by 10.107.182.138 with SMTP id g132mr60781iof.27.1462236485003;
	Mon, 02 May 2016 17:48:05 -0700 (PDT)
Received: from localhost.localdomain (76-10-180-162.dsl.teksavvy.com.
	[76.10.180.162])
	by smtp.gmail.com with ESMTPSA id u187sm815650iod.3.2016.05.02.17.48.04
	(version=TLS1 cipher=AES128-SHA bits=128/128);
	Mon, 02 May 2016 17:48:04 -0700 (PDT)
From: Christopher Friedt <chrisfriedt@gmail.com>
To: famz@redhat.com,
	mst@redhat.com
Cc: Christopher Friedt <chrisfriedt@gmail.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Date: Mon,  2 May 2016 20:47:58 -0400
Message-Id: <1462236478-61645-3-git-send-email-chrisfriedt@gmail.com>
X-Mailer: git-send-email 2.6.4 (Apple Git-63)
In-Reply-To: <1462236478-61645-1-git-send-email-chrisfriedt@gmail.com>
References: <1462236478-61645-1-git-send-email-chrisfriedt@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------2.6.4 (Apple Git-63)"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4001:c06::242
X-Mailman-Approved-At: Tue, 03 May 2016 02:46:08 -0400
Subject: [Qemu-trivial] [PATCH 2/2] Remove unnecessary CONFIG_EVENTFD
 preprocessor conditional to satisfy link
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
X-List-Received-Date: Tue, 03 May 2016 00:49:16 -0000

This is a multi-part message in MIME format.
--------------2.6.4 (Apple Git-63)
Content-Type: text/plain; charset=UTF-8; format=fixed
Content-Transfer-Encoding: 8bit


The file ivshmem.c unconditionally references event_notifier_init_fd() in util/event_notifier-posix.c, even if CONFIG_EVENTFD is not defined. On platforms where CONFIG_POSIX is defined, but CONFIG_EVENTFD is not defined, that results in an undefined symbol referenced from ivshmem.c and the link fails. That applies to Mac OS X, but possibly other BSD-based distros.

Note: there is nothing specific to eventfd inside and event_notifier_init() also fails unconditionally if CONFIG_EVENTFD is not defined.
Signed-off-by: Christopher Friedt <chrisfriedt@gmail.com>
---
 util/event_notifier-posix.c | 2 --
 1 file changed, 2 deletions(-)


--------------2.6.4 (Apple Git-63)
Content-Type: text/x-patch; name="0002-Remove-unnecessary-CONFIG_EVENTFD-preprocessor-condi.patch"
Content-Transfer-Encoding: 8bit
Content-Disposition: inline; filename="0002-Remove-unnecessary-CONFIG_EVENTFD-preprocessor-condi.patch"

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

--------------2.6.4 (Apple Git-63)--



