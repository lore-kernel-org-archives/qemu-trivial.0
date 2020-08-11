Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k5W4r-0002m6-Sk
	for mharc-qemu-trivial@gnu.org; Tue, 11 Aug 2020 11:20:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k5W4o-0002kv-Vt
 for qemu-trivial@nongnu.org; Tue, 11 Aug 2020 11:20:35 -0400
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31]:40502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k5W4k-00014I-Qz
 for qemu-trivial@nongnu.org; Tue, 11 Aug 2020 11:20:33 -0400
Received: by mail-oo1-xc31.google.com with SMTP id j16so2696398ooc.7
 for <qemu-trivial@nongnu.org>; Tue, 11 Aug 2020 08:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=LhipV3OzC4dEosq3d9R+7AnvHo5SEdfg+6Oq491p3V0=;
 b=btyUMSA4AHwbdZwkGNPMsC8fAjCvkewYTlWhzo8oxtafc1WoP9CfJAnExyJxCgy/it
 6o2jWo8/3HNhBhStBjf5qyaIeqYXya/rZFlqvfv3+QLsg5cxz9qaWyFKWuC68IW4k7MY
 1S6huH/WsujB79iginX8rsANriQ5DVRLJdBdSnp4ojYK1irl1+9tDkv12t0bPFiqWuAp
 GM11cEBboQbXN8RoJ3j88EC6z9BG39Cv6TrO8Se7+6ozQRWBUZ+/Eh4rZFnNQi1P49qe
 tjgq8xeymniMEcv7kITbh8KeVOQOmolg60ynVx038u3/zkrBWzjLEBxjiaNeUyN7UY53
 AjzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=LhipV3OzC4dEosq3d9R+7AnvHo5SEdfg+6Oq491p3V0=;
 b=WrSaFX0i75zYBoIn+E5NDH8GoWSrpUI5hP9O+JnrLrICaKR1qpebhw/4id1Hndg6YO
 pvz4/ypr4Hpe6xZje3hsj7VSmUZO41WtK1aY+UljZhOi/Q6B1pmXYugoJyW5VQTMSVLM
 iipISqprPynx4iaGDZ+5/AYHlZA039i2AFEuNjSj58b5RLCZI60wLNtqoi9aCxThUGBC
 u+HI2xk9ewx77KvvkT40GRDfaple/PEhK/8vsr10GFRwkRb1E9LDwDCNDjlGvjbdvDRP
 ACrry5gXUVxrkTnUUWjrMDdsu3lCxx7bVoPfcu1SYgSg+gUEZNmOJSEJSTpE5wXdpp16
 WTsw==
X-Gm-Message-State: AOAM5308hq7zD8MYErlKM8Ne2BaWFoDRERpxzq97CNbLiod5fy5fyx42
 /CBxjNZn1HhGvX5KwAXuB0RbJC9bNLQCZ+6Se7HxUw==
X-Google-Smtp-Source: ABdhPJzUMN/qkwG2AjzE8CmjWoI8Q6D5C5qV5XGQhHjCDngebPfaCOwfVkqLL8BVZoSeH5HtTmEnxte88d3icLW9snc=
X-Received: by 2002:a4a:8dc1:: with SMTP id a1mr5676910ool.69.1597159229386;
 Tue, 11 Aug 2020 08:20:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200811151643.21293-1-philmd@redhat.com>
In-Reply-To: <20200811151643.21293-1-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Aug 2020 16:20:18 +0100
Message-ID: <CAFEAcA-Rnu4mL6uv7uek41g88eyRRw3qekKXNoMu9nXeO54DLA@mail.gmail.com>
Subject: Re: [PATCH-for-5.2 0/3] trivial: Remove 'and and' in descriptions
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Corey Minyard <cminyard@mvista.com>, 
 QEMU Trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>, 
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::c31;
 envelope-from=peter.maydell@linaro.org; helo=mail-oo1-xc31.google.com
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
X-List-Received-Date: Tue, 11 Aug 2020 15:20:35 -0000

On Tue, 11 Aug 2020 at 16:18, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> Remove duplicated 'and' in comments.
>
> Philippe Mathieu-Daud=C3=A9 (3):
>   hw/i2c: Fix typo in description
>   util/qemu-timer: Fix typo in description
>   util/vfio-helpers: Fix typo in description

Series:

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

