Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ePgi0-0001hO-5p
	for mharc-qemu-trivial@gnu.org; Thu, 14 Dec 2017 22:30:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33456)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePghy-0001fw-FO
	for qemu-trivial@nongnu.org; Thu, 14 Dec 2017 22:30:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePghv-0003Pz-Bk
	for qemu-trivial@nongnu.org; Thu, 14 Dec 2017 22:30:46 -0500
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:34755)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePghs-0003JF-7w; Thu, 14 Dec 2017 22:30:40 -0500
Received: by mail-qk0-x244.google.com with SMTP id d66so8877391qkg.1;
	Thu, 14 Dec 2017 19:30:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=ydTnzh6nq6Y19hHeadOt1WX31i/G8HXWlFW3SzMwHC4=;
	b=lj3XitNUX18l4LnjKyqmK4lA0VHdWRywYadhSApduO9gU8p5myr8wGxTiIbd0ERoa5
	XqMQ0aQ71nlrkTVr59C30I/fqAYY0q9qLVXNBMONGWnhtiebvOANjxsgTjhHTjl01MJA
	1MbZwiLjNOysrFFHVSoj/g63A3/mg+EXMIYfU0KKZNfxexXybLKhM+MIdDRuTe5I0yXu
	stcUqQoCbn9FUH39Gq2ngO2zvUdXitJjN1gc0/E3YBp9Cw7zvDhJes1OEUqqml/eESCz
	96GtgnELZRGuDR5HA+l3i8JAW1ehWTm56vAe6WXiJLEPC8cDqrL3nf7uk7y53Ltdpmui
	UJfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=ydTnzh6nq6Y19hHeadOt1WX31i/G8HXWlFW3SzMwHC4=;
	b=iKAme85bQDKCnUv0thC5NgSoai8bc0ETS8QeFHimyAdNsoCkO0uJ2g3s0WHrK3aYyU
	ETNUnZDtFko2punPny01+4o3Q35GoAuQqZtADB5hMs4muyqL+03YthjMtPe4ajxdw9yU
	6PFmaUTYj12WC0zt5eV1byuZ8j/E4N8OAIOXmEmNBmXDL8qlRP+klHcKLf9dCNMZQPAj
	+yJEJADE7oicauhnneWSJHLoCnNw3zAVowso8LgkjUV56hW0Cvf80F8wrtgMj9ROeEvC
	8u6qsfnVfVV2nXJoAqLLX2H8GwUBLnwB5z/hL1gYvEJHu36i6gr1W5lDmKkAxT0ME0AC
	+S8Q==
X-Gm-Message-State: AKGB3mIbCwALPJTsN8Kf4RKClqSYCj8LlA+W1IXLRmI6ddUtseghEKQh
	+kRP0VhjHeZXSQl/+WCPbpf18TAm7qI=
X-Google-Smtp-Source: ACJfBovFAROI3N63tHCxzASgqw7f7tWzitsuYt3cnaCI+DEglNKlUVtJ8oSqs+6LGv6Ge9++AGYKVw==
X-Received: by 10.233.239.70 with SMTP id d67mr19177005qkg.308.1513308639781; 
	Thu, 14 Dec 2017 19:30:39 -0800 (PST)
Received: from x1.local ([181.91.222.165]) by smtp.gmail.com with ESMTPSA id
	q24sm3794605qkq.63.2017.12.14.19.30.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Dec 2017 19:30:39 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: "Michael S. Tsirkin" <mst@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-trivial@nongnu.org
Date: Fri, 15 Dec 2017 00:29:37 -0300
Message-Id: <20171215033015.738-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20171215033015.738-1-f4bug@amsat.org>
References: <20171215033015.738-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-trivial] [PATCH v4 05/43] MAINTAINERS: add an entry for
 watchdog/wdt_ib700
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
X-List-Received-Date: Fri, 15 Dec 2017 03:30:47 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4618f9b4db..00ce2931d9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -877,6 +877,7 @@ F: hw/misc/pc-testdev.c
 F: hw/timer/hpet*
 F: hw/timer/i8254*
 F: hw/timer/mc146818rtc*
+F: hw/watchdog/wdt_ib700.c
 F: include/hw/i2c/pm_smbus.h
 F: include/hw/isa/i8257.h
 F: include/hw/timer/hpet.h
-- 
2.15.1


