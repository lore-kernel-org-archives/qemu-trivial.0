Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dqNE4-00079n-UV
	for mharc-qemu-trivial@gnu.org; Fri, 08 Sep 2017 13:37:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38864)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dqNDw-00074b-Cn
	for qemu-trivial@nongnu.org; Fri, 08 Sep 2017 13:37:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dqNDv-0007JJ-DO
	for qemu-trivial@nongnu.org; Fri, 08 Sep 2017 13:37:48 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:35107)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dqNDv-0007JD-96; Fri, 08 Sep 2017 13:37:47 -0400
Received: by mail-qt0-x242.google.com with SMTP id p55so1950665qtc.2;
	Fri, 08 Sep 2017 10:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:mime-version:content-transfer-encoding;
	bh=8D1Ut1nzCt0X43P0Qq2YAuQ3+LMdrdOIiYdaPg081Uw=;
	b=hCSCF642MtqSKFH2g4uurjny2zj2SS9GLp+2ZcjDbY66Nz71EY9J2rqKfUnIQyyQCI
	vHkWjNytMwdSmROO4SPj4MnkSQy3t2AOk1KtzVdewKxVMQTeyUy4sTFntSmWjrzOQama
	lLHJhuD0JxQHnM6Ll2qzqpQv9DmN3m0R1RFC7/80gHz7zUiHhoA+QacQi/E8JF1piF7M
	lu8qxMX25uX22h2kwB+R7CyoY11hqqTCQSQzrPmtMP0C0OomHZTD9p0xCcTWy1QNqQ69
	/m/Ak0btErUNkqfMDcvA1ofQkXSC+Ypb+sHpt5dhs+Mm/XxGuImy9nLBQOzp5Ga59z/v
	IluQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:in-reply-to:mime-version
	:content-transfer-encoding;
	bh=8D1Ut1nzCt0X43P0Qq2YAuQ3+LMdrdOIiYdaPg081Uw=;
	b=d7oiPT7aLYtdh6yDSxyRDOdj7jlLOJDTm/7Cczzq6WhLofYnQXjxin5wXgWS9Plg+j
	Mhty7OBKNIVUJdJ7rMs60oT+ypW9cIbv907SDdYOILmq6eLQDuWQVkmidcvXoVnaFzPM
	qKek643yJNM3UMGCti5Qq+oTjaTrxo3BI4zjkscXWL4oFwpEQrTXVP/8WR2lM9zDxOZj
	AmI6H6Vd6JhFYDXOpeNmaQhrxEMqnv6bv0x+EMAiMIz9qo1i/Gr086yngZOWmjk5AtaG
	d7Sbk866n8aY0ndsXqlYS+RKc/vpPSjZIGa+l7Osdac7q2NHzAA4F+5UdxODRKHYZRBk
	RAUA==
X-Gm-Message-State: AHPjjUheOWaVTL70nH7pJL3ZLTjm/jmlyG2rjCMpMGXCQ5fvD4T3dYQG
	NZNgz2nt7aInmxiB4uADjQ==
X-Google-Smtp-Source: AOwi7QAnoV+G00NCOlwUHdUaKc9I+bbTugHQMzkdimT+LQX24ne4CqO7KLULyhYsMNtLA83SHejRPg==
X-Received: by 10.237.41.71 with SMTP id s65mr5500323qtd.128.1504892266575;
	Fri, 08 Sep 2017 10:37:46 -0700 (PDT)
Received: from yoga.offpageads.com ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id f4sm1605859qtg.35.2017.09.08.10.37.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Sep 2017 10:37:45 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	Michael Roth <mdroth@linux.vnet.ibm.com>
Date: Fri,  8 Sep 2017 14:36:22 -0300
Message-Id: <20170908173632.6711-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170908173632.6711-1-f4bug@amsat.org>
References: <20170908173632.6711-1-f4bug@amsat.org>
In-Reply-To: <20170908173146.6446-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-trivial] [PATCH v3 05/15] MAINTAINERS: add missing Guest
 Agent entries
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
X-List-Received-Date: Fri, 08 Sep 2017 17:37:54 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Michael Roth <mdroth@linux.vnet.ibm.com>
---
 MAINTAINERS | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e0e5a8dc3f..fa1620d8a8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1440,6 +1440,10 @@ QEMU Guest Agent
 M: Michael Roth <mdroth@linux.vnet.ibm.com>
 S: Maintained
 F: qga/
+F: qemu-ga.texi
+F: scripts/qemu-guest-agent/
+F: tests/test-qga.c
+F: docs/interop/qemu-ga-ref.texi
 T: git git://github.com/mdroth/qemu.git qga
 
 QOM
-- 
2.14.1


