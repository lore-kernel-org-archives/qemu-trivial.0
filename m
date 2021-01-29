Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l5RZS-0001Fm-BY
	for mharc-qemu-trivial@gnu.org; Fri, 29 Jan 2021 06:04:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5RZR-0001DQ-Gz
 for qemu-trivial@nongnu.org; Fri, 29 Jan 2021 06:04:09 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:43933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5RZP-0000A1-Ne
 for qemu-trivial@nongnu.org; Fri, 29 Jan 2021 06:04:09 -0500
Received: by mail-ej1-x633.google.com with SMTP id a10so12354906ejg.10
 for <qemu-trivial@nongnu.org>; Fri, 29 Jan 2021 03:04:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GyLy5CJXM8DxYz1RorINlMAfKlOYmHyccVLg8bejyq8=;
 b=c6+Io+laVoRsuUxXJ24dvuFW8IyWbGW6/UTT4jzjYZfzrLeLypRcsnWAowDKTQUYVD
 ayn2Om0LRipPYOOCzJuYDiwP7KyzI/pv3Xl5iufqUkL3Tq8MAXbF95IjonKHB3Cr+L3i
 YEpLJrbj/c83QoBYcfKqp/tzPF2EjNlncfBlkWOatRV6z6yx43HUb0EKy6KK0oL0n55r
 hCEYJGnc3zRsR6gKJ/nZN844xkkoW20XBsJ525DPcWlNA3DlfPk6Odwk26k3J4rjSeH0
 CVn8iXbcxFwVGr4D7sZs/A6lszvNBaimocKI/X4HWRznX0bixUozwwCM2U3aAAmN04QR
 aiQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GyLy5CJXM8DxYz1RorINlMAfKlOYmHyccVLg8bejyq8=;
 b=a5/Ev9yFR/N7p18/QjsvEcl3B3SJOlCGVp9/LD6kiZksag528Vt7BPHRH1uNzcCKXJ
 4N5RFEIVXMTrn+Jz22NR9P1s8RTW+dKk44MW9b2G847oWRAzFX/CN7jCkCQueRyzPvsS
 1mw2P5wn1k/BlHhoPna4HBN1hu7K3hPPMQ+wJ64O9k09j5J3GKWdAheWAj5wfZ81luHG
 xpuv03r6B0lS/RgFbEpaD7ZmyE0BKYnsV75gx7aaARxTZHZCloZ+TdsgGMmLVXxmhwzx
 azncxjP18ypE9tPGve4PMEV0hqQyF25xkFjvlfkmABGWACWyxgRnoQVDNi2Mqg3dvX0R
 q41A==
X-Gm-Message-State: AOAM533slNCGCWJ5PRLgErQP1HZDapFYUJx2VDjlCCCJkttY9x7VtcE3
 b4Ydcd8xr5QxXpdsRQ6sIVNkBtlCRpA1zzz4SPaj6u+K2aU=
X-Google-Smtp-Source: ABdhPJwCh6eG/+0xeNuFdb6szdcrkEWzm2X9gTU64yFo2J91/FUVrubD4IQTpGuzvxXur1SF8OORYddMPfgvyxBn6Pc=
X-Received: by 2002:a17:906:2747:: with SMTP id
 a7mr4126776ejd.250.1611918244218; 
 Fri, 29 Jan 2021 03:04:04 -0800 (PST)
MIME-Version: 1.0
References: <20210129083236.584238-1-laurent@vivier.eu>
In-Reply-To: <20210129083236.584238-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 29 Jan 2021 11:03:53 +0000
Message-ID: <CAFEAcA83RCjeeO-9pyM52Vr_unGZe46JW=XmSN_28cE7jvoMvQ@mail.gmail.com>
Subject: Re: [PULL 0/4] Trivial branch for 6.0 patches
To: Laurent Vivier <laurent@vivier.eu>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
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
X-List-Received-Date: Fri, 29 Jan 2021 11:04:09 -0000

On Fri, 29 Jan 2021 at 08:34, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit 9cd69f1a270235b652766f00b94114f48a2d603f:
>
>   Merge remote-tracking branch 'remotes/stefanberger/tags/pull-tpm-2021-01-25=
> -1' into staging (2021-01-26 09:51:02 +0000)
>
> are available in the Git repository at:
>
>   git://github.com/vivier/qemu.git tags/trivial-branch-for-6.0-pull-request
>
> for you to fetch changes up to 77182df19f874adfc4ac98248606c154764baaa8:
>
>   target/rx: Fix compiler errors for build with sanitizers (2021-01-29 09:31:=
> 53 +0100)
>
> ----------------------------------------------------------------
> Trivial patches 20210129
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

