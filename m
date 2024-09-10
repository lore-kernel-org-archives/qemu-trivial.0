Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1snz34-0007TF-4X
	for mharc-qemu-trivial@gnu.org; Tue, 10 Sep 2024 07:28:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1snz33-0007Rv-4C
 for qemu-trivial@nongnu.org; Tue, 10 Sep 2024 07:28:41 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1snz31-0003Ng-GF
 for qemu-trivial@nongnu.org; Tue, 10 Sep 2024 07:28:40 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5bef295a45bso2372775a12.0
 for <qemu-trivial@nongnu.org>; Tue, 10 Sep 2024 04:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725967717; x=1726572517; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2ISkgkEmCI5cff9FmpAnJPIY9AIpzWQ32iu8oi9pu8k=;
 b=y0smUsRQuTrIk15uVENKxZAxPKjyuBY3EqWnCZTK4xSwqdaK8Evbr0aGS2tmr+NG0U
 cHLlmIVS4fBE4mbZDO3nILOtetJkIvErnk6E1AZKk2odzeJ1Ry/vnPQbg1ElOKXsfxhn
 dVxvm7T1NN80j2OQ66WkEfwkQALvPm+QE/bDJDgszXJROni1/ojE/cfgBjewiCkGLSc3
 iaFGQAKkg0wBCmLf7vfIQqT5dpJVbRSsv0yRRs6UfHsHW8X7vxzf+/k+hIfn/JjAWCXX
 wAubMedMfmInKTn1kIohV+Ilw1XyYG01M6XxtOBdP1ithtirsjOXTfJXAJ1l71XPTLMe
 7XTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725967717; x=1726572517;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2ISkgkEmCI5cff9FmpAnJPIY9AIpzWQ32iu8oi9pu8k=;
 b=bu3sHSAi0qgHoJ70hL9fpe6SNCcMRyBNMJziGhRzqfYiwIusGVJ26PdiS81Mzhyy9X
 FhGCdm4Ko29FXiGoRJWeWCBEc04D8lV2cj0GF0ayJTvNKPNfslIdMvo0UggadEHX7M9G
 cLVLIK/dXpvP+yiozdA5LaR0E5zyUcIWVD9qqHqIfwL16SFVxqROOsr7UCC+Q2GKXldY
 LQNmf6UgjO4kzI7V32Zv8N4r+VZUnBBeSeCIZMeZz8paid9Z+PWYQ4R6mR2vG57/k0Rm
 KbYpRleDsA7aLGhWBWfYjtKYzTgXO9tX9uIZ8re+J32uBOdB62KS/ww97PyK/WDzyjC/
 mxBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXulO2LmhWHU5VqM2oFhv4LQz61iQP/Tzz50S3M/HUhZsPZ6ZsRXKctOQcRo7IBIVB5r2rBV4fC9aSW7Ag=@nongnu.org
X-Gm-Message-State: AOJu0YxCZPIanNfL3w7x6a7GV/UWePyGi8weu1El+/y8acwcRkffigK+
 Sd/El1oVBYT4ejFpu8jxrgwjKY26OaNXbG+cuBpveX45m6sBqqx+YEachWlszwY=
X-Google-Smtp-Source: AGHT+IHKOrK0OMUESpDluzghYxbwsv5LqrEbyRMWXZWr1hMDej4+GYkuCjRc3wkgdr4FgXiY6lELOw==
X-Received: by 2002:a05:6402:34c3:b0:5c2:58fe:9304 with SMTP id
 4fb4d7f45d1cf-5c3dc77b0a4mr13913635a12.1.1725967717123; 
 Tue, 10 Sep 2024 04:28:37 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.217.32])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd41c65sm4113767a12.16.2024.09.10.04.28.35
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 10 Sep 2024 04:28:36 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Brian Cain <bcain@quicinc.com>, qemu-trivial@nongnu.org,
 Anton Johansson <anjo@rev.ng>, Alessandro Di Federico <ale@rev.ng>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/2] misc: Rename included template headers using '.inc' suffix
Date: Tue, 10 Sep 2024 13:28:31 +0200
Message-ID: <20240910112833.27594-1-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 10 Sep 2024 11:28:41 -0000

Follow Coding Style:

  If you do use template header files they should be named with
  the ``.c.inc`` or ``.h.inc`` suffix to make it clear they are
  being included for expansion.

Philippe Mathieu-Daudé (2):
  target/hexagon: Rename macros.inc -> macros.h.inc
  tests/bench: Rename test_akcipher_keys.inc -> test_akcipher_keys.c.inc

 target/hexagon/idef-parser/README.rst                         | 4 ++--
 target/hexagon/idef-parser/{macros.inc => macros.h.inc}       | 0
 tests/bench/benchmark-crypto-akcipher.c                       | 2 +-
 .../{test_akcipher_keys.inc => test_akcipher_keys.c.inc}      | 0
 target/hexagon/gen_idef_parser_funcs.py                       | 2 +-
 target/hexagon/meson.build                                    | 2 +-
 6 files changed, 5 insertions(+), 5 deletions(-)
 rename target/hexagon/idef-parser/{macros.inc => macros.h.inc} (100%)
 rename tests/bench/{test_akcipher_keys.inc => test_akcipher_keys.c.inc} (100%)

-- 
2.45.2


