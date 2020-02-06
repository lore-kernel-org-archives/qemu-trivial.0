Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1izf1F-00039h-97
	for mharc-qemu-trivial@gnu.org; Thu, 06 Feb 2020 06:08:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55671)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1izf1C-00032v-IQ
 for qemu-trivial@nongnu.org; Thu, 06 Feb 2020 06:08:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1izf1A-0005fc-EG
 for qemu-trivial@nongnu.org; Thu, 06 Feb 2020 06:08:22 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:59890
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1izf1A-0005bN-9D
 for qemu-trivial@nongnu.org; Thu, 06 Feb 2020 06:08:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580987299;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AS0nEzYBOWUX42VgZ6/aCvxTM0F6DjJNAL92beNsEFk=;
 b=Wg1uSo2YsRLWk+GvYaHErh4qjTgy1HdbqJoPSHBZYEyZ3eknK1UiE4ZuxcGJJRH1UmzSwW
 WP0PtROeEPqBbIddR2QNO7NlbQ2Q25nJUPiWvT6QERERBYgGU234mowbPf4c4ZMcMoehVS
 NUub9qclu8JZKDczXx+ZD9fCwMN/I7w=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-15-C52IqjuNPRqjV5sAlBD1SQ-1; Thu, 06 Feb 2020 06:08:17 -0500
Received: by mail-wr1-f69.google.com with SMTP id 90so3207671wrq.6
 for <qemu-trivial@nongnu.org>; Thu, 06 Feb 2020 03:08:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Nu5Dy5d0X7tVEgM4PbaK9Aq4Ut1lH3ZTznIj6j1nAIk=;
 b=H5UL6DacWiMiDkmAmKC7brj6W/Gqh9S8FwvNmVNaMu1+h5uMHUvlMB+R76CDHJpWY8
 1r1S6Ch7Pbg+e9wtTSumOw86y1zTFMZXAoCnm5gtTWYrqWBeiRFLVUpWyqoKqPeDvQxH
 Fa+MRMvCQpr8YIGZVkK1PHC586ytKfzYsnoZRHmh8vg6NEMnOdi1rIvAXSdAY0qqLIH/
 g62v43ebIjFRrss42v7q5sRZJk+6e2oHvWI2aGFzCRRbGMZpoLPqq8ehV2gbwxypWduO
 wOsMwEGLM6WRWLel42Cnd5sp6CS+enMhFBctmDjG7AY8II7VCo6zWiYjh8qRz64I2DC/
 ykWQ==
X-Gm-Message-State: APjAAAVnWg6lPzh0mBwaFblXXvsXAXXl+dCMbsWMGeBYsQP3SUBy+yzM
 ytFGeFvd8PW+7maq0IURYXJNFGkp2QGw+ZXEgmdDGrlFV2LbD4SmKrgqVBRram0wsIgUUcWhlkQ
 tkFqDbW5UO1yCjPNRbw==
X-Received: by 2002:a1c:4d18:: with SMTP id o24mr3925375wmh.35.1580987295762; 
 Thu, 06 Feb 2020 03:08:15 -0800 (PST)
X-Google-Smtp-Source: APXvYqwdotbsdzuJ0QK8GPsLXU10ZT+nTsw0curItafwRoNkY3rDGlXkoT5URdmwyVNG4LK4gAwVjQ==
X-Received: by 2002:a1c:4d18:: with SMTP id o24mr3925338wmh.35.1580987295463; 
 Thu, 06 Feb 2020 03:08:15 -0800 (PST)
Received: from [192.168.1.35] (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id b10sm3872007wrt.90.2020.02.06.03.08.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Feb 2020 03:08:14 -0800 (PST)
Subject: Re: [PATCH] mailmap: Add entry about me
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Yu-Chen Lin <npes87184@gmail.com>, qemu-devel@nongnu.org,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20191206140931.14133-1-npes87184@gmail.com>
 <bd91caac-86c5-54a6-080d-37909b91a656@redhat.com>
Message-ID: <548b2024-f34e-f4cd-f3b9-c4575c918cbe@redhat.com>
Date: Thu, 6 Feb 2020 12:08:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <bd91caac-86c5-54a6-080d-37909b91a656@redhat.com>
Content-Language: en-US
X-MC-Unique: C52IqjuNPRqjV5sAlBD1SQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
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
X-List-Received-Date: Thu, 06 Feb 2020 11:08:23 -0000

Hello,

I suggest changing the subject to:
"mailmap: Add entry for Yu-Chen Lin"

On 12/6/19 3:15 PM, Philippe Mathieu-Daud=E9 wrote:
> Cc'ing qemu-trivial@
>=20
> On 12/6/19 3:09 PM, Yu-Chen Lin wrote:
>> I have two mail address, add entries for
>> showing author and email correctly.
>>
>> Signed-off-by: Yu-Chen Lin <npes87184@gmail.com>
>> ---
>> =A0 .mailmap | 3 ++-
>> =A0 1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/.mailmap b/.mailmap
>> index 3816e4effe..3fbf3902a3 100644
>> --- a/.mailmap
>> +++ b/.mailmap
>> @@ -151,7 +151,8 @@ Xiaoqiang Zhao <zxq_yx_007@163.com>
>> =A0 Xinhua Cao <caoxinhua@huawei.com>
>> =A0 Xiong Zhang <xiong.y.zhang@intel.com>
>> =A0 Yin Yin <yin.yin@cs2c.com.cn>
>> -yuchenlin <npes87184@gmail.com>
>> +Yu-Chen Lin <npes87184@gmail.com>
>> +Yu-Chen Lin <npes87184@gmail.com> <yuchenlin@synology.com>

Apparently the mailmap process is getting stricter,
can you Ack-by this patch from your Synology account?

>=20
> Thanks for updating your entry in .mailmap!
>=20
> Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
>=20
>> =A0 YunQiang Su <syq@debian.org>
>> =A0 YunQiang Su <ysu@wavecomp.com>
>> =A0 Yuri Pudgorodskiy <yur@virtuozzo.com>
>>


