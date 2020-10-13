Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kSKkK-0000Wh-MW
	for mharc-qemu-trivial@gnu.org; Tue, 13 Oct 2020 09:53:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kSKkJ-0000Uw-79
 for qemu-trivial@nongnu.org; Tue, 13 Oct 2020 09:53:43 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:44828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kSKkG-0004Jt-8l
 for qemu-trivial@nongnu.org; Tue, 13 Oct 2020 09:53:42 -0400
Received: by mail-ej1-x635.google.com with SMTP id a3so28346568ejy.11
 for <qemu-trivial@nongnu.org>; Tue, 13 Oct 2020 06:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=U/eqp0B9foMZv0Z94rbZKLVxmZglCcFqsiFehliRorw=;
 b=AirjSVkHDc5yLGJytnAWzyce53n0WfYjJ8VTcXoQWULy3rfCTsoSBHgqlbvknw1oaH
 Vpxm/A4KzuE1rjK5B3/cAWK4Ok3cA1eWoAAuwTg61sZSPwFbodYNZOeSnP17pKQV7i+d
 xw6pYkHX9F1Oz4uKjKfQRjbpQ/8fHojFzTFyxHy37a3Xq3++5cd+QY7Bstvgumgtc3Ch
 mJvSvYECJPmGmUA8RNHyOZNkYBfXPyD9kkAigTTdXuhVyt6EeNkmK7BOvfqvpE4ny542
 Fb4bXTtJimqrSnNAEtSvm3melLLvTYoOK3SSB6hms6ryTCxb65nosTeFBZm6ko4beG4a
 jyNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U/eqp0B9foMZv0Z94rbZKLVxmZglCcFqsiFehliRorw=;
 b=deRa9C4smNfzldmS6B75Svk2LkE/zwpjFCph3y6E/gGc9rUQIiR5Lz1Ep3Xw1UwXu2
 yznkJ3yFIazRQyK1z382y9ubHgbhXtHgy0Xk3t+vZMmRNLV5weD2qyWpwbyhknhe2hcX
 /G5vTNZqs9kX2DlqgLxXALNU3MmTOoTTzHocap4vOEOiVlPdnB+Si6zjhQDH68UVN/9w
 ukRnW/cp0z/h6MBmyLi+JBvYslNJjpkJbYvp+pkvgB9vKMGMSpqfB4to/f/SneaAoa2E
 Ukx7q+Q5D5uSzDBi5ZOmbzYWxRtNR51EInu9R6HNPR+iSd1pYTIrdrxhi/yN7g4FSIAk
 ARQg==
X-Gm-Message-State: AOAM531FQrx0QOap13kqyTGXCNJy07TSLHsk7IiVHoMX0URZ+Q5L6kpm
 Vl+dvPaDuFLSVlDNXHOlmQEiB502MINVmT5qcjxjHw==
X-Google-Smtp-Source: ABdhPJzVu41+mBUe4RXs6W6YdZqFty23rTanmUQ3e4vVYFzbDQRzOSb43Oj7Wyir8dd2wfn7zfEUtxWcKaPuvu0NDdQ=
X-Received: by 2002:a17:906:60d6:: with SMTP id
 f22mr33527684ejk.250.1602597217947; 
 Tue, 13 Oct 2020 06:53:37 -0700 (PDT)
MIME-Version: 1.0
References: <20201013115052.133355-1-laurent@vivier.eu>
In-Reply-To: <20201013115052.133355-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Oct 2020 14:53:26 +0100
Message-ID: <CAFEAcA9G_3xYJOar+Afo1w8WNmh4g5d0qwsZi=ikO-jAOEqcJA@mail.gmail.com>
Subject: Re: [PULL 00/14] Trivial branch for 5.2 patches
To: Laurent Vivier <laurent@vivier.eu>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
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
X-List-Received-Date: Tue, 13 Oct 2020 13:53:43 -0000

On Tue, 13 Oct 2020 at 12:53, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit 2387df497b4b4bcf754eb7398edca82889e2ef54:
>
>   Merge remote-tracking branch 'remotes/armbru/tags/pull-qapi-2020-10-10' int=
> o staging (2020-10-12 11:29:42 +0100)
>
> are available in the Git repository at:
>
>   git://github.com/vivier/qemu.git tags/trivial-branch-for-5.2-pull-request
>
> for you to fetch changes up to 6125673eaf711247405e796604204bb7d74090f4:
>
>   meson.build: drop duplicate 'sparc64' entry (2020-10-13 13:33:46 +0200)
>
> ----------------------------------------------------------------
> Trivial Patches Pull request 20201013
>
> ----------------------------------------------------------------

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.2
for any user-visible changes.

-- PMM

