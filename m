Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iVFMQ-0002zK-1f
	for mharc-qemu-trivial@gnu.org; Thu, 14 Nov 2019 08:40:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35629)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iVFMO-0002xg-Bm
 for qemu-trivial@nongnu.org; Thu, 14 Nov 2019 08:40:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iVFMN-0001as-CA
 for qemu-trivial@nongnu.org; Thu, 14 Nov 2019 08:40:32 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:54901
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iVFMN-0001ag-8a
 for qemu-trivial@nongnu.org; Thu, 14 Nov 2019 08:40:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573738830;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p3wjVOAJ1ygdRiLEUMd96LVQIl1MKM0n79HQLwkNNqk=;
 b=WtRs2y3IBW7gD5f6CSKIJB98ylHs64skkmLZZppE43c3Uur5BiLJZ0228RTKtGasILnfIG
 SC4oWoq2sTRBV3+GCiIGnfMp7izxZ6DcZ/4ajIILU0IHeH78/gXDBb57yP58He1fclDso0
 LVEXbH7Wc5F7xsHv/JJFlc5K14UcOEo=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-59-DdcJpbbtNwqixchcpR-rdA-1; Thu, 14 Nov 2019 08:40:29 -0500
Received: by mail-wr1-f70.google.com with SMTP id w4so4443349wro.10
 for <qemu-trivial@nongnu.org>; Thu, 14 Nov 2019 05:40:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZQSzkiSSI9tXF2L6vCtMwTYX0VEOyct32evvsNpECnM=;
 b=sLjHx3uql6XaCJIOeC/XREE+KfBy3TJTwExfFK0VofDFIpIfXU9HlOmodIP6H3JK8x
 zfq5KpeA6z++NADoaPu1OIfPQM60WgGWEnjWLpd+hNQsZv288xXzEiRAt+UXlq1A4ESB
 MLH4Q5i7ZiM6XQSygk5jevasO3kyQhf5S1gnpSHWDi9/8ghQEAtcyy2kbq80++hDbZuV
 Ndzg9PYJ0b2pmylkmcPOqYW7DNA3pu1PN3GYnMvNcdUh4sLlWuQvgD+WI+KcVEN0D/0g
 AI9gzAtlVh/ce5Gd6E4e3LwFtjc86XASgpeLkJ/BrHhcApVdd52Kx0irsLFiuwnAdzcd
 TI0Q==
X-Gm-Message-State: APjAAAWpgbXrD/ZIumyHB4cZO26kA3ucCKKClHs/3rL3z9FCBk8i2+QA
 SpjfcHM0ZjsQTgK4XkEUQQl1zmZd6Rc8Dqb3EXyXB8EzfBmWxbDp2Nutdg4UXPMXL8WQ8z/WhlQ
 vSK67tIs0+dDfx5HRzw==
X-Received: by 2002:a5d:522e:: with SMTP id i14mr9191080wra.27.1573738827764; 
 Thu, 14 Nov 2019 05:40:27 -0800 (PST)
X-Google-Smtp-Source: APXvYqxVVBEH+10GZV8Pjh4vCKHLGpcVhS5gzt0v9TOgbiRYRzKThJJYd4QMTvflYzm5mDQ8gRjAUQ==
X-Received: by 2002:a5d:522e:: with SMTP id i14mr9191068wra.27.1573738827604; 
 Thu, 14 Nov 2019 05:40:27 -0800 (PST)
Received: from [192.168.1.35] (170.red-83-59-162.dynamicip.rima-tde.net.
 [83.59.162.170])
 by smtp.gmail.com with ESMTPSA id i25sm2830829wmd.25.2019.11.14.05.40.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Nov 2019 05:40:27 -0800 (PST)
Subject: Re: [PATCH] tests: fix modules-test 'duplicate test case' error
To: Cole Robinson <crobinso@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial <qemu-trivial@nongnu.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <d64c9aa098cc6e5c0b638438c4959eddfa7e24e2.1573679311.git.crobinso@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <82e8271c-0bed-5c42-adbd-f140371d3f82@redhat.com>
Date: Thu, 14 Nov 2019 14:40:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <d64c9aa098cc6e5c0b638438c4959eddfa7e24e2.1573679311.git.crobinso@redhat.com>
Content-Language: en-US
X-MC-Unique: DdcJpbbtNwqixchcpR-rdA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
X-List-Received-Date: Thu, 14 Nov 2019 13:40:33 -0000

On 11/13/19 10:09 PM, Cole Robinson wrote:
> ./configure --enable-sdl --audio-drv-list=3Dsdl --enable-modules
>=20
> Will generate two identical test names: /$arch/module/load/sdl
> Which generates an error like:
>=20
> (tests/modules-test:23814): GLib-ERROR **: 18:23:06.359: duplicate test c=
ase path: /aarch64//module/load/sdl
>=20
> Add the subsystem prefix in the name as well, so instead we get:
>=20
> /$arch/module/load/audio-sdl
> /$arch/module/load/ui-sdl
>=20
> Signed-off-by: Cole Robinson <crobinso@redhat.com>
> ---
>   tests/modules-test.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/modules-test.c b/tests/modules-test.c
> index d1a6ace218..88217686e1 100644
> --- a/tests/modules-test.c
> +++ b/tests/modules-test.c
> @@ -64,7 +64,8 @@ int main(int argc, char *argv[])
>       g_test_init(&argc, &argv, NULL);
>  =20
>       for (i =3D 0; i < G_N_ELEMENTS(modules); i +=3D 2) {
> -        char *testname =3D g_strdup_printf("/module/load/%s", modules[i =
+ 1]);
> +        char *testname =3D g_strdup_printf("/module/load/%s%s",
> +                                         modules[i], modules[i + 1]);
>           qtest_add_data_func(testname, modules + i, test_modules_load);
>           g_free(testname);
>       }
>=20

Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>


