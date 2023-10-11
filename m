Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qqZsZ-0000C1-LF
	for mharc-qemu-trivial@gnu.org; Wed, 11 Oct 2023 10:08:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qqZsM-0008QU-WF
 for qemu-trivial@nongnu.org; Wed, 11 Oct 2023 10:07:52 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qqZsG-0007E3-ME
 for qemu-trivial@nongnu.org; Wed, 11 Oct 2023 10:07:49 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-32d834ec222so889183f8f.0
 for <qemu-trivial@nongnu.org>; Wed, 11 Oct 2023 07:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697033261; x=1697638061; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hy00VOLNiN+XirsqjTGeO5pxsZXjQq1crGFLqd0Qwbo=;
 b=LG6VgPmnuGR7vQqzuLXpIobMOGOQp8V4ozdtzwecly/wmPVeVpy/+zG/23F4VA3FhG
 KBTRHougjkaY70fyL5vanBVQioZ/08rcfJgFnSF6xNtvnt2VMCxh4mFcoMTeinSPTmPF
 7aLVem/r6aFsBIFLfi9VcTW37By65V55X46o5VBhjhWGijCrrYIhOvzoduMKfPUQb32f
 YtXAzMT29KOaz0nwlLMlgBTlbegUaOsC0bp3U836viiXfxn9A3Cuxby4iUjb2FXnPh6o
 YfwBTYqmnZ1mxjMBdVoiNjVXPa6E66HM/FASlJsa2ok9TaUWVqbCsdBtsVwD9lQU70hq
 B5bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697033261; x=1697638061;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hy00VOLNiN+XirsqjTGeO5pxsZXjQq1crGFLqd0Qwbo=;
 b=jtmETRI6PO0/Bsgl3kHHzqdeWnnSHAbZggjo63OgpQycrzQ8DuTL+vZlK4fb8rHyyv
 yhTJPnJFVv/J6s4kDTmkCI1yRBC02MiMoqSvuQ/+6Os6RXtQT1JMYbMTjeVh/nHM4/wg
 7UEBxPyP/uDlvWBIQjfxsHiHC94nBdBtvRC3+kdz0o7tQsIAl+kBol9ZBIESghpdYthg
 ZEMOmx3dx59t8wjrwK+QfGh6UOTBAlFPRzIQMd4L1dpkyDTrplcoCQt71u7YRBkLbysA
 efwpJcxgKbW9ur9h05XJJPiNxgg72rnBnfWd2Kh+HlyXh51R52lTuXyfgrRRcSGEjDBO
 Dzlw==
X-Gm-Message-State: AOJu0YyYHdkJ5H6TyllVjUnWMbzlsk1pBHCpS9bktO3MfTBfZHxOAC4y
 9b9nTLGP8Y9T3UEXIOPCVkR6LQ==
X-Google-Smtp-Source: AGHT+IHLXupghQ9oNPFr/lJxl+/ZYe84Ncq6c5Ym7tSfOOtOOTvC4pCo+Iv7LHjAzjniLR/TpddmMw==
X-Received: by 2002:a5d:500b:0:b0:319:8a66:f695 with SMTP id
 e11-20020a5d500b000000b003198a66f695mr16385128wrt.55.1697033261467; 
 Wed, 11 Oct 2023 07:07:41 -0700 (PDT)
Received: from m1x-phil.lan (mdq11-h01-176-173-161-48.dsl.sta.abo.bbox.fr.
 [176.173.161.48]) by smtp.gmail.com with ESMTPSA id
 i10-20020adff30a000000b0031f8a59dbeasm15556487wro.62.2023.10.11.07.07.32
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 11 Oct 2023 07:07:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 qemu-trivial@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 0/2] hw/ppc/ppc440_uc: Maintain and remove dead code
Date: Wed, 11 Oct 2023 16:07:19 +0200
Message-ID: <20231011140721.3469-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Oct 2023 14:07:52 -0000

Series fully reviewed.

v2: Removed few comments and added Zoltan R-b tags

- Cover ppc440_uc in MAINTAINERS
- Remove dead code

Philippe Mathieu-Daudé (2):
  MAINTAINERS: Cover hw/ppc/ppc440_uc.c with Sam460ex board
  hw/ppc/ppc440_uc: Remove dead l2sram_update_mappings()

 MAINTAINERS        |  1 +
 hw/ppc/ppc440_uc.c | 42 ------------------------------------------
 2 files changed, 1 insertion(+), 42 deletions(-)

-- 
2.41.0


