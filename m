Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UhgTN-0006xj-6Q
	for mharc-qemu-trivial@gnu.org; Wed, 29 May 2013 09:31:25 -0400
Received: from eggs.gnu.org ([208.118.235.92]:59282)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1UhgTF-0006l0-MF
	for qemu-trivial@nongnu.org; Wed, 29 May 2013 09:31:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1UhgT9-0008ND-9f
	for qemu-trivial@nongnu.org; Wed, 29 May 2013 09:31:17 -0400
Received: from mail-oa0-f52.google.com ([209.85.219.52]:59132)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1UhgT9-0008Mi-5G
	for qemu-trivial@nongnu.org; Wed, 29 May 2013 09:31:11 -0400
Received: by mail-oa0-f52.google.com with SMTP id h1so11287830oag.25
	for <qemu-trivial@nongnu.org>; Wed, 29 May 2013 06:31:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=clcL9yXeCQ0rvV5z4Oa/RaX+6KMsbbaCx93+4HckW9E=;
	b=OgimwXcRoD8iy1oWNo9cktKj/gguTUfbBfmcL3rMeLjd/R0ns4pePKaqm+dDZkWFOR
	s30dfEX3wUKx3GtcBKyTDvmKiUHVhjUHjoI20brLlQnOY7y+1r/IJ5e50oa7F1wvttE6
	nCJJjuw4oJHzrizJpAgq8d1nJIadL+jzVhvKgcCJR8sHksXWBILvVwJFytKkKDbkDWia
	4tGRDpr2a6rvwHbbmwXMNFbZ5o5dVgQgtFpPf8HcVEyFcxKc5FAyP9UE2mct4S9LrZ0U
	JPrmpKl4yFjV3lA/QoUV8aKnGyMxUnNz+BHlGf9mTYALoxZ3qecptn6BobcSRoIkRTNH
	MDcA==
X-Received: by 10.60.134.71 with SMTP id pi7mr1565440oeb.107.1369834269762;
	Wed, 29 May 2013 06:31:09 -0700 (PDT)
Received: from ka1.ozlabs.ibm.com (ibmaus65.lnk.telstra.net. [165.228.126.9])
	by mx.google.com with ESMTPSA id
	b1sm29390039oeo.8.2013.05.29.06.31.05 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 29 May 2013 06:31:08 -0700 (PDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 29 May 2013 23:30:43 +1000
Message-Id: <1369834243-17088-1-git-send-email-aik@ozlabs.ru>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQmZ5H9ZPic6QvAmRNNU2EBpdqSPxkL72uMjCqCW3LaMwY8l489elaU+lvDELXIfT0TKWGcb
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.219.52
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
X-List-Received-Date: Wed, 29 May 2013 13:31:22 -0000

The symlink to "asm" platform linux headers is made in the build tree by
the configure script but gcc is not told to look for them there.

The patch fixes this.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---

Reposting it as a top level patch.

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


