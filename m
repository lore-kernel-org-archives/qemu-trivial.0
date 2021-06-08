Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lqXHi-0005UH-Sm
	for mharc-qemu-trivial@gnu.org; Tue, 08 Jun 2021 04:40:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqXHg-0005Qg-7H
 for qemu-trivial@nongnu.org; Tue, 08 Jun 2021 04:40:29 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:43623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqXHZ-0005cW-Mn
 for qemu-trivial@nongnu.org; Tue, 08 Jun 2021 04:40:27 -0400
Received: by mail-ed1-x531.google.com with SMTP id s6so23574071edu.10
 for <qemu-trivial@nongnu.org>; Tue, 08 Jun 2021 01:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xG+VIN36W4AZwAJtcYTsqAwGYYWdQVJltWSv5S9nsr8=;
 b=WvWtiyvn90tAJg9+gdNET4l7AF4Y/rroanooPspxiJgb1CcxPAaU3uOnEF3Zn2V8QX
 DBK1r/lsjYrxrC7zW8pgHDkjRENKuydtmAOcpT6L1XWfPHd9l/26BKjxp8tKI+ktBeIu
 Sj4oTm8NiT5ZOZHdCzc2eGakPVYOsj7TI1eh+GyGZiuZXyxrCMsgVMuy3ePIT3aZfJyX
 SFVbbgLT5GWLGDGo2rEYGQ8XR0SpGxKMHLrXreLYx94jcD0PEjrtbZqjucNsoixXYrEz
 YUO3qQvmf5FF83mo1opaBm0lgiqdpdJsD9dYASNjAWLhx5/ZVic6l7yHUvUo0rnG+6Ct
 ndvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xG+VIN36W4AZwAJtcYTsqAwGYYWdQVJltWSv5S9nsr8=;
 b=r0Uwq4didghSbn5R95L1G2p0ryA8cY6jz1Mguw4MWofzVFStKqUcgqDwLkJ9TY1tAn
 Q5b4JLm5Wl0pzHajGpB9+Rnb86KbXqPLRhLxQs/37EeHJTt6sVnhCLKYtLZ4uHLcTZcw
 q8/IeZexSgl66bxx0Ab8BLOkEvjcrJyLUSl76Pp9eQO5pu9HbwPZNzoi2w+Xrpx9/xqa
 vZmbRBsv36Ra4TP4FNbL7WtqL5u5FUtFPPe6q6tNGY/M2ydY3CT4KP/q1S4Ma5dE45jr
 J+PZuhVXIJIgZPPuOqXRdpzx+7bbO+wBpw2V5glec2+I3+VzCLpBmcgjYHeR4WOrtW83
 VnCA==
X-Gm-Message-State: AOAM5333mLCz4cW3WolPaXayrofWIulNk3gG4eP7AGZ591Q+M9Ac+3yt
 cyy8LiHZGipqB2GTG2/l/4EtUJkap+0j14ZlFccuSQ==
X-Google-Smtp-Source: ABdhPJxAt9thdlKIqn0c9RItEBEfnekIxy2iu0mGaT8PM7hm5G8fbF1xhIx2rUe3/TjYEznCvLYJH/GJaUi/ltZJDIg=
X-Received: by 2002:aa7:d755:: with SMTP id a21mr24657357eds.146.1623141619203; 
 Tue, 08 Jun 2021 01:40:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210607185730.346641-1-laurent@vivier.eu>
In-Reply-To: <20210607185730.346641-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Jun 2021 09:39:45 +0100
Message-ID: <CAFEAcA_y-At8tWadkdK5i45TzeGGU+M_5awnx6ad1Cbqrwuv=g@mail.gmail.com>
Subject: Re: [PULL 00/11] Trivial branch for 6.1 patches
To: Laurent Vivier <laurent@vivier.eu>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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
X-List-Received-Date: Tue, 08 Jun 2021 08:40:29 -0000

On Mon, 7 Jun 2021 at 20:00, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit 6f398e533f5e259b4f937f4aa9de970f7201d166:
>
>   Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-tcg-20210604' into staging (2021-06-05 11:25:52 +0100)
>
> are available in the Git repository at:
>
>   git://github.com/vivier/qemu.git tags/trivial-branch-for-6.1-pull-request
>
> for you to fetch changes up to df77d45a51412ca84abd7f1490b48c1bccf07057:
>
>   vhost-vdpa: Remove redundant declaration of address_space_memory (2021-06-05 21:33:46 +0200)
>
> ----------------------------------------------------------------
> Trivial branch pull request 20210607
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

