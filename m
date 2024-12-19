Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tOIBy-0007Le-Su
	for mharc-qemu-trivial@gnu.org; Thu, 19 Dec 2024 10:11:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tOI2l-0005tY-E8
 for qemu-trivial@nongnu.org; Thu, 19 Dec 2024 10:02:27 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tOI2j-0005lY-S2
 for qemu-trivial@nongnu.org; Thu, 19 Dec 2024 10:02:27 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-435f8f29f8aso6772825e9.2
 for <qemu-trivial@nongnu.org>; Thu, 19 Dec 2024 07:02:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734620544; x=1735225344; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a5X1+M6+3UyvBYMYaayfcaUwM70oCSQurIK4F7x4Fws=;
 b=UmHm2BcEjyvAR9svCPTdB0X4L7Bl8MeLu2TfCAcoC40xcYf0nIhyBr2AN25k9/9g7R
 jWZbt/rcUj0hRt3uCCiGAazNWKgdXIcaam1bWAeCcylu1n3cK9KQSSeox2rtV3BpKH1n
 HIvbvd2XSVjTXGuDdXKrCgvkefJa/z8CBKluMqrOPi/nh2CMcRmMmBhoFSGo4JViiiKW
 LBzfOcGpoH0WmAIdrnuabikzeLyB/0yv7l4Y2/U3z9XixNpGKZksH3ZcxfEYTTBmOy6F
 +LaLrbS90Y/n39vtIFZfFY3DEY8CAwREzHINng3WVga+vt8rHHZRy137Ji79I88656Ti
 U3gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734620544; x=1735225344;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a5X1+M6+3UyvBYMYaayfcaUwM70oCSQurIK4F7x4Fws=;
 b=rSFgSqvzGG3Lv2H4hbBRCgpT4QfoqjtGLECF7PS4h7Cxg/hd4ExPopKb3QiZ+MVJir
 fOtayLPmN5ZtzrVrcG0DOHkiWyo44IMMsLCQPhtJ+j0tDtgWeWSSfD8j/GIbqHzND3zf
 OdpoO6xa0cMC7Jh1yt8ND5jgDjOYTuNC4nVVZQyGtXMWvjCqHUNcqGqp2x+skrJbhbOf
 hh+Lhf/l/p8BsHGHnoMStvJLprl7pbR5Jf9H8vHQqkAtDYgx2UlFfgfhQ8qulnYIZETK
 HSotLqfod5L2OfOaz+YfnxCY3WDK/b06wfVM0V4xgueHwEsnu59e1aw7KlZanuVvhaOg
 g0xA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7mZom/eASrv3r/443cZOkRKDv+BpBtRBwkDRcpqiimKFNii1dz+Pg5Bqe13lBJ1RxHi1Cz6zgfQ2u/6w=@nongnu.org
X-Gm-Message-State: AOJu0YxaMEem8tWihfwt3Xz8wD+cdbJIU4cnh3RpDd1sys2h9Nyj/Bsb
 1kJ1N3ndkVP6ZyPhUYuGeWhnVUT9LhREf49zTsj7iOlohk2pG53MrkzZTcBB9qs=
X-Gm-Gg: ASbGnctWUf9DrxtdXxBx9fkLE+1vkMbWWzGbSr0bLOeU+8AykatTnBSuZmQOd6r9iSX
 Er0J86ZqRJCtbHP8+YVz3qctpCMcwynAWkknjzSMG6MnGWOYqiqo2rYwFCMdwih69GLajobxHpk
 aVDimzO/QJIaIpmEwHGcfLk9IpErdbSb7I5C/AoSbPvzip0YFSO0nfKCVajAMhjNGpAlv70yuED
 pHuqGzLlbT+sT4BXVJBWEZHF/jElBjl3LBebRPcVTiXAufyFCrXEFytrrBISUUn3TBkKKHw84nN
 ot6m
X-Google-Smtp-Source: AGHT+IEXIlOmW9o9lr+s2h5UeeagPMa271FjIw/v9/nqmuTLQ26hTPtgYOmqI0JTqbYE7cTGLtpzIA==
X-Received: by 2002:a5d:5984:0:b0:386:4277:6cf1 with SMTP id
 ffacd0b85a97d-388e4d8e7edmr6587031f8f.39.1734620540285; 
 Thu, 19 Dec 2024 07:02:20 -0800 (PST)
Received: from localhost.localdomain ([78.196.4.158])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4366127c493sm19971545e9.28.2024.12.19.07.02.19
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 19 Dec 2024 07:02:19 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>, devel@lists.libvirt.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 3/3] docs: Replace 'since' -> 'removed in' in
 removed-features.rst
Date: Thu, 19 Dec 2024 16:02:03 +0100
Message-ID: <20241219150203.55212-4-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241219150203.55212-1-philmd@linaro.org>
References: <20241219150203.55212-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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
X-List-Received-Date: Thu, 19 Dec 2024 15:02:27 -0000

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 docs/about/removed-features.rst | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
index e3a87f3f555..cb1388049a8 100644
--- a/docs/about/removed-features.rst
+++ b/docs/about/removed-features.rst
@@ -403,13 +403,13 @@ Sound card devices should be created using ``-device`` or ``-audio``.
 The exception is ``pcspk`` which can be activated using ``-machine
 pcspk-audiodev=<name>``.
 
-``-watchdog`` (since 7.2)
-'''''''''''''''''''''''''
+``-watchdog`` (removed in 7.2)
+''''''''''''''''''''''''''''''
 
 Use ``-device`` instead.
 
-Hexadecimal sizes with scaling multipliers (since 8.0)
-''''''''''''''''''''''''''''''''''''''''''''''''''''''
+Hexadecimal sizes with scaling multipliers (removed in 8.0)
+'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
 
 Input parameters that take a size value should only use a size suffix
 (such as 'k' or 'M') when the base is written in decimal, and not when
@@ -510,15 +510,15 @@ than zero.
 
 Removed along with the ``compression`` migration capability.
 
-``-device virtio-blk,scsi=on|off`` (since 9.1)
-''''''''''''''''''''''''''''''''''''''''''''''
+``-device virtio-blk,scsi=on|off`` (removed in 9.1)
+'''''''''''''''''''''''''''''''''''''''''''''''''''
 
 The virtio-blk SCSI passthrough feature is a legacy VIRTIO feature.  VIRTIO 1.0
 and later do not support it because the virtio-scsi device was introduced for
 full SCSI support.  Use virtio-scsi instead when SCSI passthrough is required.
 
-``-fsdev proxy`` and ``-virtfs proxy`` (since 9.2)
-''''''''''''''''''''''''''''''''''''''''''''''''''
+``-fsdev proxy`` and ``-virtfs proxy`` (removed in 9.2)
+'''''''''''''''''''''''''''''''''''''''''''''''''''''''
 
 The 9p ``proxy`` filesystem backend driver was originally developed to
 enhance security by dispatching low level filesystem operations from 9p
@@ -532,8 +532,8 @@ security model option, or switch to ``virtiofs``.   The virtiofs daemon
 ``virtiofsd`` uses vhost to eliminate the high latency costs of the 9p
 ``proxy`` backend.
 
-``-portrait`` and ``-rotate`` (since 9.2)
-'''''''''''''''''''''''''''''''''''''''''
+``-portrait`` and ``-rotate`` (removed in 9.2)
+''''''''''''''''''''''''''''''''''''''''''''''
 
 The ``-portrait`` and ``-rotate`` options were documented as only
 working with the PXA LCD device, and all the machine types using
-- 
2.47.1


