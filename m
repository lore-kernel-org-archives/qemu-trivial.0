Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iDqad-0001fH-BR
	for mharc-qemu-trivial@gnu.org; Fri, 27 Sep 2019 09:47:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39990)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iDqaE-0001Iv-Nd
 for qemu-trivial@nongnu.org; Fri, 27 Sep 2019 09:47:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iDqaB-00067U-7d
 for qemu-trivial@nongnu.org; Fri, 27 Sep 2019 09:46:54 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:40936)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iDqaA-00066v-TY
 for qemu-trivial@nongnu.org; Fri, 27 Sep 2019 09:46:51 -0400
Received: by mail-oi1-x243.google.com with SMTP id k9so5222779oib.7
 for <qemu-trivial@nongnu.org>; Fri, 27 Sep 2019 06:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=iFxNGnMHc2gomfgmq3P5pPVF/whBRHuAE9BOwskh+hw=;
 b=IjA3JX7DIDleqxnLELS8jcb70/pCkCrV8JkN1Ujn0/mWiHUW3RvIqdY4HcEep0++BG
 YGl4jCRTQPFF28EfOQA+7S77rOPQdfUOQHdFmCKtJypx64IU3yejdn239QJ+9Q6rjbP5
 yDGJuCayFT7mG48tgi1AfoHRnMDXn+BY1fxa6jbMyaohEDzEJEN+A/YGkH1PIfZS46OF
 qU42Rco7BMGWTSjQrIlqoz3xo13kfDZxorWn5ArIvfBq+XUJKytRgI7jjgkTXLYg4Y5+
 ZOyKiqaazsNpUpX1ADbw4IsT9wGelYM03c9eubnJUp9rryKzCD0E4PtwoMBaBC6yTRq2
 d1qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=iFxNGnMHc2gomfgmq3P5pPVF/whBRHuAE9BOwskh+hw=;
 b=bQmE7um5bKLOUu0dOt0GjlSNor1hUBd4W0DFdSab9kAKVPoP/yre1/7D6jfzLuXfsP
 RrhwXgJGdyC19z7kQ0Hs5F37c6b3ldv5Bt3n/VBjkaU98tzvkVnz4Hvb5B02+kmKTcTj
 EyODdfejs46xYCNklxwon1yeKY9eG5PbODFM9O1QN6FTh5GzOWAxbArqo1S/i4btybfR
 WFWDIDy5gKWtSX/XvUCJzUmGvn+pa1/wnOqfvhlQmQUliOB3WK/bLk5L0fTAe9O4u0oa
 CnQL4c0OiZ2NZay8fg4LTZVhmD5JYz7qfSVQTYAzpMMTeADI5PMkxLnzAcAERaK5tmyn
 vI9w==
X-Gm-Message-State: APjAAAXEgT9R05AifUE2Qc/FCrUBJs94vEvK5PGTVPC9rZN7gvt4wOL2
 e+Fuvwti7HpHQGmFz7wuE0axAYpyEH0/w63JghszpTstDdY=
X-Google-Smtp-Source: APXvYqwDPDt9mPIQ92kcFMheHLiVAE6j+R5/tVPxT/BCrfwQuGh+8a2VyWm41yGTCgfowLbEzf3hPx1IFLNiyck5dRc=
X-Received: by 2002:aca:50d8:: with SMTP id e207mr6111829oib.48.1569581165430; 
 Fri, 27 Sep 2019 03:46:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190923131108.21459-1-philmd@redhat.com>
In-Reply-To: <20190923131108.21459-1-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 27 Sep 2019 11:45:54 +0100
Message-ID: <CAFEAcA9V9LXQMDxE-QFCECJou9-7x-F8XDTCKSo9SkGT_oenuQ@mail.gmail.com>
Subject: Re: [PATCH v2] hw/arm/boot: Use the IEC binary prefix definitions
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Stefano Garzarella <sgarzare@redhat.com>, Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
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
X-List-Received-Date: Fri, 27 Sep 2019 13:47:11 -0000

On Mon, 23 Sep 2019 at 14:11, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> IEC binary prefixes ease code review: the unit is explicit.
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> v2: Use 4*GiB in arm_load_dtb (sgarzare)



Applied to target-arm.next, thanks.

-- PMM

