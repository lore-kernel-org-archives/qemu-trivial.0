Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dORir-0007eC-ON
	for mharc-qemu-trivial@gnu.org; Fri, 23 Jun 2017 12:46:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39919)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dORip-0007c9-ME
	for qemu-trivial@nongnu.org; Fri, 23 Jun 2017 12:46:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dORio-0002D9-U3
	for qemu-trivial@nongnu.org; Fri, 23 Jun 2017 12:46:15 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:33643)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dORin-0002CH-0K; Fri, 23 Jun 2017 12:46:13 -0400
Received: by mail-qk0-x244.google.com with SMTP id p21so6905659qke.0;
	Fri, 23 Jun 2017 09:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=HlSkjknXLawAhgZUMH7yuaCbXX26J/nW89nIz7w34kY=;
	b=RfwYiulF/Quw4umrpNs3LnGt6s3qwIurhsCZ3yZT6vLaB/jUvBdPnD0ghTX3jLUfxF
	Oj5iG+v7LfmZQLzK74M4uGlJfc9ArFnadlbKvKQtaJ4E0tQrAixOtFvIcCWTgJ8smUzr
	snlQyp1CTZZuJi7z3MQuwFb5BtmsvI6kYgWKOHhz+IVPpco/zb0Cgc8R1nCyEMvbas8h
	tkfPXSkFpjysrC5Gvr/CoPaT7EOx748lqTHsn6Jp+3dsb8B5efuqkwAhJjW9nQ9tJHXl
	kQ4RP8ZZkSA5OlU7U+4zwSOmNePfGvHKfPKCRL3pxC49YixpU9S7He4jb4G1GBhRmXuE
	NvXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=HlSkjknXLawAhgZUMH7yuaCbXX26J/nW89nIz7w34kY=;
	b=XECT7vPwk6P+RkmbmiEOvZS/rgw28FVQEAzm4gGdctQOY+8lWo+bLpRGMoOaGt2ETu
	MQG28u495BeciHNTuuzWKQfOV/HxPKTghaamGxFoXn4E0LdUX53zTwZ/GmtRwK8fjpSX
	NfyBop8voa/GHzRExcMta8nTj/9XBpoi1Bx3FhZ8gFuhPCbChwXnGrClAnuZJQVBiUSh
	/UKitqoJIB8VG8WyZvk9ztMWxh8777J56kZInIrfcYNKRZ/ElRumnFfzpRDEhtv442HH
	8K69kKmaiHt7FUq/mv0/nN23K8CqJQIFCdA4kz9DuZjG/Jvo64dH1l4DaXjL/GypBt7r
	wsgg==
X-Gm-Message-State: AKS2vOwnywS5UowVrJWki9BS+IN1o7W52KVKuLLyVKTgGZ7lVGpJ8D39
	fDaHOng6ccJ+Zzj2rf7umA==
X-Received: by 10.55.125.65 with SMTP id y62mr9411533qkc.143.1498236372125;
	Fri, 23 Jun 2017 09:46:12 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id x7sm3690803qkx.45.2017.06.23.09.46.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 23 Jun 2017 09:46:11 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	qemu-trivial@nongnu.org, Eric Blake <eblake@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Markus Armbruster <armbru@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
	Alexander Graf <agraf@suse.de>, David Gibson <david@gibson.dropbear.id.au>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Alistair Francis <alistair.francis@xilinx.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Date: Fri, 23 Jun 2017 13:45:55 -0300
Message-Id: <20170623164557.11636-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.1
In-Reply-To: <20170623164557.11636-1-f4bug@amsat.org>
References: <20170623164557.11636-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-trivial] [PATCH 1/3] elf-loader: warn about invalid endianess
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
X-List-Received-Date: Fri, 23 Jun 2017 16:46:16 -0000

fprintf(stderr) is how errors are reported in this file.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/core/loader.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/core/loader.c b/hw/core/loader.c
index f72930ca4a..094f24627f 100644
--- a/hw/core/loader.c
+++ b/hw/core/loader.c
@@ -478,6 +478,7 @@ int load_elf_ram(const char *filename,
     }
 
     if (target_data_order != e_ident[EI_DATA]) {
+        fprintf(stderr, "%s: wrong endianess\n", filename);
         ret = ELF_LOAD_WRONG_ENDIAN;
         goto fail;
     }
-- 
2.13.1


