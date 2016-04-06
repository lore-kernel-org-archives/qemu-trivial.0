Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1angzr-0007v7-Er
	for mharc-qemu-trivial@gnu.org; Wed, 06 Apr 2016 02:31:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40560)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1angzo-0007sY-Vo
	for qemu-trivial@nongnu.org; Wed, 06 Apr 2016 02:31:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1angzk-000793-Tq
	for qemu-trivial@nongnu.org; Wed, 06 Apr 2016 02:31:20 -0400
Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244]:34193)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1angzk-00078x-N8; Wed, 06 Apr 2016 02:31:16 -0400
Received: by mail-wm0-x244.google.com with SMTP id n3so10239798wmn.1;
	Tue, 05 Apr 2016 23:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=XHgVTHdq5hqNgTKjNloUhp2yd/b/qzrV+c5ZnE7FqSI=;
	b=RT2fS75qdJuqRmDx1basVEYdYs/QE4JpguZkiTmirHnFiURj5I6iHdmxB+kqMUOF/i
	6EZOupxYmAslPyy6rEhsc8IrJjMD6J+g0WkadE/YpD7Zz/XJlViuBRoMvk5ov+9fo3pN
	w5lfiPoj2XMzSp+4gOk5GZFOt2t8OU/zDqRiYR0md7rvupBO16C/2V0R3o9BDwuJtEti
	PIIgQgY0zXrVtAsXsh1YSwEtvtpfBAHGe2LyrplQltS7yjMaLh5kYwgswOvAyGxNvog0
	kpTYVRx0RsxrAfgw9TH0PKQTJqgqnUAdDC5+Kz3cfRxgRcouiEsH5MYGbfgH6YiWOFXN
	vJYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=XHgVTHdq5hqNgTKjNloUhp2yd/b/qzrV+c5ZnE7FqSI=;
	b=DUMiCbJVTdTLTsfKZp+WtaYZt4bkeeAbfJSdDfwy4lS37GNAxSgT96tBsMVjn4td19
	7s6rLYoJrzXVpM7VE/kPiD6meQKnsZkvoClzAHiw7kV4uH2FXJKWHfDy+Va4bjHVM0yG
	hCcH8wyMkhVia+/1qB/fIzsDyAljmEb5LFNhdXUFuS8Ybb/itosiK4/mYkTD5T+M7pfU
	sqN1u+58H0+PttGuVLSdcNDzah/pOMqCs42i0R0VIaQpY12H5ZwfMZhWGq3X2uLaPFX1
	FuMwmBEvMwi8mrCrBu2Iky8CQ86CqvMLNXhr0mVhckUI/nTF2H3rxnEM3EgMK+K63WzJ
	Q9Hg==
X-Gm-Message-State: AD7BkJKmwE488sJUPvj0/tfCj4he7jNQVgcUZV8pb/j0WChfLK7rbKwsZ1oo5++LqWWf9A==
X-Received: by 10.28.211.1 with SMTP id k1mr22874513wmg.93.1459924276101;
	Tue, 05 Apr 2016 23:31:16 -0700 (PDT)
Received: from [192.168.10.150] (94-39-141-76.adsl-ull.clienti.tiscali.it.
	[94.39.141.76]) by smtp.googlemail.com with ESMTPSA id
	cf6sm1469186wjc.12.2016.04.05.23.31.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 05 Apr 2016 23:31:14 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
To: "Gonglei (Arei)" <arei.gonglei@huawei.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <1456998223-12356-1-git-send-email-arei.gonglei@huawei.com>
	<33183CC9F5247A488A2544077AF19020B030F344@SZXEMA503-MBS.china.huawei.com>
	<5704ACFB.40408@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <5704AD2E.8050709@redhat.com>
Date: Wed, 6 Apr 2016 08:31:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <5704ACFB.40408@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::244
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH 0/6] fix some coverity complains
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Apr 2016 06:31:21 -0000



On 06/04/2016 08:30, Paolo Bonzini wrote:
> 
> 
> On 06/04/2016 04:12, Gonglei (Arei) wrote:
>> Hi Paolo,
>>
>> Would you pls pick patch 1,3,4,5 to qemu-2.6 ? 
> 
> Gerd, can you pick up the three spice and egl-helpers patches?

Hem, two. :)

Paolo

> I'll take care of the backends/ one.
> 
> Paolo
> 
>> It seems the trivial-branch maintainer didn't notice them. :(
>>
>> Regards,
>> -Gonglei
>>
>>
>>> -----Original Message-----
>>> From: Gonglei (Arei)
>>> Sent: Thursday, March 03, 2016 5:44 PM
>>> To: qemu-devel@nongnu.org
>>> Cc: pbonzini@redhat.com; qemu-trivial@nongnu.org; Gonglei (Arei)
>>> Subject: [PATCH 0/6] fix some coverity complains
>>>
>>>
>>> Gonglei (6):
>>>   egl-helpers: fix possible resource leak
>>>   sheepdog: fix possible resouce leak and out-of-bounds access
>>>   spice: fix coverity complains
>>>   hostmem-file: fix memory leak
>>>   spapr: fix possible Negative array index read
>>>   smbus: fix memory leak
>>>
>>>  backends/hostmem-file.c | 5 ++++-
>>>  block/sheepdog.c        | 9 ++++++---
>>>  hw/i2c/smbus_eeprom.c   | 2 ++
>>>  hw/ppc/spapr.c          | 4 ++++
>>>  ui/egl-helpers.c        | 9 +++------
>>>  ui/spice-display.c      | 4 +---
>>>  6 files changed, 20 insertions(+), 13 deletions(-)
>>>
>>> --
>>> 1.8.5.2
>>>
>>
>>
>>
> 
> 

