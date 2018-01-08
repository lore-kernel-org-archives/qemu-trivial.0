Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eYcFX-0005n2-Iz
	for mharc-qemu-trivial@gnu.org; Mon, 08 Jan 2018 13:34:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36923)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYcFV-0005lV-98
	for qemu-trivial@nongnu.org; Mon, 08 Jan 2018 13:34:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYcFS-0000dF-7F
	for qemu-trivial@nongnu.org; Mon, 08 Jan 2018 13:34:17 -0500
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:45018)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYcFS-0000d1-3L; Mon, 08 Jan 2018 13:34:14 -0500
Received: by mail-qk0-x244.google.com with SMTP id v188so15352871qkh.11;
	Mon, 08 Jan 2018 10:34:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=RzZCVkqH1yeqRjZA3dcB4I0Cv7PJCA9gDwaT2CRaob0=;
	b=AckZM/dHKQA2+YtOKG6ETcp1wxCKJzvvoQeQufZ9ajduUMyEXLCSwM0KW7KUTc+jh9
	8OzCw7+IH6mF3T+LEmHcEHqvSS5TjHHev2OYKYYZInV3rDboCqyU81YePBSWOSPl9K8l
	TGOBwtLcQy0sEilKb1lNlnSFfKMVMUQBMZyrCKwYxcyHZSHw6D78qmNy8SigIjwJs6t4
	5GDkrLJfbacoP9WoD8aRRdd6F8dAL/kt1az6xJ6+e7pA0agHo/Dar8c2TmzwkA8FqMK+
	jvZorIjTzaWqtVmpeQjtpTnyHRwJbXU50T1+qGf2HDdrJxXjVIffKaeKxj/as/zg6ZLD
	JBYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=RzZCVkqH1yeqRjZA3dcB4I0Cv7PJCA9gDwaT2CRaob0=;
	b=XkSWtgEXDL1ZuxJD4w4ofiL/GNfD8jIzWIekdEVcODKueFKvtuVF2zLFvNS9/sQZ5I
	RDnop+O4BlnpvbXyKdtLYMYfZKvIDNa75pp1st7xKr9YHNmHpYEIBL5srlE2iBsWEla/
	8Mi2uVRczB8PcObyUwEMpiKEtHfTaVm5OUjneyHvSBAEgLw4O5DRD2Wk90CDOfy/Pq5S
	10mk9DM+8hmzTDIAm6PFlpnK3DN+2kFBXehByuZsc4nJpnAGCmP5GL3Et0J4PW1w8p1P
	PpzMun4NU+P+nXzNUASk9oJmuv4dta4gPbctFCzUz+S1fm3ovA5ZFCeQiqJ5bNbQ16re
	hARg==
X-Gm-Message-State: AKwxytdjdJwvdBRdcS3kfXUpKnZFakySsEO1z6tuc1QO9t+dqoiVg6Hn
	qigK4+eolt+ftnxivzSN3k9RTaCG8ZI=
X-Google-Smtp-Source: ACJfBouM8LP1o1+lK3fha9iNb1jCmowq8H+07ccUQ+QVYQysEgvQovG6pYlTEqLZekJ3lwy3Fw6eFg==
X-Received: by 10.55.142.70 with SMTP id q67mr17589019qkd.92.1515436453412;
	Mon, 08 Jan 2018 10:34:13 -0800 (PST)
Received: from x1.local ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id d6sm7939247qte.4.2018.01.08.10.34.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Jan 2018 10:34:12 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org,
	Dmitry Fleytman <dmitry.fleytman@gmail.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Dmitry Fleytman <dmitry@daynix.com>
Date: Mon,  8 Jan 2018 15:34:06 -0300
Message-Id: <20180108183406.17623-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-trivial] [PATCH] MAINTAINERS: update Dmitry Fleytman email
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
X-List-Received-Date: Mon, 08 Jan 2018 18:34:18 -0000

gently asked by his automatic reply :)

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 73a5555735..8050499ec5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1157,7 +1157,7 @@ F: hw/scsi/mfi.h
 F: tests/megasas-test.c
 
 Network packet abstractions
-M: Dmitry Fleytman <dmitry@daynix.com>
+M: Dmitry Fleytman <dmitry.fleytman@gmail.com>
 S: Maintained
 F: include/net/eth.h
 F: net/eth.c
@@ -1165,7 +1165,7 @@ F: hw/net/net_rx_pkt*
 F: hw/net/net_tx_pkt*
 
 Vmware
-M: Dmitry Fleytman <dmitry@daynix.com>
+M: Dmitry Fleytman <dmitry.fleytman@gmail.com>
 S: Maintained
 F: hw/net/vmxnet*
 F: hw/scsi/vmw_pvscsi*
@@ -1186,12 +1186,12 @@ F: hw/mem/nvdimm.c
 F: include/hw/mem/nvdimm.h
 
 e1000x
-M: Dmitry Fleytman <dmitry@daynix.com>
+M: Dmitry Fleytman <dmitry.fleytman@gmail.com>
 S: Maintained
 F: hw/net/e1000x*
 
 e1000e
-M: Dmitry Fleytman <dmitry@daynix.com>
+M: Dmitry Fleytman <dmitry.fleytman@gmail.com>
 S: Maintained
 F: hw/net/e1000e*
 
-- 
2.15.1


