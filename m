Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jyxcG-0003Qh-13
	for mharc-qemu-trivial@gnu.org; Fri, 24 Jul 2020 09:20:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jyxcF-0003Qa-1r
 for qemu-trivial@nongnu.org; Fri, 24 Jul 2020 09:19:59 -0400
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335]:46309)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jyxcD-0008JN-G2
 for qemu-trivial@nongnu.org; Fri, 24 Jul 2020 09:19:58 -0400
Received: by mail-ot1-x335.google.com with SMTP id n24so6916066otr.13
 for <qemu-trivial@nongnu.org>; Fri, 24 Jul 2020 06:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=jTEf1o++WaVJfH5RXYmaRp2hBzAR3Y42Mk52reBi4WA=;
 b=YFZnEp7/W2ybtHY5mYiOP77ckpKkeOvV24exIgBLSWYQ1qi+05rPNOUOEWQvaIq/h6
 0HcGDkdEIxEVRS/IJgdnO1v2vsOE1VXMmBXrl+TrWiAX1Vc1eZO7Ec/I6k1EG+VmJldf
 vXaBz0gKSqob+H5eLh3r9TDm+o3p+rEGIOBVtKiX3RWZJuHwW+9KCisK5dZ003nocBnX
 UWhmSG9WtNrzbkgE+xe1cXTBnsxseS1pPpC3xXPr59XxKHe8vCnhVQuysIOsBJqG6oht
 s4aPZ7hknS/XpDFuKnkYBKhLLix58PGosMYbK+SftlEEYPWM35dzyNAH10bq7oQezgB5
 xZFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=jTEf1o++WaVJfH5RXYmaRp2hBzAR3Y42Mk52reBi4WA=;
 b=cDyHgBmLwIzFLB3ra+tRxybFXSWSirtpXQYBYO2d5U+FzCsaELQZ1aUqEXLTS7kDaL
 lMbtZvxL5J8RjUrC4LSpWUz9pVKnxw0pnD/9wLNQG7ygl4NsPV0sa7VgSPhZmTmuS4xt
 GUoLzb1r+hiH7puhu6eoQvBbp+Loa9b9OhtwhScHgCz+gsiGrSk9H1teZ6pDbRyJLeDu
 5hq8QqNH6pYLPOkVxzeBGR5a8BhjhvYtA1DkBxMG+4k/DVJNZf/PH2t4IZAnAzKRXzul
 e7jfZ6Jz0IJeexL1I95ziEPfdWuWDAESn84MRUKzw7UvxizaqRxvfZy6airi4PLEpNkY
 iktQ==
X-Gm-Message-State: AOAM532IOXCBwE9bs5x3PFwgfCIrDPWEqIx6cUMmMeif6fwbwsj0DOri
 815h19oMSG2PbuVzptJlahLgtwzhEFYgOoM0lYG0sw==
X-Google-Smtp-Source: ABdhPJyM9eLqy2fs/eTDUfDNPXA7asIAcsJIFHdNItKNLOei76J2z4NNzo1Ekh5f++WB65Edzj5vjj96X6hWeD8U+Hk=
X-Received: by 2002:a05:6830:1bd3:: with SMTP id
 v19mr8710838ota.91.1595596796072; 
 Fri, 24 Jul 2020 06:19:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200721124250.8601-1-f4bug@amsat.org>
In-Reply-To: <20200721124250.8601-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Jul 2020 14:19:45 +0100
Message-ID: <CAFEAcA-VSRCR4fFwLkWhOcPtivQJOCM_LEbUafvsW-62Cb15bw@mail.gmail.com>
Subject: Re: [PATCH-for-5.1 v3] hw/misc/aspeed_sdmc: Fix incorrect memory size
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 qemu-arm <qemu-arm@nongnu.org>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>, QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x335.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
X-List-Received-Date: Fri, 24 Jul 2020 13:19:59 -0000

On Tue, 21 Jul 2020 at 13:42, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> The SDRAM Memory Controller has a 32-bit address bus, thus
> supports up to 4 GiB of DRAM. There is a signed to unsigned
> conversion error with the AST2600 maximum memory size:
>
>   (uint64_t)(2048 << 20) =3D (uint64_t)(-2147483648)
>                          =3D 0xffffffff40000000
>                          =3D 16 EiB - 2 GiB
>
> Fix by using the IEC suffixes which are usually safer, and add
> an assertion check to verify the memory is valid. This would have
> caught this bug:
>
>   $ qemu-system-arm -M ast2600-evb
>   qemu-system-arm: hw/misc/aspeed_sdmc.c:258: aspeed_sdmc_realize: Assert=
ion `asc->max_ram_size < 4 * GiB' failed.
>   Aborted (core dumped)
>
> Fixes: 1550d72679 ("aspeed/sdmc: Add AST2600 support")
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> --



Applied to target-arm.next, thanks.

-- PMM

