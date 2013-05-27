Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Uh7Az-0002Th-Hl
	for mharc-qemu-trivial@gnu.org; Mon, 27 May 2013 19:50:05 -0400
Received: from eggs.gnu.org ([208.118.235.92]:49699)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1Uh7Ar-0002O4-Rn
	for qemu-trivial@nongnu.org; Mon, 27 May 2013 19:50:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1Uh7Am-0001Oc-61
	for qemu-trivial@nongnu.org; Mon, 27 May 2013 19:49:57 -0400
Received: from mail-pd0-f172.google.com ([209.85.192.172]:64910)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1Uh7Al-0001OK-Vu
	for qemu-trivial@nongnu.org; Mon, 27 May 2013 19:49:52 -0400
Received: by mail-pd0-f172.google.com with SMTP id 10so6987097pdi.31
	for <qemu-trivial@nongnu.org>; Mon, 27 May 2013 16:49:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=CWKmIUsm2PNWC9FmdHm+Cem8SeePZxjjVTsBYw78o3E=;
	b=k3DcEsCJ7eWlXwYcqiZ3WB8x8wdcFG9C5LNrTIVGzQF2dkGebj7TA7cJKyX6nljXI+
	tF3OUE361BvqBCg/sDBfX/MHLJP0DMvihoPV+EYXJSmfCUZNEBuJK9MG7cFetEINqzHT
	qlyC3uVp9aqUK3AKcS4UXfC5AT0/BQ4u4CZvBoVJYVDw0GaSNStijj5NltDzbIotZbWC
	z7LO3i7ee6Z9/bpdYhJ6R3d9RR44VvKLixQeRIcnC0gYaZFBZx5oxAikzv4CAv4Q642D
	n2BJ28xEZpNOnUWl3HOfNCZMDUBT7fal441+1yWROOmQnJu8VBvPC91tDh4t2L8oB24F
	MMpQ==
X-Received: by 10.68.180.132 with SMTP id do4mr31401821pbc.96.1369698590904;
	Mon, 27 May 2013 16:49:50 -0700 (PDT)
Received: from ka1.ozlabs.ibm.com (ibmaus65.lnk.telstra.net. [165.228.126.9])
	by mx.google.com with ESMTPSA id
	xl10sm32425282pac.15.2013.05.27.16.49.47 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 27 May 2013 16:49:49 -0700 (PDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 May 2013 09:49:43 +1000
Message-Id: <1369698583-32533-1-git-send-email-aik@ozlabs.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1369698254-32350-1-git-send-email-aik@ozlabs.ru>
References: <1369698254-32350-1-git-send-email-aik@ozlabs.ru>
X-Gm-Message-State: ALoCoQm2fVCzA5C/94H1hxPR3/M6Yc1pOU546bjjFfktawMGafSwsg2fQn+aL/5+aXunZhJNoqlc
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.192.172
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH v3] qemu: fix out of tree cross compile
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
X-List-Received-Date: Mon, 27 May 2013 23:50:04 -0000

The symlink to "asm" platform linux headers is made in the build tree by
the configure script but gcc is not told to look for them there.

The patch fixes this.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---

The previous patch did not remove the old line adding includes. Early morning,
lack of focus :)

---
 configure |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index 5ae7e4a..eca2a20 100755
--- a/configure
+++ b/configure
@@ -547,7 +547,7 @@ Haiku)
   if [ "$cpu" = "i386" -o "$cpu" = "x86_64" ] ; then
     audio_possible_drivers="$audio_possible_drivers fmod"
   fi
-  QEMU_INCLUDES="-I\$(SRC_PATH)/linux-headers $QEMU_INCLUDES"
+  QEMU_INCLUDES="-I\$(SRC_PATH)/linux-headers -I$(pwd)/linux-headers $QEMU_INCLUDES"
 ;;
 esac
 
-- 
1.7.10.4


