Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aOnUG-00046L-V3
	for mharc-qemu-trivial@gnu.org; Thu, 28 Jan 2016 09:23:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56504)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1aOnUE-00040d-AB
	for qemu-trivial@nongnu.org; Thu, 28 Jan 2016 09:23:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1aOnUA-00010d-6v
	for qemu-trivial@nongnu.org; Thu, 28 Jan 2016 09:23:50 -0500
Received: from mail-wm0-x232.google.com ([2a00:1450:400c:c09::232]:35433)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1aOnUA-00010L-12
	for qemu-trivial@nongnu.org; Thu, 28 Jan 2016 09:23:46 -0500
Received: by mail-wm0-x232.google.com with SMTP id r129so27083733wmr.0
	for <qemu-trivial@nongnu.org>; Thu, 28 Jan 2016 06:23:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=TKTyFtctTwNAF3y6/UG/6THM1DGSuld++5e/nNVgzcU=;
	b=ZPX8WpOtTDTvULRZw7akrn+aStfsy7eno83KUVLYH7XlD12hetQsp5FSaLRsycD6lH
	7qFVrhmMewlQPzOyvjq299ZjPsIsm+xWGjuRAhXIybVkVTZdKcF659jjCGElaWlVOxyN
	KYx5dZ51ht0jbCeU0PKzQ91bYN4V8ErZXsD10=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=TKTyFtctTwNAF3y6/UG/6THM1DGSuld++5e/nNVgzcU=;
	b=Q/9CsNnFJzoLpIVYZ2uH6Q0nss7k/E4kVbRcpMOp9SY8ckGY0y1X++Y7rrVlnmjGMJ
	c7+0qMBarM0+c9tgvc5WoWtHoy8J9qxC8ZqYrYHue/PfomsXIGoB9y47a+MUS0P5fz2R
	8jKKUIum4ysKeNCmfuwEpO1UZfC2QhAL8wmpuZb+keWsyak8qi/4MVLzsDWYbAhGVB1s
	3d6mSp2Gbgz0s02VU4hQ2o+s/WjqpvGN57m4xY6XdkrEP59SVrXbyUVYYRmg6CXPDBAb
	emvHmAxwlg3sUcguJ9ATfhYjzaqNK982Q9JQTq40cUSHiHkqdeZFLkYmzjiP/pakd0HO
	lezA==
X-Gm-Message-State: AG10YOS9YJ5pg6gfTttcZGmblxRY49EcIY9dkbYhq0vysHeO/vqIyyumVAlNPtoKyc9s0v/L
X-Received: by 10.194.95.136 with SMTP id dk8mr3658269wjb.96.1453991025431;
	Thu, 28 Jan 2016 06:23:45 -0800 (PST)
Received: from zen.linaro.local ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id
	x189sm3316279wmg.1.2016.01.28.06.23.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 Jan 2016 06:23:41 -0800 (PST)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id E9C763E07D6;
	Thu, 28 Jan 2016 14:23:39 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Date: Thu, 28 Jan 2016 14:23:29 +0000
Message-Id: <1453991009-32736-4-git-send-email-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1453991009-32736-1-git-send-email-alex.bennee@linaro.org>
References: <1453991009-32736-1-git-send-email-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::232
Cc: kwolf@redhat.com, qemu-trivial@nongnu.org, stefanha@redhat.com,
	pbonzini@redhat.com,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	david@gibson.dropbear.id.au
Subject: [Qemu-trivial] [PATCH v3 3/3] .travis.yml: enable each of the
	co-routine backends
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 28 Jan 2016 14:23:51 -0000

We disable "make check" for the gthread backend as it is broken.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .travis.yml | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/.travis.yml b/.travis.yml
index 16be23f..021eec7 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -94,6 +94,10 @@ matrix:
     - env: TARGETS=i386-softmmu,x86_64-softmmu
            EXTRA_CONFIG="--enable-sparse"
       compiler: gcc
+    # Modules
+    - env: TARGETS=i386-softmmu,x86_64-softmmu
+           EXTRA_CONFIG="--enable-modules"
+      compiler: gcc
     # All the trace backends (apart from dtrace)
     - env: TARGETS=i386-softmmu,x86_64-softmmu
            EXTRA_CONFIG="--enable-trace-backends=stderr"
@@ -111,6 +115,15 @@ matrix:
            EXTRA_CONFIG="--enable-trace-backends=ust"
            TEST_CMD=""
       compiler: gcc
+    # All the co-routine backends (apart from windows)
+    # We currently disable "make check"
     - env: TARGETS=i386-softmmu,x86_64-softmmu
-           EXTRA_CONFIG="--enable-modules"
+           EXTRA_CONFIG="--with-coroutine=gthread"
+           TEST_CMD=""
+      compiler: gcc
+    - env: TARGETS=i386-softmmu,x86_64-softmmu
+           EXTRA_CONFIG="--with-coroutine=ucontext"
+      compiler: gcc
+    - env: TARGETS=i386-softmmu,x86_64-softmmu
+           EXTRA_CONFIG="--with-coroutine=sigaltstack"
       compiler: gcc
-- 
2.7.0


