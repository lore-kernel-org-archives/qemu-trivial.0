Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1irjvs-0002vW-7Z
	for mharc-qemu-trivial@gnu.org; Wed, 15 Jan 2020 09:46:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45066)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1irjvn-0002t2-Nb
 for qemu-trivial@nongnu.org; Wed, 15 Jan 2020 09:46:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1irjvj-0002jG-P7
 for qemu-trivial@nongnu.org; Wed, 15 Jan 2020 09:46:03 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:29547)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1irjvj-0002il-LW
 for qemu-trivial@nongnu.org; Wed, 15 Jan 2020 09:45:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579099558;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sxHCDVpna5Z29K2SKUl/QkVJIQsRwG7+GMkSYzzXztA=;
 b=hF6p4K6lrj6YtgsWhFG12ISf6N3Q3wdTEnA3uP8K8zogX+QZuUo7+dAxya162/Cv0bPtl5
 oH0bg1G1VGHS6wW7BPU5YP8ioWGACovkW3JBcTsMY2nItuquB/uq3hnmMFcboiR9EK+KbG
 CLUIZEkIriMS+hEQ6deaoUickj5w8EU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-8-8B2scwJpO6e6s9j6sZktdw-1; Wed, 15 Jan 2020 09:45:56 -0500
Received: by mail-wm1-f72.google.com with SMTP id h130so23458wme.7
 for <qemu-trivial@nongnu.org>; Wed, 15 Jan 2020 06:45:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eWtdqzuqF0Zj3s1OnmC2RRlGAp3nKqQ5v2wqbGrdqeY=;
 b=ucmEJ05Pl6k13qLJbII0bKfyJEYdMw0MAe1qrlpJdseRuK9KuPuoo84OnZ5bnCH1Po
 UPsveabFplVrB38yaNxQx+enBnQ+VmEkgg/pkD2jshR+9/+VB6Zcdo60FFrEx3OTcztJ
 aUT9ikVfPpf3KBbA+F7PeMGZgIPoWp1zdRG+GM74qmxvgh8IH0o4eJCAEjZPJgQQpwOK
 igi+VYRbJVk9CWvsIcMdCKkauZ5FjlJShZxmuPoFLC4SJF+RtCMo5pKIFUciKiBrKRJ2
 Llv7miPYUrCBlaoclofGnVFk8fPx8xQHi5zjqIFVxbtMEge0WhdUV+G1ylQHL2roCcek
 cGgg==
X-Gm-Message-State: APjAAAWJzqCvxDObPwNe/xVmWwagz6maVYq7iiS/KwZxrHCbh2Y+DRsf
 Ila2SBvLnEjCd88sVZimum6jIntDnmNapFJnzd05TiSsQ20TuL9CBTCoUVUshVoEPXyqBVnsfFK
 XV39GEjTNUgSG3anrgA==
X-Received: by 2002:a05:600c:298:: with SMTP id 24mr45764wmk.141.1579099555355; 
 Wed, 15 Jan 2020 06:45:55 -0800 (PST)
X-Google-Smtp-Source: APXvYqw7EXKI34oPK5ibvBsPl40wY8r2Ptzf8mPueD6TAsXGLWSHqbvvP6N+gSZihd900AtbPglT8Q==
X-Received: by 2002:a05:600c:298:: with SMTP id 24mr45734wmk.141.1579099555094; 
 Wed, 15 Jan 2020 06:45:55 -0800 (PST)
Received: from [192.168.1.24] (lfbn-mon-1-1519-115.w92-167.abo.wanadoo.fr.
 [92.167.83.115])
 by smtp.gmail.com with ESMTPSA id k82sm99554wmf.10.2020.01.15.06.45.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jan 2020 06:45:54 -0800 (PST)
Subject: Re: [PATCH] hw/input: Do not enable CONFIG_PCKBD by default
To: Laurent Vivier <laurent@vivier.eu>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-trivial@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
References: <20200115113748.24757-1-thuth@redhat.com>
 <670ab2be-d6ba-1eef-fd56-e6f8df7e0085@vivier.eu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <295c23bb-0849-df2a-1b97-14d257b80aad@redhat.com>
Date: Wed, 15 Jan 2020 15:45:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <670ab2be-d6ba-1eef-fd56-e6f8df7e0085@vivier.eu>
Content-Language: en-US
X-MC-Unique: 8B2scwJpO6e6s9j6sZktdw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
X-List-Received-Date: Wed, 15 Jan 2020 14:46:07 -0000

On 1/15/20 12:46 PM, Laurent Vivier wrote:
> Le 15/01/2020 =C3=A0 12:37, Thomas Huth a =C3=A9crit=C2=A0:
>> The i8042 device is part of the chipset of a machine, so it should
>> be selected by the machines or chipsets (e.g. SuperIO chipsets),
>> and not be enabled by default.

The sentence "The i8042 device is part of the chipset of a machine"=20
sounds odd to me.

Maybe simply use "The i8042 PS/2 Controller should not be enabled by=20
default. It has to be selected by machines or chipsets (e.g. SuperIO=20
chipsets)."

>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   hw/input/Kconfig | 1 -
>>   hw/isa/Kconfig   | 1 +
>>   2 files changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/input/Kconfig b/hw/input/Kconfig
>> index 287f08887b..a2f25725be 100644
>> --- a/hw/input/Kconfig
>> +++ b/hw/input/Kconfig
>> @@ -7,7 +7,6 @@ config LM832X
>>  =20
>>   config PCKBD
>>       bool
>> -    default y
>>       select PS2
>>       depends on ISA_BUS
>>  =20
>> diff --git a/hw/isa/Kconfig b/hw/isa/Kconfig
>> index 8a38813cc1..c7f07854f7 100644
>> --- a/hw/isa/Kconfig
>> +++ b/hw/isa/Kconfig
>> @@ -16,6 +16,7 @@ config I82378
>>   config ISA_SUPERIO
>>       bool
>>       select ISA_BUS
>> +    select PCKBD
>>  =20
>>   config PC87312
>>       bool
>>
>=20
> It is also used by R4K but the Kconfig already includes it, so:

I believe R4K should 'select ISA_SUPERIO' but we don't have specs and=20
this machine is deprecated, so I didn't bother improving it.

>=20
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
>=20

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>


