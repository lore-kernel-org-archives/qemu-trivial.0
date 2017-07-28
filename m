Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1daxy8-00053v-Vi
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 01:37:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48716)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxy4-00050a-Bd
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 01:37:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxy3-0004OB-P8
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 01:37:44 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:33959)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxy2-0004Mh-4f; Fri, 28 Jul 2017 01:37:42 -0400
Received: by mail-qt0-x243.google.com with SMTP id i19so11808847qte.1;
	Thu, 27 Jul 2017 22:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=GbPK0orE3UDAZBCJca6d66GwOYMPVFahhHrEaGKABeQ=;
	b=caDyxF+N8RyojwF2GTy2DiftwNf/zWXo5448FffnSETnC+KpqvzqGxQh0ZKh6zn7J9
	UzUpwZpQWv9cKuHl8Ds/FJXli4trjyFI7ipL/GuRL4tFv+UbglxaygM9UGFKoRIctrBE
	cbwcIo0Ba8B0ol7kWIYAz3wHq2MwyIXXiih3AQ1nqKyzfy5nXgVu6dk97szpC28/eRv/
	eZWPvK2+uwzvbJ6D6dcS8llvyN9sXaYOFFJWvtnBmMiexzys8gUxd+VnnPLFuu21sEiv
	b73fLnZtx36XW4lYjfOhMwi5q9LipbLzVOFh9JBrOH7CriuBea1BVkPuZvMyL8Kypqjg
	mroQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=GbPK0orE3UDAZBCJca6d66GwOYMPVFahhHrEaGKABeQ=;
	b=JRNMZPnFbOwTP4RJGQ/wufTj4WBFAi5QcH3ao3OfhbwcAc6ZuqHkVTp0YizFXo71Bg
	IO52BD7dDGDE1qTq7azWhtm5HEu/v7T0LieXzmDlt0xg3BUrdt7HUjtZHGTdoFYiG+oJ
	aXMrXDOT5tUQT57y1ny+R4A6cC7/JMMsxmmMI2k5MQ4N+r+ze2FhP0pDEzqQ83EnD/04
	KBO8jW+kacRStusbLWMIpeXCUeISYNRI6teUuqzicRsqwJMHjq3/g+KdLGUfLZZXlMAi
	ip5ONO7IUSfUjH++WGnktjOEzeYt8REFDieEaGBTC/8gwycKST65bkDrfOxD3XeEf3zB
	eV5Q==
X-Gm-Message-State: AIVw1115xMGz3oUnHo5a2E0OjZfSxgDchLOpyrS/SPKIgrxEgJM+H3xp
	hOxNhhfnRc4Faw==
X-Received: by 10.200.54.200 with SMTP id b8mr8690018qtc.307.1501220261722;
	Thu, 27 Jul 2017 22:37:41 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	h41sm12129560qta.45.2017.07.27.22.37.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Jul 2017 22:37:41 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Eduardo Habkost <ehabkost@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Fri, 28 Jul 2017 02:35:57 -0300
Message-Id: <20170728053610.15770-35-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170728053610.15770-1-f4bug@amsat.org>
References: <20170728053610.15770-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-trivial] [PATCH 34/47] MAINTAINERS: add missing X86 entries
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
X-List-Received-Date: Fri, 28 Jul 2017 05:37:47 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b2c9945299..a2b008e305 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -263,6 +263,8 @@ S: Maintained
 F: target/i386/
 F: hw/i386/
 F: disas/i386.c
+F: default-configs/i386-softmmu.mak
+F: default-configs/x86_64-softmmu.mak
 
 Xtensa
 M: Max Filippov <jcmvbkbc@gmail.com>
-- 
2.13.3


