Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dAQ5z-0000ZU-1E
	for mharc-qemu-trivial@gnu.org; Mon, 15 May 2017 20:12:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51299)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dAQ5w-0000Ql-EB
	for qemu-trivial@nongnu.org; Mon, 15 May 2017 20:12:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dAQ5v-0005oM-Kr
	for qemu-trivial@nongnu.org; Mon, 15 May 2017 20:12:08 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:33150)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dAQ5t-0005n9-4Z; Mon, 15 May 2017 20:12:05 -0400
Received: by mail-qk0-x241.google.com with SMTP id o85so20179805qkh.0;
	Mon, 15 May 2017 17:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=tvgzvC53dvved+IvgQEmsiVrqQNnfESTxPE3eHEy1pc=;
	b=i1SmG4QgVUcTpYC5e8GBazAGvPb23Gb0/Ft8tvgzPMTAx/43cbua6m7ehzwKL2WGtm
	GnaEFYNWyNfptT2iAzQI5kF6TjrO2IcOMWyMFC3SD3Jvn/KGZpRojbYgszC7fgKaa5Bc
	L5LObV4eCwqWVnO66GtcxBYZbk4xOqrkiM/xUfF11RfLn5fiHYiMqdjW/Mh+AYakvNdN
	vR68gGWM3dfM/5YRxwUR8qryK3Rn/1v88X2pGsFNtqtCVdmn+OUvRiwmZNanDXSofuW7
	GPIl1ozTk+1Wd2JADL2UCNNxvKlxo4IuIpyVN66DfNde7oWOlmLGzGp+OT3M7VIF7hlW
	UPEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=tvgzvC53dvved+IvgQEmsiVrqQNnfESTxPE3eHEy1pc=;
	b=RHDcKPUGZoZffxyIeBrPqUF+g6PK5SWciOmMyrLpggBeOBeOC4jymfZag0ASiFaL3j
	WG5NPa29pC2V6OP4y6Vj5SKjhXVcaXtSwpmBCgOr3rjp1L0QJj+NNNH0bvcGEgpnv7mD
	NlHnaNim0ZVYdCkUwhUbwMj8PLtOJ3dUt98KQeLGS2Zjo3nPNRwypkBhDylMxoimUxLP
	vdWlead9BQeY/cGjHFPyD8zg625/tAO7o/6L47RRQA5cwBmhQwYA1AEb85BOORpFn2h8
	wNCxp/u1iSucJx2HLqp0U0F7qsaL8BTYJRfE5iiU3ESY5KWveUxgKcTuoKJqAoPlG57B
	cacg==
X-Gm-Message-State: AODbwcCJjDf0mtVOzWE/zYG9zNOVEkJN2AYgF8CjGLOnGFUEAsQla11J
	TB45Z6WsxrRvLg==
X-Received: by 10.55.215.145 with SMTP id t17mr8610779qkt.78.1494893524784;
	Mon, 15 May 2017 17:12:04 -0700 (PDT)
Received: from localhost.localdomain ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id
	s21sm9424522qtc.58.2017.05.15.17.12.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 May 2017 17:12:04 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Eduardo Habkost <ehabkost@redhat.com>, Eric Blake <eblake@redhat.com>,
	Markus Armbruster <armbru@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Date: Mon, 15 May 2017 21:11:50 -0300
Message-Id: <20170516001150.11508-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170516001150.11508-1-f4bug@amsat.org>
References: <20170516001150.11508-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: [Qemu-trivial] [PATCH] coccinelle: fix typo in comment
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
X-List-Received-Date: Tue, 16 May 2017 00:12:09 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 scripts/coccinelle/return_directly.cocci | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/coccinelle/return_directly.cocci b/scripts/coccinelle/return_directly.cocci
index 48680f2c2a..4cf50e75ea 100644
--- a/scripts/coccinelle/return_directly.cocci
+++ b/scripts/coccinelle/return_directly.cocci
@@ -1,4 +1,4 @@
-// replace 'R = X; return R;' with 'return R;'
+// replace 'R = X; return R;' with 'return X;'
 @@
 identifier VAR;
 expression E;
-- 
2.11.0


