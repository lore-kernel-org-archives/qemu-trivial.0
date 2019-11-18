Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iWmQU-0002BN-Cv
	for mharc-qemu-trivial@gnu.org; Mon, 18 Nov 2019 14:11:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44088)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iWmQR-0002As-Vw
 for qemu-trivial@nongnu.org; Mon, 18 Nov 2019 14:11:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iWmQP-0000RT-Li
 for qemu-trivial@nongnu.org; Mon, 18 Nov 2019 14:11:02 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:52544
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iWmQP-0000R3-H7
 for qemu-trivial@nongnu.org; Mon, 18 Nov 2019 14:11:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574104260;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qm6I/9HoeccmQfckMhn6r50irmPDfJq+IHiFbKH7FHg=;
 b=eAZr4QuNh0aH/NAxs6T+v4rKa1YI+Akdgsvd8iGWTxuD2/Bc/+fe9rhAGh/EwmOr4jSlVu
 f/pqrmVyv5RNGFLwsCKtdP+5yem6mDWvuVHrjNkyi+u6m8HWf3rczf05o6V1CFzsZFQkDd
 7Y3homKpUW81jowrOjHDfuBg/V3E764=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-152-IK6VRFVaMqeXLga4XSy6gw-1; Mon, 18 Nov 2019 14:10:59 -0500
Received: by mail-wm1-f69.google.com with SMTP id g14so401131wmk.9
 for <qemu-trivial@nongnu.org>; Mon, 18 Nov 2019 11:10:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4rabmlt2wwhztostFxkTuciNLYT8XNH+8kZVapbVrs8=;
 b=ZjffctLiloo5XAwGcncDSbnpMAPAt+/oZiMBDZuEGkt0DDMLJbAQJSXxkTUY2Xsb6N
 QL0d1nWaoBhZEbAnTdR9UolINl2yehN+E1N5WTfGsgR9Jc3jpYodhG/tGkPRpaUtytpO
 wptV8G/9Y6pivv6vNQnaPNBQWWrHxNdEp/SITcsDGgQw76WKvMgRvA3QkO+ZeIRMk/5e
 ci0BmvxDEBSrC7qDVNuKUsUZbaS+tFFWLHKUOL7eZxGE7GBRpcjOMCzanYPlAHB8TSjX
 EQQbBMjlymExJy9aPLRq7cSUE6I5ZHm7ENVFIMdrXZG0LHTxVsc11tzgL6e521UokYOH
 Gauw==
X-Gm-Message-State: APjAAAW0txvRxU65wKTKidKR9Yzd0auvliqf8LYo0zkNVZubEA49zA/e
 E55PSvukX9bENd3qKJUJjuTSpE9TEUVu8v0+hCmqO66eODQPwgTOPCX2kF5minl8AZTIqRRNuiB
 TiffG8lw3DnHt3Yp4uQ==
X-Received: by 2002:adf:f442:: with SMTP id f2mr33323319wrp.289.1574104257929; 
 Mon, 18 Nov 2019 11:10:57 -0800 (PST)
X-Google-Smtp-Source: APXvYqzctniBrexZ9hi2XFJ28h2DQ9QCHECz2edVUPnpolOy5q/JZpZJ5ZKFNUs+yEqyGRVEq+ldag==
X-Received: by 2002:adf:f442:: with SMTP id f2mr33323267wrp.289.1574104257569; 
 Mon, 18 Nov 2019 11:10:57 -0800 (PST)
Received: from [192.168.1.35] (131.red-88-21-102.staticip.rima-tde.net.
 [88.21.102.131])
 by smtp.gmail.com with ESMTPSA id a6sm26695735wrh.69.2019.11.18.11.10.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Nov 2019 11:10:56 -0800 (PST)
