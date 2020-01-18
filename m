Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1isl2q-0002Ot-UR
	for mharc-qemu-trivial@gnu.org; Sat, 18 Jan 2020 05:09:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46147)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1isl2o-0002Od-74
 for qemu-trivial@nongnu.org; Sat, 18 Jan 2020 05:09:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1isl2m-0006BG-F8
 for qemu-trivial@nongnu.org; Sat, 18 Jan 2020 05:09:29 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:58277
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1isl2m-00066U-2K
 for qemu-trivial@nongnu.org; Sat, 18 Jan 2020 05:09:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579342166;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ALmFK4GN1R3f8ivCPsaZjbKvNERv/UXgwN1V0eQdo9U=;
 b=PF1G5ZpjdD+3NXpIHGb6uwDbSyiM4p2VshRLah6sAhz9QOwT601Puku9aLxrpXDwcmZA8X
 I8K3BJO/Il0grvCXSMMdcBUdDXpC/3WA/fMMIPAjyGUsYAd3N7pzP38pEfdIDtXFjd5yAV
 XueiysX94NastBWE8qA2gF8GXq4nXmc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-241-lC0SLoIeMWCEcNg9U2Eu9g-1; Sat, 18 Jan 2020 05:09:25 -0500
Received: by mail-wr1-f69.google.com with SMTP id u18so11551187wrn.11
 for <qemu-trivial@nongnu.org>; Sat, 18 Jan 2020 02:09:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=U1Sxext4Y1Dh1E+fQ3V/TgeW7exJ8+wkF1SkhDeB9Co=;
 b=LmtiuoWZLXPWHAkMudtgMG1MfaABPhaT3o4WGhuZ0CE4MsD1WTedYp3LxnYlASctzZ
 Snr6/StmIzZSYbot4cUVljAoMxtfhlxW+2x0MqcQscSkRJ/hX9iCNignjb34C+irBBd3
 SSi3fxzcTnBhFxpkoWBd3il+v+TKslR/VJxTnshlgGvyy2wJxnF6aUF4UfVHDnpV0hzD
 pAAfInl5ov12F1YG2aqoJdouPBt8NIFQL/47jFWYcyIJBFkbZHRMV+TMDTQzFvSxe/qW
 eVqQUVDmLYd3UOjieLarxxuK9nPRKVsS1KXICu/NG1rpaVWpjRi8kYZD1mF0Nd/GvXKX
 v3QA==
X-Gm-Message-State: APjAAAUd+2Zg9fWTOMU18ErHFyL1yaTENgwjJJXalV4gjSGOM9bOTjzo
 M6YUbkfnp3NpukaBzz4Zj/H4x2cujh7/jOjvpqJ8/3N1r9+52eEllXrY9xzwDGkM8xuhA6qDi3+
 SuoDQJ+kIPywZpRSb7Q==
X-Received: by 2002:a1c:1f51:: with SMTP id f78mr8943657wmf.60.1579342164380; 
 Sat, 18 Jan 2020 02:09:24 -0800 (PST)
X-Google-Smtp-Source: APXvYqw+UNYu5PBC0fFkwbTA6OX3+XYODHPGXlMMUt5k21OsDUHDebPYkgyQFznTzMN3BTu/hAW6uw==
X-Received: by 2002:a1c:1f51:: with SMTP id f78mr8943637wmf.60.1579342164183; 
 Sat, 18 Jan 2020 02:09:24 -0800 (PST)
Received: from [192.168.1.35] (113.red-83-57-172.dynamicip.rima-tde.net.
 [83.57.172.113])
 by smtp.gmail.com with ESMTPSA id q19sm12616717wmc.12.2020.01.18.02.09.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 18 Jan 2020 02:09:23 -0800 (PST)
Subject: Re: [PATCH] scripts/git.orderfile: Display decodetree before C source
To: qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Sven Schnelle <svens@stackframe.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stafford Horne <shorne@gmail.com>, Palmer Dabbelt
 <palmerdabbelt@google.com>, QEMU Trivial <qemu-trivial@nongnu.org>
References: <20191230082856.30556-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <4bf7c585-fe7f-c574-d706-2317e6bcbceb@redhat.com>
Date: Sat, 18 Jan 2020 11:09:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191230082856.30556-1-philmd@redhat.com>
Content-Language: en-US
X-MC-Unique: lC0SLoIeMWCEcNg9U2Eu9g-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
X-List-Received-Date: Sat, 18 Jan 2020 10:09:31 -0000

Cc'ing qemu-trivial@

On 12/30/19 9:28 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> To avoid scrolling each instruction when reviewing tcg
> helpers written for the decodetree script, display the
> .decode files (similar to header declarations) before
> the C source (implementation of previous declarations).
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>   scripts/git.orderfile | 3 +++
>   1 file changed, 3 insertions(+)
>=20
> diff --git a/scripts/git.orderfile b/scripts/git.orderfile
> index e89790941c..1f747b583a 100644
> --- a/scripts/git.orderfile
> +++ b/scripts/git.orderfile
> @@ -25,5 +25,8 @@ qga/*.json
>   # headers
>   *.h
>  =20
> +# decoding tree specification
> +*.decode
> +
>   # code
>   *.c
>=20


