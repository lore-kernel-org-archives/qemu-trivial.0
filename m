Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iVMdf-0008HX-C6
	for mharc-qemu-trivial@gnu.org; Thu, 14 Nov 2019 16:26:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48397)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iVMdd-0008Gn-2Z
 for qemu-trivial@nongnu.org; Thu, 14 Nov 2019 16:26:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iVMda-0002Kf-OC
 for qemu-trivial@nongnu.org; Thu, 14 Nov 2019 16:26:49 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:54696
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iVMda-0002KP-Ks
 for qemu-trivial@nongnu.org; Thu, 14 Nov 2019 16:26:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573766806;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jla/saRYu/JOI6uP5BLmXeDytzulzWfudjgn1bsirg0=;
 b=XWkq1qmNp6TlaV/SRGaw9w6YVzDT6GwJ0ZUxP8MvhWup9EircOqqENhvhLpJN7gZZT9jt/
 K5BohX09wAPgVHfNxPIIejUiupYQXQeWexWqVbdhJY2noDwRBllRYoYtrwy+vfz8s5ZSdA
 EhF08QKo7aPpRyrcFGFAaRkPc/Ke/7c=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-159-6aqmOKzQPd-zClRYN4fmWA-1; Thu, 14 Nov 2019 16:26:43 -0500
Received: by mail-wr1-f71.google.com with SMTP id k15so5647736wrp.22
 for <qemu-trivial@nongnu.org>; Thu, 14 Nov 2019 13:26:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mzBBBZQU9HDb4P9jS+gy/titsTwaKrr7suw5Izl+0Cc=;
 b=d9rE5svRyGb0frtbf40ZijIZwh3x+Xh8BWvOMETBCZK/bwrTNAX1MUDVN/Dwm0h7ck
 jjT7R4HTjMCVcB7dRlnzbBoL7CYnLExWDTkzXZFAkLhuE1shYAGv4ISaa8pR1mXeRBHX
 87Z8Yz4t9OELzKsTVlDat92hJYJJ/V0Q+02Bl3Qg4xvCTer5cgOXDcWZ81HN9LiPh7qX
 VBlaYZhER5Ahz4tVegg584jUEuMvF67fWr7EbolCOpnoQifhur3fHCejXKavi1K66JQa
 Z2th+wWaphcN+ohu2/pjzfYKA9hLibj/F70Ewao4bnMripNr0vmy4u5Ki+zUtYKW9w2t
 G69g==
X-Gm-Message-State: APjAAAXvVb8CNCbw3XttOi9QlYegDsPadS+8vYZMk4PJm6mNBT71VDUk
 6h8u24p+Ahz4oZlT9mdeFg3mIXYaAXRVzuxNE+PAkWMVypnPwOA9lWQBzXorWObG+TY+Pp0elld
 hc6LszBAjEucmxZCMvQ==
X-Received: by 2002:a1c:6146:: with SMTP id v67mr10674162wmb.102.1573766801470; 
 Thu, 14 Nov 2019 13:26:41 -0800 (PST)
X-Google-Smtp-Source: APXvYqw4oudtLJm+R1W1ky+87fQblsSdGqzWiQ2pNwypkQVGp/9+piH157VFdH4UusfBnJo8xfFrMA==
X-Received: by 2002:a1c:6146:: with SMTP id v67mr10674133wmb.102.1573766801238; 
 Thu, 14 Nov 2019 13:26:41 -0800 (PST)
Received: from [192.168.1.35] (170.red-83-59-162.dynamicip.rima-tde.net.
 [83.59.162.170])
 by smtp.gmail.com with ESMTPSA id y6sm8605145wrr.19.2019.11.14.13.26.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Nov 2019 13:26:40 -0800 (PST)
Subject: Re: [PATCH v2 1/3] hw/block/pflash: Remove dynamic field width from
 trace events
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: Max Reitz <mreitz@redhat.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>, qemu-block@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-trivial@nongnu.org
References: <20191108144042.30245-1-philmd@redhat.com>
 <20191108144042.30245-2-philmd@redhat.com>
 <9e7990b7-87ed-84d4-5256-8397bc25a1f4@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <dd59a9d2-d5c8-b054-191b-bbbfd9d7b7b1@redhat.com>
