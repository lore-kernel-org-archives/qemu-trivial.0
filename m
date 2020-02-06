Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1izghX-0004KE-OP
	for mharc-qemu-trivial@gnu.org; Thu, 06 Feb 2020 07:56:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60762)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1izghU-0004Dz-Ma
 for qemu-trivial@nongnu.org; Thu, 06 Feb 2020 07:56:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1izghT-00011f-C2
 for qemu-trivial@nongnu.org; Thu, 06 Feb 2020 07:56:08 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:40824
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1izghT-00010n-8B
 for qemu-trivial@nongnu.org; Thu, 06 Feb 2020 07:56:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580993766;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A7iZ29LgdcBeuL6I4ArGTKMGl1I4RACaLQGo+ho5nso=;
 b=R9S0vno01V3RqOPaJmXLcpaU9eWO+z5UjptHsBYgTAn0dqE3DFeJA35sC/jRnE+TcK5KPO
 QPIPSwOW0gblcqBCfH+qXTrCg0+kp7YclzpsZNI3yBiI1rkk2pd8x5g5+jgQfReepUwERf
 VO8L4LXrI+PBl9tCykISOPStZTFX06k=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-162-UNYN7SWwNEaQDGcuOTPw-Q-1; Thu, 06 Feb 2020 07:56:01 -0500
Received: by mail-wr1-f69.google.com with SMTP id a12so3335440wrn.19
 for <qemu-trivial@nongnu.org>; Thu, 06 Feb 2020 04:56:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZGAuiB1zlyjYAFIX26vVkpBSj7NXsH9BdHpvdI0CZ+M=;
 b=WBpqkXo8sar5KUOviwwwFU5u0IvRmsek2T/MYKvrV0/ellFoezsTQQp2vgW34gQm6E
 35cORRUOJxmMwrzzIiZyF71ha9OW6qi6b/fZznvx0UP3U1rSHVAYNgo0ompSRFCYjNEe
 9yu1SBDpctvlgA2WqOnKHbOaJ+TIyFA+UKv815yTSEUzIUXKBaBKIrRnqe4pCrK3WzhL
 AYXhJULZXqhK/kXFMQeCbD0NnNTYWuJehEBxMJRbpra9lEuC98Mqjzn6G6wUqa8orUDw
 3T+Yl+tFt1TwPvqi7eWlquh6vOXFEaO//uAmkk90STUXWQ8Lh5XqEamIyf/64F/aCMc0
 WpdA==
X-Gm-Message-State: APjAAAVcGUbc8yAFanfAP/OVxfE9n7hd60RcoUcVxP9O+C6CNQPDyHys
 jkSjyxT/cu84HQqtqYluLYxE2f27AghHSeomuIE9TKi39EcCeJNEmz71q8ysKffO4PacAgR4iWq
 C2xSzUKIiJEzKV60bfw==
X-Received: by 2002:a7b:c152:: with SMTP id z18mr4432242wmi.70.1580993760099; 
 Thu, 06 Feb 2020 04:56:00 -0800 (PST)
X-Google-Smtp-Source: APXvYqy1qC3ZLTFzQdwI7mdaa9MyWXKwFYRE7V61xDcPwSo4MfyjGNk46zsqWh93kawHUCOlqubWYQ==
X-Received: by 2002:a7b:c152:: with SMTP id z18mr4432214wmi.70.1580993759792; 
 Thu, 06 Feb 2020 04:55:59 -0800 (PST)
