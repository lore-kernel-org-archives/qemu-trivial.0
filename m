Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1daxyB-000571-MX
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 01:37:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48786)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxy9-00054j-FI
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 01:37:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxy8-0004VQ-PK
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 01:37:49 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:37185)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxy6-0004Rm-I1; Fri, 28 Jul 2017 01:37:46 -0400
Received: by mail-qt0-x244.google.com with SMTP id d10so10619229qtb.4;
	Thu, 27 Jul 2017 22:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=zm9A8JLeELJRW1a1+VgLTBvKrZjuSRmu5o3gHhvc74A=;
	b=OX7/nCz5GLa9I931fB2raVYDyh3blzqHrCQpfWNPB2imH+pqq/PgxcnSjSrWlQFtk5
	BklyouBcS47S4Z7yOSWJXlhvPg0q2mjRyCHdLPaCbL9Etjvi9XwuiUTh3oY+tfy2uxU0
	pS6qRVBwp5BIonz1qhbX3sZVhOmoTN5FtIc2yxINUbF9TcJuhF23bTvKai6lPIXS/5hg
	b7xrGMpE39hqaqgvUqu6W6S42xjZrDDkbMzIXx/FT0hpJI0yBNmWp7d89cwPbmoqGRnr
	xKXuXBvY3BXE16GQ0SG1qGbwi4sT+pBZaAGeqBVGpLCrmddschg3juQd8FOe/ijOQvwK
	gmbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=zm9A8JLeELJRW1a1+VgLTBvKrZjuSRmu5o3gHhvc74A=;
	b=kM63D1wm9gKpTrqXZWa5IxXZ5C4cs8hKEiGmuU4GbmNp0EmpkwZwOIuhQ7lpolej72
	MSkyc1/UBDyC9NgMGFzldw592Pp9oQKv4m0VK9iJgY/QURpIv1IelVb+ShurYDZ0VA5h
	wJpqNqc2vnJXcIsMJ30LT3WQMaWSBqIzhsgC7K2tdZsSoVC3Y8OQmY+MsCbQ5DVJR7yA
	HTKWqpe3w+PcPHjN+Q+7Mbc7XoNFVeoIXm3SGksstxA77eOVOlrhWtgXmeG/bW/5pjiX
	ebkc8U4UXzhrvLOV6dGBMCh7LEZfYx4I+n6wzYXsngq+R7yzyJaxWzz+oec6+PjYry6O
	BBug==
X-Gm-Message-State: AIVw110fw5tAG4WL/FPM2Mb7EDenFIAfrrSEJaT6MJlVv1mHhIvHypWI
	SSZNuS48OAHOwA==
X-Received: by 10.200.54.139 with SMTP id a11mr9579668qtc.318.1501220266119;
	Thu, 27 Jul 2017 22:37:46 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	h41sm12129560qta.45.2017.07.27.22.37.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Jul 2017 22:37:45 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Hannes Reinecke <hare@suse.de>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-block@nongnu.org
Date: Fri, 28 Jul 2017 02:35:59 -0300
Message-Id: <20170728053610.15770-37-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170728053610.15770-1-f4bug@amsat.org>
References: <20170728053610.15770-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-trivial] [PATCH 36/47] MAINTAINERS: add missing entry test
 for megasas
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
X-List-Received-Date: Fri, 28 Jul 2017 05:37:50 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b9a132d964..7649d57e0f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1144,6 +1144,7 @@ L: qemu-block@nongnu.org
 S: Supported
 F: hw/scsi/megasas.c
 F: hw/scsi/mfi.h
+F: tests/megasas-test.c
 
 Network packet abstractions
 M: Dmitry Fleytman <dmitry@daynix.com>
-- 
2.13.3


