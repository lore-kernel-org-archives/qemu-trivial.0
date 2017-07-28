Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1daxyQ-0005Ic-5a
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 01:38:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48976)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxyK-0005EG-1b
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 01:38:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxyJ-0004kH-8V
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 01:38:00 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:35468)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxyH-0004fk-3c; Fri, 28 Jul 2017 01:37:57 -0400
Received: by mail-qk0-x244.google.com with SMTP id a77so2885521qkb.2;
	Thu, 27 Jul 2017 22:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=N8yIKC8oJNKn7fkvwccZCwnoSkNCDtM6Guuwqvs4FQE=;
	b=LcNXd2oa7ZUJ4WsL9rMCNg3ZT1xCEb1B8E2LqemwhHjFZ+7IsLYcihuGpMgtFWKbl1
	stNzWMkEhDgc+WPLMMUDayMsgj24RGaydQfft1YlPNN4cCgc/tm3cpsOShdhzRjud2rr
	+3u6Sbc8IsgloTOLD4AFqGdLOtXPlfA9Zpz3uH7IFcJ3Lf6amUjx2dfLPMb9ILza9dt8
	tq0C7YYGp2T5GiuhDpWZzKWFmu4Lj5v9asRh4rCtRDmtz8KjsWwSfDpSWOXmxu0HCKx7
	MgKR6QOghcL4VNLUydqEvL2qZCGCLTGCtKwpOE4mCmm44+SHFG5/ukHMSH/40OeiSRAI
	tJNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=N8yIKC8oJNKn7fkvwccZCwnoSkNCDtM6Guuwqvs4FQE=;
	b=sYT6Aq7ChgO8f2zVokiAkNDvH4TjiJbUTFplGV1ubRLVkSExXZlPlfz1sn/pORPYXK
	NdBCCiqbyCfTO3qPqF8S8NGrlnJtMcEZTb0urOGbaJ8w38f7Fg1/N+sPCT0lZ0eoyPJ9
	MA7Eg8QAYJnT/zJixzIjIAKtH1BeAFrYkI4Ui2vozL4xhXN7a8DMNM2xA6I8wsXQ7U46
	154v6EIEQvgxvfYm5hsuXI0K+Err+z+t/NSxZx/E+7ZaO0STp8uvxzIrJZRGfrOdBKcn
	U0q0NyjmgPoeU7lBLsEcaQ+hm4vNAJe7F7lzI8mM+miVSKy8bvMk3WQuIv6ICWP002hU
	uquw==
X-Gm-Message-State: AIVw110aEM4DLy5ytHBjWXgPLbZYmx3oZjFjkpMQDIOwlM1ByJAnQG2I
	WEq0CIljnFtLuMETXmSuYQ==
X-Received: by 10.55.25.41 with SMTP id k41mr9072012qkh.354.1501220276627;
	Thu, 27 Jul 2017 22:37:56 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	h41sm12129560qta.45.2017.07.27.22.37.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Jul 2017 22:37:56 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	Fam Zheng <famz@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-block@nongnu.org
Date: Fri, 28 Jul 2017 02:36:03 -0300
Message-Id: <20170728053610.15770-41-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170728053610.15770-1-f4bug@amsat.org>
References: <20170728053610.15770-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-trivial] [PATCH 40/47] MAINTAINERS: add missing entry for AIO
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
X-List-Received-Date: Fri, 28 Jul 2017 05:38:01 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 83597fca4e..fb6a82c1ad 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1253,6 +1253,7 @@ F: util/aio-*.c
 F: block/io.c
 F: migration/block*
 F: include/block/aio.h
+F: scripts/qemugdb/aio.py
 T: git git://github.com/stefanha/qemu.git block
 
 Block Jobs
-- 
2.13.3


