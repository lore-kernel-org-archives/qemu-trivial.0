Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rdB4N-0000Lr-4V
	for mharc-qemu-trivial@gnu.org; Thu, 22 Feb 2024 10:33:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rdB4L-0000LJ-El
 for qemu-trivial@nongnu.org; Thu, 22 Feb 2024 10:33:05 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rdB4G-0001Fn-Fo
 for qemu-trivial@nongnu.org; Thu, 22 Feb 2024 10:33:05 -0500
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-563fe793e1cso8725655a12.3
 for <qemu-trivial@nongnu.org>; Thu, 22 Feb 2024 07:32:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708615978; x=1709220778; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lYKOw0V2LO8N+rtWpZWayjhzSDOUcSorDpZXhPCifiM=;
 b=g1Yb5Mxe8vhZ9xVeZilYLcO88y3TpWzEbdOb7aAyJEmmf6zNrbjaBiBQIU5qx03X7G
 Mw8e5UFQ4BBLWp7+1l1cvZzb0g17yoEbIeNkdf/hFuZW4/pX6ORsFaiSeatw/uDAaU/m
 z4d/anNbSbF9pO44b6LL4x7IK7dV2WPRaCcbws916Idc4dt9AG3Nit67n1fB5gJv0ZZ0
 zhn4bwA2Lj1BB72L/6fIjOjJCEMLFbZdNqS0MrAong7uGL72yzxaS+M6snn4IngwgYwZ
 o7/hpj+iEr+sVDBVRCxTKk4knYZS0XQ6qX9X2Ki7/ogHTgTnv3ClKtgQ1RQWy5PNYEVv
 R+LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708615978; x=1709220778;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lYKOw0V2LO8N+rtWpZWayjhzSDOUcSorDpZXhPCifiM=;
 b=iE48v8PG7i7SkhxVm6/oYGIo/11LQ0aGzg0P5S8hIG40/W2Dn8I2SSi3q9EbzOrbZG
 uaH/u12xe2+PDPJpGF6W/Quxq1gc94pBRLBHMzfBQrHACRqIfzSlyQ+3RTtMNduQjmWu
 hNA2cRCi10OzekOUQwipsOINKR+77jLEibmO63M5XeCP3Sy/pn76mCJrAQkR2putsH3t
 YMgWLDs4+w28usL68cd7Dc2NBloX83hEY2dNOL1LOxMYKu9ZIpM8SR5PPHClRsQomatC
 dJqelXSml0mP307BhQmWJlsRWvZKe3peEuR3odKhS/vNMujjNGVmIFGiasLyejl6XHWI
 JlOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUKcA5hUGeEGulc9lCJUwbCebq+Z9r+PwTw2rf1Nu1Z6/yWgeHN5ehn7X1pQnpKoHFLUQLXQKXuh3iItkL+Uv681RuFavdgA==
X-Gm-Message-State: AOJu0Yyb2lIW9taNCY6Oj2iw+H5A1S7Pa4rLZRx8yFr3Y8tSLq5K+Uug
 BF4as2shlghG9PapExTRdRAYc9WZ7eFMV0lYuCK5YOV5N0DBulCgFzP5JhJAJe0G0WWimZ5c0og
 oh8VATb5GHErJiiGnrr/6gCB94jo6NGNmRyc7Yztmi7fzT0yE
X-Google-Smtp-Source: AGHT+IGxmwaCPlBxITERyQ6qj0sJWu2n0rTrApZtoduUbEb99sSXY7iKcehwUAup0jqoenKlcI9Y0TtBhgm8teMsO88=
X-Received: by 2002:aa7:d358:0:b0:565:4e5c:2815 with SMTP id
 m24-20020aa7d358000000b005654e5c2815mr595347edr.24.1708615978631; Thu, 22 Feb
 2024 07:32:58 -0800 (PST)
MIME-Version: 1.0
References: <20240222112601.2526057-1-mjt@tls.msk.ru>
In-Reply-To: <20240222112601.2526057-1-mjt@tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Feb 2024 15:32:46 +0000
Message-ID: <CAFEAcA_eJ_uKqU33piABxTw5aeBHUoZ0FDaEvi8aJ+jJu5KK3w@mail.gmail.com>
Subject: Re: [PULL 00/34] Trivial patches for 2024-02-22
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
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
X-List-Received-Date: Thu, 22 Feb 2024 15:33:05 -0000

On Thu, 22 Feb 2024 at 11:29, Michael Tokarev <mjt@tls.msk.ru> wrote:
>
> The following changes since commit 760b4dcdddba4a40b9fa0eb78fdfc7eda7cb83d0:
>
>   Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into staging (2024-02-20 10:11:08 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/mjt0k/qemu.git tags/pull-trivial-patches
>
> for you to fetch changes up to 185311130f54ead75c407cdf83004d575829b5d2:
>
>   system/vl: Update description for input grab key (2024-02-22 08:59:16 +0300)
>
> ----------------------------------------------------------------
> trivial patches for 2024-02-22
>
> The bulk is a spelling fixes series from Manos Pitsidianakis.
> Plus a few small things in other places.
>

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/9.0
for any user-visible changes.

-- PMM

