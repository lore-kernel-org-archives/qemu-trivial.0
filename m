Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j06TI-00070V-83
	for mharc-qemu-trivial@gnu.org; Fri, 07 Feb 2020 11:27:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56019)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j06TF-0006tq-Ad
 for qemu-trivial@nongnu.org; Fri, 07 Feb 2020 11:27:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j06TE-0002Qc-77
 for qemu-trivial@nongnu.org; Fri, 07 Feb 2020 11:27:09 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:35492
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j06TE-0002PJ-4C
 for qemu-trivial@nongnu.org; Fri, 07 Feb 2020 11:27:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581092827;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NRew0WM9/hguVVDiQByA4rcgt0exsoGjc2th1JNhHPk=;
 b=PjJpkQjxSLymJxWY0rNrx5/7/4xsSkQ5sjYznEvtOXP1p2EYIyL2y44DLIySRyPxlvX/6j
 j/L6VaRoYU3QypZF4FZICM/8ucHq6NCjdo96ZpLljecMs4bBhiE21//0D9LRgtf3TDCewI
 XFb/hnWbr2N0HHA6Qt34+0aXNfZplrI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-167-Pi77wbCtP8aeMPdzl2rb2g-1; Fri, 07 Feb 2020 11:27:03 -0500
Received: by mail-wr1-f70.google.com with SMTP id w6so1503711wrm.16
 for <qemu-trivial@nongnu.org>; Fri, 07 Feb 2020 08:27:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2k/2EJp51nHK080TIi/E0WhhVolewYmzVbUQJs/efd4=;
 b=rkAoGY++1zbs0CVTbTJqX4OWcF/nEIRlRkBfKOUibM/iefEYWFY/HsEp5RX4kHV+OI
 39SEIOu5XL3QdCEHFswBceslJCH/oyTzwp+CcC8hRexKpaXs/AnTh8q4faYAFuyUMpjI
 tDTBWDv/bGzW781BuvjOPkJzkIfwSJRzZio8N0NSWcqxJd6TN9toivDZQdeEZGPe6r1d
 H7a10mUMC/4tK/st+8U0lGd6VCL0ZjOyV8DeXmrfXTKG785PBhn+YMknLLMon/X77EIY
 PIobOBGRTX1btUXx8gTg2Ugf2FOdWmNkZoBeyDPeSTzFHJ1GWYpu5FWlq6mO8DiQQW8g
 zhqA==
X-Gm-Message-State: APjAAAVqGVYF7SKM1rFd2TCXEqB4+blQUclw96Iv1UxnHXuIJlXdE1DB
 lkec6rIEjAdh7dVwe43VqHy9gFdzPpSAkUJPG0pJYcDah+U+JOjejntQhqDW6+PihmLtdRexLZt
 YoyrvValizVuIanIlTw==
X-Received: by 2002:a1c:4d18:: with SMTP id o24mr5090931wmh.35.1581092822772; 
 Fri, 07 Feb 2020 08:27:02 -0800 (PST)
X-Google-Smtp-Source: APXvYqxok2Nx4s3cjmNK/Gj6cuVv1QGJ68HxLfccaqMLYtgRHntobkykNKitwaJM5TUN/vQdEQAlpw==
X-Received: by 2002:a1c:4d18:: with SMTP id o24mr5090905wmh.35.1581092822570; 
 Fri, 07 Feb 2020 08:27:02 -0800 (PST)
Received: from [192.168.254.233] (66.red-217-126-125.staticip.rima-tde.net.
 [217.126.125.66])
 by smtp.gmail.com with ESMTPSA id r1sm3919271wrx.11.2020.02.07.08.27.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Feb 2020 08:27:02 -0800 (PST)
Subject: Re: [PATCH 2/3] MAINTAINERS: Cover qapi/block{-core}.json in 'Block
 layer core' section
To: Markus Armbruster <armbru@redhat.com>, Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, John Snow <jsnow@redhat.com>
References: <20200207103012.27049-1-philmd@redhat.com>
 <20200207103012.27049-3-philmd@redhat.com>
 <87blqaqyxi.fsf@dusky.pond.sub.org> <20200207142146.GF6031@linux.fritz.box>
 <87blqapej2.fsf@dusky.pond.sub.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <6f20c34f-f96e-ad7d-e91c-0863471406d8@redhat.com>
Date: Fri, 7 Feb 2020 17:27:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <87blqapej2.fsf@dusky.pond.sub.org>
Content-Language: en-US
X-MC-Unique: Pi77wbCtP8aeMPdzl2rb2g-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
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
X-List-Received-Date: Fri, 07 Feb 2020 16:27:10 -0000

On 2/7/20 5:07 PM, Markus Armbruster wrote:
> Kevin Wolf <kwolf@redhat.com> writes:
>=20
>> Am 07.02.2020 um 15:01 hat Markus Armbruster geschrieben:
>>> Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:
>>>
>>>> List this file in the proper section, so maintainers get
>>>> notified when it is modified.
>>>>
>>>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>>>> ---
>>>> Cc: Kevin Wolf <kwolf@redhat.com>
>>>> Cc: Max Reitz <mreitz@redhat.com>
>>>> Cc: qemu-block@nongnu.org
>>>> ---
>>>>   MAINTAINERS | 2 ++
>>>>   1 file changed, 2 insertions(+)
>>>>
>>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>>> index 903831e0a4..e269e9092c 100644
>>>> --- a/MAINTAINERS
>>>> +++ b/MAINTAINERS
>>>> @@ -1842,6 +1842,8 @@ S: Supported
>>>     Block layer core
>>>     M: Kevin Wolf <kwolf@redhat.com>
>>>     M: Max Reitz <mreitz@redhat.com>
>>>     L: qemu-block@nongnu.org
>>>     S: Supported
>>>>   F: block*
>>>>   F: block/
>>>>   F: hw/block/
>>>> +F: qapi/block.json
>>>> +F: qapi/block-core.json
>>>>   F: include/block/
>>>>   F: qemu-img*
>>>>   F: docs/interop/qemu-img.rst
>>>
>>> This is in addition to
>>>
>>>      Block QAPI, monitor, command line
>>>      M: Markus Armbruster <armbru@redhat.com>
>>>      S: Supported
>>>      F: blockdev.c
>>>      F: block/qapi.c
>>>      F: qapi/block*.json
>>>      F: qapi/transaction.json
>>>      T: git https://repo.or.cz/qemu/armbru.git block-next
>>>
>>> I'm not sure this section makes much sense anymore.
>>
>> This is probably for you to decide.
>>
>> Though the block-next branch from the T: line doesn't even exist any
>> more...
>=20
> I have the questionable habit to delete my -next branches when they're
> empty.

Having dangling -next branches pointing to something very previous is=20
also questionable...


