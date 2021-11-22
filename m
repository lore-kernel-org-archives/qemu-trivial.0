Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mp6tC-0005eR-1d
	for mharc-qemu-trivial@gnu.org; Mon, 22 Nov 2021 05:49:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mp6tA-0005Z0-Pf
 for qemu-trivial@nongnu.org; Mon, 22 Nov 2021 05:49:32 -0500
Received: from [2a00:1450:4864:20::42b] (port=44973
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mp6t9-0008Pj-89
 for qemu-trivial@nongnu.org; Mon, 22 Nov 2021 05:49:32 -0500
Received: by mail-wr1-x42b.google.com with SMTP id n29so31797736wra.11
 for <qemu-trivial@nongnu.org>; Mon, 22 Nov 2021 02:49:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=JVajJ0TDzfG2+VIWfPsFwIhrDu/OlZKLmKn5D/S/flU=;
 b=moHtstDrrTCHhaJasJXchUm1vEhCQqOY1ov/n0dWxYzUIlBsXIRwcN4KfdKxJO0jYZ
 DzhmpL1L/C+7Nd3Y7E5583CCib5DK7OAxrLI9y1bwmoqDErSvtGw0PW+Amsi3kws2NjD
 9jFa2OVdQC9r8Eug9+MfzPe6xAdheE/wfT1xZNsXwnZNKvIs6vFN2HwVkz7REGcU9uHm
 GdGHlaWhZe0RElAAK/GuaBVJh2ZDDN1yrSNIJEZPFgk5NmphzszvFwyWFaV3SqZjIyCi
 Zd9ibeMrcz15xXHADMp1aHbMWlAlle/uQm+VTnqSHCkP62EMHbuVrZskzcK3G2SW2yHE
 ggOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=JVajJ0TDzfG2+VIWfPsFwIhrDu/OlZKLmKn5D/S/flU=;
 b=BtnMYdwIe48lxjwdt6dZx5DJevfnIXHBqpHRq8t9WAEHOIrWRTFWhLsyCSmsoimblS
 beS8uYW6catZxjProTe1TwRzIxhdAwO4oei489mCyJjGAsssRmZDVNDSj0tubogw4Tk9
 b0RXirv4YL1kwWrhg8q/66CJJR7aR9WYXponu/eS2bfbLivJQ265XnbNWk6ujfNaYBLd
 DA4tI1ELrvlteEgaVWNfPMDAjl5FyWcUGcBy+TdkTe55g/fzn2Nao8WKK8jedAvrp1mk
 YBOOQVK/OEIQeBHK/bilYzElAtWTgcjjmnjfXw7JRpm30Rn6trfacQkqQln2xw3ikpfg
 ju1Q==
X-Gm-Message-State: AOAM531/jCrpvH5GLsFkOwEUF/mcS6lWDpEWHR0Sx2FHpzbcZu2CZx5g
 m91T/6sM2eMD7hohsxfPJFCL8jC8rlmxe2IBsAUHafA4OkI=
X-Google-Smtp-Source: ABdhPJymBfKa14dn47WBBV959Q+2eflW+SjyJzhjCw3L7XcTVrgvHaK0omVn50VLCKktUH1+jPcdcCnDwc7XUOAbT/s=
X-Received: by 2002:a5d:6151:: with SMTP id y17mr37379627wrt.275.1637578169752; 
 Mon, 22 Nov 2021 02:49:29 -0800 (PST)
MIME-Version: 1.0
References: <20211122104744.1051554-1-f4bug@amsat.org>
In-Reply-To: <20211122104744.1051554-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 22 Nov 2021 10:49:18 +0000
Message-ID: <CAFEAcA87Zxv3QZCq+W0gtyo+9_ng94U49rTdwxfWiX=za2hPOQ@mail.gmail.com>
Subject: Re: [PATCH] hw/scsi: Fix scsi_bus_init_named() docstring
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, Fam Zheng <fam@euphon.net>,
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 22 Nov 2021 10:49:33 -0000

On Mon, 22 Nov 2021 at 10:47, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Commit 739e95f5741 ("scsi: Replace scsi_bus_new() with
> scsi_bus_init(), scsi_bus_init_named()") forgot to rename
> scsi_bus_init() in the function documentation string.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  include/hw/scsi/scsi.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/hw/scsi/scsi.h b/include/hw/scsi/scsi.h
> index a567a5ed86b..2ef80af6dca 100644
> --- a/include/hw/scsi/scsi.h
> +++ b/include/hw/scsi/scsi.h
> @@ -158,7 +158,7 @@ struct SCSIBus {
>   * provided by the caller. It is the caller's responsibility to make
>   * sure that name does not clash with the name of any other bus in the
>   * system. Unless you need the new bus to have a specific name, you
> - * should use scsi_bus_new() instead.
> + * should use scsi_bus_init() instead.
>   */
>  void scsi_bus_init_named(SCSIBus *bus, size_t bus_size, DeviceState *hos=
t,
>                           const SCSIBusInfo *info, const char *bus_name);
> --
> 2.31.1

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

