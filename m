Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fQZue-0007bW-AS
	for mharc-qemu-trivial@gnu.org; Wed, 06 Jun 2018 10:59:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60769)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQZub-0007UT-Rr
	for qemu-trivial@nongnu.org; Wed, 06 Jun 2018 10:59:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQZub-0007O5-8x
	for qemu-trivial@nongnu.org; Wed, 06 Jun 2018 10:59:45 -0400
Received: from mail-qk0-x234.google.com ([2607:f8b0:400d:c09::234]:39776)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQZuV-0007Gr-2F; Wed, 06 Jun 2018 10:59:39 -0400
Received: by mail-qk0-x234.google.com with SMTP id g14-v6so4124612qkm.6;
	Wed, 06 Jun 2018 07:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=oGnUSJaPn2n38SJ88CoCgtmuH1hY1wXIECkZM/ZBhdM=;
	b=iOh1jkac2rOJieKamkzZmyVeS2vk0j5X/qgBFX6sf/lha1vQbRkc7WcbkuEGECcivE
	6t3wFwokDAdbPswnnNAjG0dz45Fz59ZBxFfCt7YuHWpG9wWelTHACnhfdY9H5G+fP/zL
	vZb3khSHNMsE0m5sFijuL/kS8XnX4XrD521dLRJ3e5VhQi6RpJAE/QCXowwtRF+A2KFg
	ffHC/3QhyHrqR54R2UqvTf1TsPVlOoA2Vd0aexH3FVjDsApLvQ3XQIv6zFc6vah+H53p
	/opbGyxTUbaRIRCUQr6+cXtFrhgTbiMZo4KfoGipKdaALQRXiA4ebgYxdwe6oEoSLxlK
	Mdog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=oGnUSJaPn2n38SJ88CoCgtmuH1hY1wXIECkZM/ZBhdM=;
	b=Gr75hll/myEfN7QzGoaoSb36mOhzg+722V4hf6asw+zsEczVbr3iASYQMrO/uzE3gt
	g6AH163OPr+AQrwX/RMycMoN7ZMtPxssafR+q9iVxVyThRxwsiU9bDdkHyM8M5QMsQl0
	HgL+22N9NhkUucDIetT0AHLMsHqd7JVoIzxExUm35vwGpUhMUjxioJZzTGTbQwiLtgvF
	rwUA7RVWeJtGP2U/hmVBmXYYmOKIvpNmNOoGl5FqJliaJoliIfbOSXMfK198Ls5a1ETG
	a44WXj0aDaH/uyChxELgyEE2oJ/swi9Wiwm8N6eEHwBsnLkpoqAQXGxj3FeAj1HUzfhk
	ZvHw==
X-Gm-Message-State: APt69E2vf9oqcusify4aHSp9EJmbByblUqbLoiANz1wRqP6ZYHUvnJ4r
	1WnoHLFjMlGsRX9d25AIqsxYWAbx
X-Google-Smtp-Source: ADUXVKK9J52bCsWdgy34cw2UPPQZ5y7JbQruAWOehESgBIthPdZCnezxslDF0SU8H7YTdlS5FevjJw==
X-Received: by 2002:a37:c602:: with SMTP id
	b2-v6mr2716430qkj.413.1528297178456; 
	Wed, 06 Jun 2018 07:59:38 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	v29-v6sm8519439qkv.28.2018.06.06.07.59.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Jun 2018 07:59:38 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Alexander Graf <agraf@suse.de>, David Gibson <david@gibson.dropbear.id.au>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-ppc@nongnu.org
Date: Wed,  6 Jun 2018 11:59:21 -0300
Message-Id: <20180606145921.30606-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180606145921.30606-1-f4bug@amsat.org>
References: <20180606145921.30606-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::234
Subject: [Qemu-trivial] [PATCH 3/3] hw/misc/mos6522: Add trailing '\n' to
 qemu_log() calls
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
X-List-Received-Date: Wed, 06 Jun 2018 14:59:46 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/misc/mos6522.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/misc/mos6522.c b/hw/misc/mos6522.c
index 6163cea6ab..49166cb8ad 100644
--- a/hw/misc/mos6522.c
+++ b/hw/misc/mos6522.c
@@ -189,12 +189,12 @@ static uint64_t mos6522_get_load_time(MOS6522State *s, MOS6522Timer *ti)
 
 static void mos6522_portA_write(MOS6522State *s)
 {
-    qemu_log_mask(LOG_UNIMP, "portA_write unimplemented");
+    qemu_log_mask(LOG_UNIMP, "portA_write unimplemented\n");
 }
 
 static void mos6522_portB_write(MOS6522State *s)
 {
-    qemu_log_mask(LOG_UNIMP, "portB_write unimplemented");
+    qemu_log_mask(LOG_UNIMP, "portB_write unimplemented\n");
 }
 
 uint64_t mos6522_read(void *opaque, hwaddr addr, unsigned size)
-- 
2.17.1


