Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1esoI3-0004DF-2Y
	for mharc-qemu-trivial@gnu.org; Mon, 05 Mar 2018 06:28:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41800)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1esoHz-0003ur-AQ
	for qemu-trivial@nongnu.org; Mon, 05 Mar 2018 06:28:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1esoHx-0007GJ-Qm
	for qemu-trivial@nongnu.org; Mon, 05 Mar 2018 06:28:19 -0500
Received: from mail-wm0-x232.google.com ([2a00:1450:400c:c09::232]:38399)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1esoHx-0007Fj-Kb; Mon, 05 Mar 2018 06:28:17 -0500
Received: by mail-wm0-x232.google.com with SMTP id z9so14699908wmb.3;
	Mon, 05 Mar 2018 03:28:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=sFz7gQbLiFkW50vNIxhdWGVyBqApJwkZmkLI5b89DVw=;
	b=Shvv3/FSmISJf7rRK99PivsimvGbsq5D81IldL4w8LR2eNBS+O9yI2ZZCo180Gubk2
	lEwzG6M623d3ILH4UmTw6Dz2jGMG9InBSFYtBFvJxEbYcvfDy2W3Tm7W42mMzZZuMN40
	H+qc9Jl909vR90h3MXhGrvlaVH0zWYzMt5D4u7XNZl7mu+/hKxi4xeN6ezlgOZMXLgSr
	KlDt+k8IX6ehW+RDC7BnqwyDAiJ9/GqUyo9xwMmhIHIWRAsfHB4aRWjdpYQiOKWbwuSl
	I5rjQfr1himlP62+5GiWCm5LdaPxTeuUy5KEaSjdpfoukSJNUI18+r5FO2CcnzsRKLA3
	9USw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=sFz7gQbLiFkW50vNIxhdWGVyBqApJwkZmkLI5b89DVw=;
	b=F5lnvXHdaP+Ngmd89IHN6S7rIIGVe28lnkNwQafS/ZftsnVuFbg3cfXudicDyqHD3C
	pgBBbXvUd4kx/34k5yo4LLzzP81lDLN3b+StczNpy6Cf4q3VU9qXqXqsaA/L5lh6UrPD
	xbPrLDyoHnWSMvJuphvX9HcUNAPX+YsJaHGTVi7Lt8aD8KQNFpKFeL9WE+Rj6vI7veJa
	sz81X23kE3LZblmefWuCqtGjB5YjLZeD8iaaRuz+K3gIZ00VOdmn2F6YbPF1RQFkeIx7
	wTvgLfZcVZ89FrcsCn5FESW4E/OfvxEkVLQrrE4dTy6bgZUGS4/ECA5sfh6mjcLZqcH5
	8dRA==
X-Gm-Message-State: AElRT7GpiYWTRlojFz21d+WiuuNdb8VOytlJFYouqrpgp9Ptu3yxEuGB
	XETBGm0G5pnuhv6DBQ8W9DnH3drsny4=
X-Google-Smtp-Source: AG47ELtjPvPspMl4pBk9oeWLc6OlSOiB3vxfYgt3PHj6oCVcJbxS02HQeXlB7yM7lD5L5G6bVvoDvw==
X-Received: by 10.28.159.68 with SMTP id i65mr8530745wme.27.1520249296412;
	Mon, 05 Mar 2018 03:28:16 -0800 (PST)
Received: from x1.local (ABayonne-654-1-79-224.w86-222.abo.wanadoo.fr.
	[86.222.222.224]) by smtp.gmail.com with ESMTPSA id
	k45sm11744388wrf.62.2018.03.05.03.28.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Mar 2018 03:28:15 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Date: Mon,  5 Mar 2018 08:27:30 -0300
Message-Id: <20180305112732.26471-29-f4bug@amsat.org>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180305112732.26471-1-f4bug@amsat.org>
References: <20180305112732.26471-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::232
Subject: [Qemu-trivial] [PATCH v2 28/30] ivshmem: use the BYTE-based
 definitions
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
X-List-Received-Date: Mon, 05 Mar 2018 11:28:20 -0000

It eases code review, unit is explicit.

Patch generated using:

  $ git grep -E '(1024|2048|4096|8192|(<<|>>).?(10|20|30))' hw/ include/hw/

and modified manually.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 hw/misc/ivshmem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/misc/ivshmem.c b/hw/misc/ivshmem.c
index 16f03701b7..9b3ad96471 100644
--- a/hw/misc/ivshmem.c
+++ b/hw/misc/ivshmem.c
@@ -1302,7 +1302,7 @@ static void ivshmem_realize(PCIDevice *dev, Error **errp)
     }
 
     if (s->sizearg == NULL) {
-        s->legacy_size = 4 << 20; /* 4 MB default */
+        s->legacy_size = 4 * M_BYTE; /* 4 MB default */
     } else {
         int ret;
         uint64_t size;
-- 
2.16.2


