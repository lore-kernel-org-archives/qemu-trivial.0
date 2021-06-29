Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ly9Yf-0008Sa-Sq
	for mharc-qemu-trivial@gnu.org; Tue, 29 Jun 2021 04:57:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ly9Yf-0008SG-1v
 for qemu-trivial@nongnu.org; Tue, 29 Jun 2021 04:57:29 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:42528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ly9Yd-0007qC-5P
 for qemu-trivial@nongnu.org; Tue, 29 Jun 2021 04:57:28 -0400
Received: by mail-ed1-x52d.google.com with SMTP id n25so3718717edw.9
 for <qemu-trivial@nongnu.org>; Tue, 29 Jun 2021 01:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=B6IueLWMuxDsD1oh+0U6X6Mbl458KZ6nboBwmqHHgfw=;
 b=HhMgs3Yf0T+4VXlJzrBmNIt4tnASm6lpePYOGc2+h6mJbJUcGu3OgMPqYvWPi1EU+t
 LcjqdyN1Pmf9ReKoBFzeDJF6rg7ClLYJ6BI1/9+fFIwkWp7HPvYa9j830J5JCnF2r1RS
 dGrFLbKbfKJmdykXTEpeuK/G3bVy2CynB+/U5x8XyglKLthGHi+EGelEs4qk9Y9HewDq
 LFbN9hZEbWNTmNT3sVbFrFj9esa2/9dDiicVaDVf1G5ARHhhPetrZ6VYj/iGvNJ68594
 dwSpiRP9WdWehuU2ZJDXzALodjeEDlKNxGxTOsOTUA2qNGuxtH139jgikcbBR+JfLBDm
 0Etg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=B6IueLWMuxDsD1oh+0U6X6Mbl458KZ6nboBwmqHHgfw=;
 b=BwhcnqUEGaD07ExLvalUEPTKjHBMZo73KjsxSsAAKb52j7rVtLEV0CLG9ytUona127
 EbFqDzGVEahcEqAo4G3LIQXSYlFLfGN8X4TvUKt5KxYhnKCopjh7tkk5h1e3+wGTzWMw
 wy4I/pVVAMkitJzhGLuWbqhBYZZWlnSKoeglCKwG6A576MF8RUBqYl2Vy0k0YUJJnZGi
 1O0lXb71Ur3qEYfsiMMTdNlzQRFFLjEaMqyRR8eBh8gYZXJRpFzE4OSpJbp/h46/SfC+
 5FygAOcdZdv02/LtKVDJtCvm/IbOUVCJWzyjwjhMAGx4KHRWwDnflgxp+LdgqeR5YgYM
 avRA==
X-Gm-Message-State: AOAM5311qfW0wBOsSGC0g1tLLqLbCD46M1g99JbGClEW/6sAttuGprzN
 bZheS7ItXUdpf68X4y9PwnjSw8SAFkM0revNihMtVQ==
X-Google-Smtp-Source: ABdhPJwfM39pmflt9eDXq46MN1eHic36OeXQTyGa376vzZkz5B6G+/ndRqRrHL0MAz1b9k17ER46KodDPkRJQbQ0dOs=
X-Received: by 2002:aa7:c644:: with SMTP id z4mr38472612edr.204.1624957045078; 
 Tue, 29 Jun 2021 01:57:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210629051400.2573253-1-f4bug@amsat.org>
In-Reply-To: <20210629051400.2573253-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Jun 2021 09:56:48 +0100
Message-ID: <CAFEAcA_f16C7niFiZwjXAwmYuC7F+v1q_3fXfLfmQ=+VDTfv1A@mail.gmail.com>
Subject: Re: [PATCH v2] misc: Fix "havn't" typo
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, 
 Luis Pires <luis.pires@eldorado.org.br>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Tue, 29 Jun 2021 08:57:29 -0000

On Tue, 29 Jun 2021 at 06:15, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Fix "havn't (make)" -> "haven't (made)" typo.
>
> Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