Date: Thu, 14 Nov 2019 22:26:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <9e7990b7-87ed-84d4-5256-8397bc25a1f4@redhat.com>
Content-Language: en-US
X-MC-Unique: 6aqmOKzQPd-zClRYN4fmWA-1
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
X-List-Received-Date: Thu, 14 Nov 2019 21:26:50 -0000

Hi Eric,

On 11/8/19 4:56 PM, Eric Blake wrote:
> On 11/8/19 8:40 AM, Philippe Mathieu-Daud=C3=A9 wrote:
>> Since not all trace backends support dynamic field width in
>> format (dtrace via stap does not), replace by a static field
>> width instead.
>>
>> Reported-by: Eric Blake <eblake@redhat.com>
>> Buglink: https://bugs.launchpad.net/qemu/+bug/1844817
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>> ---
>> =C2=A0 hw/block/pflash_cfi01.c | 8 ++++----
>> =C2=A0 hw/block/pflash_cfi02.c | 8 ++++----
>> =C2=A0 hw/block/trace-events=C2=A0=C2=A0 | 8 ++++----
>> =C2=A0 3 files changed, 12 insertions(+), 12 deletions(-)
>>
>> diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
>> index 566c0acb77..787d1196f2 100644
>> --- a/hw/block/pflash_cfi01.c
>> +++ b/hw/block/pflash_cfi01.c
>> @@ -276,7 +276,7 @@ static uint32_t pflash_data_read(PFlashCFI01 *pfl,=
=20
>> hwaddr offset,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DPRINTF("BUG in %=
s\n", __func__);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 abort();
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> -=C2=A0=C2=A0=C2=A0 trace_pflash_data_read(offset, width << 1, ret);
>> +=C2=A0=C2=A0=C2=A0 trace_pflash_data_read(offset, width << 3, ret);
>=20
> Umm, why is width changing?=C2=A0 That's not mentioned in the commit mess=
age.

Previously it was used to set the format width: [1, 2, 4] -> [2, 4, 8].

We usually log the width in byte (accessed at memory location) or bits=20
(used by the bus). When using this device I'm custom to think in bus=20
access width.

Regardless whichever format we prefer, a change is needed.

>=20
>> @@ -389,7 +389,7 @@ static uint32_t pflash_read(PFlashCFI01 *pfl,=20
>> hwaddr offset,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> -=C2=A0=C2=A0=C2=A0 trace_pflash_io_read(offset, width, width << 1, ret,=
 pfl->cmd,=20
>> pfl->wcycle);
>> +=C2=A0=C2=A0=C2=A0 trace_pflash_io_read(offset, width << 3, ret, pfl->c=
md,=20
>> pfl->wcycle);
>=20
> And even this one is odd.=C2=A0 Matching up to the trace messages:
>=20
>=20
>> -pflash_io_read(uint64_t offset, int width, int fmt_width, uint32_t=20
>> value, uint8_t cmd, uint8_t wcycle) "offset:0x%04"PRIx64" width:%d=20
>> value:0x%0*x cmd:0x%02x wcycle:%u"
>=20
>> +pflash_io_read(uint64_t offset, int width, uint32_t value, uint8_t=20
>> cmd, uint8_t wcycle) "offset:0x%04"PRIx64" width:%d value:0x%04x=20
>> cmd:0x%02x wcycle:%u"
>=20
> you are changing from:
>=20
> "%04"PRIx64" %d %0*x...", offset, width, width << 1, ret,...
>=20
> (where width<<1, ret matches *x)
>=20
> into
>=20
> "%04"PRIx64" %d %04x...", offset, width << 3, ret,...
>=20
> where you are now printing a different value for width.

Do you prefer using a "-bit" suffix? As

"offset:0x%04"PRIx64" width:%d-bit value:0x%04x cmd:0x%02x wcycle:%u"

I can also simply remove this information. Ideally I'd revert this patch=20
once the we get this format parsable by the SystemTap backend.


