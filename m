Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lsmfv-0001kP-TA
	for mharc-qemu-trivial@gnu.org; Mon, 14 Jun 2021 09:30:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsmfu-0001jJ-BX
 for qemu-trivial@nongnu.org; Mon, 14 Jun 2021 09:30:46 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:41783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsmfs-0001jf-U2
 for qemu-trivial@nongnu.org; Mon, 14 Jun 2021 09:30:46 -0400
Received: by mail-ej1-x62a.google.com with SMTP id ho18so16706808ejc.8
 for <qemu-trivial@nongnu.org>; Mon, 14 Jun 2021 06:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=4b9Wkd0O7OX6il3ZzHzl28vJKwk5ztLG9V1Wp8jiSW0=;
 b=zsRFLQdsl2LXWXgoqndLgfvAmgq32yvNFKBxchA+M3BxJadyZV8YI7nhg6UM2zDrV0
 hBSGk6PoPGwkkZy9r44noWCbT5af289jrKKy7LKXowcHGnlLwf13H2sM6yCGZUqv0xXN
 ce7PvOQLlI0LvxdvGeYqNNQwhZzOB5S2X82Px+t4lS5dwnrslHJaN6kF7oBhm/Bv7fLY
 ksQUaEn3XGsQaZ77idgZWvwAje/7TJQaT9E+z9wKq6F+N2vKldkhex0x7jd4TMXVz6qT
 WmNjTrTz5ISyFhMReFlYdTxCvyMQBnM0qjDk3/5b6eoizpNl6V92eXhrL/MFsBr9Gxnm
 mmQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=4b9Wkd0O7OX6il3ZzHzl28vJKwk5ztLG9V1Wp8jiSW0=;
 b=SIVeNEBqlNSPW3Xu/uU5kDey1zHa0nJOij4U5vnxlCDe3qRwKgfArXY+33h3YHSU+M
 fDWr+tmSGCT8D1aMZqj9f1bkVz/h/wN8WLiABXUOwILoBJFVxWjGeWa8M1kI/lFr6Fj7
 vppDaWZOIRrK0AYHHcZsytkdRu/tArrC4y+klVwKz+ynkqJNwzLTYAD4YPEl0M8LowhS
 2o4HoyeQNLpBkf/z5nmKiZV6KBL2cSXtaGDoaBnyRq0LOIi/EHLcwmgqujhEDQ5CiRWP
 Azx3jcPwmO7MMW2kDbReo11SFKmQG8uyQH93KTZA0cMH4kZe887JEYJaLMeY8NMpcQIn
 vjiA==
X-Gm-Message-State: AOAM5321pcKmTAQy965AyGORB652UxLpnd4KfdKxQIHVKDQPw9XXeOhP
 21B6lILN6eLxoVYvZTTubJKgcgLzEKcuR1lUkme+Ow==
X-Google-Smtp-Source: ABdhPJzgdM7CNJJzsWV0eZozqvMAzp2FRyXOc5Y7yeMPFu+pEfmkeXhnKeoW/lXHk51Lz9VRTWvtRSCP9+zSCXBOcrU=
X-Received: by 2002:a17:906:a458:: with SMTP id
 cb24mr15392863ejb.482.1623677443236; 
 Mon, 14 Jun 2021 06:30:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210614132536.1657-1-alex.bennee@linaro.org>
In-Reply-To: <20210614132536.1657-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Jun 2021 14:30:08 +0100
Message-ID: <CAFEAcA8e0oVDdoAa_zpQQq++dujdWs9BkGTqEMd9Fgn0BjZecw@mail.gmail.com>
Subject: Re: [PATCH] linux-user/trace-events: fix minor type in format string
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
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
X-List-Received-Date: Mon, 14 Jun 2021 13:30:46 -0000

On Mon, 14 Jun 2021 at 14:27, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

Typo in subject line: should be "typo" :-)

-- PMM

