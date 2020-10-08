Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kQTRT-0004PY-NY
	for mharc-qemu-trivial@gnu.org; Thu, 08 Oct 2020 06:46:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kQTRR-0004Mn-RP
 for qemu-trivial@nongnu.org; Thu, 08 Oct 2020 06:46:34 -0400
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641]:38421)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kQTRQ-0007hE-0b
 for qemu-trivial@nongnu.org; Thu, 08 Oct 2020 06:46:33 -0400
Received: by mail-ej1-x641.google.com with SMTP id ce10so7419583ejc.5
 for <qemu-trivial@nongnu.org>; Thu, 08 Oct 2020 03:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=W93pR4c85urxJqc43xX67bIFtgRTfAcBdk2OKlxXVxo=;
 b=zCpKtmrGMZZPbJpJN1BZk5o3L6fMcuclqaOkFMs8PNPo21tUwFToen+jZwUKPD1obA
 o2ipJDW14hoZJxg+QV7gVXcdLV6Q+nBR7J7F6MtdUcluyIzD3Xrxo+NqXNNR9drAx9lM
 4pUnHhBgjXNZaduqcDc1rUgcchNd7pUY1BRFkytntrSYL0PzpoxZIXWk/cjjuLZy0PxY
 vthQAg5hrLvRMWorcPhcdDsXXuarsmDsAuzqGG28iSXA/ANRi/xr4KL0WIJobi60LHbZ
 2l0SnQI5IOR7w/VNOg/o14t6TkuUCWMdbwntxsSe1ZOt+4Bqx+KwO5bfUoOeVHBb1EPq
 NPUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=W93pR4c85urxJqc43xX67bIFtgRTfAcBdk2OKlxXVxo=;
 b=e7cJZIenFxtD0DtNW0skHW6Mq9lRw+LdVP3ekmMvXVSNuH81r7s8L2wCkLVHvlII6Z
 q++9ilkIJjWLULhiPLNDB1lt8EDeL7N9fgNZcWOSesHJkYLkPkzsExg2Igi1irfSjhza
 1ApykLWw/ChTxJvjKyeR6GzBf6q8dQbWnouY/gXXHU1v65Jj+ez4Slf2QMX78iN03tI5
 2vWvoO9jnhqYUXubtGJW7gzeFdDotsdGd6MHfBSjsT4NT2THi+NFy73DH5/G4L5Nn5Mw
 4k9bSC8dY2A0WWzVmjCdkkbfGlpqByjkkP4XyLPeF18XqfxYznLf2Ik4Ags3KlsIKR0T
 vDuQ==
X-Gm-Message-State: AOAM532swJuXYpWP7c/5tHD17a5HE/GhKo+mzHnLutqR2fzZs5algWLY
 MU02ALOM0hP10wwiGjeEX/8FHrUcwvk6sB873yrj5YXdu17IYg==
X-Google-Smtp-Source: ABdhPJxDT+DVazu705V399eq9nXWzqSModRVAUf7ouFdyzQoXRh576ZZHRIFcYG2osJXBMOkwqNoSWvng/U+kyJ3rGY=
X-Received: by 2002:a17:906:1f42:: with SMTP id
 d2mr7944728ejk.407.1602153990555; 
 Thu, 08 Oct 2020 03:46:30 -0700 (PDT)
MIME-Version: 1.0
References: <20201002080935.1660005-1-f4bug@amsat.org>
In-Reply-To: <20201002080935.1660005-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Oct 2020 11:46:19 +0100
Message-ID: <CAFEAcA8uGrkJg35xiDmZBnqbTDLmA_DfeBypZLkjWTx2dANphA@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/fsl-imx25: Fix a typo
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, 
 QEMU Trivial <qemu-trivial@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::641;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x641.google.com
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
X-List-Received-Date: Thu, 08 Oct 2020 10:46:34 -0000

On Fri, 2 Oct 2020 at 09:09, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  include/hw/arm/fsl-imx25.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/hw/arm/fsl-imx25.h b/include/hw/arm/fsl-imx25.h
> index 971f35dd16..c1603b2ac2 100644
> --- a/include/hw/arm/fsl-imx25.h
> +++ b/include/hw/arm/fsl-imx25.h
> @@ -179,7 +179,7 @@ struct FslIMX25State {
>   * 0xBB00_0000 0xBB00_0FFF 4 Kbytes     NAND flash main area buffer
>   * 0xBB00_1000 0xBB00_11FF 512 B        NAND flash spare area buffer
>   * 0xBB00_1200 0xBB00_1DFF 3 Kbytes     Reserved
> - * 0xBB00_1E00 0xBB00_1FFF 512 B        NAND flash control regisers
> + * 0xBB00_1E00 0xBB00_1FFF 512 B        NAND flash control registers
>   * 0xBB01_2000 0xBFFF_FFFF 96 Mbytes (minus 8 Kbytes) Reserved
>   * 0xC000_0000 0xFFFF_FFFF 1024 Mbytes  Reserved
>   */



Applied to target-arm.next, thanks.

-- PMM

