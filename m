Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1liiW3-0000I3-Ba
	for mharc-qemu-trivial@gnu.org; Mon, 17 May 2021 15:02:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1liiVy-0000DP-0W
 for qemu-trivial@nongnu.org; Mon, 17 May 2021 15:02:54 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:36466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1liiVw-0006oC-4E
 for qemu-trivial@nongnu.org; Mon, 17 May 2021 15:02:53 -0400
Received: by mail-ed1-x530.google.com with SMTP id df21so8180105edb.3
 for <qemu-trivial@nongnu.org>; Mon, 17 May 2021 12:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Dc/uVxtGEsmWH51jmQ0+qJMZNzXGxQ9tLIwrv0+DYhs=;
 b=SAT598vBQ7iAUaROYDYcsx2xs7ysScm5MHXK9T1BwESZQVconOelQ5eKX/YMY0PQYK
 Omh2rVQMyN2ecrp4uBUR1+/AHC0TuVMGdrpnOL6ac0zjuOcwkzXon3CD0eXkmab4w2dv
 +Nuz7rItU349b4v1vE4SOf/3g+hRyoqSFUMfqVbED4ZUbhoCTsAtyLcAuwYTd90g5LFn
 +RW5tdQrOv5VjzNcZNJyJgnPnI75ubdLi8TJslWCj4N6FCMbuxHG+8+YCIYxhC+Ox8Vi
 yV8i4J9BUJamaeYruqoY9po+SR7kxRJ4mdZf/db7Z8VSoZXw3UgJvIcRP1XOQ9vyZKWf
 4Qew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Dc/uVxtGEsmWH51jmQ0+qJMZNzXGxQ9tLIwrv0+DYhs=;
 b=bOWY5HKceMvuHktHSoLKtTDvQ8BmYFShc2AA480oJsaNr0Xaczm7UPvwWy5TmC4Evo
 uBzdjrMFOYkWbHCiwpQhTaYDB6iYLbUTCZYivTHVD3Fk/2AUgp+lyfg+YLe36nyj+iC0
 BKG4rOUJMLmRuBIuSdolOGP7MmxiC1jTv+6e+px2lgamokbhy2djuxgummrchq2D9oJ5
 HSngKNq5a4K6uQzGWKnfdArJwHe+GEouZeBx8wS1EwaAVEux3YmrWH1sfe0sleAHtQCU
 dU/jeZGJ8VWxOGnn1Vi68cDvBFayNO7DajyHyrhaQ8/Qi6nOtj2Fv4lgwUSsUPunNcbt
 2P9A==
X-Gm-Message-State: AOAM533KJo7YCDKO9p1xpXyI4XxXRerTCMtfMVpaHj+Z5SXs0lYIVk4z
 qSVuvLwiZ/VxYaGKSfvsTf3gMWaZSgraXDN1pXbhWg==
X-Google-Smtp-Source: ABdhPJxsz0s3AlRb6PkmCl58aH6egNgr06p5oK7/8bxsVbNhwMjVsoOl8wQcZgJT2nOOoPgN+AvVn5RQ9+mOlAMHKCI=
X-Received: by 2002:a05:6402:416:: with SMTP id
 q22mr1864461edv.204.1621278170596; 
 Mon, 17 May 2021 12:02:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210515100335.1245468-1-laurent@vivier.eu>
In-Reply-To: <20210515100335.1245468-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 17 May 2021 20:02:35 +0100
Message-ID: <CAFEAcA8YLicpSrHE24ZhjmJ8GrJFMNAax8pTT3C_hduLf2be-Q@mail.gmail.com>
Subject: Re: [PULL 00/16] Trivial branch for 6.1 patches
To: Laurent Vivier <laurent@vivier.eu>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Mon, 17 May 2021 19:02:54 -0000

On Sat, 15 May 2021 at 11:07, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit 3e9f48bcdabe57f8f90cf19f01bbbf3c86937267:
>
>   Merge remote-tracking branch 'remotes/alistair/tags/pull-riscv-to-apply-20210511' into staging (2021-05-12 17:31:52 +0100)
>
> are available in the Git repository at:
>
>   git://github.com/vivier/qemu.git tags/trivial-branch-for-6.1-pull-request
>
> for you to fetch changes up to 29f9c636894c462fa54fad08049e51877905e93b:
>
>   target/avr: Ignore unimplemented WDR opcode (2021-05-13 19:18:42 +0200)
>
> ----------------------------------------------------------------
> Pull request trivial-branch 20210515
>
> ----------------------------------------------------------------



Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

