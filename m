Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dvQaY-0000Yv-8F
	for mharc-qemu-trivial@gnu.org; Fri, 22 Sep 2017 12:14:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58172)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dvQaW-0000Uk-Co
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 12:14:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dvQaV-0008AH-In
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 12:14:00 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:37503)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dvQaO-00082X-Sm; Fri, 22 Sep 2017 12:13:52 -0400
Received: by mail-qt0-x243.google.com with SMTP id u48so944509qtc.4;
	Fri, 22 Sep 2017 09:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=RkLl7S17NGL7msnpqf/3iNU4fOstQxPKCoVS85Rs/XY=;
	b=T52jHoDhHWxatEuEZedZKpqWrFVkRACnB3BbWbpOENTBWBzEHboBcOjo3aPyhNeTKl
	or8AByoA0VCC5ZZoPOBbfpBvToaiDAdf8UBoEy59MkdThWBcSFAGDPpYhim8fqWnN3gr
	9Xe+OKO4thaRTmQJJFO7iPgmhpcHF7D5Z34HGbxL2WFg5lskOqO867pWYsjm8FX2rms5
	5h9wQPAFuhDFR/nWvxu0m/LmPdaY7iBQycOLSRWmJRK7alVCtE9uybsOVfzIHJmtqP18
	AyRDclSDYymfbF2EK+SZtKgGOTYysAH/Rx9sGy3K+DQoWA7+apjKC4xjNukTuVj/54cp
	KEuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=RkLl7S17NGL7msnpqf/3iNU4fOstQxPKCoVS85Rs/XY=;
	b=LbJm1pRROtDYeAC+fyQadslasLW7F/WTcGqPeXPBvqu86FD8ULb84Cpy8Ueo/HlHS7
	ILj/CWyISwmoqGNHQsXQUVtWwuEqu+6/ot3N7yCt0z/p6FVZReNdviTiRyvRNdVwXkdp
	28bccaA5rw9fl3TiUzq24KsB3/YJleHoqrJ40ZtvsL2XMASdhAGJmqki6rNmu92uAZ3d
	tAppjkFfx0YmcqPr72IX3tJCRs1/8henVs9iS9zhzsjq+2wqhckRYF1eJeiSkp+L9IQ/
	zdmwMv1RSUjyJxRDZpK+iYJxWpVHTiX6anFSwT/iaHQRZ1ELah0XZpgNP0oHbuzWA/tw
	8EhA==
X-Gm-Message-State: AHPjjUhQ3dbsLahMxkCU+bRhqZFYeyvurNTMZT5JLsPRhcBTDVWRuoX7
	V70zyNAMD6tO1QvLc8bZrsI=
X-Google-Smtp-Source: AOwi7QAaYeQlHu3IhYG9+B5RXS/C884ouEI/Q77RIB8GG/w967gcdqgaE96m1GDEMBBlidwg/JQgGQ==
X-Received: by 10.200.15.170 with SMTP id b39mr9713742qtk.52.1506096832293;
	Fri, 22 Sep 2017 09:13:52 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id f6sm119985qtb.68.2017.09.22.09.13.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Sep 2017 09:13:51 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>,
	"Emilio G . Cota" <cota@braap.org>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Fri, 22 Sep 2017 13:13:45 -0300
Message-Id: <20170922161345.331-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-trivial] [PATCH] scripts/orderfile: keep MAINTAINERS at bottom
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
X-List-Received-Date: Fri, 22 Sep 2017 16:14:01 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 scripts/git.orderfile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/git.orderfile b/scripts/git.orderfile
index ac699700b1..34619769c2 100644
--- a/scripts/git.orderfile
+++ b/scripts/git.orderfile
@@ -27,3 +27,4 @@ Makefile*
 # code
 *.c
 
+MAINTAINERS
-- 
2.14.1


