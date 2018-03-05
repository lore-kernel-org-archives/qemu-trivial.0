Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1esvQp-0008Ks-Ri
	for mharc-qemu-trivial@gnu.org; Mon, 05 Mar 2018 14:05:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46622)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1esvQo-0008Je-3g
	for qemu-trivial@nongnu.org; Mon, 05 Mar 2018 14:05:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1esvQn-0001Rc-AX
	for qemu-trivial@nongnu.org; Mon, 05 Mar 2018 14:05:54 -0500
Received: from mail-wr0-x244.google.com ([2a00:1450:400c:c0c::244]:45742)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1esvQl-0001Qd-BF; Mon, 05 Mar 2018 14:05:51 -0500
Received: by mail-wr0-x244.google.com with SMTP id p104so18406842wrc.12;
	Mon, 05 Mar 2018 11:05:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=iPxgFklOL+/IeNdx8pSZDt0mfQb2EiD8YCl0HjPxKOU=;
	b=C8fIdKTgrDBmo1xpxdjh0037RBaGSOmqhgU1Y0/NakP3BiLPeLpqPLy4Q7nvOfJ4jr
	a0bBqSADy2hBahgJ65H5buEjsw0GnoXCN9/hlk5inPUVGoqTLYvJ4s6CluHCAB78zhgI
	V3hOogU1JS2yHIcwsVMmzvBsqEO6SW433C65/5uvvYUv9OPxK9PZzsmGkHgoma+TCYPj
	xAPj0aXElTvV6riaf454IQ96iwuDd5qdtXGTZ+/PZhG7oQ+xB4wYx9d5ZdrslDTiLZ1e
	Rv0Wur7bYJ0mqi5Rvjsmdx5/GIGHsXsOIk62Vs8EPKBToKLxMpe1Cmng9YPw1LB8XnOm
	ZKZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=iPxgFklOL+/IeNdx8pSZDt0mfQb2EiD8YCl0HjPxKOU=;
	b=jX0NZit9+6JZHBc+stOu87l5bWiIT1EIcgNJtnol+nzC6fWw+AAS5f7F61/NGMkBGI
	4QoO1dZMDazSz579djb5AoAcIyZxTTNjcNtT17G4bUoqL90e04h0DSoadcjepbDn8ZMF
	ZEsmNDzwRPpYhCAlpPwbSEwWiB5IAmG43TX0gBOarlh5B5nFj8W2e3ej0WgNAKkb7Zqe
	902oRHuY4eGO5F4M3EGmq/4z5vSMgpIyVaE9mlzbWnkQGJLR8JjS4pJ0Y0Phpv8ArC41
	S94iU2dnMpaYh8ov4bKsmo0NSl0AUBXLSjjHjZOMoZBHVgng56Zp610DLkkzu9SfbOw5
	stNA==
X-Gm-Message-State: APf1xPBQgX70H0HGP8l1LNuDdtbYZGod0lNiDIlZj7iW8I3YbM5Siedt
	CQ5K8CmGzKAwcp+QmedbhQgPeqjkS9Q=
X-Google-Smtp-Source: AG47ELs6N/nTrLS8otn4XJs2023T/48AXK3a3XhK8Uo9wNTDYDWz0A+EWK/wKg9AOLlfrRE/jox9pg==
X-Received: by 10.223.183.43 with SMTP id l43mr14562760wre.265.1520276750104; 
	Mon, 05 Mar 2018 11:05:50 -0800 (PST)
Received: from [192.168.1.16] (ABayonne-654-1-79-224.w86-222.abo.wanadoo.fr.
	[86.222.222.224]) by smtp.gmail.com with ESMTPSA id
	u22sm13284781wrf.86.2018.03.05.11.05.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Mar 2018 11:05:49 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Jiri Slaby <jslaby@suse.cz>, qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org
References: <20180305112732.26471-1-f4bug@amsat.org>
	<20180305112732.26471-22-f4bug@amsat.org>
	<d0a41a33-45c0-92bf-7fa1-e5cad644b4fe@suse.cz>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <7fb5baea-61e7-8daa-e05e-3a99c7276898@amsat.org>
Date: Mon, 5 Mar 2018 16:05:48 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <d0a41a33-45c0-92bf-7fa1-e5cad644b4fe@suse.cz>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::244
Subject: Re: [Qemu-trivial] [PATCH v2 21/30] hw/misc: use the BYTE-based
 definitions
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
X-List-Received-Date: Mon, 05 Mar 2018 19:05:55 -0000

Hi Jiri,

On 03/05/2018 04:02 PM, Jiri Slaby wrote:
> On 03/05/2018, 12:27 PM, Philippe Mathieu-Daudé wrote:
>> --- a/hw/misc/auxbus.c
>> +++ b/hw/misc/auxbus.c
>> @@ -68,7 +68,7 @@ AUXBus *aux_init_bus(DeviceState *parent, const char *name)
>>  
>>      /* Memory related. */
>>      bus->aux_io = g_malloc(sizeof(*bus->aux_io));
>> -    memory_region_init(bus->aux_io, OBJECT(bus), "aux-io", (1 << 20));
>> +    memory_region_init(bus->aux_io, OBJECT(bus), "aux-io", 2 * M_BYTE);
> 
> Only M_BYTE, not "2 *".

Yes! I totally missed this :/

> 
>>      address_space_init(&bus->aux_addr_space, bus->aux_io, "aux-io");
>>      return bus;
>>  }
>> diff --git a/hw/misc/edu.c b/hw/misc/edu.c
>> index 34eb05d213..ce8235dfc4 100644
>> --- a/hw/misc/edu.c
>> +++ b/hw/misc/edu.c
>> @@ -357,7 +357,7 @@ static void pci_edu_realize(PCIDevice *pdev, Error **errp)
>>                         edu, QEMU_THREAD_JOINABLE);
>>  
>>      memory_region_init_io(&edu->mmio, OBJECT(edu), &edu_mmio_ops, edu,
>> -                    "edu-mmio", 1 << 20);
>> +                    "edu-mmio", 1 * M_BYTE);
> 
> "1 * " is superfluous

I kept "1 * " to be consistent with the other uses, I find it easier to
review (or modify).

Thanks for your review!

Phil.

