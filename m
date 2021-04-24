Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1laQeK-00018i-D6
	for mharc-qemu-trivial@gnu.org; Sat, 24 Apr 2021 18:21:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1laQeC-00015i-CO; Sat, 24 Apr 2021 18:21:08 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:39691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1laQe8-0005c4-D9; Sat, 24 Apr 2021 18:21:08 -0400
Received: by mail-wr1-x42e.google.com with SMTP id s7so51882244wru.6;
 Sat, 24 Apr 2021 15:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=H0fwLrUfzDLFdghXKG1yIZE5yIn8vOurFtVl1bgqEIg=;
 b=bgaT6zYDZ/WlXbtfySMGMhVjJQyB9uqt17tLGXpTg7l2sQLYHMs93UgjgQ7Vr+DW1G
 LA0m/m7ITb3ObvpD/0Ap+P10VhN69S4vDDZ5OndPbIlUveIq0FYc2lAVzWkZ45zD0JqJ
 bpvPc2T7T7wrV71EJeETVVoq8dQku7+xsYRtNfyGueFTR0to+GZvKA6oAgnx+vtSOTZH
 YRxd3tOYF6vApwvMQWO9Rt9xKpyO9WvLkYkGTteQHFbl//gK9IlNxZ85DtOFtI80fj25
 sYc3L28Ev7FJC4iwq/fXaPFKPAaZNp39Av6KtAhF9TMYP3GhvoeytsWa8eAu9W1M5u2y
 G7gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=H0fwLrUfzDLFdghXKG1yIZE5yIn8vOurFtVl1bgqEIg=;
 b=UvAR99lWFm1AF5mVknz+mW3iHrAAPmpL2iPlTDlvntV/FMNpuWbXj3hSyiFEh70/fJ
 TITDdhZTWE/x+3/u8dYbkQQ3sQeKG+Ra7SvT142eKThdnX/nkGNtyemiDVLi4FQQS4X0
 1TxTFwLIkaJrJ3XRDHGkHTUnOm7ULnL0VrNzictBstnHJxCyThHHRR1gUIe8RE0DIHzn
 mrCWBGGy3BwfcviUGImPrsxckw2+2HKped/CtW0KpvF6y7c6YxSkR32pyVpwKkRl/X3t
 BpWH2ibC2GktetlmcqjgbV54RJX2BMqoa/mHtHX8AYDAZBvz7dFGZNbf28Quk/NQrElX
 AwOg==
X-Gm-Message-State: AOAM533kyGL8CKssC/LLvL+FZz345NpEo/9E8EwlWCC0DWc2h16OjtUe
 3Ucs8HjrfOX1neUFiBtB0hFYQ+WgxZsocw==
X-Google-Smtp-Source: ABdhPJx5uOjvT9fIMTd3bxhg098Osy7yTbzQaK18K8e7LBpAv0dCLvUobn28lETZiEVAsOavVTCt4g==
X-Received: by 2002:a5d:4a48:: with SMTP id v8mr13197325wrs.204.1619302860297; 
 Sat, 24 Apr 2021 15:21:00 -0700 (PDT)
Received: from x1w.redhat.com (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id t20sm14318347wmi.35.2021.04.24.15.20.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Apr 2021 15:20:59 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Miroslav Rezanina <mrezanin@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 qemu-trivial@nongnu.org, John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 0/3] hw: Restrict PCMCIA to ARM target
Date: Sun, 25 Apr 2021 00:20:54 +0200
Message-Id: <20210424222057.3434459-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
X-List-Received-Date: Sat, 24 Apr 2021 22:21:11 -0000

Only a pair of ARM PXA machines requires the PCMCIA type.=0D
Complete the Kconfig dependencies to only build the PCMCIA=0D
related devices when required.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (3):=0D
  hw/arm/pxa2xx: Declare PCMCIA bus with Kconfig=0D
  hw/ide: Add Kconfig dependency MICRODRIVE -> PCMCIA=0D
  hw/pcmcia: Do not register PCMCIA type if not required=0D
=0D
 hw/arm/Kconfig        | 1 +=0D
 hw/ide/Kconfig        | 1 +=0D
 hw/pcmcia/meson.build | 2 +-=0D
 3 files changed, 3 insertions(+), 1 deletion(-)=0D
=0D
-- =0D
2.26.3=0D
=0D

