Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dqNE8-0007E3-9b
	for mharc-qemu-trivial@gnu.org; Fri, 08 Sep 2017 13:38:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38954)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dqNE5-0007AH-7r
	for qemu-trivial@nongnu.org; Fri, 08 Sep 2017 13:37:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dqNE3-0007Pf-Cy
	for qemu-trivial@nongnu.org; Fri, 08 Sep 2017 13:37:57 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:33281)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dqNE3-0007PQ-9M; Fri, 08 Sep 2017 13:37:55 -0400
Received: by mail-qt0-x244.google.com with SMTP id h15so1961009qta.0;
	Fri, 08 Sep 2017 10:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:mime-version:content-transfer-encoding;
	bh=Wn4g3yXbYuh1WmMbLHAouYPjz8Pm1O+zlPZO/QVLSZw=;
	b=pIEV0DoLOFNimcOo4fKK8BQ7I1I90AKGo7UiuPbLsdxJPkYFQTVmKhXBTUdV/6gEo+
	tSVbBsH85ee+ublca1fp+HNaYCamoRkbjW95FBZzONiH2SQcH0v+ipz+pGyWHtM9j7fP
	sUgjm9XFmxmJmVxLAfBK9SZO/8OyKH6aBKUzmxI3MDwRzG5DnOSdPh5NLhF3UmMUQ8NI
	rSsTSSB8I6Ff6H18Z9fTG8Ez6/HKWH0S+4qWJ3uQDntFpmtYCsMNThcnZ6bi61svpfXq
	cwvQzVpx+aQwKayHl3rORqj9EfxBBKgonNI7mBRvLHubE1OUURaSEbp4Z920ateN/1NI
	hkEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:in-reply-to:mime-version
	:content-transfer-encoding;
	bh=Wn4g3yXbYuh1WmMbLHAouYPjz8Pm1O+zlPZO/QVLSZw=;
	b=KXpRnZiWp7aKf4JrST09Ymgp07nXPRx1FccY4K866G7ENafR5WleNb9O9fSr5CAFGU
	V0COPtHGzxfUClUkIaDyhFbp4dAk+0vbriPZ4QDTvVQjpqbyWQtpzqmvaUMggJ16PGFN
	xEr0L/hMlF2+b6nWvCq1xdZx7A6uuCFtMgYnSZEB39S8AkZImuj9c/EPn9VONBhOwxa3
	WKmEyyumcFP7oco9DGvU42GuwVhqHIw1GuAW2FjOZYnkxgx0bXkON8+BkjuQ1NAn9FAA
	Tf5Gfl6qjuhUcEpLlUV7VgxqWroJL+dd6BP/bq6NzI2S3ttk6j4mCvqw/59kSDBlUH/S
	fJnw==
X-Gm-Message-State: AHPjjUj+p/nzamW/ToDws/5e2r90jCzEv3ttJZ+8vX3xqNmW+3FFYYir
	SEAjllP11Dv30aVrSds0qg==
X-Google-Smtp-Source: AOwi7QBHnlZwk2UVDHYI72T7GR4vi0dUU8mXH5JIard/+eQymmZlyuh0ap+FxXzXdd5udn7oUCpyVQ==
X-Received: by 10.200.47.238 with SMTP id m43mr90714qta.251.1504892274541;
	Fri, 08 Sep 2017 10:37:54 -0700 (PDT)
Received: from yoga.offpageads.com ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id f4sm1605859qtg.35.2017.09.08.10.37.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Sep 2017 10:37:53 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel@redhat.com>
Date: Fri,  8 Sep 2017 14:36:25 -0300
Message-Id: <20170908173632.6711-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170908173632.6711-1-f4bug@amsat.org>
References: <20170908173632.6711-1-f4bug@amsat.org>
In-Reply-To: <20170908173146.6446-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-trivial] [PATCH v3 08/15] MAINTAINERS: add missing PCI entries
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
X-List-Received-Date: Fri, 08 Sep 2017 17:37:58 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Marcel Apfelbaum <marcel@redhat.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 04cc35cc3a..69ad3aac29 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -928,6 +928,8 @@ F: include/hw/pci/*
 F: hw/misc/pci-testdev.c
 F: hw/pci/*
 F: hw/pci-bridge/*
+F: docs/pci*
+F: docs/specs/*pci*
 
 ACPI/SMBIOS
 M: Michael S. Tsirkin <mst@redhat.com>
-- 
2.14.1


