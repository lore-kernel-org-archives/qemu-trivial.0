Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l1jSK-0003Bz-7k
	for mharc-qemu-trivial@gnu.org; Tue, 19 Jan 2021 00:21:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1jSI-0003AT-FL; Tue, 19 Jan 2021 00:21:26 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:34869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1jSG-0004Au-UX; Tue, 19 Jan 2021 00:21:26 -0500
Received: by mail-ed1-x535.google.com with SMTP id u19so20045785edx.2;
 Mon, 18 Jan 2021 21:21:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZvJJR/TLmSPSU+it15dUTOtYooEyYIl80JB+Vf2GE68=;
 b=XyWdqSX300KAEJ8XfNwFzsr6PMVAOc8EACHtDJRw2hWWG4r5M+dsddc9cdm91U07Hw
 E/CWefN7Bjf5d8HpmZt7XQvF2GHaiS0Ja2fh+1eeKRN0uXaPAHzZUueFcTSqfSuovZZo
 0WoQ3H6RpsogHUTstvT9sSOlhESb6LnrSKKnfGm4xrcjadHEjr/28FALx5ZRyTKgky7a
 zVK+e+RWu4wqbtQZ/Kt9N6TzJK9UWxJV6nep+3xBeOClPsOcv6k8pdCsUXItWMAOX0fd
 ZIKUpPPgUWTfF+AH7l6YyuRGRSICJA4/EGbdicNnDjnr+UQaMhSWhzt+H4euqfYriHzF
 Dj4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=ZvJJR/TLmSPSU+it15dUTOtYooEyYIl80JB+Vf2GE68=;
 b=OLmVVDOdCc7ZlpOFqE5XFi0bONwzzz0yAS+kYo7tVYcElqf71AnkOU9/foXevLer8l
 lcU0dW8d24lLoBD+NWYOCRlQw1bEQegPgA65Sx5La3UToN8s3bJ7/djx+Vx+svs1MDGO
 /BPOhJkk43trb1oAlriOAu+ZURRkGZRz3/+EUXrPMY2xqYEW59j0ayOwPjtjkvvHCTKD
 1bAkuJ/iiw/n6TOPtkhuECWZeSxVRpNN+fciYG04tthccaRwZxhDpdhnXZ3IwAPikK/z
 0HGQG/5Cx/18YGMuPrEUIP0dvFYO/8mo7th4+Qw5uUTS14+AQ/m6yK+jlSmooqKXc6XM
 fF6g==
X-Gm-Message-State: AOAM533wHbHqIZttMXFQW7I3Kru93bV09crPdGpc4S0gqwXHYBlPpPlW
 y73XySeakb+IvnlUDZ1uvewnvbIUhVo=
X-Google-Smtp-Source: ABdhPJzEC5vnyM4OTkcARc91aShaj+eKCcjMQnsUZgbrMVUpem/Wby0TvpPptsFoZVu6a51C2d9fRw==
X-Received: by 2002:a05:6402:5193:: with SMTP id
 q19mr2071732edd.264.1611033682695; 
 Mon, 18 Jan 2021 21:21:22 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id f9sm697407edm.6.2021.01.18.21.21.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jan 2021 21:21:22 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Fam Zheng <fam@euphon.net>, qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH] tests/docker: Fix typo in help message
Date: Tue, 19 Jan 2021 06:21:20 +0100
Message-Id: <20210119052120.522069-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Jan 2021 05:21:26 -0000

To have the variable properly passed, we need to set it,
ie. NOUSER=1. Fix the message displayed by 'make docker'.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/docker/Makefile.include | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index 0779dab5b96..bdc53ddfcf9 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -209,7 +209,7 @@ endif
 	@echo '                         before running the command.'
 	@echo '    NETWORK=1            Enable virtual network interface with default backend.'
 	@echo '    NETWORK=$$BACKEND     Enable virtual network interface with $$BACKEND.'
-	@echo '    NOUSER               Define to disable adding current user to containers passwd.'
+	@echo '    NOUSER=1             Define to disable adding current user to containers passwd.'
 	@echo '    NOCACHE=1            Ignore cache when build images.'
 	@echo '    EXECUTABLE=<path>    Include executable in image.'
 	@echo '    EXTRA_FILES="<path> [... <path>]"'
-- 
2.26.2


