Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dQayc-0001Lo-Un
	for mharc-qemu-trivial@gnu.org; Thu, 29 Jun 2017 11:03:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57861)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dQaya-0001Jq-SU
	for qemu-trivial@nongnu.org; Thu, 29 Jun 2017 11:03:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dQaya-0006dh-5W
	for qemu-trivial@nongnu.org; Thu, 29 Jun 2017 11:03:24 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:36389)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dQayY-0006cH-7r; Thu, 29 Jun 2017 11:03:22 -0400
Received: by mail-qt0-x243.google.com with SMTP id v31so11610083qtb.3;
	Thu, 29 Jun 2017 08:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=qqoJY4ITkVvJvvIP/o5foAjUr4yXXVcCIApmmbvpWvA=;
	b=ipH0dvzqUbMWOpdS5Cxmfy22YFDMqJgoP4/HoQnrX5PJm0Vclahbi6NJh9xNSUcvi2
	SCqV9PcPHuomE/n/djEUR2lIaHS1qY06WbkdHb7A0sRwHFmvKfhqcpayXffTC3ioFi5K
	eddxUab5h0IBTcpS0JC65S7dRGP+PwCwf2aXDT5nckzNCP/PLjAIM1DJdRvjZR0vchRh
	XifkIo4/RdP7u/YlHLBLYuEG+cwcl6JNwT6kJNSfyFwotQ3Jfsh3ig8zVvJX6eMFx5fi
	t0HP/G3J3ViVcqV0/hf4TE+OAhS8RrlfHwa76XJA0rNfOhn/UMBCLyyVaJ4Jvj3kuC2Q
	/LNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=qqoJY4ITkVvJvvIP/o5foAjUr4yXXVcCIApmmbvpWvA=;
	b=hrA/9sa8uFw6bdMc6U6lUKn489OVKUgYimjYXBEF2JdyZlT6GwyThwQs/zotrbcvbT
	0JUovyW4v63VIm2TthJbpAYFnIcgDVBcjJcSrJrPuBYoRvfDpA/YSsnyFOeNVtwe8Hw6
	yurXmG3DVGnhAv0Of7EPEittffUcRi+2oaR+6CqoAwQJzJWaG/EID2ZF4SF/1u0YqW/A
	s3i1kK6rROHlH/TSW7oc+Jz4gQUl+CPydwzH4i0agHgSol6BqGExREae02j0TYPg4woN
	j5+6jMJsW6XUndR6CzLHLJ86NQ1mxxhbqY9WmbwgGNF4AyESHE9v8gXQZXXeN05EXg5n
	uX0g==
X-Gm-Message-State: AKS2vOw9RTkNI0//bZSk3qifyc8KeeHypFfzt9o/qDvMjzcpIqsiMn6E
	ACUdZzMgQC6atN2U4Ap6YA==
X-Received: by 10.200.52.242 with SMTP id x47mr21016729qtb.70.1498748601151;
	Thu, 29 Jun 2017 08:03:21 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id z1sm3873349qkb.37.2017.06.29.08.03.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 29 Jun 2017 08:03:20 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	"Emilio G . Cota" <cota@braap.org>, Stefan Weil <sw@weilnetz.de>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Yang Zhong <yang.zhong@intel.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-trivial@nongnu.org
Date: Thu, 29 Jun 2017 12:03:04 -0300
Message-Id: <20170629150308.22766-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.1
In-Reply-To: <20170629150308.22766-1-f4bug@amsat.org>
References: <20170629150308.22766-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-trivial] [PATCH v2 1/5] MAINTAINERS: update TCG entries
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
X-List-Received-Date: Thu, 29 Jun 2017 15:03:25 -0000

moved in a9ded601..244f1441 to accel/

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 839f7ca063..06006fc7df 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -84,14 +84,10 @@ M: Paolo Bonzini <pbonzini@redhat.com>
 M: Peter Crosthwaite <crosthwaite.peter@gmail.com>
 M: Richard Henderson <rth@twiddle.net>
 S: Maintained
-F: cpu-exec.c
-F: cpu-exec-common.c
 F: cpus.c
-F: cputlb.c
 F: exec.c
 F: softmmu_template.h
-F: translate-all.*
-F: translate-common.c
+F: accel/tcg/
 F: include/exec/cpu*.h
 F: include/exec/exec-all.h
 F: include/exec/helper*.h
-- 
2.13.1


