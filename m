Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lHMii-0000D0-2X
	for mharc-qemu-trivial@gnu.org; Wed, 03 Mar 2021 03:19:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dme@dme.org>) id 1lHMif-0000CZ-Ku
 for qemu-trivial@nongnu.org; Wed, 03 Mar 2021 03:18:57 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:35574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dme@dme.org>) id 1lHMid-0006gM-VV
 for qemu-trivial@nongnu.org; Wed, 03 Mar 2021 03:18:57 -0500
Received: by mail-wr1-x433.google.com with SMTP id l12so22632482wry.2
 for <qemu-trivial@nongnu.org>; Wed, 03 Mar 2021 00:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dme-org.20150623.gappssmtp.com; s=20150623;
 h=to:cc:subject:in-reply-to:references:from:date:message-id
 :mime-version:content-transfer-encoding;
 bh=HVmepXob9ZmbChWjLZW0mKAsVatZgsD82ynPeBTwbrs=;
 b=Ajxz6crYt++MLn+OYn1V1QcGFO2DLXDyLQSi4dZi0juOMzIOU2tcxQO4F65hQ9sSVi
 1xB7mii3hMyowm5T/LBq9PlvjpyX8RBH/nGHXqPlhsrBAtdN90h/iyzUhhH30yAkczNc
 cZVpF/yBzC6qX3qtawnvVtgbpjqK5p1VEtC12C/05t+ZJgxjAe8PKpuPIfYoqlTwV+7u
 dlFUr5z1JZ+nRKKxy1TI2lHqgP6G0iFv/Bg3F1LzrRlYog6OZ58kAPNyZo3glv1vQS4G
 LqiTdTtflkMm0crB+lirvc9VJ4/vJVs9D2W+5XBwc/GW6BdW5hX2uAn7RvxKgAnzOTd+
 DwkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:subject:in-reply-to:references:from:date
 :message-id:mime-version:content-transfer-encoding;
 bh=HVmepXob9ZmbChWjLZW0mKAsVatZgsD82ynPeBTwbrs=;
 b=hV4GIgd2cwQj7XPkrHi/NIuSFWNPsObYs1jPF9W8BOM1n9iozGsTygmRpTWW/FAHOg
 00eLgDxD4ly02TPPJDstFmAqBBGbfikk/cvY+wnU35vm2WFbGJr8ynX950v17UR7dGFO
 0/tZ4ucazCfR1rDhUSzSYUdFRhx6thKTtM9EzaB2K3RVmOlE4smLMp7fiNkhvg4ifOef
 4BEiv+pFMv6sDmnLhiHQ3w83hCrUBq8Rctx7RmTqMMOeh+LB7WEDzBVTtiIKbhycDXc9
 sImBx7TPjfsleM5UYES3XZkk7JGMrvKUsxpe5nH0WS68hlzdYvjhHj71wwXfVHDbbyad
 D5vA==
X-Gm-Message-State: AOAM531JRdZBk2QGddHJSKwQPDqujh/ttan5J6pz7QsCXXpVp5oU4tGb
 l9Vc7a84g0UyMgNqwgxFu7lp1w==
X-Google-Smtp-Source: ABdhPJxrQ4cZoTlw003L1bHOnI/dfUa2KLOa2FUxulV3W8Lore3VwTbVZ/11/lszj2WSW5APFxOAXA==
X-Received: by 2002:adf:f584:: with SMTP id f4mr26544826wro.311.1614759533522; 
 Wed, 03 Mar 2021 00:18:53 -0800 (PST)
Received: from disaster-area.hh.sledj.net (disaster-area.hh.sledj.net.
 [2001:8b0:bb71:7140:64::1])
 by smtp.gmail.com with ESMTPSA id o14sm29334847wri.48.2021.03.03.00.18.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 00:18:53 -0800 (PST)
Received: from localhost (disaster-area.hh.sledj.net [local])
 by disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id 1dddac4b;
 Wed, 3 Mar 2021 08:18:52 +0000 (UTC)
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH] hw/elf_ops: Fix a typo
In-Reply-To: <20210225181344.3623720-1-philmd@redhat.com>
References: <20210225181344.3623720-1-philmd@redhat.com>
X-HGTTG: heart-of-gold
From: David Edmondson <dme@dme.org>
Date: Wed, 03 Mar 2021 08:18:51 +0000
Message-ID: <m2sg5clkes.fsf@dme.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: neutral client-ip=2a00:1450:4864:20::433;
 envelope-from=dme@dme.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NEUTRAL=0.779, UNPARSEABLE_RELAY=0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Wed, 03 Mar 2021 08:18:58 -0000

On Thursday, 2021-02-25 at 19:13:44 +01, Philippe Mathieu-Daud=C3=A9 wrote:

> g_mapped_file_new_from_fd()'s parameter is named 'writable'.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: David Edmondson <dme@dme.org>

> ---
>  include/hw/elf_ops.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/hw/elf_ops.h b/include/hw/elf_ops.h
> index 8e8436831d2..304f266bf3b 100644
> --- a/include/hw/elf_ops.h
> +++ b/include/hw/elf_ops.h
> @@ -417,7 +417,7 @@ static int glue(load_elf, SZ)(const char *name, int f=
d,
>=20=20
>      /*
>       * Since we want to be able to modify the mapped buffer, we set the
> -     * 'writeble' parameter to 'true'. Modifications to the buffer are n=
ot
> +     * 'writable' parameter to 'true'. Modifications to the buffer are n=
ot
>       * written back to the file.
>       */
>      mapped_file =3D g_mapped_file_new_from_fd(fd, true, NULL);
> --=20
> 2.26.2

dme.
--=20
I've always been mad, I know I've been mad, like the most of us are.

