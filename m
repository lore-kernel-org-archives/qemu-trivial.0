Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rLoKG-0006eE-IH
	for mharc-qemu-trivial@gnu.org; Fri, 05 Jan 2024 12:49:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rLoKF-0006dk-CJ
 for qemu-trivial@nongnu.org; Fri, 05 Jan 2024 12:49:43 -0500
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rLoKA-0007mX-JX
 for qemu-trivial@nongnu.org; Fri, 05 Jan 2024 12:49:43 -0500
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2ccbf8cbf3aso26947621fa.3
 for <qemu-trivial@nongnu.org>; Fri, 05 Jan 2024 09:49:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704476976; x=1705081776; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+sXnJtWcjyBLOb2yW1MhZlclOJfsqSSZCQwvR/NIHrA=;
 b=N+MnHX/MO4x3+RFDyu5814V3teR4vZUK9qrnKwjz7Ks3yJz5hdoEugTXNWqegxMrlU
 3ZZiVGqzXaBdGdwWauR80cQhuGT/jb16vmC2r49+Zmhq8MPLsK244HstFNLUDRcUGSyz
 xTewPEfaV5khOkEJUOBh5E9l5utknjRQ/HWVA8IIeINfgrXW+zPEWvrRzLzYyf1zSUWj
 P0mFya+iVBmYAJP0FS4zwNQeoyJD9IsnUqWbPmulhE6tTppWgxSG2wsFQnGes/Mwe/G9
 Gb8QIG5ZEePJxNVHWXOMneoWv/bLPQyE9xqhh+vHSZ3ucYV6ypSwE0d52EuUhvjQ1Vvy
 LBuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704476976; x=1705081776;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+sXnJtWcjyBLOb2yW1MhZlclOJfsqSSZCQwvR/NIHrA=;
 b=BDXJgyxDQodlqKUc/fahe2y/CrL2TYCxksZq11EZbGnmjQzfwJYkH7plMQPXt8s5EL
 bmgZ5tvydAgnsbyYJMqN+2/eA2iok8sNamXty/kI0EHu0TVFIKCxUVjtDO1vX6/+fKup
 O/6c/HzosrfrcbJb8gu9Mtikyh3b8bsAgoWc2U/zOwH8+knnpt+2YC17iFga+480npWh
 ybiPKtHiUyG/WTVLQ03jxUF3N6KgxMrO78qK4MPEnueoRQLkU6VhYposi3oYm04VweQe
 6/AvCz2uieEUXsKwa8q7UMn9tfRbVhHM+/Iok8Q2pR0RNDi4LoG9WDqPDYYDcU3ceUov
 prHg==
X-Gm-Message-State: AOJu0Yx0Tmp0rfq6QaF7y1e25tdBLp8wy2lo+j5VxPllElhmx7O3B2wI
 ohRdfXPKCfXrtCx/P8WMqqKoZFTRKi5595Gr4nONLA3Ighk6zg==
X-Google-Smtp-Source: AGHT+IH5rG1gUpJoxmAV6+MY9zz3mfIdQY1bsoQxIgXHW1wKcJ5YzP/Tp3xbm2QILBt2fm8BBkHnJGJt5hA98kgvviE=
X-Received: by 2002:a05:651c:1693:b0:2cc:f586:ce9a with SMTP id
 bd19-20020a05651c169300b002ccf586ce9amr1442366ljb.93.1704476976171; Fri, 05
 Jan 2024 09:49:36 -0800 (PST)
MIME-Version: 1.0
References: <20240103172817.2197737-1-sam@rfc1149.net>
In-Reply-To: <20240103172817.2197737-1-sam@rfc1149.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Jan 2024 17:49:25 +0000
Message-ID: <CAFEAcA_yoBEM-6cw5QOTcpO=TH+2=ySFu6=XRkBqGywxAi2SHA@mail.gmail.com>
Subject: Re: [PATCH] docs: use "buses" rather than "busses"
To: Samuel Tardieu <sam@rfc1149.net>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-trivial@nongnu.org, 
 Vikram Garhwal <fnu.vikram@xilinx.com>, Pavel Pisa <pisa@cmp.felk.cvut.cz>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::234;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x234.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 05 Jan 2024 17:49:43 -0000

On Wed, 3 Jan 2024 at 17:28, Samuel Tardieu <sam@rfc1149.net> wrote:
>
> If "busses" might be encountered as a plural of "bus" (5 instances),
> the correct spelling is "buses" (26 instances). Fixing those 5
> instances makes the doc more consistent.
>
> Signed-off-by: Samuel Tardieu <sam@rfc1149.net>

Applied to target-arm.next, thanks (since 2 out of 3 of these
are arm related).

-- PMM

