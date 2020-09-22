Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kKkPd-0003Xy-Nd
	for mharc-qemu-trivial@gnu.org; Tue, 22 Sep 2020 11:41:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kKkPY-0003Ut-8h
 for qemu-trivial@nongnu.org; Tue, 22 Sep 2020 11:40:56 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:35942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kKkPV-0000ly-Oz
 for qemu-trivial@nongnu.org; Tue, 22 Sep 2020 11:40:55 -0400
Received: by mail-ej1-x633.google.com with SMTP id e23so23562642eja.3
 for <qemu-trivial@nongnu.org>; Tue, 22 Sep 2020 08:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bxEFYgUY2cx5IyfVcmg6AKvwLa5SECy4vTVB6TWDcvY=;
 b=Q5M8i5xmb9LvuVb6GV3HTuBzvIBuGNyDy4jWhSgPGvAsTSonlfXgv72xVZksL/QjEW
 6cbMYlt2aaD0yalOieKdxYmq0CViBL7avjvxN3hvE1o/gANod+pr5XDwPoauuUAUWKzJ
 OpllQxYKN1lA9qY0z5k4v7DptUNoUwVGQH0zE1N7Uofq8RQMKvLdanRT/NGoKCZN+w9v
 r5Gtl3HiqGjEigoFBy/zn/EkD2Mio4ATNksek+2fCEYGXu5cqZJwRCKipH4idcizOVEV
 33iK2cu7PPmJLyffYZ778HUoElSJNagUBHxR1ssY2Vq+HNbtyT4qc4ep5eUl8Cig6v02
 /sGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bxEFYgUY2cx5IyfVcmg6AKvwLa5SECy4vTVB6TWDcvY=;
 b=E0365tR3qY3UXGjaNFNP+sbl0WOywvrlafzZGIx/Vosr4+S00cLoVnmnib5YB8koKk
 e6ktNY7fMBn9V+gekI1NnSrA8vmc0gPW8wi21vMoihYUZsslToZoQ3gyVdzKTbFv5TiI
 CIocodfapdeVC6jIZaDVikWrmpubrjpBCq647x28pJdXUaxZp/SSGeDslVZbk5HZfTms
 yj9R/T0wj7C3B8fEmzRPgSYLgVAkDBSXVH9AeV/tAgAZbkVannUVhJfzjjNbeghUHftB
 rg8df3LENr47b19IFZ2XYwJZ+GUDG/Gq+rZrihxazzq1HloY5kfsN6cqJRAS9gmjXPAD
 lXqw==
X-Gm-Message-State: AOAM530Kp1LXukVxkH70kU0JhJujnCL1wIsqI/J/PIje2qfBydPqQMT3
 ZqWPfwcOYXD00aXFZKpkKdvDREpSJXmhtCGG7gudrg==
X-Google-Smtp-Source: ABdhPJxPs/pvW/EsgJEAqxAEyLkhiWZyeZ6kNU9qmst4wLo3TewhyB37M2M8nU7nF+UtrO/i1n9tfEuOKVd1yjUQuik=
X-Received: by 2002:a17:906:24d6:: with SMTP id
 f22mr5498197ejb.85.1600789251128; 
 Tue, 22 Sep 2020 08:40:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200919184451.2129349-1-laurent@vivier.eu>
In-Reply-To: <20200919184451.2129349-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 Sep 2020 16:40:40 +0100
Message-ID: <CAFEAcA9g1uatatmumU5xEtuJ+wA8Zrk5aBvz6DFozVwjBWXUJg@mail.gmail.com>
Subject: Re: [PULL 00/17] Trivial branch for 5.2 patches
To: Laurent Vivier <laurent@vivier.eu>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
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
X-List-Received-Date: Tue, 22 Sep 2020 15:40:57 -0000

On Sat, 19 Sep 2020 at 19:48, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit de39a045bd8d2b49e4f3d07976622c29d58e0bac:
>
>   Merge remote-tracking branch 'remotes/kraxel/tags/vga-20200915-pull-request=
> ' into staging (2020-09-15 14:25:05 +0100)
>
> are available in the Git repository at:
>
>   git://github.com/vivier/qemu.git tags/trivial-branch-for-5.2-pull-request
>
> for you to fetch changes up to 639b090df52a4952262615328a3fdfae81234ea8:
>
>   contrib/: fix some comment spelling errors (2020-09-17 20:41:44 +0200)
>
> ----------------------------------------------------------------
> Pull request trivial patches 20200919
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.2
for any user-visible changes.

-- PMM

