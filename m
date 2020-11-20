Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kg9SX-00069x-RL
	for mharc-qemu-trivial@gnu.org; Fri, 20 Nov 2020 11:40:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kg9SV-00064c-FI
 for qemu-trivial@nongnu.org; Fri, 20 Nov 2020 11:40:27 -0500
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:38037)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kg9ST-0000oj-Qn
 for qemu-trivial@nongnu.org; Fri, 20 Nov 2020 11:40:27 -0500
Received: by mail-ej1-x642.google.com with SMTP id a16so13760280ejj.5
 for <qemu-trivial@nongnu.org>; Fri, 20 Nov 2020 08:40:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a/eGltTOKyfKvrChaf2BpxhfQrvDgPj4R/DA6RZ4a4w=;
 b=co0u2cLSQKoR2/vZ0ZwtwhLzJPoGXksZBsHvV8ZQ2TSqaOmeCL9JlzjIqi4vxKs6QE
 tGHPCe6UATmZzKauisZ1n+Gam8P9V8A8rsgyZSwXBWVGzKebfdGeDxoD+m97syySrPPP
 Nn0MBsTo6mkkP/s2zIjMfT01tNoV490kQwSmAP/ZVQeoc7WI37IS2NsWVxu0SydsOXzN
 Vu/c/Gk32n4bKigL7H3f6Vm+PM1J3htT817P3fOLTfgpEjb6dJPx+opprslwnV/0AUJt
 qlOu8hxR+okMmZwk+z1DRFjkCIuTcwFjUktpdEc4Rd+YzDaGUfP1IDRoD+5QRFZazDwV
 I3cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a/eGltTOKyfKvrChaf2BpxhfQrvDgPj4R/DA6RZ4a4w=;
 b=OAlDGsH2uqflcwLmTL9AVYs5KfkejPdBzuR2QbqRRqVvtmNfo7iqDBASvGIdgglZkC
 NMw7bWIlsfeMgvmUzLh14vnr8q2iyy8o4zTS+ZvZF3utQpLhB9do6p7eWj/9KEeq5f7C
 yHQq+K3uVcF24OxpxnEjMqmtyxzaidCvs4uSnekRJc47zIfKUopXMwVwcPjpTobgbzPj
 IAyt4mLgKAdTixIqPb2592wmLbcvza8nklwVnzmm/KCO/0UcxvF7iZR2MrF/JhhKDIjy
 GO54VCWKqm1smf7AMMPnQQvQMvt5vMgKiTJYqx86Z6SEFuP9pwgkJ79MeQylO0Gix6b6
 4LBQ==
X-Gm-Message-State: AOAM533bvassfY0eQq6vixmmHimby8agv0GU3InoWfJeFT2+qQhi68vR
 /nbhlkJj27tGtUOOOMZtYAdb35qPdTZOn1oYN5j8ZQ==
X-Google-Smtp-Source: ABdhPJyqQtkWhwBK+kxEw0pqP0S9jdxaoiCsk+OuA4aVIjFhr4Im/UhqB2zQDPbpzVGv4q048plvkzlKX2PoQzby0IY=
X-Received: by 2002:a17:906:af8c:: with SMTP id
 mj12mr33051933ejb.85.1605890423353; 
 Fri, 20 Nov 2020 08:40:23 -0800 (PST)
MIME-Version: 1.0
References: <5F9FD78B.8000300@huawei.com>
In-Reply-To: <5F9FD78B.8000300@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 20 Nov 2020 16:40:11 +0000
Message-ID: <CAFEAcA9twgUD_xvHz3eUMznP69RVHYL1vZ4wBRG53vaUi6=Hcg@mail.gmail.com>
Subject: Re: [PATCH] hw/arm: Fix bad print format specifiers
To: AlexChen <alex.chen@huawei.com>
Cc: andrzej zaborowski <balrogg@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU <qemu-devel@nongnu.org>, QEMU Trivial <qemu-trivial@nongnu.org>,
 zhanghailiang <zhang.zhanghailiang@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x642.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 20 Nov 2020 16:40:27 -0000

On Mon, 2 Nov 2020 at 09:56, AlexChen <alex.chen@huawei.com> wrote:
>
> We should use printf format specifier "%u" instead of "%i" for
> argument of type "unsigned int".
>
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Alex Chen <alex.chen@huawei.com>
> ---
>  hw/arm/pxa2xx.c | 2 +-
>  hw/arm/spitz.c  | 2 +-
>  hw/arm/tosa.c   | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)



Applied to target-arm.next for 5.2, thanks.

-- PMM

