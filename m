Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gKi1z-0006WI-Pd
	for mharc-qemu-trivial@gnu.org; Thu, 08 Nov 2018 05:59:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51988)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1gKi1x-0006Vr-IQ
	for qemu-trivial@nongnu.org; Thu, 08 Nov 2018 05:59:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1gKi1t-0003EX-Ev
	for qemu-trivial@nongnu.org; Thu, 08 Nov 2018 05:59:20 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:45026)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
	id 1gKi1t-0003Dk-6f
	for qemu-trivial@nongnu.org; Thu, 08 Nov 2018 05:59:17 -0500
Received: by mail-wr1-x442.google.com with SMTP id j17-v6so15616436wrq.11
	for <qemu-trivial@nongnu.org>; Thu, 08 Nov 2018 02:59:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=vkt28YUk2b8VXkuvPjG4t57qv2BficVRMJGaBsWH6Vo=;
	b=LBqRnontum9mURNVGdWI7nL8/lezsV9/Uykrhe26LKKG8R9zsoKRwG7997Pztn96Lo
	q2TOxK4nIOxVQDqK4FnsE/Ct4ND9AbbC5F3Jb1Cxg641XtohVLTnl65jy9gbDDYMf2xZ
	8YEGOSoxWkuihrsZMFWmO4JcfTRnVdCO0JMmc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=vkt28YUk2b8VXkuvPjG4t57qv2BficVRMJGaBsWH6Vo=;
	b=atZEouC3OeIxpDXg6xJY+iVTY6kwqg5Rd8hrdxa2QVYepBrvGi00aWAKx/+FT0fLab
	wuyEVubL630NhuUtm6j0aSwF9U9UkOoFUpUVnEJkq4E6MS7GPiyoA9KDgjevYJSMZVNa
	AIcW131/Yy8/Anf1E+gxmas4y1hABLafNA/GX9vR09JnDLicWEGIPoku421VhHOGT9ow
	q885Bjw71+UbZXQCJF8C56gO/sg7Nw5YGzDnX+7/ZcS3zi+5jbgEABtXs22t26nSmWEI
	oirQyzNQ/79ELE4JFTTD4bLE82xraLHdBDlZd2yVWPnxQ+moNBbnQmn3JjHV63ztDBGF
	DhMA==
X-Gm-Message-State: AGRZ1gLQeDhwiADbPlh7UvOdR0/sAuVxKgSq6QEztA75NmKXFmUX/Tka
	mejAVyEecvMfvG6utO8yKevYtw==
X-Google-Smtp-Source: AJdET5c4lH3ZUZCv2+HWb46ldICLUKZPAH+zMVB6cfXnP3+w7baWkIkS6q2OobUu0NhefvIY1DfXqQ==
X-Received: by 2002:adf:9dd1:: with SMTP id
	q17-v6mr3585127wre.12.1541674754989; 
	Thu, 08 Nov 2018 02:59:14 -0800 (PST)
Received: from zen.linaro.local ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id
	y2-v6sm7774663wrh.53.2018.11.08.02.59.14
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 08 Nov 2018 02:59:14 -0800 (PST)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id B7D083E009E;
	Thu,  8 Nov 2018 10:59:13 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-trivial@nongnu.org, Riku Voipio <riku.voipio@iki.fi>,
	Laurent Vivier <laurent@vivier.eu>
Date: Thu,  8 Nov 2018 10:59:04 +0000
Message-Id: <20181108105904.27980-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::442
Subject: [Qemu-trivial] [PATCH] linux-users/syscall: make do_ioctl_rt safer
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
X-List-Received-Date: Thu, 08 Nov 2018 10:59:22 -0000

host_rt_dev_ptr is set while looping through a control structure. The
compiler can not know that all structures passed to do_ioctl_rt will
trigger the if clause so rightly complains with an --enable-sanitizers
build. To keep the compiler happy we default the host_rt_dev_ptr and
check it has been set before attempting to follow it.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
CC: qemu-trivial@nongnu.org
---
 linux-user/syscall.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 810a58b704..3a942f1f4a 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -4669,7 +4669,7 @@ static abi_long do_ioctl_rt(const IOCTLEntry *ie, uint8_t *buf_temp,
     int target_size;
     void *argptr;
     abi_ulong *target_rt_dev_ptr;
-    unsigned long *host_rt_dev_ptr;
+    unsigned long *host_rt_dev_ptr = NULL;
     abi_long ret;
     int i;
 
@@ -4715,7 +4715,7 @@ static abi_long do_ioctl_rt(const IOCTLEntry *ie, uint8_t *buf_temp,
     unlock_user(argptr, arg, 0);
 
     ret = get_errno(safe_ioctl(fd, ie->host_cmd, buf_temp));
-    if (*host_rt_dev_ptr != 0) {
+    if (host_rt_dev_ptr && *host_rt_dev_ptr != 0) {
         unlock_user((void *)*host_rt_dev_ptr,
                     *target_rt_dev_ptr, 0);
     }
-- 
2.17.1


