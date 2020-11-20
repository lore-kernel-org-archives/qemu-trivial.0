Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kg6ik-0005Je-Kd
	for mharc-qemu-trivial@gnu.org; Fri, 20 Nov 2020 08:45:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kg6ii-0005FF-Qg
 for qemu-trivial@nongnu.org; Fri, 20 Nov 2020 08:45:00 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:33350)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kg6ig-0006uw-VY
 for qemu-trivial@nongnu.org; Fri, 20 Nov 2020 08:45:00 -0500
Received: by mail-ed1-x530.google.com with SMTP id k4so9594705edl.0
 for <qemu-trivial@nongnu.org>; Fri, 20 Nov 2020 05:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=N7WKqA9zpurRykd5uLpJ/XSo1eU6mxFHkZEw4VajoEc=;
 b=QOClg52iF0nwGZIy3gsVbpWmiJT8GG+ivktoYqDALIbMwzV9yy3NrSHTouacSMb8he
 Q1oZUvuH1771PF6SUuQ0lgsntcZx0MJTievS+dYlEXpvFg5C92W2rVHou6NYwsh3jSU5
 kh4viuvxA1FLMK+9Sc28Tmt4kLPK8hj3VE3uz5t2be/Nbj5YPMp4dS7svQUFLKuSmxJD
 RvmM1p+fAhRV1ftLXLvWIWZzyi96oUacTM0sOt9tN2eB48as38ASLfEMdNEzaSqkGGGu
 ulywVDRPucsDaP/Ds9vL6Qe2hyDz3Ro/ZJJG52ZePxLery9ohOqKICpp0OAJNZ0PMXLC
 PtNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=N7WKqA9zpurRykd5uLpJ/XSo1eU6mxFHkZEw4VajoEc=;
 b=NgWaQPTvv1PFe+ALoFa/ETemJNHb1vugtlvNqQZN+MNhExY0Scq4SoYwtNXAorGs8j
 AQePCMTxTAprrcje++4b1TKB1DIlk9MvvSTK7dV5OevSnxCR0spO85YaRzqk8G0crEN8
 RNE8S+zD8O1LFBHLXbWTT3b7d2kfj2mwXNcfPfsHcDsjZvyVzX3o+vGcd3W7gsPmmsbJ
 Up8V+eGfqidG88Tp1IhsXwtPsCBels18eVRmLsjPoeAQ5AO1HYYPORFk2pWi+j370AFQ
 PrZHkYUua3/WE9GBYjLuMrRUw7Iza4MtkNKSDG1vi654m9jz65oVcZk0VaqR8kFcKpMr
 3efg==
X-Gm-Message-State: AOAM533+fltCEx4pJWvwmfIpyhzpmViI1UZZR0aO8O2rcnYJx2YzOi2I
 CsoGVeMryxIuDSR/D7PHQl9c05pr6IiDO3yWpzufFQ==
X-Google-Smtp-Source: ABdhPJzwGyLnhHJp5o4F6qzfvB+0fE7Qlfv77WE89mwYGtRr41Um0ig0iUG1hr1nOk5G7sGx9TOVPfGQtEmUWi6AJlI=
X-Received: by 2002:a05:6402:3089:: with SMTP id
 de9mr36449418edb.100.1605879897277; 
 Fri, 20 Nov 2020 05:44:57 -0800 (PST)
MIME-Version: 1.0
References: <20201111141733.2358800-1-kuhn.chenqun@huawei.com>
In-Reply-To: <20201111141733.2358800-1-kuhn.chenqun@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 20 Nov 2020 13:44:45 +0000
Message-ID: <CAFEAcA_BSYrq87it7UXWJUDvUuA8L8U1Y8mxkyZdwzb3n_sSiA@mail.gmail.com>
Subject: Re: [PATCH-for-5.2 v2] hw/intc: fix heap-buffer-overflow in
 rxicu_realize()
To: Chen Qun <kuhn.chenqun@huawei.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, 
 zhanghailiang <zhang.zhanghailiang@huawei.com>, Gan Qixin <ganqixin@huawei.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Euler Robot <euler.robot@huawei.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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
X-List-Received-Date: Fri, 20 Nov 2020 13:45:01 -0000

On Wed, 11 Nov 2020 at 14:18, Chen Qun <kuhn.chenqun@huawei.com> wrote:
>
> When 'j =3D icu->nr_sense =E2=80=93 1', the 'j < icu->nr_sense' condition=
 is true,
> then 'j =3D icu->nr_sense', the'icu->init_sense[j]' has out-of-bounds acc=
ess.
>
> The asan showed stack:
> ERROR: AddressSanitizer: heap-buffer-overflow on address 0x604000004d7d a=
t pc 0x55852cd26a76 bp 0x7ffe39f26200 sp 0x7ffe39f261f0
> READ of size 1 at 0x604000004d7d thread T0
>     #0 0x55852cd26a75 in rxicu_realize ../hw/intc/rx_icu.c:311
>     #1 0x55852cf075f7 in device_set_realized ../hw/core/qdev.c:886
>     #2 0x55852cd4a32f in property_set_bool ../qom/object.c:2251
>     #3 0x55852cd4f9bb in object_property_set ../qom/object.c:1398
>     #4 0x55852cd54f3f in object_property_set_qobject ../qom/qom-qobject.c=
:28
>     #5 0x55852cd4fc3f in object_property_set_bool ../qom/object.c:1465
>     #6 0x55852cbf0b27 in register_icu ../hw/rx/rx62n.c:156
>     #7 0x55852cbf12a6 in rx62n_realize ../hw/rx/rx62n.c:261
>     #8 0x55852cf075f7 in device_set_realized ../hw/core/qdev.c:886
>     #9 0x55852cd4a32f in property_set_bool ../qom/object.c:2251
>     #10 0x55852cd4f9bb in object_property_set ../qom/object.c:1398
>     #11 0x55852cd54f3f in object_property_set_qobject ../qom/qom-qobject.=
c:28
>     #12 0x55852cd4fc3f in object_property_set_bool ../qom/object.c:1465
>     #13 0x55852cbf1a85 in rx_gdbsim_init ../hw/rx/rx-gdbsim.c:109
>     #14 0x55852cd22de0 in qemu_init ../softmmu/vl.c:4380
>     #15 0x55852ca57088 in main ../softmmu/main.c:49
>     #16 0x7feefafa5d42 in __libc_start_main (/lib64/libc.so.6+0x26d42)
>
> Add the 'ice->src[i].sense' initialize to the default value, and then
> process init_sense array to identify which irqs should be level-triggered=
.
>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

