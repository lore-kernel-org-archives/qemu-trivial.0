Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jhCPk-0001FE-4k
	for mharc-qemu-trivial@gnu.org; Fri, 05 Jun 2020 09:29:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jhCPi-0001DO-VE
 for qemu-trivial@nongnu.org; Fri, 05 Jun 2020 09:29:38 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:42813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jhCPg-00057l-Md
 for qemu-trivial@nongnu.org; Fri, 05 Jun 2020 09:29:38 -0400
Received: by mail-ot1-x342.google.com with SMTP id o7so7578172oti.9
 for <qemu-trivial@nongnu.org>; Fri, 05 Jun 2020 06:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=MjBx5mbcnQFgKZnmd+gPc0Sz7vAMpyCVxxcFHrl1+vA=;
 b=irCiZYGwlllOeb6+VEa8m03LTwSiYd5ydYRors8B/kb0ReMA5drC8vBLvJJunGEYIU
 TM9gauJg/OIaEWaGLRukEb6jybUSrgIB9PgnzkrWkREUkE8TMPAyBaFUeHj0Z/SEcMEI
 LwP8CPMLdwnBJtQtc2nExy8vUrlfqfc13MTlvGxRDsTVyJBpwmgAS0z105GqxzlMnjBW
 piol1QUGWgibpz63eEhPU5rrFkB36k/W832DYi3M81tsFsEClMna0epGdmFeFVL87mLQ
 yS+cfAP7Jdxe5XRpOqMcf2L8Q8Doh1BhKThn04U8u6sbTrxwC/TEzbNX95tO7QMPZHyo
 1s6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=MjBx5mbcnQFgKZnmd+gPc0Sz7vAMpyCVxxcFHrl1+vA=;
 b=jbF0aq/FA6SwJNncwD/XseHMYuqYK8TlrnEr4e+LbUWxXVpSqJZzw4O0/DFgtUdMKx
 Mj2zsmcrUcDJJ7V99cp/3ehI5Pu2fKZX1iaFKIBBHZlrbn9eUPLwIJO6QBqk/zgWOF+D
 WFb1oVqIoOmxMs3FHR9jJ3b08AtN8VzGaAjNeUP1R+BMF5C+lByHf5ymCafSka6QQdAX
 g95RP2tW+Tq8RFym46iOT9UowKvh2fshKpw58wyzY7JZ3sz+y1VaGrRKUMiPmRl9Iir6
 NZ2aNCEjTgr6Y4XQAvB4yeg+IFYVT8M1JSSCoFtmy2XvoqrOtXzge1Nc0i8r0expqyKy
 iDDQ==
X-Gm-Message-State: AOAM532R+hSu+NcdKKsccwyXE1Qlwg8kARjw8WT+bjSXJG+r2H9fVyOW
 5KxIH301fbtnxdZceGY1+A51tLxP+RjW7Hs8y0/YZA==
X-Google-Smtp-Source: ABdhPJyEoglVWqZSwsHTkP0EWdHkvs8OEXCpE1E62uXongN86V6iQAdKayr+FFCaQHhNm4lfUW261qRbBXFVZLLmzjk=
X-Received: by 2002:a9d:b82:: with SMTP id 2mr7256440oth.221.1591363775642;
 Fri, 05 Jun 2020 06:29:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200603055915.17678-1-f4bug@amsat.org>
In-Reply-To: <20200603055915.17678-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Jun 2020 14:29:24 +0100
Message-ID: <CAFEAcA_SZ=Byk8_-GURDEWP+WuaJXwYF9rz1b+4XwPi8GSf9wA@mail.gmail.com>
Subject: Re: [PATCH v3] hw/adc/stm32f2xx_adc: Correct memory region size and
 access size
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, 
 Alistair Francis <alistair@alistair23.me>, qemu-arm <qemu-arm@nongnu.org>, 
 Seth Kintigh <skintigh@gmail.com>, Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Fri, 05 Jun 2020 13:29:39 -0000

On Wed, 3 Jun 2020 at 06:59, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>
> The ADC region size is 256B, split as:
>  - [0x00 - 0x4f] defined
>  - [0x50 - 0xff] reserved
>
> All registers are 32-bit (thus when the datasheet mentions the
> last defined register is 0x4c, it means its address range is
> 0x4c .. 0x4f.
>
> This model implementation is also 32-bit. Set MemoryRegionOps
> 'impl' fields.
>
> See:
>   'RM0033 Reference manual Rev 8', Table 10.13.18 "ADC register map".
>
> Reported-by: Seth Kintigh <skintigh@gmail.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>



Applied to target-arm.next, thanks.

-- PMM

