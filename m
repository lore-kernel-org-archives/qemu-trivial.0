Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nVA6v-0007ow-3i
	for mharc-qemu-trivial@gnu.org; Fri, 18 Mar 2022 06:45:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nVA6o-0007oC-GD
 for qemu-trivial@nongnu.org; Fri, 18 Mar 2022 06:45:28 -0400
Received: from [2607:f8b0:4864:20::b2b] (port=34433
 helo=mail-yb1-xb2b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nVA6n-0007TW-1G
 for qemu-trivial@nongnu.org; Fri, 18 Mar 2022 06:45:26 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id h126so15171592ybc.1
 for <qemu-trivial@nongnu.org>; Fri, 18 Mar 2022 03:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=caDBYGIUNO2OHO+Uch1oAdpMHErIerLtn1C+qAgza7o=;
 b=NeKE+36RkGB8VBcj/IiRcVwDTezuQXrp/5uj1H+qC+6BbOXgKldX4snA6kQ2FjgjOh
 4iKnm1NhMV4sMHcY9IeHdny5gazfaj/2xRpz8BwC8gAie7vJ16Xeepu7aWsteqWuXQBI
 UzkmlS0DlqBzF7TWHsK1itpTz1TICMPEn1wBDxOAnYsiFFCoUrJmXsGPeWVGq8l04Ho7
 dXafxD4r3mxiJz2dRcvDywd70JMesDAD+DkTjNNKXPaFBg9FIdJcl/m6U14emiCQjUma
 w/NLAJUIAEUVU0Qm/3aM3XWoFN4grO5yRlnVbSx63LnaqrpKaAVlM7jC/yHBm5HarVIz
 DDxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=caDBYGIUNO2OHO+Uch1oAdpMHErIerLtn1C+qAgza7o=;
 b=ujRjSnAO70jZOdnMFhSz9lC1m+KGEvUrNTodlQkTuzet4W6cZ54zkznopBLCh+A3FF
 hWEe9LtT1+LHr+V/GpI5r8H3JAl9r3C21YG1I3wKTficoX0kjnxgDlIQusZ78mkm/fSo
 S+t8RSfw72vlvMuf6ipMVuZRjZe7ZYAPC65JCzZZK7CE16DhPK6oZq8xNRrOsTfcWTLR
 pwAMqwPxBNUdVBbLNeP7k/fma4i3rZyO35iTMOe6KXUmCWr53QY6PrbnAEhlI2UJkKJV
 3MbRPY7Zv7+tFEptPGjhVFpTSB2rI3xqE75rHB9ufVOJr4TX4bbgbnApH+Xz+iuJTGO3
 3ahA==
X-Gm-Message-State: AOAM532VTVPQoQnBL5qhRWmlh+DrzMadvIIL1D7RS9dx5eTKp4cvzrQz
 mI5y0HCN8ZGa4j2dyEABEB1KBgjirqewFMuPwXeoeQ==
X-Google-Smtp-Source: ABdhPJwV9Z3OEjjuuMx/Oqq3x2s2d9CwRTwKR0DwTxsCTB1hbS7wCpNpwgtTLivALxwamcxu9Hnv4H2LIcvFpgS9W38=
X-Received: by 2002:a5b:350:0:b0:628:86b8:6e09 with SMTP id
 q16-20020a5b0350000000b0062886b86e09mr8996723ybp.39.1647600323869; Fri, 18
 Mar 2022 03:45:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220318101124.912-1-quic_rcran@quicinc.com>
In-Reply-To: <20220318101124.912-1-quic_rcran@quicinc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 18 Mar 2022 10:45:11 +0000
Message-ID: <CAFEAcA-SHKsmemg10VnO6pcKrR9HB=ViX0+zhwWKXGzMsp8Obg@mail.gmail.com>
Subject: Re: [PATCH trivial 1/1] hw/pci/pci.c: Fix typos of "Firewire", and of
 "controller" on same line
To: Rebecca Cran <quic_rcran@quicinc.com>
Cc: Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <Laurent@vivier.eu>,
 qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 18 Mar 2022 10:45:31 -0000

On Fri, 18 Mar 2022 at 10:14, Rebecca Cran <quic_rcran@quicinc.com> wrote:
>
> Signed-off-by: Rebecca Cran <quic_rcran@quicinc.com>
> ---
>  hw/pci/pci.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index 5cb1232e271d..dae9119bfe5f 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -1697,7 +1697,7 @@ static const pci_class_desc pci_class_descriptions[] =
>      { 0x0902, "Mouse", "mouse"},
>      { 0x0A00, "Dock station", "dock", 0x00ff},
>      { 0x0B00, "i386 cpu", "cpu", 0x00ff},
> -    { 0x0c00, "Fireware contorller", "fireware"},
> +    { 0x0c00, "Firewire controller", "firewire"},
>      { 0x0c01, "Access bus controller", "access-bus"},
>      { 0x0c02, "SSA controller", "ssa"},
>      { 0x0c03, "USB controller", "usb"},
> --

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

