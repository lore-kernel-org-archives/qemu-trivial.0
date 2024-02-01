Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rVUjl-0004mv-0w
	for mharc-qemu-trivial@gnu.org; Thu, 01 Feb 2024 05:56:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rVUjj-0004ml-Tz
 for qemu-trivial@nongnu.org; Thu, 01 Feb 2024 05:56:03 -0500
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rVUji-0000pj-6n
 for qemu-trivial@nongnu.org; Thu, 01 Feb 2024 05:56:03 -0500
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2d0512f6e32so10559661fa.1
 for <qemu-trivial@nongnu.org>; Thu, 01 Feb 2024 02:56:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706784960; x=1707389760; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qN6y19UcwMAgqwLDkEu9hiGfYytXq+mtCzfkER94cME=;
 b=HMb6YpR6j6rTWCjGK881zjvzIzSrM/m2QlXe0n1FHnuAHERe72mjLfVfMlr59DkZwq
 dhQeBKbSuQQhgNWmoBq5bCbdOJmO2ZedOPCy0SYTkH40KmOpvDY/lkIAhJBIdvE9cJsF
 X3nQlmnocDw+Kn2eoXbW8W66E+kt6ssQiovP8CC+PXYmBwJxOmQLaUFK3uYv9oOLJF/e
 wMgphtkUzI6od9croyNN9CYG7z9p0qmCBcyTEOC7BAgfZmsG6Yll3DeI1SQzpFN354Hn
 6PsFO1CMlZdUyi7RfBJC3xPCResQEqhXDr7uKdvIou7/CcsCdjo4yqdr1QyzFhnzA8J2
 n38Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706784960; x=1707389760;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qN6y19UcwMAgqwLDkEu9hiGfYytXq+mtCzfkER94cME=;
 b=c3O3fmIGDcRTQwMjWS8Rd5KfI52CNedy48ZOb8RKNo4oSRCwrj8U9KNR11yee5mcCF
 gTWZ+GZbdYe1DLjKoNXjztXZQfDSt8rBewM8dYvWxRnxJWE8DU7pYfJOiT4di6o94YK5
 T8NJRlSRL/FseeWggZ+XL+Cw1IudMEE9hC+a5RtYghmV2pbDiLYcIuAUUr5Hs9SpqwvW
 psv7QXheIRhCoER7YSP5OwQISw5dpFAMvkedmQh95hMP626r15Aa+qYGiOOfpyuhUR2w
 UhcqboBNtkxoyLiEQWg2TosZRL9Bm/k1ACPi2oJ5OJ0PXNbvkefR774TONCDc2tRvJmY
 9yuQ==
X-Gm-Message-State: AOJu0YwLC6oonb1zArn/4ZkeBomjzcqAI8gvZHw3pcbOd/HShrkv8Ozp
 puw460vAuYSDRs8I/nJYXjnekkvkC9LktcY4j2MTBAcKDm4Eg99On+SSZanCJIJh82ivLIrQMzj
 NTs2/z4iI34QErXjw64SJxnW5YELYIf17FJpjNQ==
X-Google-Smtp-Source: AGHT+IE2TI+//8Dg8Vubx2KRqv+Lxyu8AVNu6r2Sg2rYQ4HeDSJxXZmqLSWtlic7rBDaDkxqj7Da4xkrYZNbEN7Ddeo=
X-Received: by 2002:a2e:7e06:0:b0:2cf:19bb:12f with SMTP id
 z6-20020a2e7e06000000b002cf19bb012fmr1238751ljc.2.1706784960479; Thu, 01 Feb
 2024 02:56:00 -0800 (PST)
MIME-Version: 1.0
References: <20240131115549.2263854-1-mjt@tls.msk.ru>
In-Reply-To: <20240131115549.2263854-1-mjt@tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 1 Feb 2024 10:55:49 +0000
Message-ID: <CAFEAcA_EOLVk1Q4BU3LgogxUVK9+9b33_H665LW5T5wRSexOyQ@mail.gmail.com>
Subject: Re: [PULL 00/21] Trivial patches for 2024-01-31
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::229;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x229.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 01 Feb 2024 10:56:04 -0000

On Wed, 31 Jan 2024 at 11:57, Michael Tokarev <mjt@tls.msk.ru> wrote:
>
> The following changes since commit 11be70677c70fdccd452a3233653949b79e97908:
>
>   Merge tag 'pull-vfio-20240129' of https://github.com/legoater/qemu into staging (2024-01-29 10:53:56 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/mjt0k/qemu.git tags/pull-trivial-patches
>
> for you to fetch changes up to 54f0058fa7821c391719e69a92804636b2c403ae:
>
>   hw/hyperv: Include missing headers (2024-01-30 21:20:20 +0300)
>
> ----------------------------------------------------------------
> trivial patches for 2024-01-31
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/9.0
for any user-visible changes.

-- PMM

