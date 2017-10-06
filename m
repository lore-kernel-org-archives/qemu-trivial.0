Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e0cRD-00016k-S3
	for mharc-qemu-trivial@gnu.org; Fri, 06 Oct 2017 19:53:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42579)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cRA-00013P-Tq
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:53:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cRA-0006uK-7T
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:53:48 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:37991)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cR8-0006qq-5T; Fri, 06 Oct 2017 19:53:46 -0400
Received: by mail-qk0-x242.google.com with SMTP id 17so5919590qkq.5;
	Fri, 06 Oct 2017 16:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=hAX8a1zhko+r8FcH7TTw6l2tfK33CDbsSZ5ACwAaIT0=;
	b=FU7xkhC+QX6lQs2a52nIMlZaMQhPkF56t5tN1xUXNr/jeXWPNhIRlq0dVhHAI26k5i
	VuueyJrpe5LV0RMMOXO8c56+zJAmOBX9dkZxAbpJwYbagF+EB6VEoUdtYWNPUb6nVZpI
	EfKgeRJpnwW9dskyd2I/o8u9/DAfud9d5oC8xG9ljm2ZF988+ilmOMsBx7bo0yiIY0Fo
	1f1bgL9qOQYsaEFjzTJmowsqz8mkYZTGPZlG1vKC2ETRch0gcacXbnwxbEyMwcNeJuKV
	dFv+Ng+YSIDKqCnqSSQOjnNDmUqLkC+qKSLDKmQVVQZKnkklCAM9+rg0Xbi4idBUaFfd
	A5iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=hAX8a1zhko+r8FcH7TTw6l2tfK33CDbsSZ5ACwAaIT0=;
	b=aS3k0CyuTdJ2XO37/bYpOh6KN4V9yafiGgkRPaJxI1sUEjDksyFxYFtXLonjyb4kKR
	WFXd7i9Zl1jWMeItNneqpuZIdAK5Nwc3Q9mSLNacZoYkAfgsy2bZdan/4obbVdfkHCg3
	5qrRUql1x4enQb6gco2BkGStPl9GIW1Mlf8FaNhCUts3pT5BKWQUIu1aDru3mXU3AgV6
	HpRSQyO+FpW0Cf12JKHntJsUGMrspmlzMhTG48cWu1n4k7nkURn4xdhlTX9x9RQw3iUb
	0pIruyDaKofbcuaqAOciiPuqZIpLfX6T1yUoL+VDkspPRexBM5j3L9uYyw5tVF4VIgp9
	BXZw==
X-Gm-Message-State: AMCzsaX8vmKTubq+rucfRsaZP2QghefahrL8vXEZhr9375pCmzyctubf
	gFRS6O4oYgMIjvHL3UhOHJE=
X-Google-Smtp-Source: AOwi7QA6iY9YcX1ITDErLB7ddzxtj01OBZaewjSlZ+IMAuVjcGSe+zuFS8acMYZzpnebfLZh+m70+w==
X-Received: by 10.55.140.68 with SMTP id o65mr727713qkd.293.1507334025648;
	Fri, 06 Oct 2017 16:53:45 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id g1sm1705226qta.95.2017.10.06.16.53.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Oct 2017 16:53:45 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
	Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
	David Gibson <david@gibson.dropbear.id.au>, Alexander Graf <agraf@suse.de>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	qemu trival <qemu-trivial@nongnu.org>, qemu-ppc@nongnu.org
Date: Fri,  6 Oct 2017 20:49:50 -0300
Message-Id: <20171006235023.11952-56-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171006235023.11952-1-f4bug@amsat.org>
References: <20171006235023.11952-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: [Qemu-trivial] [PATCH 55/88] PReP: use g_new() family of functions
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
X-List-Received-Date: Fri, 06 Oct 2017 23:53:49 -0000

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 hw/ppc/prep.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ppc/prep.c b/hw/ppc/prep.c
index 94138a4e8c..c638d3d17a 100644
--- a/hw/ppc/prep.c
+++ b/hw/ppc/prep.c
@@ -512,7 +512,7 @@ static void ppc_prep_init(MachineState *machine)
     int ppc_boot_device;
     DriveInfo *hd[MAX_IDE_BUS * MAX_IDE_DEVS];
 
-    sysctrl = g_malloc0(sizeof(sysctrl_t));
+    sysctrl = g_new0(sysctrl_t, 1);
 
     linux_boot = (kernel_filename != NULL);
 
-- 
2.14.2


