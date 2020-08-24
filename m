Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kABcq-0001BA-80
	for mharc-qemu-trivial@gnu.org; Mon, 24 Aug 2020 08:31:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kABcn-00017W-R1
 for qemu-trivial@nongnu.org; Mon, 24 Aug 2020 08:30:57 -0400
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643]:32856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kABcl-00028m-N9
 for qemu-trivial@nongnu.org; Mon, 24 Aug 2020 08:30:57 -0400
Received: by mail-ej1-x643.google.com with SMTP id u21so10987493ejz.0
 for <qemu-trivial@nongnu.org>; Mon, 24 Aug 2020 05:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dXZhTszVlkVg0cZ3QueoEXrT+cPUerAFKSlxG5lTWCU=;
 b=LaoGrZpxV/57gOPX3aC0hqkEQ0qEkjwr/cYp6nj9CaCTjMJlkMWztUev5hXtXD6R/F
 qYE2u4mIOTBoEa+5u1YPe+uQ89Y+C2/N7nyeycOnMyspnH/2iRYuVzEQsZzTTWD7o/23
 eqLKbIyafTLnwu+2GzK9fEfsAiwx8z+1DXmT58/XZ/aOcboppQpMt6fSogs1tfywFmdJ
 lBgZ/MdtXVwQdl5u0vn7TLIm6hMkr4sPS/huChF32AgtQLjTfuGAsHTAh5TT7el7JDZ2
 NoD5QkAwyHfoxtuT2XL/yzyKiPm4tBJF/yEtkidXKT+IZq2H5lbmahCoT6+EK4qgoUsC
 TngA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dXZhTszVlkVg0cZ3QueoEXrT+cPUerAFKSlxG5lTWCU=;
 b=FcMXymmX857mhcL5qJ5JOnVeUzagPnCD3DtmL6SIq7k59jb5DVseX1TYllkXiuYIDp
 XHEbSL/W4yCUX6ELIuzRcVPEC4pGIRpyK4A4Upqxu7OjO1R1xGhGALUYZnISFUOrWp4W
 DTpLxK7M9ffqNfT6BVrIR69pCt92vDLtNMn1Wd3V9Hg5zTjgbWYRhJuFdBMRNfw9Hbf4
 /46n7+S2Sop6AwYdZ4YVRUMjZ8K5nJfxEjy3HWEzT4G/FufmtA6ueA3udwEsF443I6QO
 zsm6/CA3Ec2WMqPRr/qsUxk7zMhXkEIMlHsbhf6m/EbHW0XNmVYvXo2deTduMm+oN2iz
 1ahA==
X-Gm-Message-State: AOAM531u3EwmAwMZbe4YsU4CkpIxh4kKUPH8iNIEY+3UIaRQ4BkBysjF
 tzsZuCW5St4x78DNrzc6ZAXVM3ClDmCDyhS7cPRhyw==
X-Google-Smtp-Source: ABdhPJxxjW53tsGjf1xZiy6oWe1ipqv5fhiNI+yqfrUhBPvzN//OXKyQ4QYIvzpefo5JUfkNyWunH4hLmfdAD/LmD44=
X-Received: by 2002:a17:906:59b:: with SMTP id 27mr5646649ejn.56.1598272254093; 
 Mon, 24 Aug 2020 05:30:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200812101500.2066-1-zhaolichang@huawei.com>
 <20200812101500.2066-5-zhaolichang@huawei.com>
In-Reply-To: <20200812101500.2066-5-zhaolichang@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 Aug 2020 13:30:41 +0100
Message-ID: <CAFEAcA_QyxVTMyFZO=xTVaDdfLGureG1OtbsAN6YdEYfNo7vDQ@mail.gmail.com>
Subject: Re: [PATCH RFC 04/10] scripts/: fix some comment spelling errors
To: zhaolichang <zhaolichang@huawei.com>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::643;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x643.google.com
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
X-List-Received-Date: Mon, 24 Aug 2020 12:30:58 -0000

On Wed, 12 Aug 2020 at 14:43, zhaolichang <zhaolichang@huawei.com> wrote:
>
> I found that there are many spelling errors in the comments of qemu,
> so I used the spellcheck tool to check the spelling errors
> and finally found some spelling errors in the scripts folder.
>
> Signed-off-by: zhaolichang <zhaolichang@huawei.com>


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

