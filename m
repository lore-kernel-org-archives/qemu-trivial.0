Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jfTwy-0002xh-5k
	for mharc-qemu-trivial@gnu.org; Sun, 31 May 2020 15:48:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jfTww-0002xC-HG
 for qemu-trivial@nongnu.org; Sun, 31 May 2020 15:48:50 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:43108)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jfTwv-0006hN-Jc
 for qemu-trivial@nongnu.org; Sun, 31 May 2020 15:48:50 -0400
Received: by mail-oi1-x244.google.com with SMTP id i22so7246559oik.10
 for <qemu-trivial@nongnu.org>; Sun, 31 May 2020 12:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ILaa0c1UMVCHaphm0DdLpskuHaCCEchvE3UnkzWKwTU=;
 b=gh/yOzBvDIyuIfovF4HlMlYod16q8wUChDeH3hG7Vg+iTSHsq68cyaZOlaiNPIf9US
 ygkjSaJT2vmqdUJQIEGlL8gV2MtXWHco1mZIOuO5KiIKQs3G5nr+4EVe214ZZXeEv7t2
 BrAvP75A4QrCdtXWHeTAoOJNw5pvGzbuC2G/kLi877DgbTs+y3Xd2yQqelINQ+/4seCD
 JnV4TjmGBJgF8NzHohYqz7Kn6m0rIYAsc00stNMZ+W0zNNKTer3Nbo9C6s5802r+PVaz
 RvSVWI8S5dnalEPSFqzdJ82hUjtjWbzfyTWqx+oNh8fIgRphvyytYus3c9E04tDW/7Xd
 ywBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ILaa0c1UMVCHaphm0DdLpskuHaCCEchvE3UnkzWKwTU=;
 b=Wv+u2FVxOMgu+C7JnStvBF7l3z27hydYFSlafZ26wjP0T1MYCzLJnXzfmhe6NXkqEx
 eXtCz0RotlsrzB+EI7gQ6BRZ34oeNWdWcw8mdD84FMxzDm3wbtubkGepJDGOyhwvoDG9
 Ldbit84oY3PFfso6zT8Uh06b55XyE+smarT1CfeY2PT2JujFlF1Z/CHG+Mk0rflBEwy/
 PWNJbKdAR43zSpbuqHSUxpHgmhhxsGD7lzOQenD3GzSs+rInUDj3J7RU2qFKDc1tLoYz
 Mga1KBTYPlJ9Ck7ouyQxDSWMPS/SJx4Gttn7zUK7BOcZOPfwGtkqPnnzBOJZJIPfxR/K
 eR/w==
X-Gm-Message-State: AOAM5305SZaBdtNAOpXPPu6Dqo1xgeL7Ez6kjTEybSk5SPOglVwix6iS
 5iw0SvhK+5Nf2L2B/TwQD3yWrZ50at9qG+euMfQ+iw==
X-Google-Smtp-Source: ABdhPJxKeNN10qTHbz3+NODuq1ECUVF+14p38NKGTSU2wB+Fz1ZTvl0ES71h3qOGWCxhFj3oAr/7710lgqqoniYFZ4Q=
X-Received: by 2002:aca:5451:: with SMTP id i78mr7136005oib.48.1590954528355; 
 Sun, 31 May 2020 12:48:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200531173814.8734-1-f4bug@amsat.org>
In-Reply-To: <20200531173814.8734-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 31 May 2020 20:48:37 +0100
Message-ID: <CAFEAcA95OLKmG1xNVjAg_KPt3hfN4vT5wvZ6SJbcKk5zdYO_Gg@mail.gmail.com>
Subject: Re: [PATCH 0/8] hw: Fix some incomplete memory region size
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Andrew Jeffery <andrew@aj.id.au>,
 Helge Deller <deller@gmx.de>, 
 Richard Henderson <rth@twiddle.net>, Eduardo Habkost <ehabkost@redhat.com>,
 Paul Durrant <paul@xen.org>, 
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 "open list:X86" <xen-devel@lists.xenproject.org>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 QEMU Trivial <qemu-trivial@nongnu.org>, Joel Stanley <joel@jms.id.au>,
 qemu-arm <qemu-arm@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, qemu-ppc <qemu-ppc@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::244;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x244.google.com
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
X-List-Received-Date: Sun, 31 May 2020 19:48:50 -0000

On Sun, 31 May 2020 at 18:38, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> memory_region_set_size() handle the 16 Exabytes limit by
> special-casing the UINT64_MAX value.
> This is not a problem for the 32-bit maximum, 4 GiB, but
> in some places we incorrectly use UINT32_MAX instead of
> 4 GiB, and end up missing 1 byte in the memory region.
>
> This series fixes the cases I encountered.
> Also included few patches while reviewing, I replaced some
> magic values by the IEC binary prefix equivalent.
>
> Regards,
>
> Phil.
>
> Philippe Mathieu-Daud=C3=A9 (8):
>   hw/arm/aspeed: Correct DRAM container region size
>   hw/pci-host/prep: Correct RAVEN bus bridge memory region size
>   hw/pci/pci_bridge: Correct pci_bridge_io memory region size
>   hw/pci/pci_bridge: Use the IEC binary prefix definitions
>   hw/pci-host: Use the IEC binary prefix definitions
>   hw/hppa/dino: Use the IEC binary prefix definitions
>   hw/i386/xen/xen-hvm: Use the IEC binary prefix definitions
>   target/i386/cpu: Use the IEC binary prefix definitions

whole series:
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

