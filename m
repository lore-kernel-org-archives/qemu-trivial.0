Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Uh75k-0000dl-Ei
	for mharc-qemu-trivial@gnu.org; Mon, 27 May 2013 19:44:40 -0400
Received: from eggs.gnu.org ([208.118.235.92]:48843)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1Uh75Y-0000Px-VU
	for qemu-trivial@nongnu.org; Mon, 27 May 2013 19:44:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1Uh75T-00005j-Gr
	for qemu-trivial@nongnu.org; Mon, 27 May 2013 19:44:28 -0400
Received: from mail-pd0-f176.google.com ([209.85.192.176]:50084)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1Uh75T-00005X-AH
	for qemu-trivial@nongnu.org; Mon, 27 May 2013 19:44:23 -0400
Received: by mail-pd0-f176.google.com with SMTP id r11so6935522pdi.21
	for <qemu-trivial@nongnu.org>; Mon, 27 May 2013 16:44:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=5PB8X78Av3Wj2TyOt7xYBuFv/sIrgplHQR759sfWB/k=;
	b=c0xxHeg1Sy1A66BfQ+uRNUI0yxFYgONENXQ+bR5+rVcpKmDXRc09OkpCOJWUnBBWUB
	lcHjBXLRcldI0nxhlbVZW/ae9UY2kQms1BkewF4JAiLz1M5TDWaEcSIbgxKrdP6z4bOC
	Wa9xTdv8z9jBAAO0EWQAeXbg3IupOpiloWFFsGd2iypOX5Jc9fFD3jCi0kcPUF+aDKCZ
	R/IjEtwN1k1/v6XjhnWggVKxMaoF7MuVnAZTNRyMrhfD6u3uHG8epdAEkIi9Ai9SXhTn
	pDQo7Eff/Lfv2BgWE+rEzRYxx5QoX33vV7w/6bvsBTlYPH/coI9B3vVmYsTT+su3L/Gt
	fAGA==
X-Received: by 10.68.136.230 with SMTP id qd6mr18285895pbb.112.1369698262354; 
	Mon, 27 May 2013 16:44:22 -0700 (PDT)
Received: from ka1.ozlabs.ibm.com (ibmaus65.lnk.telstra.net. [165.228.126.9])
	by mx.google.com with ESMTPSA id
	wt5sm30238503pbc.38.2013.05.27.16.44.18 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 27 May 2013 16:44:21 -0700 (PDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 May 2013 09:44:14 +1000
Message-Id: <1369698254-32350-1-git-send-email-aik@ozlabs.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <51A3E556.3020509@ozlabs.ru>
References: <51A3E556.3020509@ozlabs.ru>
X-Gm-Message-State: ALoCoQknqA3EunfdYpVkCQxqdYneKLsVCsrfkyspTmqDA2qZ/XHgqRlQweVmJbcVT39CBwMqThnL
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.192.176
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH v2] qemu: fix out of tree cross compile
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
X-List-Received-Date: Mon, 27 May 2013 23:44:38 -0000

The symlink to "asm" platform linux headers is made in the build tree by
the configure script but gcc is not told to look for them there.

The patch fixes this.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 configure |    1 +
 1 file changed, 1 insertion(+)

diff --git a/configure b/configure
index 5ae7e4a..20b42f0 100755
--- a/configure
+++ b/configure
@@ -548,6 +548,7 @@ Haiku)
     audio_possible_drivers="$audio_possible_drivers fmod"
   fi
   QEMU_INCLUDES="-I\$(SRC_PATH)/linux-headers $QEMU_INCLUDES"
+  QEMU_INCLUDES="-I\$(SRC_PATH)/linux-headers -I$(pwd)/linux-headers $QEMU_INCLUDES"
 ;;
 esac
 
-- 
1.7.10.4


