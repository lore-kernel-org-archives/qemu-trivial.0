Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1is9qK-0003qA-09
	for mharc-qemu-trivial@gnu.org; Thu, 16 Jan 2020 13:26:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36854)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1is9qF-0003ps-QL
 for qemu-trivial@nongnu.org; Thu, 16 Jan 2020 13:26:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1is9qC-0004iJ-E9
 for qemu-trivial@nongnu.org; Thu, 16 Jan 2020 13:26:03 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:45832
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1is9qC-0004hj-Aw
 for qemu-trivial@nongnu.org; Thu, 16 Jan 2020 13:26:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579199159;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6wb3uvWE//pbl5HIWjx8Nx0ie/6KPJsZZo9m0HmU93k=;
 b=gL91XEDclLNsOXktfAhHWcJAU/DMslggevajXDZp08X7fVsLrzGa1QdhCKhqXBuge0ZlQd
 hlZY256eaFFEKxw4cMEhY2XIno1stI4sQ/ag/HlH8raohGTY9yWmEw8xYgwUnH+EstkpAD
 /biqw7YHZPuSfckq/ZRdx8IkhdSTvEI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-296-p9i4o3DQNDCK6lVXRpEyaw-1; Thu, 16 Jan 2020 13:25:58 -0500
Received: by mail-wr1-f70.google.com with SMTP id 90so9482994wrq.6
 for <qemu-trivial@nongnu.org>; Thu, 16 Jan 2020 10:25:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=c/c8V5rf2/aAXQloIrsK2RPGfgbVJD1aae0hGkuaRUc=;
 b=o9Cj6sQ3FjtpSo/7M6YKBL9nHHYCaXQ5/ffmCrMOl104HcQqek0AlGWnz1Kuf2gGcK
 jqfpXXGpY9pZYlGRdynEbeX1ZLhUMUD0btgk1YU6Hg6tjVBOX08QQn5RdPqCRBQJBonz
 bHkWd1Yfte5w3VvvA0hPhmaARo6DD6F8pJJaYKZL03xlbUNih6jh6ppc5Tgc96Ms4EL3
 DOnZN0nlC2nk+0xJFh3AfDTPyF1qAsYAeBPblDvHvB2qryDjjySVi70qvAql2bo8XnqC
 9lwwt58AkFYDGI7QvfByJIIe9RhBQszMTpRKAZ5ygKfTAy3UykXmj5mUO54mDu+0baCO
 7VPw==
X-Gm-Message-State: APjAAAXAOWRQXMytn+OXyCF/rXA2PD62bd77OHp9/DqOP99FkEyvROnw
 bd9QsGeJ5mO97Q2uB/O+2Cl1oXi06k913Mbce8o871U+isPyeYJ6kmMSQcM7tNBrrfFW0sSONGO
 P/e9SiO5jcNtqJcMH5g==
X-Received: by 2002:adf:d184:: with SMTP id v4mr4652798wrc.76.1579199156878;
 Thu, 16 Jan 2020 10:25:56 -0800 (PST)
X-Google-Smtp-Source: APXvYqw144x1PcEjEHgFGRI3gzp5sO/V4YEQxE/gobRDdPC6z+KmBEBwFmquqVfqE9Tt8QUptSbyJA==
X-Received: by 2002:adf:d184:: with SMTP id v4mr4652773wrc.76.1579199156615;
 Thu, 16 Jan 2020 10:25:56 -0800 (PST)
Received: from [10.101.1.81] ([176.12.107.132])
 by smtp.gmail.com with ESMTPSA id v17sm30106941wrt.91.2020.01.16.10.25.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jan 2020 10:25:55 -0800 (PST)
Subject: Re: [PATCH] MAINTAINERS: update Leif Lindholm's address
To: Leif Lindholm <leif@nuviainc.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
 Leif Lindholm <leif.lindholm@linaro.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20200116174226.4780-1-leif@nuviainc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a2fc8a4f-0b56-7868-0e52-51c2abfd97f7@redhat.com>
Date: Thu, 16 Jan 2020 19:25:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200116174226.4780-1-leif@nuviainc.com>
Content-Language: en-US
X-MC-Unique: p9i4o3DQNDCK6lVXRpEyaw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
X-List-Received-Date: Thu, 16 Jan 2020 18:26:07 -0000

On 1/16/20 6:42 PM, Leif Lindholm wrote:
> Update address to reflect new employer.
>=20
> Signed-off-by: Leif Lindholm <leif@nuviainc.com>
> ---
>   MAINTAINERS | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 483edfbc0b..3c8653f26f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -735,7 +735,7 @@ F: include/hw/ssi/imx_spi.h
>   SBSA-REF
>   M: Radoslaw Biernacki <radoslaw.biernacki@linaro.org>
>   M: Peter Maydell <peter.maydell@linaro.org>
> -R: Leif Lindholm <leif.lindholm@linaro.org>
> +R: Leif Lindholm <leif@nuviainc.com>
>   L: qemu-arm@nongnu.org
>   S: Maintained
>   F: hw/arm/sbsa-ref.c
>=20

You might want to add yourself a .mailmap entry too:

-- >8 --
diff --git a/.mailmap b/.mailmap
index 3816e4effe..a521c17b44 100644
--- a/.mailmap
+++ b/.mailmap
@@ -44,6 +44,7 @@ Aleksandar Markovic <amarkovic@wavecomp.com>=20
<aleksandar.markovic@imgtec.com>
  Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com> <arikalo@wavecomp.com>
  Anthony Liguori <anthony@codemonkey.ws> Anthony Liguori=20
<aliguori@us.ibm.com>
  James Hogan <jhogan@kernel.org> <james.hogan@imgtec.com>
+Leif Lindholm <leif@nuviainc.com> <leif.lindholm@linaro.org>
  Paul Burton <pburton@wavecomp.com> <paul.burton@mips.com>
  Paul Burton <pburton@wavecomp.com> <paul.burton@imgtec.com>
  Paul Burton <pburton@wavecomp.com> <paul@archlinuxmips.org>
---

If you ack this snippet maybe a maintainer is willing to amend it to=20
your patch :)

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>


