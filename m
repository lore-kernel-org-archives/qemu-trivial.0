Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1daxxK-0004IL-8d
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 01:36:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47748)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxxH-0004DY-2r
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 01:36:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxxG-0003Ka-64
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 01:36:55 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:35430)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxxB-0003Ep-AH; Fri, 28 Jul 2017 01:36:49 -0400
Received: by mail-qk0-x243.google.com with SMTP id a77so2884389qkb.2;
	Thu, 27 Jul 2017 22:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Auu4Nmguhw7ihYRP5x/rfeGY9PQCrLPJvMSFV+W6SmM=;
	b=hQfP9+ajXY2EgAv/uQdwO2pta6niN1Ixdz9MkiGD0c5LxfaxLYNZwABLPV7LZPBatk
	hQLaaq+peIVSfcOhncB2iqvHjNeHoijpuHzlDqKzP/1jWonGvCeA1cxnZTqGz4WdkHtO
	wcLInELoYVoYTEdo5KjOLA+uqKuegZtaceF6yfY3XO/sTPFOvKTH7LTvlEY0NT6anKXm
	I8+lF4ntVie15BlyIEgiyL3r2L1ggwNh6qFtibhKVgudV9aoUrWqU/TkWw2LggC6yF9B
	YpeBVvApPV9u5KmD3uJ2WKueVEGH1R4fsOCWfcjvEGFbCmLZSjF1ht6cMzVh3CHqJGS8
	e55A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=Auu4Nmguhw7ihYRP5x/rfeGY9PQCrLPJvMSFV+W6SmM=;
	b=rbYjvVPhFCOIIP5c/5PiU6fw+XgPOgQ7dkU5dIAEUC/iAHx/xv/XdHaqN/oWH/a3e9
	U3NoBVYrCFCy2K251vPMo7naUIrFiqkDuLzMOushNs60YmBnIgBhDu+9/bEnaJoLc69j
	G+ONAll0tK7aOoPyWl/6EhrkRodjKX9ZmUum1Io99fh8z0ZM7PyJZyaS+9Ywf0LAsxBa
	90161Sr7JdbPHMYLiNkLUS82Gxr9N7jIampgtJjeY3OM4yzmU9qth7zd30QejyL0mWJp
	rhFNBEbLOOszhGLtpV3YPXC7BgttS3EGQbMP8Oi0VJmRKaU8o9mtwJLBrskqtGhJfkEw
	56lQ==
X-Gm-Message-State: AIVw113Bos8cj/WcCgZujsR5JA6R6Z3gw6dBYN3ZNxV5aXZ4b3ksRTrp
	qYMWhxejqq+JkA==
X-Received: by 10.55.122.68 with SMTP id v65mr8333007qkc.225.1501220208780;
	Thu, 27 Jul 2017 22:36:48 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	h41sm12129560qta.45.2017.07.27.22.36.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Jul 2017 22:36:48 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Cornelia Huck <cohuck@redhat.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Fri, 28 Jul 2017 02:35:34 -0300
Message-Id: <20170728053610.15770-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170728053610.15770-1-f4bug@amsat.org>
References: <20170728053610.15770-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: [Qemu-trivial] [PATCH 11/47] MAINTAINERS: add missing entry for
 virtio/ccw
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
X-List-Received-Date: Fri, 28 Jul 2017 05:36:56 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2958dd2479..bfdb2f8928 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1075,6 +1075,7 @@ M: Cornelia Huck <cohuck@redhat.com>
 M: Christian Borntraeger <borntraeger@de.ibm.com>
 S: Supported
 F: hw/s390x/virtio-ccw.[hc]
+F: include/standard-headers/asm-s390/virtio-ccw.h
 T: git git://github.com/cohuck/qemu.git s390-next
 T: git git://github.com/borntraeger/qemu.git s390-next
 
-- 
2.13.3


