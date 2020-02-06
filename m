Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1izgje-00014e-I7
	for mharc-qemu-trivial@gnu.org; Thu, 06 Feb 2020 07:58:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33632)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1izgjb-0000wm-MM
 for qemu-trivial@nongnu.org; Thu, 06 Feb 2020 07:58:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1izgja-0002Kk-DJ
 for qemu-trivial@nongnu.org; Thu, 06 Feb 2020 07:58:19 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:33805
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1izgja-0002KH-9M
 for qemu-trivial@nongnu.org; Thu, 06 Feb 2020 07:58:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580993897;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xHAKl8pesUGlBD+BRq3bhs0mKFdOTb/GnYO0Mbr1D10=;
 b=ZNSfmYqme6+9FpdUIZWGqNtujfXTGHn93Tn+rmvHIiR6HIzdhiDoRSwKywwnfAEWzUYSwG
 G4TAbaTrYcL4aMq8YMXpAUv+CPrtmnnXG0W1nU/Jl3QfJSepF/Y0fqeVx+WsnT0sITrS8F
 4TadAX9MWcOuE7yTeBdCLHO23qmiP08=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-60-GqIfV1npPAiwifjP0otMJA-1; Thu, 06 Feb 2020 07:58:15 -0500
Received: by mail-wm1-f72.google.com with SMTP id d4so2594650wmd.7
 for <qemu-trivial@nongnu.org>; Thu, 06 Feb 2020 04:58:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2UUzyxmqnLLpOCeg29AAbMmqKpCwRZYUEkXMgFeju9Y=;
 b=g0l1TAdcGPl1MXCnpZmRaZCCnnXPlhPTGFIhKt36CcEDi4AK5C7Ps9T7oRbuIy7gmS
 SHMOolqPLyU6BiOMTbZqncISAOfasCeHjri7eiimPOWfdpY0gUuQ2V/5oarZmbasKzqh
 LEnhm1zaDS1duxKEhi/rCjFHL2PxrZg2ZJZv2J6+NE8CuLAP+nbhS9mQOFawLUxT6liu
 U+PWljFH2a1w9aHlfn+xizcUJGemxluqAdYq9OsbWJg0rgIbPRrdDl7DbamKb6/J+aFx
 x7POb7oMfuibzc7gRHsKLkMIgshzxCbKW7/wo+d+lFP8G2VGyVTO8C6U4nXSsn573AmX
 xCmw==
X-Gm-Message-State: APjAAAU852ydt62+4pzjvlCI6ODn9r+Vezc883ke/Pade8qkBw/t3dVZ
 P2gxtLd8qgVRnJyudVX/iOk6U646bbFkkzZ8jBKN5i4p/+KfqTs4GSAAk/Xc6O0DoL+Ky+Zn2Gw
 GShW4PjrrwgDyMQlfSQ==
X-Received: by 2002:a1c:ddc3:: with SMTP id u186mr4488977wmg.103.1580993894330; 
 Thu, 06 Feb 2020 04:58:14 -0800 (PST)
X-Google-Smtp-Source: APXvYqzbmA0OTOLQksvQZ6+QA1/BQE39yf9Hny40zz/AERZZdoPt88kuLpd2/xiNC277dljNgVB2FQ==
X-Received: by 2002:a1c:ddc3:: with SMTP id u186mr4488962wmg.103.1580993894145; 
 Thu, 06 Feb 2020 04:58:14 -0800 (PST)
Received: from [192.168.1.35] (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id g79sm3360412wme.17.2020.02.06.04.58.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Feb 2020 04:58:13 -0800 (PST)
Subject: Re: [PATCH v2] mailmap: Add entry for Yu-Chen Lin
To: Yu-Chen Lin <npes87184@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, yuchenlin@synology.com
References: <20200206125504.7150-1-npes87184@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <0df754cf-c633-25a2-a9a9-194235a445d2@redhat.com>
Date: Thu, 6 Feb 2020 13:58:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200206125504.7150-1-npes87184@gmail.com>
Content-Language: en-US
X-MC-Unique: GqIfV1npPAiwifjP0otMJA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
X-List-Received-Date: Thu, 06 Feb 2020 12:58:20 -0000

On 2/6/20 1:55 PM, Yu-Chen Lin wrote:
> I have two mail address, add entries for
> showing author and email correctly.
>=20
> Signed-off-by: Yu-Chen Lin <npes87184@gmail.com>
> ---
> v1 -> v2:
> * Change subject
>=20
>   .mailmap | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/.mailmap b/.mailmap
> index 3816e4effe..3fbf3902a3 100644
> --- a/.mailmap
> +++ b/.mailmap
> @@ -151,7 +151,8 @@ Xiaoqiang Zhao <zxq_yx_007@163.com>
>   Xinhua Cao <caoxinhua@huawei.com>
>   Xiong Zhang <xiong.y.zhang@intel.com>
>   Yin Yin <yin.yin@cs2c.com.cn>
> -yuchenlin <npes87184@gmail.com>
> +Yu-Chen Lin <npes87184@gmail.com>
> +Yu-Chen Lin <npes87184@gmail.com> <yuchenlin@synology.com>

Since I know both emails belong to you (see the EDK2 similar patch
https://github.com/tianocore/edk2/commit/0ef6fbbd114e89b8d838eade39bc3a6d7e=
c54c3c):
Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>

>   YunQiang Su <syq@debian.org>
>   YunQiang Su <ysu@wavecomp.com>
>   Yuri Pudgorodskiy <yur@virtuozzo.com>
>=20


