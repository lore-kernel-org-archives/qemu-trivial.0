Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1daxx9-000483-1G
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 01:36:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47538)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxx6-00045a-HB
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 01:36:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxx3-00037U-SB
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 01:36:44 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:38428)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxx1-00034a-Iz; Fri, 28 Jul 2017 01:36:39 -0400
Received: by mail-qt0-x242.google.com with SMTP id p3so11916334qtg.5;
	Thu, 27 Jul 2017 22:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=+g/2SaVdE51PdGNRtclYuo+Y5qsr3J59Qu/qHLMtjRI=;
	b=WlQWr76+ZJ79DmY03F6rLjKHSbup0uAkHcdbDyoluh3G3JMeoQr52+YhS6C3UYKGhn
	loT3pBS/S8/u5Z8dDv46JVS35XZmv+kd2D7y4O4L4sFkVDI/aGZshAMPnpv3BnvpjLwv
	GOiSoFzw1y+7Fn3ygtAQ1cGCXh4tJBKyDmwbVFV/EJXSLOUCes3Opp8sVMqzcVC3ApqW
	KjwLDvNW6JVkZJMqOXS20JuBt7aJpl7rUBaobUBn/ZtsXg5GxT+ODvu9G3g+8c50et/x
	q6W0dIIKoQcbIBUrOT291uw1sbpvq+6k+V1tRdG5XJGLVt1zo5S9V4gqdDEgmCHuuXOf
	lo6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=+g/2SaVdE51PdGNRtclYuo+Y5qsr3J59Qu/qHLMtjRI=;
	b=TCEe4sAs5CnM2bvTxPzRkHmTQfU6VmgYL/aMevhKZX7jv3aVy0pZ1NEs4lw4DNvWLP
	qx6TPLYYawv7UBfaa1RJMGWOAFeb7nxd4AR8aNz4htv7IjIwP1a+x3UCId9/t1HIMcP1
	PuzjMxcwl2i49+tdiB5JVqOSjJaL/78dW6JdFmky89ytPwlFSRh9rbUHV0CC/NHu10nx
	bPKa5v8wmWoXoIRN5+AhIrkCo0gcKtGKXPZ8KgtFXMKcv1lxa6yBw68tfXMnoPpNe9T2
	k97NVlR6GAaJVvcH1dIo/y+nqWOhq6bX8OleYik4jQw8Ke7UIgBmGUnZzDBuRZawanFU
	S/AA==
X-Gm-Message-State: AIVw1134CDhVuCCbA8G+jw0pQRaA/t/qpA+VFIl7WcKnMxMbqnv87JpU
	jreY4J79qnH07iG7kmUJbA==
X-Received: by 10.200.55.53 with SMTP id o50mr9274037qtb.211.1501220199177;
	Thu, 27 Jul 2017 22:36:39 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	h41sm12129560qta.45.2017.07.27.22.36.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Jul 2017 22:36:38 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Cornelia Huck <cohuck@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Fri, 28 Jul 2017 02:35:30 -0300
Message-Id: <20170728053610.15770-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170728053610.15770-1-f4bug@amsat.org>
References: <20170728053610.15770-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-trivial] [PATCH 07/47] MAINTAINERS: add missing entry for
 vfio/ccw
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
X-List-Received-Date: Fri, 28 Jul 2017 05:36:45 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ddf6f3f6d8..69987b5e5b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1029,6 +1029,7 @@ S: Supported
 F: hw/vfio/ccw.c
 F: hw/s390x/s390-ccw.c
 F: include/hw/s390x/s390-ccw.h
+F: linux-headers/linux/vfio_ccw.h
 T: git git://github.com/cohuck/qemu.git s390-next
 
 vhost
-- 
2.13.3


