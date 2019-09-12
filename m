Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i8Qiu-00005K-7J
	for mharc-qemu-trivial@gnu.org; Thu, 12 Sep 2019 11:09:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37121)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1i8Qis-0008UV-34
 for qemu-trivial@nongnu.org; Thu, 12 Sep 2019 11:09:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1i8Qiq-0001PX-9G
 for qemu-trivial@nongnu.org; Thu, 12 Sep 2019 11:09:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45972)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1i8Qiq-0001PB-2U
 for qemu-trivial@nongnu.org; Thu, 12 Sep 2019 11:09:24 -0400
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1B29E10B182
 for <qemu-trivial@nongnu.org>; Thu, 12 Sep 2019 15:09:23 +0000 (UTC)
Received: by mail-wr1-f69.google.com with SMTP id 32so7678456wrk.15
 for <qemu-trivial@nongnu.org>; Thu, 12 Sep 2019 08:09:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7+8EFW9Nkbbot0zXClv+DpnuUl998o+XNV8XMeGZPVA=;
 b=T+Tkf4BypupzRSDI7R17WcFGzMe+zFK3tnPu13uLkkhOiiOPRb0x/78JrZkbfNqiFD
 Lr8yrd2qMmLCxSzx2MEG6ceZ4KrpMKsOg5V1/YIv1w9+4Uaw/7e4IIYX+gitU8I4bvpC
 Y6HqadMZDXhBrp1KQn/T2lm0sfIPBuel39w1p9lAZedSdXNHdoMuYtFmbk/knx25gWTn
 V3KNOgcS61y1EVhtE/iiCaBychyhAwY0KMQwp/nAndwRj3ybn+uMf9onVrPbIRjT/Ir5
 ADdqf54d76+NVMpU9nXO8tbzDTFgai2BwTij1UNHcLFsXHHPYS1mxC54aP7eR7yZYLW/
 k7vw==
X-Gm-Message-State: APjAAAUC2huAiN4n+9uVN3vbnQKZGEYk+IFGmBVniPJdiJ6kxLkXZB0t
 7vLx2691yoXMyCUDjp5lqK/BVz9sQ3kZ+qDRxZ9o+UNlvJx3688w68XMDonSVa+e24yqy55zS+Y
 lSNVn2v3SeLdLWYbcvw==
X-Received: by 2002:a05:6000:110f:: with SMTP id
 z15mr1981189wrw.328.1568300961490; 
 Thu, 12 Sep 2019 08:09:21 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyPwqzbz4KjrRnTiyFjhztT2SqwVmE8sF4gCHz9DaWLi3KLfqnBtMczqacnfenVTWqXUjWmZA==
X-Received: by 2002:a05:6000:110f:: with SMTP id
 z15mr1981157wrw.328.1568300961203; 
 Thu, 12 Sep 2019 08:09:21 -0700 (PDT)
Received: from [192.168.1.41] (251.red-88-10-102.dynamicip.rima-tde.net.
 [88.10.102.251])
 by smtp.gmail.com with ESMTPSA id a15sm293479wmj.25.2019.09.12.08.09.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Sep 2019 08:09:20 -0700 (PDT)
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, Stefan Hajnoczi <stefanha@gmail.com>
Cc: qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>
References: <20190613050937.124903-1-aik@ozlabs.ru>
 <35361394-42ba-dcf0-6fe2-5a0a538d1440@redhat.com>
 <d20e26db-7157-d9bd-c707-d7f4443396c0@ozlabs.ru>
 <20190614093306.GG10957@stefanha-x1.localdomain>
 <33c70ea6-08d7-d4ba-210b-328ea275cfe5@ozlabs.ru>
 <fa361ec0-c734-567a-d617-6613b6e89f78@redhat.com>
 <bbbf2fd0-34e5-c9a9-a11c-f87d07cc3b8f@ozlabs.ru>
 <1aa3e97b-b5f7-1b88-eb14-af8926701ce4@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <eea0ce7a-1534-67e3-3841-ac06b7e620d5@redhat.com>
Date: Thu, 12 Sep 2019 17:09:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1aa3e97b-b5f7-1b88-eb14-af8926701ce4@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH qemu] loader: Trace loaded
 images
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
X-List-Received-Date: Thu, 12 Sep 2019 15:09:27 -0000

On 6/20/19 10:53 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> On 6/20/19 7:50 AM, Alexey Kardashevskiy wrote:
>> On 17/06/2019 14:56, Philippe Mathieu-Daud=C3=A9 wrote:
>>> On 6/17/19 3:25 AM, Alexey Kardashevskiy wrote:
>>>> On 14/06/2019 19:33, Stefan Hajnoczi wrote:
>>>>> On Fri, Jun 14, 2019 at 10:13:04AM +1000, Alexey Kardashevskiy wrot=
e:
>>>>>>
>>>>>>
>>>>>> On 13/06/2019 23:08, Philippe Mathieu-Daud=C3=A9 wrote:
>>>>>>> Hi Alexey,
>>>>>>>
>>>>>>> On 6/13/19 7:09 AM, Alexey Kardashevskiy wrote:
>>>>>>>> This adds a trace point which prints every loaded image. This in=
cludes
>>>>>>>> bios/firmware/kernel/initradmdisk/pcirom.
>>>>>>>>
>>>>>>>> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
>>>>>>>> ---
>>>>>>>>
>>>>>>>> The example for a pseries guest:
>>>>>>>>
>>>>>>>> loader_write_rom slof.bin: @0x0 size=3D0xe22e0 ROM=3D0
>>>>>>>> loader_write_rom phdr #0: /home/aik/t/vml4120le: @0x400000 size=3D=
0x13df000 ROM=3D0
>>>>>>>> loader_write_rom /home/aik/t/le.cpio: @0x1ad0000 size=3D0x9463a0=
0 ROM=3D0
>>>>>>>
>>>>>>> I find the "ROM=3D0" part confuse, maybe you can change to "ROM:f=
alse".
>>>>>>
>>>>>> How? I mean I can do that in the code as rom->isrom?"true":"false"=
 and
>>>>>> make trace point accept "%s" but it is quite ugly and others seem =
to
>>>>>> just use %d for bool.
>>>>>
>>>>> Yes, %d is the convention for bool.  Perhaps you can name it "is_ro=
m"
>>>>> instead of "ROM".  That way the name communicates that this is a bo=
olean
>>>>> value.
>>>>
>>>> It is quite obvious though that it is boolean even as "ROM" (what el=
se
>>>> can that be realistically?) and there does not seem to be a conventi=
on
>>>> about xxx:N vs is_xxx:N. And personally I find longer lines worse fo=
r
>>>> limited width screens (I run multiple qemus in tiled tmux). Whose tr=
ee
>>>> is this going to? Let's ask that person :)
>>>
>>> Personally I find 'is_rom' clearer. I read 2 addresses, then my first
>>> reaction was to parse it as another address. But it is also true we n=
ow
>>> enforce traced hex values with '0x' prefix, so your 'ROM' is unlikely=
 an
>>> address. Tiled tmux is an acceptable argument. Anyway you already got=
 my
>>> R-b.
>>>
>>> Tree: the PPC tree is likely to get it merged quicker than the MISC t=
ree.
>>
>>
>> There is nothing specific about PPC though so I guess it is the MISC
>> tree, who does maintain that?
>=20
> Paolo, Cc'ing him.

Stefan sometime takes tracing patches, but this patch might also go via
Trivial@ (Cc'ed).

