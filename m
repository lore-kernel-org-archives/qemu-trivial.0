Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iMteR-0002iy-QC
	for mharc-qemu-trivial@gnu.org; Tue, 22 Oct 2019 08:52:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56850)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iMteL-0002fp-BY
 for qemu-trivial@nongnu.org; Tue, 22 Oct 2019 08:52:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iMteJ-0003g3-Kj
 for qemu-trivial@nongnu.org; Tue, 22 Oct 2019 08:52:32 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57998)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iMteJ-0003fV-Bo
 for qemu-trivial@nongnu.org; Tue, 22 Oct 2019 08:52:31 -0400
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4590E356D3
 for <qemu-trivial@nongnu.org>; Tue, 22 Oct 2019 12:52:30 +0000 (UTC)
Received: by mail-wm1-f71.google.com with SMTP id g67so5861894wmg.4
 for <qemu-trivial@nongnu.org>; Tue, 22 Oct 2019 05:52:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gmvf0BVZShPGJSnkCjp4EkXvRxogE/PLOWq6DjpJu2c=;
 b=kpi9CMCnYE6csTB+EiU2/CUCp2dBOOOedssODTj67QIty14jd8i5yfk/hGvxeL2PmU
 rvhkIYGpb9xwoFQnAjqkFew7rIs2w3RA8eyyf2Xa6CPVzDaMe/Rn/y90Q2m2IYhHGy16
 oh4pRA3fxyFSBLhx1qx0TEDSQuIlovqKbe3jegS2+Gy+8jAUat7/y6D0nzLDQY+8fdrx
 kBMbXpgoW30BRJmQMyAxREWa0lVBlms23vyb6UJzjvvawSrBEBIjoiBx+7j9inwg9biQ
 iGrE8YhJ+WDc4k3pPClrOh329h1ZvCgZWiWkP3IlYRtTxOgprMag6TQJE8EaJpsjWSGM
 mdOA==
X-Gm-Message-State: APjAAAWH27fR8f0LLxjzvd23X2xhd+TQHUjkrFokInSGGVZRAOQ7hrPs
 yZD87RunmuPYpkTxW6bnH3z87FGKNjrwaxKBVQwcKS/EoXUAWwjLF9Zk91oiblga8Lbx540KlZI
 LzmlPjel3Mtg4FKpyTg==
X-Received: by 2002:a5d:6281:: with SMTP id k1mr3472066wru.69.1571748748473;
 Tue, 22 Oct 2019 05:52:28 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzJQp8T5eHdBaFhOuIzdgZBTL1G/LdslrkQCEPQ+k9R00VBDwSIcjj6H4egtGRrGyrz7fPnJA==
X-Received: by 2002:a5d:6281:: with SMTP id k1mr3472025wru.69.1571748747953;
 Tue, 22 Oct 2019 05:52:27 -0700 (PDT)
Received: from [192.168.1.41] (129.red-83-57-174.dynamicip.rima-tde.net.
 [83.57.174.129])
 by smtp.gmail.com with ESMTPSA id z13sm21247346wrm.64.2019.10.22.05.52.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Oct 2019 05:52:27 -0700 (PDT)
Subject: Re: [PATCH] qemu-options.hx: Update for reboot-timeout parameter
To: Markus Armbruster <armbru@redhat.com>, Han Han <hhan@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <20191015151451.727323-1-hhan@redhat.com>
 <87d0epqp5r.fsf@dusky.pond.sub.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <1a07f8dd-88e8-c8f0-f76e-2fe62259cac3@redhat.com>
Date: Tue, 22 Oct 2019 14:52:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <87d0epqp5r.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
X-List-Received-Date: Tue, 22 Oct 2019 12:52:38 -0000

On 10/22/19 8:18 AM, Markus Armbruster wrote:
> Han Han <hhan@redhat.com> writes:
>=20
>> Since ee5d0f89d, -1 is not valid for the value of reboot-timeout. Upda=
te
>> that in qemu-options doc.
>>
>> Signed-off-by: Han Han <hhan@redhat.com>
>> ---
>>   qemu-options.hx | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/qemu-options.hx b/qemu-options.hx
>> index 793d70ff..6b92a916 100644
>> --- a/qemu-options.hx
>> +++ b/qemu-options.hx
>> @@ -327,8 +327,8 @@ format(true color). The resolution should be suppo=
rted by the SVGA mode, so
>     A splash picture could be passed to bios, enabling user to show it =
as logo,
>     when option splash=3D@var{sp_name} is given and menu=3Don, If firmw=
are/BIOS
>     supports them. Currently Seabios for X86 system support it.
>     limitation: The splash file could be a jpeg file or a BMP file in 2=
4 BPP
>     format(true color). The resolution should be supported by the SVGA =
mode, so
>>   the recommended is 320x240, 640x480, 800x640.
>>  =20
>>   A timeout could be passed to bios, guest will pause for @var{rb_time=
out} ms
>> -when boot failed, then reboot. If @var{rb_timeout} is '-1', guest wil=
l not
>> -reboot, qemu passes '-1' to bios by default. Currently Seabios for X8=
6
>> +when boot failed, then reboot. If @option{reboot-timeout} is not set,
>> +guest will not reboot by default. Currently Seabios for X86
>>   system support it.
>>  =20
>>   Do strict boot via @option{strict=3Don} as far as firmware/BIOS
>=20
> Preexisting: "could be passed" sounds awkward.  Same in the previous
> paragraph.  Not this patch's problem, so:
>=20
> Reviewed-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

I assume this patch will go via qemu-trivial.

