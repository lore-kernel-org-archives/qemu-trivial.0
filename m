Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1daxy0-0004wQ-Oj
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 01:37:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48602)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxxy-0004u9-GE
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 01:37:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxxv-0004CS-6H
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 01:37:38 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:35826)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxxs-00049C-J3; Fri, 28 Jul 2017 01:37:32 -0400
Received: by mail-qt0-x243.google.com with SMTP id t37so8845562qtg.2;
	Thu, 27 Jul 2017 22:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=EtPaTMCIFmG8GN224uGNMDxBI9vDxnU/FfBNQXe9PDU=;
	b=KncJuYyecpXbphHFC4ss786YQlDixDxmBOB2Aqo47Br9+iKn5ocF/2S7300Xi8uDU2
	3rwjWoG/JSdDMllL0Z4XIMXe1N5PitJIieeHoCtY0tbh26yK7IVHoa+trUZjw75/cik/
	/Hl+1ZbRl7S9K+tJhyHcaIdzLb3a0HG23rqy23oNZ+pXOemMnOJaXgO8OuoLrpQXjwUj
	WCzbYYY5Z1vQMwbLVpYvcpmDjzX+1wgux0fPzFXmnAExRBgKEjx0BtYyIiHD6OoaG2Ke
	xxbgcjDfnnjb6X+WWCbEZ9EmcBjI54390uby8ALMMHovrzreOwymcHYnzttL4NVo6/bs
	gBYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=EtPaTMCIFmG8GN224uGNMDxBI9vDxnU/FfBNQXe9PDU=;
	b=qPRUkOx+pwbhWwRBLfsVTgRmIdxYvtG4D3uPrYrrEUUIOJq3uWjbrpOawCkJ91UkAX
	QpjDLbZtpEww7K14YJzLBZ75I99wxT+B2yw7Zcbvj/hj8dPuA01xAqTGjMvYKLs0ec7n
	sJbrvYnzbbR1IvIaJE7v9UWmXBQAUZDzUyOIVMhx734gCcwTGfA7wu3uuMThyNI1cMx1
	kTGz2aC14N2lnIfmg3R1EkR5rcAsD2SmKL2RLC6ek3SV1LqTv9QAcWWKxfMt9eEZMDXK
	SCrVVEye/beeq0fSP/DDf0fs+gEsa2XtsyYwG+YCU+QE9PV6IPYl1FLUW8OhQbSa4Kky
	Uhew==
X-Gm-Message-State: AIVw110batVxgUlZOpKOqbPu4XJZ3RWaR2cfEny9taTq2CycHkALsd3T
	fHkGPNFDc/Sj+Q==
X-Received: by 10.200.47.193 with SMTP id m1mr9389062qta.331.1501220252185;
	Thu, 27 Jul 2017 22:37:32 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	h41sm12129560qta.45.2017.07.27.22.37.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Jul 2017 22:37:31 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Artyom Tarasenko <atar4qemu@gmail.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Fri, 28 Jul 2017 02:35:53 -0300
Message-Id: <20170728053610.15770-31-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170728053610.15770-1-f4bug@amsat.org>
References: <20170728053610.15770-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-trivial] [PATCH 30/47] MAINTAINERS: add missing SPARC entry
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
X-List-Received-Date: Fri, 28 Jul 2017 05:37:39 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index bb1cb1fc1c..e363a18631 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -245,6 +245,7 @@ F: target/sparc/
 F: hw/sparc/
 F: hw/sparc64/
 F: disas/sparc.c
+F: default-configs/sparc*-softmmu.mak
 
 UniCore32
 M: Guan Xuetao <gxt@mprc.pku.edu.cn>
-- 
2.13.3


