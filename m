Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jiDsC-000862-5g
	for mharc-qemu-trivial@gnu.org; Mon, 08 Jun 2020 05:15:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jiDsA-00084X-1P; Mon, 08 Jun 2020 05:15:14 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:38056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jiDs8-0006YC-TD; Mon, 08 Jun 2020 05:15:13 -0400
Received: by mail-wr1-x42b.google.com with SMTP id e1so16554213wrt.5;
 Mon, 08 Jun 2020 02:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7oosCVOZu8AF2EF+mXOQD7SMhC2RNTaEpyJI9zoWqf4=;
 b=KW/kKWMGt/Af8X1DnrdvHG2F8STqogeM+rLOUKtDde07rdKujR2dKmmTmPchqbAVca
 OOd2S3T7KKkQDweXACmOreFRyD7XWKtKCbgO6HWMgXJWhWVkL94PCR6cEbPAYNVswpHA
 MQ9UUz+Q4va2/Kny9xMa3cgseoXnesnYpqcFwotgbD4KIQb98sAvZjDTJTBNVFq6upe9
 QfhXXhamGbo14D9oXRS3JUlZNkabPff56QvyDJmlmNA5DGwIXe8W/PhzMrRH1dfRUaK3
 DPJXDyBPhOvZDLHvX+h5mWqq3NiNJzBx7e12dRk02j+9hs7tXP0ASljQ/4gdOIeuEM9P
 o0iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=7oosCVOZu8AF2EF+mXOQD7SMhC2RNTaEpyJI9zoWqf4=;
 b=LHW0W448HjNqjWqU1oVNsbSIjsLygrqn4uL9GWF8Tpg01C1IXdXiUESsEUSdwkY0cN
 1pjkh09saOh8XLhDBlgRMGtYDNNLD1xNvtRjomWYY3y3lu8M2rM2TFgYEl5lFBTp3MtA
 I/JGLNPbjHe7vTeIZHX6EkR1nB2J+308ObOisioSPxCFuLUJvNOxZ+94obwY0ke7DyIx
 S3+XScmnxI1bZUX0nq38ALJx3qK54BuesnduRrvyfyHoic3AAiJ6AxP2IJq7bIiaSN6s
 mU6xHQk1mO5PJ/eYLp7d+vDwL4vwW6Mxr+EmtzF/60/41jFXp5KMD+2lpdIEmassiQjC
 nk6Q==
X-Gm-Message-State: AOAM532T2tsayAYECeH+GlEZXltTuwdasOaWEOhd36gc4JOc/c1NfdUN
 aH3/dwKIPeCqUP70OCUJueXcOFK+
X-Google-Smtp-Source: ABdhPJyLPReKnCHrP8Ba9ymDXDbkdbTNBmGckRzMoB11sI2v2YWfsbYHZz5Ygr1T1B6MaRP3S1RV6Q==
X-Received: by 2002:adf:b60b:: with SMTP id f11mr22458943wre.7.1591607710351; 
 Mon, 08 Jun 2020 02:15:10 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id c5sm18258653wma.20.2020.06.08.02.15.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 02:15:09 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Michael Tokarev <mjt@tls.msk.ru>,
 Max Filippov <jcmvbkbc@gmail.com>, Jason Wang <jasowang@redhat.com>,
 qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 0/2] hw/net/opencores_eth: Trivial patches
Date: Mon,  8 Jun 2020 11:15:06 +0200
Message-Id: <20200608091508.19838-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Mon, 08 Jun 2020 09:15:14 -0000

Remove unnecessary mask, use #define instead of magic.

Philippe Mathieu-Daudé (2):
  hw/net/opencores_eth: Use definitions instead of magic values
  hw/net/opencores_eth: Remove unnecessary address masking

 hw/net/opencores_eth.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

-- 
2.21.3