Subject: Re: [PATCH v2 2/3] hw/mips/gt64xxx: Remove dynamic field width from
 trace events
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: Max Reitz <mreitz@redhat.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>, qemu-block@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-trivial@nongnu.org
References: <20191108144042.30245-1-philmd@redhat.com>
 <20191108144042.30245-3-philmd@redhat.com>
 <ead1eb4b-a0e0-edf9-8323-ce9f5a291547@redhat.com>
 <bffde73d-cc1a-dcea-2e5d-7128bda7abf9@redhat.com>
Message-ID: <0a1b0182-d91e-ac9f-3c4e-aad53ee794b8@redhat.com>
Date: Mon, 18 Nov 2019 20:10:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <bffde73d-cc1a-dcea-2e5d-7128bda7abf9@redhat.com>
Content-Language: en-US
X-MC-Unique: IK6VRFVaMqeXLga4XSy6gw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
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
X-List-Received-Date: Mon, 18 Nov 2019 19:11:05 -0000

On 11/14/19 10:24 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> On 11/8/19 4:58 PM, Eric Blake wrote:
>> On 11/8/19 8:40 AM, Philippe Mathieu-Daud=C3=A9 wrote:
>>> Since not all trace backends support dynamic field width in
>>> format (dtrace via stap does not), replace by a static field
>>> width instead.
>>>
>>> Reported-by: Eric Blake <eblake@redhat.com>
>>> Buglink: https://bugs.launchpad.net/qemu/+bug/1844817
>>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>>> ---
>>> v2: Do not update qemu_log_mask()
>>> ---
>>> =C2=A0 hw/mips/gt64xxx_pci.c | 16 ++++++++--------
>>> =C2=A0 hw/mips/trace-events=C2=A0 |=C2=A0 4 ++--
>>> =C2=A0 2 files changed, 10 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/hw/mips/gt64xxx_pci.c b/hw/mips/gt64xxx_pci.c
>>> index 5cab9c1ee1..6743e7c929 100644
>>> --- a/hw/mips/gt64xxx_pci.c
>>> +++ b/hw/mips/gt64xxx_pci.c
>>> @@ -642,19 +642,19 @@ static void gt64120_writel(void *opaque, hwaddr=
=20
>>> addr,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* not really im=
plemented */
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 s->regs[saddr] =
=3D ~(~(s->regs[saddr]) | ~(val & 0xfffffffe));
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 s->regs[saddr] |=
=3D !!(s->regs[saddr] & 0xfffffffe);
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 trace_gt64120_write("INTRCA=
USE", size << 1, val);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 trace_gt64120_write("INTRCA=
USE", size << 3, val);
>>
>> Again, this isn't mentioned in the commit message.=C2=A0 Why are you=20
>> changing parameter values?
>>
>>
>>> +++ b/hw/mips/trace-events
>>> @@ -1,4 +1,4 @@
>>> =C2=A0 # gt64xxx.c
>>> -gt64120_read(const char *regname, int width, uint64_t value)=20
>>> "gt64120 read %s value:0x%0*" PRIx64
>>> -gt64120_write(const char *regname, int width, uint64_t value)=20
>>> "gt64120 write %s value:0x%0*" PRIx64
>>> +gt64120_read(const char *regname, int width, uint64_t value)=20
>>> "gt64120 read %s width:%d value:0x%08" PRIx64
>>> +gt64120_write(const char *regname, int width, uint64_t value)=20
>>> "gt64120 write %s width:%d value:0x%08" PRIx64
>>
>> Huh, we were really broken - the old code (if passed to printf) would=20
>> try to parse 4 parameters, even though it was only passed 3.=C2=A0 But i=
t=20
>> looks like you still need a v3.
>=20
> Oops. I am surprise the compiler doesn't emit a warning here...

I'm sorry I can't see the 4th parameter.

Before: "gt64120 read %s value:0x%0*" PRIx64

#1 's' for 'const char *regname'
#2 '0*' for 'int width'
#3 'x' for 'uint64_t value'

After: "gt64120 read %s width:%d value:0x%08" PRIx64

#1 's' for 'const char *regname'
#2 'd' for 'int width'
#3 '08x' for 'uint64_t value'

Am I missing something?


