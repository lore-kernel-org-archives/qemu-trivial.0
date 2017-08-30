Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dnAxu-0005Ue-D5
	for mharc-qemu-trivial@gnu.org; Wed, 30 Aug 2017 17:56:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48869)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dnAxs-0005S0-6j
	for qemu-trivial@nongnu.org; Wed, 30 Aug 2017 17:56:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dnAxp-0007fR-GL
	for qemu-trivial@nongnu.org; Wed, 30 Aug 2017 17:56:00 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:37186)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dnAxn-0007cr-L2; Wed, 30 Aug 2017 17:55:55 -0400
Received: by mail-qt0-x241.google.com with SMTP id g13so6271413qta.4;
	Wed, 30 Aug 2017 14:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=21dR6PTVMmbSvgk5dP82bsp9CRMRgJhpko/iti8+ge8=;
	b=QRHTd1GiQ4BDDvVaYFsssKXZYsdOEj8StyC3XN0HvLQmRNmKbgsYQOBGJiZlW+Fu+I
	d0kiLFMKa1UcWcOvQoR6BNxJdvcphbOmY/21clDOLTcesCP+TJekhpuxx8Wq2H1bRbeN
	r+Egm50qnjqE947YHAd2/fd9Wg6lKw4b6ILHASnRtRBPRAvcFNB4sQjpkar7oL3Kr7sD
	rBOXxRVZ0ADgZVzkXVg6XAzvReo9rEeshvMAguOeSE5MIojYKNOa5Rm92YENQbP9EOHp
	OsixT+tPu/4f/CMqaaT2WPYgU3vIIVHa3CD1mWibIWfLeTDI58GYufWM1+Ld33Sdq+5y
	bx8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=21dR6PTVMmbSvgk5dP82bsp9CRMRgJhpko/iti8+ge8=;
	b=RhWR9e1eg/JWevo/0wIkVaTv1AkaIyH8dErpKEZa+qCV+kjaOo9E+kKVD1OBuIyJkZ
	QyxOReKQgs9onMFqcrg88jRAEAmin6GCoSXo0CkZ34jYiRYULoT8YGkLUKtYhVy1CU8k
	6/tzoq3sjnDb/Gzjkh4OEJrn7uMX5bl8akQ5wcP3j61LNBcWXKfmG4LoflKhpfjWrUBU
	cZxeJ8zWcwNnX/kpWC9KdKLo1oBf8UTRBaniWhvOSl5Bxn7o3bJ/INTyVnrB89SF16bC
	8FvSGG2XMdU0NMbNp4Y8NtR9UvVU8cyia9j/2lJandNy84Wmh+G10Csh72lAYwsswOrp
	d/iQ==
X-Gm-Message-State: AHYfb5jK5CrX5NW7osZ+auVDL/wmaTkswM1GHR39zTKfYwUOJ1fRjq/s
	bg74WgSrq7Hz+A==
X-Received: by 10.200.27.61 with SMTP id y58mr4138028qtj.192.1504130155078;
	Wed, 30 Aug 2017 14:55:55 -0700 (PDT)
Received: from yoga.offpageads.com ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id
	w131sm4298690qkb.85.2017.08.30.14.55.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Aug 2017 14:55:54 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Michael Roth <mdroth@linux.vnet.ibm.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Wed, 30 Aug 2017 18:55:12 -0300
Message-Id: <20170830215523.25278-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170830215523.25278-1-f4bug@amsat.org>
References: <20170830215523.25278-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-trivial] [PATCH v2 06/17] MAINTAINERS: add missing Guest
 Agent entries
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
X-List-Received-Date: Wed, 30 Aug 2017 21:56:01 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index aa185c1edd..f4e07173c8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1434,6 +1434,10 @@ QEMU Guest Agent
 M: Michael Roth <mdroth@linux.vnet.ibm.com>
 S: Maintained
 F: qga/
+F: qemu-ga.texi
+F: scripts/qemu-guest-agent/
+F: tests/test-qga.c
+F: docs/interop/qemu-ga-ref.texi
 T: git git://github.com/mdroth/qemu.git qga
 
 QOM
-- 
2.14.1


