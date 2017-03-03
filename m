Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cjuFc-0008Ka-3x
	for mharc-qemu-trivial@gnu.org; Fri, 03 Mar 2017 15:56:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44718)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1cjuFZ-0008JP-Mi
	for qemu-trivial@nongnu.org; Fri, 03 Mar 2017 15:56:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1cjuFY-0002ah-OB
	for qemu-trivial@nongnu.org; Fri, 03 Mar 2017 15:56:29 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:64896)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <balaton@eik.bme.hu>)
	id 1cjuFT-0002ZI-BO; Fri, 03 Mar 2017 15:56:23 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
	by localhost (Postfix) with SMTP id C88B374577A;
	Fri,  3 Mar 2017 21:56:20 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
	id AE4067456AD; Fri,  3 Mar 2017 21:56:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zero.eik.bme.hu (Postfix) with ESMTP id AD7687456D4;
	Fri,  3 Mar 2017 21:56:20 +0100 (CET)
Date: Fri, 3 Mar 2017 21:56:20 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Peter Maydell <peter.maydell@linaro.org>
cc: QEMU Developers <qemu-devel@nongnu.org>, 
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>
In-Reply-To: <CAFEAcA8w9ox2KSSvky6aY3sHG=Xq=h7Wu2F_9UHRtQAKCPTrLg@mail.gmail.com>
Message-ID: <alpine.BSF.2.20.1703032154440.14293@zero.eik.bme.hu>
References: <cover.1488504063.git.balaton@eik.bme.hu>
	<7e582e5ca2aaa7b8b6c1f8a040562b099767ff81.1488504063.git.balaton@eik.bme.hu>
	<CAFEAcA8w9ox2KSSvky6aY3sHG=Xq=h7Wu2F_9UHRtQAKCPTrLg@mail.gmail.com>
User-Agent: Alpine 2.20 (BSF 67 2015-01-07)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:738:2001:2001::2001
Subject: Re: [Qemu-trivial] [PATCH v3 04/13] sm501: QOMify
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
X-List-Received-Date: Fri, 03 Mar 2017 20:56:30 -0000

On Fri, 3 Mar 2017, Peter Maydell wrote:
> On 3 March 2017 at 01:03, BALATON Zoltan <balaton@eik.bme.hu> wrote:
>> Adding vmstate saving is not in this patch because the state structure
>> will be changed in further patches, then another patch will add
>> vmstate descriptor after those changes.
>>
>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>
>> +static void sm501_init(SM501State *s, DeviceState *dev, uint32_t base,
>> +                       uint32_t local_mem_bytes)
>> +{
>> +    s->base = base;
>> +    s->local_mem_size_index = get_local_mem_size_index(local_mem_bytes);
>> +    SM501_DPRINTF("sm501 local mem size=%x. index=%d\n", get_local_mem_size(s),
>> +                  s->local_mem_size_index);
>> +    if (get_local_mem_size(s) != local_mem_bytes) {
>> +        error_report("Warning: sm501 VRAM size adjusted to %" PRIu32,
>> +                     get_local_mem_size(s));
>> +    }
>
> Just noticed this. I think reporting the error upwards by
> failing device realize is better than adjusting the value.
> It's what we tend to do for other devices. Management tools
> like libvirt prefer to get hard errors if there's a config
> file error that means they misconfigure a device.

Making this change would need rebasing the whole series again an fixing 
conflicts. Do you insist on this or can we live with this warning which is 
closer to the original behaviour of this device?


