Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kg9UA-0000Kq-JE
	for mharc-qemu-trivial@gnu.org; Fri, 20 Nov 2020 11:42:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kg9U9-0000Hx-Iv
 for qemu-trivial@nongnu.org; Fri, 20 Nov 2020 11:42:09 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:38647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kg9U7-0001FN-OW
 for qemu-trivial@nongnu.org; Fri, 20 Nov 2020 11:42:09 -0500
Received: by mail-ej1-x636.google.com with SMTP id a16so13767603ejj.5
 for <qemu-trivial@nongnu.org>; Fri, 20 Nov 2020 08:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7nNhzWSN1U2uAcnQgsU0jgORBLK+9mZeCHTcLoPEtAM=;
 b=jYgMeO3FNySe1OEPFg6KaebSpJnLCS8+0tpU9pl9ZHHGBfXwUvrlNmk1vU9pbHGu3F
 A01zFf/Ya0HF2SNfVsqUHNOpr2QrH2ow3Mi2yjTf4IDfPjXvS97qF+wiZqosidJvFRl8
 uw4/9cyxWsr74vsTjgcnrQ32ecPmpnN3OIdblsCVuE7uHamXjzqt+zC4+qkXZnBH5Tev
 gc3+u2h1/CgAMEe+kKQIwd85bvImoq5Mr2ai2ciwwsItokOdrm1Z+zP0quboo79HGgxi
 rQd+aEhZquyDfL8krcz4enRbpq5nTXPTxpDG8leZKWHRMy3BjbPRBlaAyu2sUA6jn1d7
 uUig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7nNhzWSN1U2uAcnQgsU0jgORBLK+9mZeCHTcLoPEtAM=;
 b=WEHeEE6j7SyAuQDrFozymw0MFQMq5a+ttVIMHHUXHRObbKfKgQbC7Goi+4zDmzuxs7
 TqGb6WFOClSsRTBLRD+CuQrMuKu42GUa3qma7f9tBJrzeg1AIXCIfs5IbsS3oYqD38hc
 oLIatPrXqEr4hUCC8Zi8//GnCJt5HS2W1t6nSI5uBGwd4T1QeCzBjaeGNEPNx9W++YRD
 XtYcO4SohPSQA/ABIepNdNyNLAdcF3w7/kIbXfiltOSv8s379dRM8ortwXbtsaSs/zi3
 Vmy4dOn4Uwf5jeshpjAr4FY6Gy8XFGKieHq2IxmWjBWLOcQRe2i59nvK99uk817+KXXB
 QPBg==
X-Gm-Message-State: AOAM531iA/IcSt7M+qycpinKAgcSKC+/br8DC7BLxAh30fmCEImfi/pv
 nuBLfFqOjH2YlDuQLpNhGlxwrYzPOFdR8AZ98SGp1A==
X-Google-Smtp-Source: ABdhPJy+QbcjDfPSGHvqFP4Yd8VQ+yGpMwQ2qiEFb47CLsjGKrOdWewo8zvXPqDp2js0IuI/UXkZscmyoFvrfVWuwB8=
X-Received: by 2002:a17:906:1542:: with SMTP id
 c2mr22965103ejd.382.1605890526295; 
 Fri, 20 Nov 2020 08:42:06 -0800 (PST)
MIME-Version: 1.0
References: <20201111141733.2358800-1-kuhn.chenqun@huawei.com>
 <CAFEAcA_BSYrq87it7UXWJUDvUuA8L8U1Y8mxkyZdwzb3n_sSiA@mail.gmail.com>
In-Reply-To: <CAFEAcA_BSYrq87it7UXWJUDvUuA8L8U1Y8mxkyZdwzb3n_sSiA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 20 Nov 2020 16:41:55 +0000
Message-ID: <CAFEAcA8Ax3X5EFAgvGR_PVztLx7ShTweX63sd6k4CeqJqXnNRw@mail.gmail.com>
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
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 20 Nov 2020 16:42:09 -0000

On Fri, 20 Nov 2020 at 13:44, Peter Maydell <peter.maydell@linaro.org> wrot=
e:
>
> On Wed, 11 Nov 2020 at 14:18, Chen Qun <kuhn.chenqun@huawei.com> wrote:
> >
> > When 'j =3D icu->nr_sense =E2=80=93 1', the 'j < icu->nr_sense' conditi=
on is true,
> > then 'j =3D icu->nr_sense', the'icu->init_sense[j]' has out-of-bounds a=
ccess.

> > Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> > Reported-by: Euler Robot <euler.robot@huawei.com>
> > Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
>
>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

I'll take this via target-arm.next, I guess.

thanks
-- PMM

