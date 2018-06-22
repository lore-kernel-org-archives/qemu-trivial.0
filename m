Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fWKrL-0001eS-Ec
	for mharc-qemu-trivial@gnu.org; Fri, 22 Jun 2018 08:08:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39885)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWKrI-0001Ys-2q
	for qemu-trivial@nongnu.org; Fri, 22 Jun 2018 08:08:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWKrE-0002od-T7
	for qemu-trivial@nongnu.org; Fri, 22 Jun 2018 08:08:07 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:45140)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWKrE-0002oY-OJ; Fri, 22 Jun 2018 08:08:04 -0400
Received: by mail-qt0-x241.google.com with SMTP id i18-v6so5661935qtp.12;
	Fri, 22 Jun 2018 05:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Id8yzSFj9ePPjI2MaWGhA3CDbGvKDnHr+YAJfPJrzTs=;
	b=A018qgRcX7mM9V8EoJGGDyiELj2ZpjFfbghzUAKSCbD+P4JvQ0ef3JZDp2KAkAVtCb
	+hravw64o8+tTLCHbKPwJ1s1IVOBncyeXym9Me9KmcOUqTYApIGVsc/vATTh7QTrrv6F
	yN+w+GMIGJMAKvoY8gs9CdwnRubU/UrhXVb6IVYJ6t+0w5yWAl6RpRJe6VmeKd96eAu9
	rH/qbY9JVm2CAWDyXYr5avFaNO5ZAq4J44EtB7uFcnsHapNrmZEUFVPgwkeVcPKbPcjv
	zsXtFMgGBiuVdeCe74mJVR8pN3py9XI6eTnAy65hCGTpdYsGhZeWYRlo6snwLUnkpqJ+
	naxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=Id8yzSFj9ePPjI2MaWGhA3CDbGvKDnHr+YAJfPJrzTs=;
	b=BZrEMCj/1u8bmE0a3pd5hC9ch7IZUjD8TXQxm9vuhacP52W8daViQH8yIPSk5lbEbU
	w3PXHLpDa0pR4w4qFBFvnNW2TTEOqU17tqM63vj/UkNU7ra78eCOrwSrSZH5ZZBs89qb
	ljeFqef7BJjMPm+qUJVYNDKwNrfkaBf/pqAH+LSA4bM8HjIkXlHM/6PM/ynx06lvrUnU
	pqiUO+2yMxrZgmc2zyMmfX5XqfOEVvuNLDtVAmHeI5gIRsTU6uHwNsRahQ2B8Q3wZmua
	g+wb33rbo/ZtKxRi5sXR7A2uKMEzNBLTnNzdWND/ddJow0tfrGTAinlAd6R3qg/yoKwI
	DOqw==
X-Gm-Message-State: APt69E2B6wqbdY3IqnDBqBAipVxzdXR7pTd/VONK9E6EeAfMBbyJue1B
	wvI7LKd1Qjr2QPqWGnOuli2CqcRc
X-Google-Smtp-Source: ADUXVKI11BVZHUCuRYU6dHnGFaU3LNp7dLOxZTnI2Xq1QhfLqIsU4cFy4udiiFnMeSdipKa1jIwpjQ==
X-Received: by 2002:ac8:a06:: with SMTP id b6-v6mr1009450qti.99.1529669284092; 
	Fri, 22 Jun 2018 05:08:04 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	g188-v6sm5030201qkc.37.2018.06.22.05.08.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Jun 2018 05:08:03 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
References: <20180621171257.14897-1-f4bug@amsat.org>
	<20180621171257.14897-6-f4bug@amsat.org>
	<20180622062225.ay4bubgshxjj3uey@sirius.home.kraxel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <3a5e52f6-3b65-5ce8-f5d2-48b76e3e4f21@amsat.org>
Date: Fri, 22 Jun 2018 09:07:59 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180622062225.ay4bubgshxjj3uey@sirius.home.kraxel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: Re: [Qemu-trivial] [PATCH 05/11] hw/display/cirrus: Convert
 printf() calls to trace events
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
X-List-Received-Date: Fri, 22 Jun 2018 12:08:09 -0000

Hi Gerd,

On 06/22/2018 03:22 AM, Gerd Hoffmann wrote:
> On Thu, Jun 21, 2018 at 02:12:51PM -0300, Philippe Mathieu-Daudé wrote:
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  hw/display/cirrus_vga.c | 25 ++++++-------------------
>>  hw/display/trace-events |  2 ++
>>  2 files changed, 8 insertions(+), 19 deletions(-)
>>
>> diff --git a/hw/display/cirrus_vga.c b/hw/display/cirrus_vga.c
>> index 138ae961b9..a826bef6ec 100644
>> --- a/hw/display/cirrus_vga.c
>> +++ b/hw/display/cirrus_vga.c
>> @@ -2608,11 +2608,8 @@ static uint64_t cirrus_vga_ioport_read(void *opaque, hwaddr addr,
>>  	    break;
>>  	case 0x3c5:
>>  	    val = cirrus_vga_read_sr(c);
>> +        trace_vga_cirrus_read_reg("SR", s->sr_index, val);
>>              break;
>> -#ifdef DEBUG_VGA_REG
>> -	    printf("vga: read SR%x = 0x%02x\n", s->sr_index, val);
>> -#endif
> 
> Indention looks weird.

Actually this is the code around that is weirdly intended, a mix of
<tab> and <spaces>.
I noticed, except when upgrading generic API, there are very few logical
changes (except yours) in this file in the git history. Thus little
interest in doing an indentation cleanup previous patch (at this point
git history is more useful).

> 
> otherwise the patch looks fine.

Do you prefer a previous indent cleanup patch or can I add your Acked-by
tag?

Thanks,

Phil.

> 
> cheers,
>   Gerd
> 

