Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1esoHs-0003h9-VM
	for mharc-qemu-trivial@gnu.org; Mon, 05 Mar 2018 06:28:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41565)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1esoHn-0003ax-4V
	for qemu-trivial@nongnu.org; Mon, 05 Mar 2018 06:28:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1esoHm-000768-Bw
	for qemu-trivial@nongnu.org; Mon, 05 Mar 2018 06:28:07 -0500
Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242]:37300)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1esoHm-00075U-5e; Mon, 05 Mar 2018 06:28:06 -0500
Received: by mail-wm0-x242.google.com with SMTP id 139so14794561wmn.2;
	Mon, 05 Mar 2018 03:28:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=xsEDBxTCMiwWWbwKFmSfHj4pR0aGwb+uFWuedeEclp4=;
	b=a8XH9mBrwz2+k2RfE2rx/hZIPkMiuvCKYTKkDnvRX5waTbcIr+RcyWl715S8+myC5G
	9X7WmyKrQBaDKpSPtIY52v7djWygDKLcsTJEt9JJHgaGzScnn0/boBbdu2bvKHDA9tGW
	VSU9EreZ2B9/SEnFJTDHXcH8v15TkX68TNWjF9Z9afpCotj4JkwHlSeP2VHvv9YzIExD
	dqxPdzE/G0/i1I2VigtiidpIfyPC0zC9Z5OCpNfj0j7NeJjDN8ltB0y9BT4iXYbjT5sl
	X/REh9pf3jcqiE4Lm6dz/R49Jj2biWiH6YBibwApcK6sbi6UQX9yXcSFc+AxQmXJnQBx
	8rag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=xsEDBxTCMiwWWbwKFmSfHj4pR0aGwb+uFWuedeEclp4=;
	b=VWYTTgYxIMaSJY27G0QbuirkRuidIk4CYbDOt2TyG9GrdFk4kWD/R2IGIEgIdlWRHa
	khlUeX7jhuPb4ipnwIZm+q2lPVi3nD0ZgxsyurVHMkmeOZpB53Lr2YoAxFwbU0PXIRM+
	BbE4o0iI/Z6zO98MSYtUlh0c7zLGkfawYPhMrvpJBiCysibQb7cv3XwaRSejhXZ7xFxc
	cDXikabxAsvw4com7dROeSkPj0mhA9wA3F8r8iAb+I0SW6VV8kzipyJ+rF6xkIrzR+N3
	QGAJfcO3oDNetyBjFLFzBm0i9MjzeC2nC/RSeo3L7XlPmThzMfOMacZoUm9CrCc6dSeA
	euhg==
X-Gm-Message-State: AElRT7E6E0OfoEufL0yBqp60T1CZofCYgS0X2s5BW2YjMgWbJtcPCG04
	2luUlM1WKhlmpKGe9OXpHZoScSSu
X-Google-Smtp-Source: AG47ELspaNV7WGxZdLwypJ2NwlsFsgxskSyrnc4ZOROc9gzHrV4icUb/SWeqk0d1uQ18Uf3anH+xJA==
X-Received: by 10.28.154.213 with SMTP id c204mr7565095wme.64.1520249285045;
	Mon, 05 Mar 2018 03:28:05 -0800 (PST)
Received: from x1.local (ABayonne-654-1-79-224.w86-222.abo.wanadoo.fr.
	[86.222.222.224]) by smtp.gmail.com with ESMTPSA id
	k45sm11744388wrf.62.2018.03.05.03.28.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Mar 2018 03:28:04 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Chris Wulff <crwulff@gmail.com>,
	Marek Vasut <marex@denx.de>
Date: Mon,  5 Mar 2018 08:27:21 -0300
Message-Id: <20180305112732.26471-20-f4bug@amsat.org>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180305112732.26471-1-f4bug@amsat.org>
References: <20180305112732.26471-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::242
Subject: [Qemu-trivial] [PATCH v2 19/30] hw/nios2: use the BYTE-based
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
X-List-Received-Date: Mon, 05 Mar 2018 11:28:10 -0000

It eases code review, unit is explicit.

Patch generated using:

  $ git grep -E '(1024|2048|4096|8192|(<<|>>).?(10|20|30))' hw/ include/hw/

and modified manually.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/nios2/boot.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/nios2/boot.c b/hw/nios2/boot.c
index 771e00267b..911f28c0d8 100644
--- a/hw/nios2/boot.c
+++ b/hw/nios2/boot.c
@@ -176,7 +176,7 @@ void nios2_load_kernel(Nios2CPU *cpu, hwaddr ddr_base,
             high = ddr_base + kernel_size;
         }
 
-        high = ROUND_UP(high, 1024 * 1024);
+        high = ROUND_UP(high, 1 * M_BYTE);
 
         /* If initrd is available, it goes after the kernel, aligned to 1M. */
         if (initrd_filename) {
-- 
2.16.2


