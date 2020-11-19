Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kffH6-0007qv-4S
	for mharc-qemu-trivial@gnu.org; Thu, 19 Nov 2020 03:26:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kffH1-0007p9-AJ
 for qemu-trivial@nongnu.org; Thu, 19 Nov 2020 03:26:36 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:46752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kffGw-0003u0-RL
 for qemu-trivial@nongnu.org; Thu, 19 Nov 2020 03:26:34 -0500
Received: by mail-ej1-x62a.google.com with SMTP id bo9so932875ejb.13
 for <qemu-trivial@nongnu.org>; Thu, 19 Nov 2020 00:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=KapW45sKsnAnywpOYLI8/0VhYYYVNjQmlsW3R9prmG4=;
 b=OPLWUNCM0CZbZ7IyvcN/0cjgQ+/1gR24YRz4psJFcJOF+F7k7BsWJwu60tn5WEOj3a
 fuNKdr09opn3dm4vyxtXpWsoQleg/Wqnp0I6TmDHr/MoT9jTVvtFJBPVBI7niRaHuNxf
 Hg6BdAoZ2B37Fz35OCEADkzyezIoYTTz96SZTmhlT/zn0yYocpTr7MDpbSpsTpbcJr/J
 F3wmFYsdU5Zm2Odt2M2sq7kVkk+MKTrytvJh5+R8IzFM8lscmQs76X0AmPdWgYZ1u4yB
 8a2znVSx1pKYq8ZaUe1iYk1hnGhSAnyYMbJCp0NmtmB6Bs5hufLAEeQREXF96a8VheU5
 UT1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KapW45sKsnAnywpOYLI8/0VhYYYVNjQmlsW3R9prmG4=;
 b=BduAonTv6EjVeCcCLf5mjwI4qhCo6WKPRnQXKjuUKh1UVB39fm6PddEh2jDB+PMK4Z
 1XzHnTd8wQefOQvZR0eX/Ls6J/se/CoGfk4f1RbRbwyP+n+xpe7wpGYYA7zTfZ1J4Vao
 xSBbdXUNWcC14SDtidbYopmXRCbqsHhGqaEqhES9C+TdLqm0vJPtpVtSOKXj98lNgjjH
 9DKRX3A7NIhLJlrS/OQPEvnQN+CksYA0Gvu3DCsJoewV1r4XQRbHLbXbTubhsYGy56ts
 1o+Cx1Wv+9SsifHoIA7Sb8YcwJezp9VXkSHpixbMMiGvPWlZEGjQBO0Tb0IebmN4aCe0
 pYoA==
X-Gm-Message-State: AOAM5307aIOsi9ZpVMHE6WWshb07k+AZnahLUBXkQhOoQ492df+YjgW5
 tV6T7tpaAo6wY3Ov/1FJ2Wacoax45KCSN31K5sU+Pg==
X-Google-Smtp-Source: ABdhPJzBJ0a1RKyXGgVUjURhVUjvgEyOiCYlDPmuJs4UESZye+YsfTJyHryTwlDEFmXWLETt6RpMeGgJp8T9UYEJPs8=
X-Received: by 2002:a17:906:8485:: with SMTP id
 m5mr28618305ejx.205.1605774388844; 
 Thu, 19 Nov 2020 00:26:28 -0800 (PST)
MIME-Version: 1.0
References: <20201118115646.2461726-1-kuhn.chenqun@huawei.com>
 <20201118115646.2461726-2-kuhn.chenqun@huawei.com>
In-Reply-To: <20201118115646.2461726-2-kuhn.chenqun@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Nov 2020 08:26:17 +0000
Message-ID: <CAFEAcA81CeW=RdrABuAZx2pL6L-nE_AaQ2vbryqm7amUbRjM-g@mail.gmail.com>
Subject: Re: [PATCH-for-5.2? 1/2] tests/qtest: variable defined by g_autofree
 need to be initialized
To: Chen Qun <kuhn.chenqun@huawei.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, 
 Hao Wu <wuhaotsh@google.com>, Havard Skinnemoen <hskinnemoen@google.com>, 
 zhanghailiang <zhang.zhanghailiang@huawei.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Euler Robot <euler.robot@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
X-List-Received-Date: Thu, 19 Nov 2020 08:26:37 -0000

On Wed, 18 Nov 2020 at 11:57, Chen Qun <kuhn.chenqun@huawei.com> wrote:
>
> According to the glib function requirements, we need initialise
>  the variable. Otherwise there will be compilation warnings:
>
> glib-autocleanups.h:28:3: warning: =E2=80=98full_name=E2=80=99 may be
> used uninitialized in this function [-Wmaybe-uninitialized]
>    28 |   g_free (*pp);
>       |   ^~~~~~~~~~~~
>
>  static void tim_add_test(const char *name, const TestData *td, GTestData=
Func fn)
>  {
> -    g_autofree char *full_name;
> -
> -    full_name =3D g_strdup_printf("npcm7xx_timer/tim[%d]/timer[%d]/%s",
> -                                tim_index(td->tim), timer_index(td->time=
r),
> -                                name);
> +    g_autofree char *full_name =3D g_strdup_printf(
> +        "npcm7xx_timer/tim[%d]/timer[%d]/%s", tim_index(td->tim),
> +        timer_index(td->timer), name);

Which compiler is so unintelligent that it cannot see that
a declaration immediately followed by an assignment must
always initialize the variable ???

thanks
-- PMM

