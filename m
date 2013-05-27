Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UgyAo-0007Ta-0Y
	for mharc-qemu-trivial@gnu.org; Mon, 27 May 2013 10:13:18 -0400
Received: from eggs.gnu.org ([208.118.235.92]:53475)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1UgyAl-0007MZ-B3
	for qemu-trivial@nongnu.org; Mon, 27 May 2013 10:13:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1UgyAg-0006eJ-Fw
	for qemu-trivial@nongnu.org; Mon, 27 May 2013 10:13:15 -0400
Received: from mail-pd0-f180.google.com ([209.85.192.180]:61107)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1UgyAg-0006e9-9X
	for qemu-trivial@nongnu.org; Mon, 27 May 2013 10:13:10 -0400
Received: by mail-pd0-f180.google.com with SMTP id 14so4187956pdc.25
	for <qemu-trivial@nongnu.org>; Mon, 27 May 2013 07:13:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=qoT0xSkp+3i7Wx/UZykUQtkm9+L3Wy2bYHhO8dcLmn4=;
	b=I6TwzoMDxQuWKYdkQjPGNtZfGtmkzJMs5Brte9il0HbsyUF10HYFYFGUECEZbIedl0
	pEqO/5Ymw1ckwduho+pUhIyhXcmzz9Xih3W3orlkE6bbcqFhLGPTP1yeJddOmaK7T2aW
	lDIRQYp2tlwoIwWDEDWK+dHQqTujsRMZwxCh/1NSoKAKX4cnLsK4ZHPt/a9SQ6o2y5iL
	LVYaPqH9x7ZTbxjCndJmyvUL6JUBq3/xzGndVTOJT3nEIuYssiEH5faks5ws4NYPAtJL
	L4jBbUPzpqQfG0PpNOv0TAvmf3xab2/SdkWKxx/nhTalP8LExedrd7kBc8doE+Cuqy4T
	rVqw==
X-Received: by 10.68.27.9 with SMTP id p9mr29076248pbg.139.1369663989505;
	Mon, 27 May 2013 07:13:09 -0700 (PDT)
Received: from ka1.ozlabs.ibm.com (ibmaus65.lnk.telstra.net. [165.228.126.9])
	by mx.google.com with ESMTPSA id nt6sm289520pbb.4.2013.05.27.07.13.05
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 27 May 2013 07:13:07 -0700 (PDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 May 2013 00:12:59 +1000
Message-Id: <1369663979-25613-1-git-send-email-aik@ozlabs.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <51A36976.80608@ozlabs.ru>
References: <51A36976.80608@ozlabs.ru>
X-Gm-Message-State: ALoCoQn6hgnHJcY6e6S764sZ3L6u9EG2uAvX6a3kp/jv6Yo0epYVNgOEHmG8RECw/+4zXw8ZwRHe
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.192.180
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-trivial@nongnu.org,
	qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH] qemu: fix out of tree cross compile
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
X-List-Received-Date: Mon, 27 May 2013 14:13:16 -0000

The symlink to platform linux headers is made in the build tree by
the configure script but gcc is not told to look for them there.
The patch fixes this.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 configure |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index 5ae7e4a..5ba691a 100755
--- a/configure
+++ b/configure
@@ -547,7 +547,7 @@ Haiku)
   if [ "$cpu" = "i386" -o "$cpu" = "x86_64" ] ; then
     audio_possible_drivers="$audio_possible_drivers fmod"
   fi
-  QEMU_INCLUDES="-I\$(SRC_PATH)/linux-headers $QEMU_INCLUDES"
+  QEMU_INCLUDES="-I$(pwd)/linux-headers $QEMU_INCLUDES"
 ;;
 esac
 
-- 
1.7.10.4


