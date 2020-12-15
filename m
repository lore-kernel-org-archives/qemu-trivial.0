Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kp93h-0006dt-KE
	for mharc-qemu-trivial@gnu.org; Tue, 15 Dec 2020 07:04:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kp93f-0006am-A8
 for qemu-trivial@nongnu.org; Tue, 15 Dec 2020 07:03:59 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:44023)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kp93d-00068V-IY
 for qemu-trivial@nongnu.org; Tue, 15 Dec 2020 07:03:59 -0500
Received: by mail-ej1-x629.google.com with SMTP id jx16so27279257ejb.10
 for <qemu-trivial@nongnu.org>; Tue, 15 Dec 2020 04:03:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=01cXpZdWDwdTL+YKu3xh8zJlKwB9s64ctlCEMuj2Yqg=;
 b=hmambKAZVwxJ122hfqjuMadKI/odgK03SBV6pJIuf4KRl6Bx7WFPDWCQ8wvh7hywiH
 wp4i1mUh40/S9LYupYuzRBGjBQCiarqNn9pmXDGeYiT1gp0BZ/XjDgX1Lhf7Q+VXadww
 ZTIZ/TlryFQ8MAogNoUsxr8QuFt9afW/yrrLe08QcXDFOA19wlJwYqoJz0OD6xrGHMZ1
 /jhACKuk13igFMjkaqBDxuoO2h9cRqCuqRwVhwxyTiB9SRmA+bIuQK7DpB09J1GVhFRI
 qiEBbT7NDFclJZ+nBOrZIatIeE1k+2mXp2kUf9Kgg+GxJwMrLXdJEjCtLoxvHiBPRDvE
 OgJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=01cXpZdWDwdTL+YKu3xh8zJlKwB9s64ctlCEMuj2Yqg=;
 b=JwNiR+fTD3Ix/QEv9+vjyonZ6AyXeO28uyVEWD7C5IyInwxTc4XREeyYPcAdZmN71w
 7p2kjSEbvkI4w9bZ4k4IUOlUmtLXFqbHUxfU44MN6R8IAIq8zus6RlQ/XcEvQMrW7D69
 J1xqGuBT4lzDtue9jDVD91/h7piQ8MRmRmU1SB7+v4z4fqQzC9tSemyMjNOBLbN+AcdL
 fEZd7NMdy8SSp4J4xhKgekQLIgTmaxUegOzJ9vsLrDM8LhHLIGjHgfJNa01Ph/c8Bhv8
 elAUzU1bEUjnPVNOR8o3KAdqtvhTEzX3NIBxJ1oyYCF7IzxImJFQqZ7rUrmYHb0Buzt6
 ZnbQ==
X-Gm-Message-State: AOAM531Ruvn1RcUOLnfyeTeJOBuO+bpjXReTEOQPcRlCCDL3tHBDMLf6
 y6SYXCZ6tvOyoDPL00Aw6iZvseDwZgIVjsqRfbi/bw==
X-Google-Smtp-Source: ABdhPJyt7v4lS7g3av+2ZZORZmUmepAvJbYia+ylQmxhTejzRkdBLUMsCD9nyu37G0vzrmtAPHUBk/3qILm+PxF1p28=
X-Received: by 2002:a17:907:971c:: with SMTP id
 jg28mr26592761ejc.85.1608033835424; 
 Tue, 15 Dec 2020 04:03:55 -0800 (PST)
MIME-Version: 1.0
References: <20201214155733.207430-1-laurent@vivier.eu>
In-Reply-To: <20201214155733.207430-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Dec 2020 12:03:44 +0000
Message-ID: <CAFEAcA9ji4Hn1nOOAOgomRK6YvJd3G87bbWsgkaV4ihBxy0PAA@mail.gmail.com>
Subject: Re: [PULL 00/19] Trivial branch for 6.0 patches
To: Laurent Vivier <laurent@vivier.eu>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
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
X-List-Received-Date: Tue, 15 Dec 2020 12:03:59 -0000

On Mon, 14 Dec 2020 at 16:06, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit 17584289af1aaa72c932e7e47c25d583b329dc45:
>
>   Merge remote-tracking branch 'remotes/vivier/tags/m68k-for-6.0-pull-request=
> ' into staging (2020-12-12 18:33:46 +0000)
>
> are available in the Git repository at:
>
>   git://github.com/vivier/qemu.git tags/trivial-branch-for-6.0-pull-request
>
> for you to fetch changes up to 48f670ecfcbe92f63475c516aefb6e217f469bbf:
>
>   configure / meson: Move check for linux/btrfs.h to meson.build (2020-12-13 =
> 23:56:16 +0100)
>
> ----------------------------------------------------------------
> Pull request trivial-patches 20201214
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

