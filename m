Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rMpUv-0005q9-BJ
	for mharc-qemu-trivial@gnu.org; Mon, 08 Jan 2024 08:16:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rMpUn-0005p2-P5
 for qemu-trivial@nongnu.org; Mon, 08 Jan 2024 08:16:49 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rMpUZ-0000xW-ME
 for qemu-trivial@nongnu.org; Mon, 08 Jan 2024 08:16:47 -0500
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-555e07761acso2076145a12.0
 for <qemu-trivial@nongnu.org>; Mon, 08 Jan 2024 05:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704719794; x=1705324594; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=DwGLdKsVOai909TPhHnK9iYkIWEQ4kf4rhfYlHTtk9U=;
 b=IJ6G8DrrkJSI6hnTO1Nd/Z7BzM6aITsDWL8TShWAuVrbQqqZIOKMxbqALgkyaa9klN
 p0caIwKxsQ0FmA4PJsva2LD5gpDudwxNX8GgLr5e4bRL4gD3D+VpSgXE1iLlb/PIR/Xg
 bG168Ya1p6Bgwc1eKKxb3Nqjc50lyXhpmNCFV7NBbVxpP3Jk8CE5tjuGc4BVumBmo6TC
 +dIbYyChvUDJ9JP0jDhD/wlaaVOYTBC12MV3GSBjKA/YqkXNa3ZcthrOnB1JQ30+fZ7x
 QvDSxda9HznlvDVlBnol5KoKuXUrdffqu5ljQb1A0Rjd4bPhOrDGnQiodNAGHzjzZ4xL
 jC3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704719794; x=1705324594;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DwGLdKsVOai909TPhHnK9iYkIWEQ4kf4rhfYlHTtk9U=;
 b=mZL7qbQp6OpLFZm2rV/bqg0+n6mZrgoXWFaowGOhFJdkgbC+Q3VlaWDB3faIl1E6Ek
 f6XtLCwrnOAGtUdzHeMAngk+HvFI/t9uivRC/26CaGkxNKh6tkS969UrqavvX7X9Bqsd
 Z+Dvixe0Hd7/irXF8YUr7V11osr79YlOtM86zOPHyyujCAtZxfsGfk0lGNeXz2NRTtrj
 Gx1prqVUioSp892XVizoBkQpxSXilhTQWdd6SNH6SiMlxg9LafVqrXpqZYcGBa1J7tlQ
 S+Al/sXjLj8fBMgt+JwiIV1mZNUhPbeCNsLqMD5pZd0gGfyGlotKnB6qMfLK6vXiql9a
 Arag==
X-Gm-Message-State: AOJu0YzqLdKv08J+36+CoMIARdyqMnhio1BbILzJsyBCXrEMLsz+d0A2
 9NCznAfUbgiqaw5W8SlHPOWiwlKDQWyyC4UBnm+wYHek16T5jA==
X-Google-Smtp-Source: AGHT+IG2Aq7Aa2ZOrDN8uHKfLWpiXW2iH9M5FDkopxgal+IidSmmB5sZL2ZbwzntxjbaYQIxmPenvym0OlKxq0BpTxM=
X-Received: by 2002:a50:9b4e:0:b0:557:8a58:ed34 with SMTP id
 a14-20020a509b4e000000b005578a58ed34mr1006730edj.121.1704719793950; Mon, 08
 Jan 2024 05:16:33 -0800 (PST)
MIME-Version: 1.0
References: <20240105193038.116576-1-mjt@tls.msk.ru>
In-Reply-To: <20240105193038.116576-1-mjt@tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Jan 2024 13:16:23 +0000
Message-ID: <CAFEAcA8VqpRsU7mRm+wkPrVAkadYc2AAny1vasDDQqxH4Xjp4w@mail.gmail.com>
Subject: Re: [PULL 0/6] Trivial patches for 2024-01-05
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 08 Jan 2024 13:16:50 -0000

On Fri, 5 Jan 2024 at 19:32, Michael Tokarev <mjt@tls.msk.ru> wrote:
>
> The following changes since commit 0c1eccd368af8805ec0fb11e6cf25d0684d37328:
>
>   Merge tag 'hw-cpus-20240105' of https://github.com/philmd/qemu into staging (2024-01-05 16:08:58 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/mjt0k/qemu.git tags/pull-trivial-patches
>
> for you to fetch changes up to 8a780cd212647a6013c8ea59e0929dad996e2c54:
>
>   docs: use "buses" rather than "busses" (2024-01-05 22:28:54 +0300)
>
> ----------------------------------------------------------------
> trivial patches for 2024-01-05
>
> Random stuff here and there, plus a riscv bugfix.
>

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/9.0
for any user-visible changes.

-- PMM

