Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e0cSl-0002hB-3k
	for mharc-qemu-trivial@gnu.org; Fri, 06 Oct 2017 19:55:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43928)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cSg-0002cn-9H
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:55:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cSf-0008Py-J2
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:55:22 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:53663)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cSd-0008L5-Dq; Fri, 06 Oct 2017 19:55:19 -0400
Received: by mail-qt0-x244.google.com with SMTP id n61so6370467qte.10;
	Fri, 06 Oct 2017 16:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=DyQ8Lj0Q3s/8TCexwZm2h7X6AHnaZ4A4DHRwz9DHO0g=;
	b=GlfAbG8eXWYaYS6IDYy5AfVMqInVmVSAzHTFfqwXCyrB1U7ObzF5Q2pQRdvZ1fa+cZ
	u1hnG7S4Qe/d7MhUcX6rf/2tnuJQyxSch2Zv459Dy1Xnrmi1TJWSdYquWmastaUx02Rh
	eYXLhh3ykjwPmxnaOvVM/q0lwQ6kgmkjvbD41/wGs2f2AJUHlUxwTqVs+5rTLNJJz2u7
	NOuZGASMsgz6r2Mn/J710YqsBPO6EcVVjPArYhJODCdmWldqNku0EIVU15ZkILkx3B4r
	jDKybZb06hjsxVDpyOmwlpTDyVveM7fZzTAyMBGIOZeCKbEl8rBRsArXhMTXH+wdG8b2
	B+EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=DyQ8Lj0Q3s/8TCexwZm2h7X6AHnaZ4A4DHRwz9DHO0g=;
	b=rS1i0OGoLZbe9mBNFeLQDGYd0FMGMXvlIOFXBju8ip5nuKde8wro+5sFUbB37UZoTa
	QcbLlfFb3d4u5PEtfXRbEq9yTIuqbZ86Y4pm3xV1DPL2ZlLIkALZtsoQEvxxg/G5frSK
	TJ0kMdUH/criVuZ83zVQ8YLQPWCua+iJFUzyNiQWTXp7R1XdeeHk08VLYG+uTBFY0RQi
	MUWNGCHrRN6b5+JG+5OzCFgbTu9o9hr5fCXV14a06rDMohadp2ozRO+wjUsmQX9pb7FK
	Z05AVRoBssd9/HTXOuEKcRKwlUUbVGpuefZ8f33AnI1bXX1dE2ahGtEuOh61RnGaambB
	CTDw==
X-Gm-Message-State: AMCzsaWsjH3qeQJ9rjj1CN8WRFXkH9iIWe5nQINmt09FsC/haDYJnU/b
	fizXqPLolElt844dLAeYvhg=
X-Google-Smtp-Source: AOwi7QDn5iB7Uc2E6kc7FshfHKC0w4UCA3ONKClwpJ7KTdBUs0xYcwD8/NqDyivHmnxRLISQV32ilg==
X-Received: by 10.200.43.228 with SMTP id n33mr5728374qtn.241.1507334118775;
	Fri, 06 Oct 2017 16:55:18 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id g1sm1705226qta.95.2017.10.06.16.55.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Oct 2017 16:55:18 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
	Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
	Ben Warren <ben@skyportsystems.com>, "Michael S. Tsirkin" <mst@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu trival <qemu-trivial@nongnu.org>
Date: Fri,  6 Oct 2017 20:50:16 -0300
Message-Id: <20171006235023.11952-82-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171006235023.11952-1-f4bug@amsat.org>
References: <20171006235023.11952-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-trivial] [PATCH 81/88] hw/acpi: use g_new() family of
 functions
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
X-List-Received-Date: Fri, 06 Oct 2017 23:55:25 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/acpi/vmgenid.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/acpi/vmgenid.c b/hw/acpi/vmgenid.c
index 2876d8a639..ced507d218 100644
--- a/hw/acpi/vmgenid.c
+++ b/hw/acpi/vmgenid.c
@@ -269,7 +269,7 @@ GuidInfo *qmp_query_vm_generation_id(Error **errp)
     }
     vms = VMGENID(obj);
 
-    info = g_malloc0(sizeof(*info));
+    info = g_new0(GuidInfo, 1);
     info->guid = qemu_uuid_unparse_strdup(&vms->guid);
     return info;
 }
-- 
2.14.2


