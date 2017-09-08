Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dqNDw-00074w-OA
	for mharc-qemu-trivial@gnu.org; Fri, 08 Sep 2017 13:37:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38827)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dqNDu-00073N-IY
	for qemu-trivial@nongnu.org; Fri, 08 Sep 2017 13:37:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dqNDt-0007H8-2H
	for qemu-trivial@nongnu.org; Fri, 08 Sep 2017 13:37:46 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:35879)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dqNDs-0007Gv-Te; Fri, 08 Sep 2017 13:37:44 -0400
Received: by mail-qt0-x241.google.com with SMTP id 7so1945247qtz.3;
	Fri, 08 Sep 2017 10:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:mime-version:content-transfer-encoding;
	bh=8d/h6ox3fwXsaiwPJvMLELXkfpEBXxiv8myDkWqiuXc=;
	b=kUDB3bOtQNOyMdkoUqHqe89pypj6jdfdAcBQ0lcfZpaRr0fM5HgD0ETJGw6dMyMj5Z
	epDM1ELg+Dha7WxmuGoFM+NVfdJUl+/IWcHEsftR1nLJ5WS0rXE5MX2iZaxjeP+00Jam
	OqqZozc2jxmWyC2+m4CZx01UNJlpKf6jlBsm+qWnfErnjkbtgsqV624r1IEwh30lVCaV
	ZtCipuz+QNzAhn7dIvSAkNlqoPaqvvpAdj6EDoh8ntgzWDVqdD2ab3g7r+BT4PcXW3I2
	1wDZKeXSZpTtCrhVTDsvFXXiRiWgAKRKxuhtroijDYckhVGKqVA2pBZmb3CqINBKwwNb
	QSJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:in-reply-to:mime-version
	:content-transfer-encoding;
	bh=8d/h6ox3fwXsaiwPJvMLELXkfpEBXxiv8myDkWqiuXc=;
	b=dIQZLDWMVCCzPFksQrQ4PM8pBjHMg1AAASAa2OFvHqDxVH6YDsrxf63Ezt/sIzEfDq
	6bCkI5LfO2u3S5MRCshOTiPxJXZTEvP7/rH+TlG3gflI5jw33pbkqBHpUl7j7fIEAqBd
	7JIkILm/9kCDgUEdLDn5arhLwlUOY83x+OJ2wwEZl/x3v53srCLH8rJ8koVe8VBhQFSz
	B3bwAnbs9L9Q4IU7uaRr4K1C7OAv8V54Rar+LHqNTDoXYwNX0e7N2n6TMnIrIVWLvMIw
	jtj9SVVrH8V76AcnUDRP4atTSarsJmUzLBx5G2FMZ9JwmjnS8rNOD3ODmFJNzVpWWU8r
	X4fw==
X-Gm-Message-State: AHPjjUhjoiMWOHnZZBmXxQoPHCHeCUv0oWTuWFnVEBCKw9Ou7fgnix1r
	jrg7u1SzkZ+FTLdzgpPBFw==
X-Google-Smtp-Source: AOwi7QBrNWk0GOhNldWwlw2WdBKeX5yZUZt7glWl/wOeFiYYnfd/8Qq08/jAx0EKfLBGPAF0t5wqZg==
X-Received: by 10.237.53.23 with SMTP id a23mr5561007qte.125.1504892264139;
	Fri, 08 Sep 2017 10:37:44 -0700 (PDT)
Received: from yoga.offpageads.com ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id f4sm1605859qtg.35.2017.09.08.10.37.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Sep 2017 10:37:43 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	Dmitry Fleytman <dmitry@daynix.com>, Thomas Huth <thuth@redhat.com>
Date: Fri,  8 Sep 2017 14:36:21 -0300
Message-Id: <20170908173632.6711-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170908173632.6711-1-f4bug@amsat.org>
References: <20170908173632.6711-1-f4bug@amsat.org>
In-Reply-To: <20170908173146.6446-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-trivial] [PATCH v3 04/15] MAINTAINERS: add missing VMWare
 entry
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
X-List-Received-Date: Fri, 08 Sep 2017 17:37:48 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Dmitry Fleytman <dmitry@daynix.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index afc0072a17..e0e5a8dc3f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1126,6 +1126,7 @@ M: Dmitry Fleytman <dmitry@daynix.com>
 S: Maintained
 F: hw/net/vmxnet*
 F: hw/scsi/vmw_pvscsi*
+F: tests/vmxnet3-test.c
 
 Rocker
 M: Jiri Pirko <jiri@resnulli.us>
-- 
2.14.1


