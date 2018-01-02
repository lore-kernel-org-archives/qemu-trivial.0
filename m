Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eWITr-0004NM-DV
	for mharc-qemu-trivial@gnu.org; Tue, 02 Jan 2018 04:03:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53064)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lepton@google.com>) id 1eWITp-0004Mo-6V
	for qemu-trivial@nongnu.org; Tue, 02 Jan 2018 04:03:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lepton@google.com>) id 1eWITo-0008AY-8m
	for qemu-trivial@nongnu.org; Tue, 02 Jan 2018 04:03:29 -0500
Received: from mail-wr0-x241.google.com ([2a00:1450:400c:c0c::241]:39883)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <lepton@google.com>) id 1eWITo-00089t-2O
	for qemu-trivial@nongnu.org; Tue, 02 Jan 2018 04:03:28 -0500
Received: by mail-wr0-x241.google.com with SMTP id o101so19266041wrb.6
	for <qemu-trivial@nongnu.org>; Tue, 02 Jan 2018 01:03:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=blLkhzRVf8hCDNu6fX/QcvhZVo7eWLAfwQdzrk4uHZI=;
	b=r4YqPSw1MqZ/QpdWqUjxQwSFV8+GI5INP9oUYh0A5Zv2YkQ1Kt4A8QwB+ELZqB5H6A
	tLMwl0IredszJc3PF9sHpCu956W+VZOHgpsqAa+/rxmNON6/Bnleu0AFr5VLmqaRa48s
	Xyasnv7EyOi0Ti/PBDdXL/DmJGCEK0nCVKtJpmwOWWSJn0rtsTh268MC1bBJwbGKHcTP
	c37DHYWS2BgI1YhQ7JiQpcq0LoRgs+7M4gIHiaDDu7jTbUjyWjTMBKwoWakigvzOZJ+n
	3+vQvVh+O0n/EnS6bKCcO2i24reCe/OKG4u0tjv3Khzchq3Bvh/pKIu52Z6IO99B8RT9
	L95Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=blLkhzRVf8hCDNu6fX/QcvhZVo7eWLAfwQdzrk4uHZI=;
	b=owFZQ8JcxLmijNuz54I+xSoddqw9mJCktcBsJCCFkx/X7PM+cYNINfkqV/XlJuzK5E
	AgSrxs2fUuGrMu+GPCaehaB8LynvLdMWXcpjFFZAVj8IRg9E673ib2qEu8ZPXSEpnOtP
	qdcoU8XX2HLdG8Zwyi4Ux9GCjUR+po6w0pfbACp5MtZ5vw8k0TFFQ2R/bpeepcULYHSE
	p5gu3d4VZ89iz/uVouYRWNU2nuAG/yoQ6LHn5VK9q9JwiXa6cvm28jYdR9h+ZK6CplGy
	7DFbjoenNTnhZMcjbc3cP/j2xPQvvssJBKh9DfXcHyIwNMsBC6kDBA9btcO8ThC4W7k0
	+KFQ==
X-Gm-Message-State: AKGB3mJ323gPHoqs99y69prVAWU1tTwBq6/Ny2FibEXJHf73AMoawHbV
	dCd6LYXzNRjuSpsbwCyXoMqWSsFC+MomjximtFYjKg==
X-Google-Smtp-Source: ACJfBovOnJxwn+z5oi9x6wbezfMdF/g+9QqBXLxh+46xh5b/ofVKXm4THI1zYimAaLFezBwd+uizv6uk5ExNabPxwZ8=
X-Received: by 10.223.202.18 with SMTP id o18mr13158438wrh.275.1514883805998; 
	Tue, 02 Jan 2018 01:03:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.131.208 with HTTP; Tue, 2 Jan 2018 01:03:25 -0800 (PST)
In-Reply-To: <CAOvqHj4P17JQ=bJqpZsA3n-sfw927Sad3-YD2FUHff1zhpanGA@mail.gmail.com>
References: <20171207065639.164900-1-lepton@google.com>
	<CAOvqHj4P17JQ=bJqpZsA3n-sfw927Sad3-YD2FUHff1zhpanGA@mail.gmail.com>
From: =?UTF-8?B?VGFvIFd1KOWQtOa2m0BFbmcp?= <lepton@google.com>
Date: Tue, 2 Jan 2018 01:03:25 -0800
Message-ID: <CAOvqHj7Cx7dJLq2kYgpG3M-RoeBd64XM-BT0Hs4=vvnTg9zgAQ@mail.gmail.com>
To: QEMU <qemu-devel@nongnu.org>
Cc: qemu-trivial@nongnu.org, kraxel@redhat.com, mjt@tls.msk.ru, 
	Laurent Vivier <laurent@vivier.eu>, Tao Wu <lepton@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::241
Subject: Re: [Qemu-trivial] [PATCH] hw/input/hid: Add support for several
 keys.
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 02 Jan 2018 09:03:30 -0000

Ping?

On Thu, Dec 14, 2017 at 1:25 PM, Tao Wu(=E5=90=B4=E6=B6=9B@Eng) <lepton@goo=
gle.com> wrote:
> Anybody can merge this?
>
> It's a simple change:  actually it only changed 4 bytes in hid usage
> table to enable 4 keys: audiomute volumeup volumedown and power.
>
> It's easy to verify what the patch is doing:
>
> Boot some guest os with argument "-usbdevice keyboard"  and use qemu
> monitor console to do "sendkey audiomute", without this patch, nothing
> happend inside guest os. with this patch,  all these 4 keys work correctl=
y.
>
> On Wed, Dec 6, 2017 at 10:56 PM, Tao Wu <lepton@google.com> wrote:
>> Add support for these keys: audiomute volumedown volumeup power.
>> Tested with "sendkey" command in monitor and verify the behavior
>> in guest OS.
>>
>> Signed-off-by: Tao Wu <lepton@google.com>
>> ---
>>  hw/input/hid.c | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/hw/input/hid.c b/hw/input/hid.c
>> index 0d049ff61c..aa4fb826fd 100644
>> --- a/hw/input/hid.c
>> +++ b/hw/input/hid.c
>> @@ -57,14 +57,14 @@ static const uint8_t hid_usage_keys[0x100] =3D {
>>      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
>>      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
>>      0x00, 0x00, 0x00, 0x00, 0x58, 0xe4, 0x00, 0x00,
>> -    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
>> -    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
>> -    0x00, 0x00, 0x00, 0x00, 0x00, 0x54, 0x00, 0x46,
>> +    0x7f, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
>> +    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x81, 0x00,
>> +    0x80, 0x00, 0x00, 0x00, 0x00, 0x54, 0x00, 0x46,
>>      0xe6, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
>>      0x00, 0x00, 0x00, 0x00, 0x00, 0x48, 0x48, 0x4a,
>>      0x52, 0x4b, 0x00, 0x50, 0x00, 0x4f, 0x00, 0x4d,
>>      0x51, 0x4e, 0x49, 0x4c, 0x00, 0x00, 0x00, 0x00,
>> -    0x00, 0x00, 0x00, 0xe3, 0xe7, 0x65, 0x00, 0x00,
>> +    0x00, 0x00, 0x00, 0xe3, 0xe7, 0x65, 0x66, 0x00,
>>      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
>>      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
>>      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
>> --
>> 2.15.1.424.g9478a66081-goog
>>

