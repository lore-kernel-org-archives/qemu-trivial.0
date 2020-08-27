Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kBFkM-0000fv-Me
	for mharc-qemu-trivial@gnu.org; Thu, 27 Aug 2020 07:07:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kBFkL-0000bx-E1
 for qemu-trivial@nongnu.org; Thu, 27 Aug 2020 07:07:09 -0400
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643]:42069)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kBFkJ-0007w0-AR
 for qemu-trivial@nongnu.org; Thu, 27 Aug 2020 07:07:09 -0400
Received: by mail-ej1-x643.google.com with SMTP id j25so7069023ejk.9
 for <qemu-trivial@nongnu.org>; Thu, 27 Aug 2020 04:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NcFQCh/pwj5JpIFEsK0KeHer9AoG967avch5EL9zFHc=;
 b=r2DOuKTCUAvtmjIXOeXiU/nHsh/V+Jzdgmz0yUGw0cbEUqJJrce8W+zf82VZKGZhCp
 ZODgP153/5MYTR5GUsLydiAyZ1T1J6JyAfSGOOUTAncKNIq7oJ7wIyxyCxyiiR17oesF
 rjJ0vh6kzHAkf5HvDnTqyJs9rY5ElwtwcjvS41HSy8OlQbzzueqOIhk3qCFf8iCXj7Jg
 v+Om0SY4/Fs6fF5S93N+r1AvoiOnXQx3dRwtOUs+UcyU+Kx8KGHgcUrHGiacuhk1gQ7G
 0JwCz66HPx60gaKLYaiKZeSuyQ3dTfNXGSITAzmBWk1f1Uxg/3+OFGLKMm12wDbSXG3Q
 ORnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NcFQCh/pwj5JpIFEsK0KeHer9AoG967avch5EL9zFHc=;
 b=lDZw35NFlaZANxOc2LnZcuczQ08Nd5J0QZeseEy+33oOohA65z3e1e99NoIxWJHSqu
 ROtJAMvLSmW0PWBiWOhH1y47YeVbU7RsFxFvcSV6ZqwBRY4yF6TBXEPlWMbabG7HCVkB
 T3pGKfOzkq6MWIZzfNlVL3UqiFhCjBU/aNuQ+gG4lImocAWwGIafCH68Wtgw11/Dq4he
 BdLXyqiaTBFhX1c1lMBkSJP9PrZrOsYWIF+bhGjChyX8BGWTy+vQTS85FD8/76AXYoTL
 THIFHyMKrF4SjLvueeN6TClD5jHAhkv6Wq7L6qi+2ESohc8wwxYsGMK39DYVHJzIfyhM
 lSgg==
X-Gm-Message-State: AOAM5330D978YEUnXocibIi+FLIxk9C1FO4+MovZM8o7zQAVhMdlMZdU
 /iEKscBWHluy2fDgNCkCGNZhbAkhRmAD4G9duWB6aQ==
X-Google-Smtp-Source: ABdhPJzoSW5+SRJOixZA/zUjBv3z3x9KA0TcnrqzbsL3O9+YzXiMNyPvJ28B3sDB3NWkbeFsl8N0PsCW2CCqv2esSlw=
X-Received: by 2002:a17:906:2cc2:: with SMTP id
 r2mr20048873ejr.482.1598526425506; 
 Thu, 27 Aug 2020 04:07:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200827110311.164316-1-kuhn.chenqun@huawei.com>
 <20200827110311.164316-10-kuhn.chenqun@huawei.com>
In-Reply-To: <20200827110311.164316-10-kuhn.chenqun@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 27 Aug 2020 12:06:53 +0100
Message-ID: <CAFEAcA8t1oo4B3KUm1kLzFV0R6L=_Z07cDcsSomP8UKRwMMjSw@mail.gmail.com>
Subject: Re: [PATCH v3 09/10] hw/intc: fix default registers value in
 exynos4210_combiner_read()
To: Chen Qun <kuhn.chenqun@huawei.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, 
 Pan Nengyuan <pannengyuan@huawei.com>,
 zhanghailiang <zhang.zhanghailiang@huawei.com>, 
 Euler Robot <euler.robot@huawei.com>, Igor Mitsyanko <i.mitsyanko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::643;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x643.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
X-List-Received-Date: Thu, 27 Aug 2020 11:07:09 -0000

On Thu, 27 Aug 2020 at 12:04, Chen Qun <kuhn.chenqun@huawei.com> wrote:
>
> Clang static code analyzer show warning:
> hw/intc/exynos4210_combiner.c:231:9: warning: Value stored to 'val' is never read
>         val = s->reg_set[offset >> 2];
>
> The default register return value should be return 'val'.
>
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
> ---
> Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

