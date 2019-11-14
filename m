Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iVMbA-0005MU-D7
	for mharc-qemu-trivial@gnu.org; Thu, 14 Nov 2019 16:24:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47940)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iVMb7-0005JE-8O
 for qemu-trivial@nongnu.org; Thu, 14 Nov 2019 16:24:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iVMb5-0001SK-SV
 for qemu-trivial@nongnu.org; Thu, 14 Nov 2019 16:24:13 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:34089
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iVMb5-0001Ru-Od
 for qemu-trivial@nongnu.org; Thu, 14 Nov 2019 16:24:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573766651;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lMYVnu/QioG78ckKeCNfu19H6SmTq1Wb7xgXCYr7lS4=;
 b=hRY+p2BOYExVCoAc9NN0VW9U89TYWCN/VnUke2b9GI8LMJ50/MaZQ9Sh+tXU3rOGIFlv+9
 pVveyi/IMOIVPgieSD50He2QnEWd7md6RN2UZxDfdZGdivHDhoM3ta2GwOiP6CwdVYX8e6
 8MpmHFeyckXFf4btpn6dOPDFUUJX+cI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-285-FS3-4WisOxGk7as37Eem2Q-1; Thu, 14 Nov 2019 16:24:09 -0500
Received: by mail-wm1-f70.google.com with SMTP id y133so4319900wmd.8
 for <qemu-trivial@nongnu.org>; Thu, 14 Nov 2019 13:24:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QwcE/DqumSPzvCi6RyJBPaw3kY/NfmaYQc3YQaxPPMk=;
 b=bvWtMhNvxKn+gdpFdyl9sAStqR07FqcU78MOpAs8m3sL2YqrwVL5jkhY/abtmbIRge
 YxRZnUsvy8cYHceKuBf7PiQS744VRt+ECSIzk9sCDkMV6fKobkc9Sf6GgyuPiuKNuSHF
 1BxYWTXPQ8rw14oJpY9yTl5V5J1Pu3NLAbbz6qYS1ICfs0/oNc91yPOHRpiChO6Z2lje
 0ZXw2ADvduwr3CAe2P59E2riNL4O6W8rjBGj/s2jXM9CHW4IiHvoLWdR9VZTdCNYQrss
 kZrPI3b5YNIzHf6ailVFZN+fN6vDXUs/VDDNym9BPeh5d7F8v+Fe3ncY4KvPmnh67BQN
 b93w==
X-Gm-Message-State: APjAAAWrn4NlNbGPTsyoHFTMwCH4g2MuLwaw1SjqZxvYQ9oUrFTeUmaH
 VMVnFA1vfnSaGuzy7YPrXfRKlycMqsmTmS+YZmI2KAlw5aMKndrN3RjIODpeos83lY7n4uu8oN4
 2ivNT2nEAtSLxW38C4g==
X-Received: by 2002:adf:e28f:: with SMTP id v15mr10571105wri.130.1573766648217; 
 Thu, 14 Nov 2019 13:24:08 -0800 (PST)
X-Google-Smtp-Source: APXvYqzQByTgbqPtxsG4VWwfBAQOHcuheI/vp59/mKz643WpbL+QRm3GlGOQeqp+7blcDUpGI3UsGA==
X-Received: by 2002:adf:e28f:: with SMTP id v15mr10570979wri.130.1573766647268; 
 Thu, 14 Nov 2019 13:24:07 -0800 (PST)
Received: from [192.168.1.35] (170.red-83-59-162.dynamicip.rima-tde.net.
 [83.59.162.170])
 by smtp.gmail.com with ESMTPSA id v184sm7949618wme.31.2019.11.14.13.24.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Nov 2019 13:24:06 -0800 (PST)
Subject: Re: [PATCH v2 2/3] hw/mips/gt64xxx: Remove dynamic field width from
 trace events
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: Max Reitz <mreitz@redhat.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>, qemu-block@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-trivial@nongnu.org
References: <20191108144042.30245-1-philmd@redhat.com>
 <20191108144042.30245-3-philmd@redhat.com>
 <ead1eb4b-a0e0-edf9-8323-ce9f5a291547@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <bffde73d-cc1a-dcea-2e5d-7128bda7abf9@redhat.com>
Date: Thu, 14 Nov 2019 22:24:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <ead1eb4b-a0e0-edf9-8323-ce9f5a291547@redhat.com>
Content-Language: en-US
X-MC-Unique: FS3-4WisOxGk7as37Eem2Q-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
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
X-List-Received-Date: Thu, 14 Nov 2019 21:24:14 -0000

On 11/8/19 4:58 PM, Eric Blake wrote:
> On 11/8/19 8:40 AM, Philippe Mathieu-Daud=C3=A9 wrote:
>> Since not all trace backends support dynamic field width in
>> format (dtrace via stap does not), replace by a static field
>> width instead.
>>
>> Reported-by: Eric Blake <eblake@redhat.com>
>> Buglink: https://bugs.launchpad.net/qemu/+bug/1844817
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>> ---
>> v2: Do not update qemu_log_mask()
>> ---
>> =C2=A0 hw/mips/gt64xxx_pci.c | 16 ++++++++--------
>> =C2=A0 hw/mips/trace-events=C2=A0 |=C2=A0 4 ++--
>> =C2=A0 2 files changed, 10 insertions(+), 10 deletions(-)
>>
>> diff --git a/hw/mips/gt64xxx_pci.c b/hw/mips/gt64xxx_pci.c
>> index 5cab9c1ee1..6743e7c929 100644
>> --- a/hw/mips/gt64xxx_pci.c
>> +++ b/hw/mips/gt64xxx_pci.c
>> @@ -642,19 +642,19 @@ static void gt64120_writel(void *opaque, hwaddr=20
>> addr,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* not really imp=
lemented */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 s->regs[saddr] =
=3D ~(~(s->regs[saddr]) | ~(val & 0xfffffffe));
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 s->regs[saddr] |=
=3D !!(s->regs[saddr] & 0xfffffffe);
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 trace_gt64120_write("INTRCAU=
SE", size << 1, val);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 trace_gt64120_write("INTRCAU=
SE", size << 3, val);
>=20
> Again, this isn't mentioned in the commit message.=C2=A0 Why are you chan=
ging=20
> parameter values?
>=20
>=20
>> +++ b/hw/mips/trace-events
>> @@ -1,4 +1,4 @@
>> =C2=A0 # gt64xxx.c
>> -gt64120_read(const char *regname, int width, uint64_t value) "gt64120=
=20
>> read %s value:0x%0*" PRIx64
>> -gt64120_write(const char *regname, int width, uint64_t value)=20
>> "gt64120 write %s value:0x%0*" PRIx64
>> +gt64120_read(const char *regname, int width, uint64_t value) "gt64120=
=20
>> read %s width:%d value:0x%08" PRIx64
>> +gt64120_write(const char *regname, int width, uint64_t value)=20
>> "gt64120 write %s width:%d value:0x%08" PRIx64
>=20
> Huh, we were really broken - the old code (if passed to printf) would=20
> try to parse 4 parameters, even though it was only passed 3.=C2=A0 But it=
=20
> looks like you still need a v3.

Oops. I am surprise the compiler doesn't emit a warning here...


