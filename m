Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e6yCz-0006Yd-Hh
	for mharc-qemu-trivial@gnu.org; Tue, 24 Oct 2017 08:21:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42487)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e6yCt-0006TB-Tl
	for qemu-trivial@nongnu.org; Tue, 24 Oct 2017 08:21:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e6yCq-0007DG-OD
	for qemu-trivial@nongnu.org; Tue, 24 Oct 2017 08:21:19 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:55921)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e6yCi-00077Y-QA; Tue, 24 Oct 2017 08:21:08 -0400
Received: by mail-qk0-x241.google.com with SMTP id x82so25919139qkb.12;
	Tue, 24 Oct 2017 05:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=wraKdZSGpwoslQ/nBgo714YDl4uliR0qkyarfqUSHuE=;
	b=FECKuljZcxS1iIItuxIODzUvdN54IUxgBzYyEMl7Va9Qu98a9/ryEg8jZBRM+LtFqB
	kfEnqdpoqXoN3KNPqxcOH3iQwFV+MnpXdic6m0RYReGZ85lBKobca5eroBd18ro8bVYD
	1guOezE3QiCXq3of6FyDMzA9wFxi3Fm2JiK8pArRvdI3xFoqg/WuFYfjIA7Bem3NUy4v
	kRi4Sv8N6dpxHESo/Q4HWzbS6jtU3OXJbH1BrN6Op8MyEEuRm4uMXHBb05a+tV5fmx4x
	Xw6VVlGFuPx8IBx9cqHTkih8izkr8JtDpk4zo5cVeV9FN1YyFMc7koTNR2TFWC9tqp23
	3CWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=wraKdZSGpwoslQ/nBgo714YDl4uliR0qkyarfqUSHuE=;
	b=FWoKf5Y3fsmzAtjKPUB/z0yhlzEhQt96mT4u0I0LWv1wD57QceLSaIv3/cyQHD6BG7
	9sUjzYYuV4c0jDdHglGctfX8pskLG08S7qW+jyXleyLJr8siADkqHpL8QYgR/+TYm7li
	Aedk55vEqlwuSaeFrFZSjdlzij+qQYGAKR/e86kNhTaVyznbl0OD/QEaPgT5zzIO7HEI
	xDn9IlNnN0ImuGzE3Ahq6Lq75Ngpvleya7N2ZuTRc6hxZV/v6dotMS++CrsG6MS9o/4f
	QmM31ZG65Q6uiqcKhww8UyJjPdpjbJsZog3TQgjOyUCaFd106KFHxrFaE/STAz9vtlhi
	7tTQ==
X-Gm-Message-State: AMCzsaX9V36lpVI0ZcG2AGeXE6MjxV9fbRR+HrZ2JjFL++qznmtsyaSl
	rRKJzejconQltgaV4ASWR3Y=
X-Google-Smtp-Source: ABhQp+QLIyGwkwVnmQFBKl6gzfP13g0E7M8ELLfO7y0vhBT8sZTA+XWUHA3dmG/R532hcvOlT97akg==
X-Received: by 10.55.10.18 with SMTP id 18mr21930674qkk.184.1508847668359;
	Tue, 24 Oct 2017 05:21:08 -0700 (PDT)
Received: from x1.local ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id n76sm103983qkn.85.2017.10.24.05.21.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 24 Oct 2017 05:21:07 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: BALATON Zoltan <balaton@eik.bme.hu>,
	"Richard W . M . Jones" <rjones@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	Amarnath Valluri <amarnath.valluri@intel.com>,
	Juan Quintela <quintela@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>,
	Peter Xu <peterx@redhat.com>
Date: Tue, 24 Oct 2017 09:20:44 -0300
Message-Id: <20171024122045.30072-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.0.rc1
In-Reply-To: <20171024122045.30072-1-f4bug@amsat.org>
References: <20171024122045.30072-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: [Qemu-trivial] [PATCH v2 3/4] tpm: remove unnecessary #ifdef
 CONFIG_TPM
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
X-List-Received-Date: Tue, 24 Oct 2017 12:21:24 -0000

Makefile.objs now checks for $(CONFIG_TPM).

Suggested-by: Stefan Berger <stefanb@linux.vnet.ibm.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tpm.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/tpm.c b/tpm.c
index 45520f555d..ab5d29e91e 100644
--- a/tpm.c
+++ b/tpm.c
@@ -30,8 +30,6 @@ void tpm_register_model(enum TpmModel model)
     tpm_models[model] = true;
 }
 
-#ifdef CONFIG_TPM
-
 static const TPMBackendClass *
 tpm_be_find_by_type(enum TpmType type)
 {
@@ -192,8 +190,6 @@ int tpm_config_parse(QemuOptsList *opts_list, const char *optarg)
     return 0;
 }
 
-#endif /* CONFIG_TPM */
-
 /*
  * Walk the list of active TPM backends and collect information about them
  * following the schema description in qapi-schema.json.
-- 
2.15.0.rc1


