Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jwnfL-0008ET-0k
	for mharc-qemu-trivial@gnu.org; Sat, 18 Jul 2020 10:18:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jwnfI-0008Cb-F8
 for qemu-trivial@nongnu.org; Sat, 18 Jul 2020 10:18:12 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:39720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jwnfF-0004de-9l
 for qemu-trivial@nongnu.org; Sat, 18 Jul 2020 10:18:11 -0400
Received: by mail-ot1-x344.google.com with SMTP id 18so8954444otv.6
 for <qemu-trivial@nongnu.org>; Sat, 18 Jul 2020 07:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ALTmyTbkrboopNee/5LGQVDdqqrDjvus0ZMXWnu1kbQ=;
 b=z4Yri8mX0sWkse7rh/K9Ed8xmWBOBC5lbrcmnLs+3d1s1UUm2qjBqcV9vsMOTUBS8U
 0EvdfIJDIfy/ucDXSWuRTtpCwEVyXSWcQ1a8jpFvCcerhT7aD1p5Tcg237hEQXN2F7p/
 6Z5aAI1G00vtscI9lBpLNkKvIrvCM9qvEgciQ324Qj3taSYjKn9oSKpVFpRS3pZDCXxy
 vIWq8FqLbIh5noQ0lu18Hghevuv054F+9uJOrmgMoWbquOiOgYLUYSH905ur2DBS0fsc
 /q0Q7IW6vDaD+XmE3z2hPSGVJQoXhal/7AvhbGeIn4EfHC2PzqwUw91lFikvCHsEcYS8
 Vq5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ALTmyTbkrboopNee/5LGQVDdqqrDjvus0ZMXWnu1kbQ=;
 b=FJJdKn3X8W6oqMzh3FMRb/MDvhX1DVl6arXNx6wZnC28T4aRWjqHZgXSPOEuACFx6n
 EVAGY2GSMqlY7xwCO6ErpVw5THqBdwfyhQuYaTiTPI5d8Lwvbl6MYxbEX6tdkN6m+IGL
 t2pFFADNVwIbX98GMn0E1sctTG//WuVdIVowLLgvtYxsCvOrglygLsPwjfFQXM0j4UKe
 CEL2+01Msilz/0gSwU6VHeqROqSyca6Y0QSqWjsCAEsB5SjkHHaBT0lHvHH6MCu2uxPM
 qhwdAgoyi4gykGzPW3Z/tvtmYBN8LfDTaN0oRtIHBcLIrlr7/CNDA7dWNGtBWyTCR5br
 pjIQ==
X-Gm-Message-State: AOAM532bFsiCAXW8OchzyY2xR6oYLjkMUUgd6pIt8eT6bui+SZATdUWd
 T5nMMwLSqyJcX6HNAF2b9cbi9hewcDKXOguuWVWyaw==
X-Google-Smtp-Source: ABdhPJxZ4d+NpEJiul55RA4p9DaNAYWnOE+ocmzKTg7XfziWw8Gc5wv+9geY5vLi/4ILWDj2OC56r48oiqr5nS9sCQQ=
X-Received: by 2002:a05:6830:1bd3:: with SMTP id
 v19mr12784404ota.91.1595081885763; 
 Sat, 18 Jul 2020 07:18:05 -0700 (PDT)
MIME-Version: 1.0
References: <CA+XhMqzHPG5ezqY-YxbA+tMoadA3VDFWBX8_LaLC5YsQOMrz+A@mail.gmail.com>
In-Reply-To: <CA+XhMqzHPG5ezqY-YxbA+tMoadA3VDFWBX8_LaLC5YsQOMrz+A@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 18 Jul 2020 15:17:54 +0100
Message-ID: <CAFEAcA88cskF-PP48Z2Lnj7rYoKObkV7kD-VdB1XONSzRX=9Pw@mail.gmail.com>
Subject: Re: [PATCH 3/3] contrib: ivshmem client and server build fix for
 SunOS.
To: David CARLIER <devnexen@gmail.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::344;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x344.google.com
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
X-List-Received-Date: Sat, 18 Jul 2020 14:18:13 -0000

On Sat, 18 Jul 2020 at 14:22, David CARLIER <devnexen@gmail.com> wrote:
>
> From 1c5225132a01ad67c87d603659ef4e4bcd46a16d Mon Sep 17 00:00:00 2001
> From: David Carlier <devnexen@gmail.com>
> Date: Sat, 18 Jul 2020 13:32:47 +0100
> Subject: [PATCH 3/3] contrib: ivshmem client and server build fix for SunOS.
>
> sun is a macro on these systems, thus renaming the variables on the
>  client and server.
>
> Signed-off-by: David Carlier <devnexen@gmail.com>
> ---
>  contrib/ivshmem-client/ivshmem-client.c | 12 ++++++------
>  contrib/ivshmem-server/ivshmem-server.c | 12 ++++++------
>  2 files changed, 12 insertions(+), 12 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

