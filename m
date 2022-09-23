Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1obiCZ-0004Ax-FG
	for mharc-qemu-trivial@gnu.org; Fri, 23 Sep 2022 08:54:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1obiC3-00040V-N9; Fri, 23 Sep 2022 08:54:26 -0400
Received: from mail-vs1-f48.google.com ([209.85.217.48]:45845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1obiC0-0004Ku-Od; Fri, 23 Sep 2022 08:54:09 -0400
Received: by mail-vs1-f48.google.com with SMTP id m66so13547814vsm.12;
 Fri, 23 Sep 2022 05:54:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=cVLDq7eNbwU/Ox5QdxwEVyZtFde4AJSltr1NWOk0AIY=;
 b=bJ9xmGBt2PFhq96UM6NowvCtCLp1R0OnDFh/YM7Tgn7zvpaolQeq67vfuPg6FMUZ1J
 G5NZRzPiVNEk0qB80geSHQfpaf+SeQUuZQWif9JTQJzWaWvTxApVy13EPNFJ1fxvmQwF
 IB1R9Zk+5eKJAoE2IMMdG77ut0LEtvAXBJs2yHc4ghoUVt7BNqRs3LjQsagCkq05DzXw
 U6TievwkaZJbrt0Fl6lhdWW72FVR+FeohjsU/hqAtGy8c0QXD64ZlhQF+lpzMOMnueo5
 RYFZIcTEoKsyO1swRgmJlf5ELOHWg1A+9hR7dykf3eyYQMRKCkFL4AEK5p0eszFF8UQb
 OEgg==
X-Gm-Message-State: ACrzQf329HX9a+Q2N2uU9NvaAzNa8yMx4V4QTTIe/Nt0+njKz/OhnAcT
 FmeBc8XbEbSviltRictP3rE+ToW6AHKcoTrGpzwovXl9JAcarA==
X-Google-Smtp-Source: AMsMyM5Q5X2nAF40BM/7za6fX20NzxcMu+AKrbCGDkp6IyrKPgYGbr4G3DgEwkMNI3JrAZFYqFOedVNUzwz56ZAOWZs=
X-Received: by 2002:a67:b44b:0:b0:398:7e9c:21ba with SMTP id
 c11-20020a67b44b000000b003987e9c21bamr3245188vsm.83.1663937646003; Fri, 23
 Sep 2022 05:54:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220923120025.448759-1-armbru@redhat.com>
 <20220923120025.448759-2-armbru@redhat.com>
In-Reply-To: <20220923120025.448759-2-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Fri, 23 Sep 2022 14:53:54 +0200
Message-ID: <CAAdtpL55FKHaXDos+fny6O0i+ghDFqyApVTGMqpC1Xvawj971A@mail.gmail.com>
Subject: Re: [PATCH 1/3] hw/core: Tidy up unnecessary casting away of const
To: Markus Armbruster <armbru@redhat.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.217.48;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-vs1-f48.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 23 Sep 2022 12:54:38 -0000

On Fri, Sep 23, 2022 at 2:30 PM Markus Armbruster <armbru@redhat.com> wrote=
:
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  hw/core/sysbus-fdt.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

