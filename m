Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4FVG-00062H-I4
	for mharc-qemu-trivial@gnu.org; Mon, 16 Oct 2017 20:13:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33162)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4FVA-0005vv-KL
	for qemu-trivial@nongnu.org; Mon, 16 Oct 2017 20:12:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4FV9-0003uz-Rl
	for qemu-trivial@nongnu.org; Mon, 16 Oct 2017 20:12:56 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:47669)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4FV7-0003tT-Se; Mon, 16 Oct 2017 20:12:53 -0400
Received: by mail-qt0-x244.google.com with SMTP id z50so59971qtj.4;
	Mon, 16 Oct 2017 17:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=rGlo2+c/qkSc7BHo6dYcKoKbfztIRGd5Ttbw7xnt3mg=;
	b=F6oCl7yyGTk9aL2qJ4b6Hf8fHUzbF3QecxXYFkTDVtw+8xAO16o1ILlrSGCsP9jdXm
	SAYWunAH007OGPLAb8MIWIHmGf0DMgbvHfTX9tjCCm6aP63/apQOUlTZlK3iT1LLBkxq
	9NcKEbIO7U4sZ4bQM8PRS+0kw3EPxNSqU+LVBL8JhU669tYNTQAk/JOMdhV4dCpetkFK
	7Iam9b0w5RVBZpLhSwgniLmuH4Xn0JjWdkJFR8qmbt+DAGyQ6gAUJYQYfEFMCAvjNWww
	2rKHlaHpKn4CNAoFJR2vnUHVKygTCx9A9EFUb/bdBGp68yLURvc91qH74q13a3lFTGQN
	Ul6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=rGlo2+c/qkSc7BHo6dYcKoKbfztIRGd5Ttbw7xnt3mg=;
	b=fqPMI+ssY5sg957Q6LL8YborY7TMZ5VerwAlybRaX36HnTrsDH2zbG6nyqhBcZ6FZD
	ffIJFc1xY8bfoi4ErB5wqC+65dYnYoV0rnXWYy5j4Kp5Cn8lNQrb5Kjoshvl2GEsMRfc
	KczOmqkYhp1MkHtfLf2oXmhp5JeVTPpl74jOHtq+11nwff0fZybBPBnJUfCPM28T0Are
	+z1hcoiST1ual7csKTI9bSxfBS/Dpa37SdUxh2cxPgAcAgn6SvBlMqaDtPMXuSqeb2PQ
	9V88aMvdniSJ/DPL91fS0K1wELG55USzkIXhrpyttrACLM60kqG0vyH3GVio9QWvwSLu
	foXA==
X-Gm-Message-State: AMCzsaXd0bxzR4pftTW23VpDiYfLiG1WL3SjR3VszKrsckzMxWme6OqA
	M9JBXMZl7lZIqhBzd79BAhI=
X-Google-Smtp-Source: ABhQp+QUiElqArbt2EdQfU73E9kfEg89kW2gkHwdQzLlwaN4e3WT55Wpe2XF7DRNpTum0FDjrjR2JA==
X-Received: by 10.200.36.68 with SMTP id d4mr4224627qtd.180.1508199173457;
	Mon, 16 Oct 2017 17:12:53 -0700 (PDT)
Received: from x1.local ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id r6sm5409043qkh.22.2017.10.16.17.12.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Oct 2017 17:12:52 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Mon, 16 Oct 2017 21:11:37 -0300
Message-Id: <20171017001209.32276-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.0.rc0
In-Reply-To: <20171017001209.32276-1-f4bug@amsat.org>
References: <20171017001209.32276-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-trivial] [PATCH v2 07/39] MAINTAINERS: add missing entry for
 include/hw/net/
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
X-List-Received-Date: Tue, 17 Oct 2017 00:12:59 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Hervé Poussineau <hpoussin@reactos.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 06ec24912e..ddaba2702c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -982,6 +982,7 @@ Network devices
 M: Jason Wang <jasowang@redhat.com>
 S: Odd Fixes
 F: hw/net/
+F: include/hw/net/
 F: tests/virtio-net-test.c
 T: git git://github.com/jasowang/qemu.git net
 
-- 
2.15.0.rc0


