Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qfj0O-0004np-F5
	for mharc-qemu-trivial@gnu.org; Mon, 11 Sep 2023 11:39:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qfj0M-0004nQ-St
 for qemu-trivial@nongnu.org; Mon, 11 Sep 2023 11:39:14 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qfj0K-0002y3-OE
 for qemu-trivial@nongnu.org; Mon, 11 Sep 2023 11:39:14 -0400
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-522bd411679so5957361a12.0
 for <qemu-trivial@nongnu.org>; Mon, 11 Sep 2023 08:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694446750; x=1695051550; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=32V/O7v/mTvum7vKvk+CkZN1UnpCbI+il/Yg7qcmCOc=;
 b=CoT0wl1WeGxq7Tuej392T8+muY28F2eThw4cQUiqDGM6vCKfwojINMtuGr6q7Jadfm
 55e8xH2SMo5boWdroa3hPHw3ObIQcKdhhrkO1WP91RrQjdXpDJDRuTwtm12cUPKtKU5e
 ljQ0urke9oOswdRDswpdYncFS4iTSlgvhu3ofQkh93bhg1bmFbJ0wwii3qkj5xrGvKvt
 zaJNfvn3HISQp+Ocla1QxDlFmwN/uMtA1pThCpnSwAzmpD0o7ZTLjcRRFKOjdPO/XFo7
 S5WhoX2r+2nnV07TLEvk1yL50+vNie7Rubcz5PJibEZ/De378QI9NmapPBeIbv46Ofui
 NuHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694446750; x=1695051550;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=32V/O7v/mTvum7vKvk+CkZN1UnpCbI+il/Yg7qcmCOc=;
 b=ntne72X0u/wiZ7BqaWcBtAXD4UJS10RJ3LYn1Z4s8KOky3PBV0yQygRWMprASp8Yi2
 WMyVUUOWZNE7/khCBRFW3u43B1JQse3tIr0euiUPbBizm/7I2ns4PtuQbdtD8+/ok0SM
 6fNOB2NPBP5Sz5jdDSshV/xOBU3gnaU6RA0pwn9ekKs8Gw3oTrQq2NYjn7VToRQDxxN9
 5KuXQE7zWTfqtvQBoralpEmi4KW0owjJ8biz8/BHqDmP3/c5JwfpuktCN3jX19JWVHsj
 8aHn7y1CUCRheCnAcPGKJPwRun4efooTC7Wa9UziP7kOFPpchY9MrtCI8U0d0zR/LpdV
 6p8g==
X-Gm-Message-State: AOJu0Yy2419lumm5/Vdz9hkdWAawXWp8z+r47SYp9NNMTd0BW+9VIFBV
 wNbNNgR872Wkfdpr3JUh2CkS2QyPLCSoLSe8WPdugQ==
X-Google-Smtp-Source: AGHT+IHq2voxZBQdmQDkY9ANesBhKZhB8QystLji2NzJ0fM5pBV5TE+SoYSRgbRND8L8phhlQpdnnYEApJk4sbgNBfs=
X-Received: by 2002:aa7:da46:0:b0:52b:d169:b372 with SMTP id
 w6-20020aa7da46000000b0052bd169b372mr8116644eds.4.1694446750138; Mon, 11 Sep
 2023 08:39:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230909131258.354675-1-mjt@tls.msk.ru>
 <20230909131258.354675-5-mjt@tls.msk.ru>
In-Reply-To: <20230909131258.354675-5-mjt@tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Sep 2023 16:38:59 +0100
Message-ID: <CAFEAcA92Y-DvvSyk0+qrUB9GAaLLyV4k5yfVMGX2Adm4wR8G+g@mail.gmail.com>
Subject: Re: [PATCH 4/7] hw/net: spelling fixes
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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
X-List-Received-Date: Mon, 11 Sep 2023 15:39:15 -0000

On Sat, 9 Sept 2023 at 14:15, Michael Tokarev <mjt@tls.msk.ru> wrote:
>
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

PS: for a v2 patchset each patch email ought to have the
"PATCH v2" tag, not just the cover letter.

thanks
-- PMM

