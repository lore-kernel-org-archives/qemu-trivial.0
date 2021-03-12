Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lKeaU-0005dJ-Ml
	for mharc-qemu-trivial@gnu.org; Fri, 12 Mar 2021 05:00:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKeaI-0005Zk-Im
 for qemu-trivial@nongnu.org; Fri, 12 Mar 2021 05:00:00 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:42624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKeaA-0001K7-DR
 for qemu-trivial@nongnu.org; Fri, 12 Mar 2021 04:59:54 -0500
Received: by mail-ej1-x635.google.com with SMTP id c10so52127071ejx.9
 for <qemu-trivial@nongnu.org>; Fri, 12 Mar 2021 01:59:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5dDQABMaTprCsRbhCVLhXU6zH90nj3FDfajnq6VWCrE=;
 b=dta4TNXxiOdYby91NrmmntN/uWTVHMdSgpgR3SRpdnrrQa6gjdwFqT9Q45GGHz/RUD
 HqxUF/ogqyXXCRL1XkdtBP29KRgR038wyujYAv5q30hk1Veyt/LavYPsoXncwcRBRGFi
 AUmUr31h06uk3M6BdBSuC3xUbfFSKAUpqKVZOdh97u3f2e1Nz240ggil2GPIo3Uatsbt
 scJica420LuENSpCz+HwvzmwspaSvrliROFnWPZWukpqJu5Z15wDNWRpp//FsFV6FAY/
 hnKmuZ3wLuuWMJFl21/Np3gykGyHVKaaM4xx95xFUECaa8VdieuGXA5Z7JlRMxfXNX8s
 pbIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5dDQABMaTprCsRbhCVLhXU6zH90nj3FDfajnq6VWCrE=;
 b=TGbA/WqUukyP/ebeZ9G3uC5ThKfWNGf5bQou88mAGHKkDR4iPExzPD9BGfGK4qu5os
 veenufUF+8HjaMcGMF8QfbXJz5F8/im2tkNFNWgrBF1ai5u2PNuUFfUFRa1l57noFwCc
 mNct3Bra7n7pRiLuP7Z2dvAEQ7r6SWuAxxIEFhsPICqFJzSlZHKjCOkHqNrLOp8LNOrS
 PbFuyNcIedCyKTGNzdo3aGm5zxq86D/SrAIEdgzxS+ryesJzW9J1ZxRBvj53BEMUnL9S
 BMGmtamZmYJ6DGQ8VMzltKQRmclFleM6Ni3AjCurFYtzIFZmzDGt3WAbd223Hxv9mUIu
 yQVg==
X-Gm-Message-State: AOAM532k4GJ1B0cbkncOi9DMqyakdqfi5++sDBKzOxvsQgSwMYIYq+rx
 LansWHRkZcdtX9rvk8d3qJEsVhPSIjWWXVppO0MM1A==
X-Google-Smtp-Source: ABdhPJxyFozcLZ7UC9+z1+0lVD3kd8GyDrSMqzvv5HLWbsotBD6mIoAclnyCppKXUwSxjIIfKBf34AcMehwNLSYCSnc=
X-Received: by 2002:a17:906:c301:: with SMTP id
 s1mr7481157ejz.382.1615543180863; 
 Fri, 12 Mar 2021 01:59:40 -0800 (PST)
MIME-Version: 1.0
References: <20210310214504.1183162-1-laurent@vivier.eu>
In-Reply-To: <20210310214504.1183162-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Mar 2021 09:59:22 +0000
Message-ID: <CAFEAcA-9GNdUZ3os2Dqi7ojkLKA6bzh-+rFH1XPcJHZjtMF=mA@mail.gmail.com>
Subject: Re: [PULL 00/22] Trivial branch for 6.0 patches
To: Laurent Vivier <laurent@vivier.eu>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
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
X-List-Received-Date: Fri, 12 Mar 2021 10:00:02 -0000

On Wed, 10 Mar 2021 at 21:47, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit b2ae1009d7cca2701e17eae55ae2d44fd22c942a:
>
>   Merge remote-tracking branch 'remotes/mcayland/tags/qemu-sparc-20210307' in=
> to staging (2021-03-09 13:50:35 +0000)
>
> are available in the Git repository at:
>
>   git://github.com/vivier/qemu.git tags/trivial-branch-for-6.0-pull-request
>
> for you to fetch changes up to 538f049704e9b7a07eeaf326af772fdd30d89576:
>
>   sysemu: Let VMChangeStateHandler take boolean 'running' argument (2021-03-0=
> 9 23:13:57 +0100)
>
> ----------------------------------------------------------------
> Pull request trivial patches 20210310
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