Received: from [192.168.1.35] (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id n12sm3590076wmi.18.2020.02.06.04.55.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Feb 2020 04:55:59 -0800 (PST)
Subject: Re: [PATCH] mailmap: Add entry about me
To: Yu-Chen Lin <npes87184@gmail.com>
Cc: qemu-devel@nongnu.org, QEMU Trivial <qemu-trivial@nongnu.org>
References: <20191206140931.14133-1-npes87184@gmail.com>
 <bd91caac-86c5-54a6-080d-37909b91a656@redhat.com>
 <548b2024-f34e-f4cd-f3b9-c4575c918cbe@redhat.com>
 <CAPTqjH2bd4z_fgHt243Nx9CyMPO57aJY_BT8_eB3mAJ2D=avOQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <07dba4b7-5daa-ad81-e95a-54b6b8c534dd@redhat.com>
Date: Thu, 6 Feb 2020 13:55:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAPTqjH2bd4z_fgHt243Nx9CyMPO57aJY_BT8_eB3mAJ2D=avOQ@mail.gmail.com>
Content-Language: en-US
X-MC-Unique: UNYN7SWwNEaQDGcuOTPw-Q-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
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
X-List-Received-Date: Thu, 06 Feb 2020 12:56:10 -0000

On 2/6/20 1:50 PM, Yu-Chen Lin wrote:
> Hi,
>=20
> Thank you for your suggestion, I will send v2 with new subject. Also, I=
=20
> will ack in v2 mail by my=C2=A0Synology account.

Well I have to split=20
https://www.mail-archive.com/qemu-devel@nongnu.org/msg671676.html for=20
the same reasons, so I can include your patch there if you want (no need=20
for you to send v2).

>=20
> Thanks.
>=20
> Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com <mailto:philmd@redhat.com>=
> =E6=96=BC=20
> 2020=E5=B9=B42=E6=9C=886=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=887:=
08=E5=AF=AB=E9=81=93=EF=BC=9A
>=20
>     Hello,
>=20
>     I suggest changing the subject to:
>     "mailmap: Add entry for Yu-Chen Lin"
>=20
>     On 12/6/19 3:15 PM, Philippe Mathieu-Daud=C3=A9 wrote:
>      > Cc'ing qemu-trivial@
>      >
>      > On 12/6/19 3:09 PM, Yu-Chen Lin wrote:
>      >> I have two mail address, add entries for
>      >> showing author and email correctly.
>      >>
>      >> Signed-off-by: Yu-Chen Lin <npes87184@gmail.com
>     <mailto:npes87184@gmail.com>>
>      >> ---
>      >> =C2=A0 .mailmap | 3 ++-
>      >> =C2=A0 1 file changed, 2 insertions(+), 1 deletion(-)
>      >>
>      >> diff --git a/.mailmap b/.mailmap
>      >> index 3816e4effe..3fbf3902a3 100644
>      >> --- a/.mailmap
>      >> +++ b/.mailmap
>      >> @@ -151,7 +151,8 @@ Xiaoqiang Zhao <zxq_yx_007@163.com
>     <mailto:zxq_yx_007@163.com>>
>      >> =C2=A0 Xinhua Cao <caoxinhua@huawei.com <mailto:caoxinhua@huawei.=
com>>
>      >> =C2=A0 Xiong Zhang <xiong.y.zhang@intel.com
>     <mailto:xiong.y.zhang@intel.com>>
>      >> =C2=A0 Yin Yin <yin.yin@cs2c.com.cn <mailto:yin.yin@cs2c.com.cn>>
>      >> -yuchenlin <npes87184@gmail.com <mailto:npes87184@gmail.com>>
>      >> +Yu-Chen Lin <npes87184@gmail.com <mailto:npes87184@gmail.com>>
>      >> +Yu-Chen Lin <npes87184@gmail.com <mailto:npes87184@gmail.com>>
>     <yuchenlin@synology.com <mailto:yuchenlin@synology.com>>
>=20
>     Apparently the mailmap process is getting stricter,
>     can you Ack-by this patch from your Synology account?
>=20
>      >
>      > Thanks for updating your entry in .mailmap!
>      >
>      > Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com
>     <mailto:philmd@redhat.com>>
>      >
>      >> =C2=A0 YunQiang Su <syq@debian.org <mailto:syq@debian.org>>
>      >> =C2=A0 YunQiang Su <ysu@wavecomp.com <mailto:ysu@wavecomp.com>>
>      >> =C2=A0 Yuri Pudgorodskiy <yur@virtuozzo.com <mailto:yur@virtuozzo=
.com>>
>      >>
>=20


