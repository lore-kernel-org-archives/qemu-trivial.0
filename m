Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rrcWC-0006hw-7a
	for mharc-qemu-trivial@gnu.org; Tue, 02 Apr 2024 07:41:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rrcW5-0006h2-W9
 for qemu-trivial@nongnu.org; Tue, 02 Apr 2024 07:41:28 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rrcVz-0003mO-E3
 for qemu-trivial@nongnu.org; Tue, 02 Apr 2024 07:41:22 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-56c0a249bacso6125331a12.1
 for <qemu-trivial@nongnu.org>; Tue, 02 Apr 2024 04:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712058077; x=1712662877; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=iXdhEj8D9AgaXWEHfz+JRhRCKc5icpIRdo3WoQFTrus=;
 b=zSSswM0WBL6cW3Lu6bzS8/voW+lKdTdcZFnsadT5glUZbR3piXTBPR1ej9e0Bb7H5O
 prQ4vJi/fN67lYPvPFBvhtfX6vs6xv9W4FupOKA/dOewMSVgQRl6mhsUc7PLBcQyEGF2
 Kq6K4kXpdtM+0MaXOlecYA8pE6A5wjc6KCFtfvPfqVGupP5a3w1cblTZ7Pdf3y/mwlBQ
 hg9bcMAgpcXGUV20XjxG/wq45SYe7ShSRtRg5LWkaEBliXW4Mh6biroNop73hri09jh+
 J9Dktcywv62noRZpgV/nHF5S6EREt5cwa1bF+Xrc7tJrc2xE5LXsB6mSwQ68MJmYlDPS
 J0NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712058077; x=1712662877;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iXdhEj8D9AgaXWEHfz+JRhRCKc5icpIRdo3WoQFTrus=;
 b=m0p0P90Ur4tiF3Wd9ePcPXtBcJEby/B/Y55pL0xxuUOjwosSgrcktCWjmx0kk54Rxg
 EN+m3qMsMamKq1n5lXmYZgIa51IoD9E285EOdQ2wEeggK6KQ0Yqx/+8SKi+nMniyxCOy
 w1Slw8RrxY4r0tru4wL9GxhGrl2ozNgEtZKhWtHQywmJs0+IJpY2H4KdRwJkkerd7pg8
 YbG4Vq9O6iFYC+/9ye5vsqJtVBaI/uHCxPjdYuaZPBYDUrXsk/XevBX1ZVENqF2V98gU
 lHSWYk+BuDK91M0c7FCcmyyA+IwbYERz6SFzDeB2GbtzLi7uxS/f5NWqH3ANXUEk2Tjr
 bsMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUp/gig4WPN63dRJed+7/OllUXemlBY6CJpMBZlxAscoJAD6aa/NOA0oLexU1ScjCGH7lBrfWz2+L5o6mWw+D2NYeRzgwxNA==
X-Gm-Message-State: AOJu0YyjGpKHBelN0UbWWWy+it0AH2U6zpr8BKpAeiQlunDUWepdDsC7
 MgQ45S4PeZPBbwrVLAH7jDzghhjhNbdXg0voxd453BXH0ZVghb3DaCyjOGIzGp21FxZE2o5MeYG
 IsMgW6vCcYdk5iAqIOMciQa5HCZjQgBU7hMXSqQ==
X-Google-Smtp-Source: AGHT+IHtPeRVVZ3PuTPjmKdSEl44gpdmnFDh/FDVhYD+bG+DmcPDEeeNt/Ff6sSoiwd6n68sT4IOtFI+2d/1xA56gFc=
X-Received: by 2002:a50:c04e:0:b0:568:bc48:5f27 with SMTP id
 u14-20020a50c04e000000b00568bc485f27mr8309298edd.39.1712058077333; Tue, 02
 Apr 2024 04:41:17 -0700 (PDT)
MIME-Version: 1.0
References: <20240402093157.2931117-1-mjt@tls.msk.ru>
 <CAFEAcA8UBewAHriNkbJNO9CFKgf5bBGRHntbb_y11JdfoNTvcQ@mail.gmail.com>
 <60faa39d-52e8-46f1-8bd9-9d9661794880@tls.msk.ru>
In-Reply-To: <60faa39d-52e8-46f1-8bd9-9d9661794880@tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Apr 2024 12:41:05 +0100
Message-ID: <CAFEAcA950hP1vb-aVSFOvAmG3n2cjTsU524AsYBDAseSZh+Q4A@mail.gmail.com>
Subject: Re: [PULL 0/4] Trivial patches for 2024-04-02
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 02 Apr 2024 11:41:29 -0000

On Tue, 2 Apr 2024 at 11:41, Michael Tokarev <mjt@tls.msk.ru> wrote:
>
>
> > Author: Stefan Weil via <qemu-trivial@nongnu.org>
>
> *SIGH*  This happened *again*.
>
> > (you'll need to tell git log "--no-mailmap" to not get confused
> > by the mapping we have for the last time one of these slipped
> > through...)
>
> Now this is interesting.  And this is exactly why I haven't noticed
> it - I did pay attention to Author lines this time.  -- because
> it is displayed with mailmap applied.  How very useful.
>
> I have to use `git show --no-mailmap' to see the original " via.."
> version.

FWIW my apply-pullreq script makes this check for this:

if git shortlog --author='qemu-.*@nongnu\.org' master..staging | grep .; then
    echo "ERROR: pull request includes commits attributed to list"
    exit 1
fi

(This doesn't pass --no-mailmap, because git shortlog doesn't
take that option, and the --author match is done on the "true"
author, not the mapped one. This is the kind of orthogonality
in command line UI that we have come to expect from git ;-))

-- PMM

