Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1angz1-0006pG-PX
	for mharc-qemu-trivial@gnu.org; Wed, 06 Apr 2016 02:30:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40373)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1angz0-0006o6-3m
	for qemu-trivial@nongnu.org; Wed, 06 Apr 2016 02:30:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1angyv-00071s-Fq
	for qemu-trivial@nongnu.org; Wed, 06 Apr 2016 02:30:30 -0400
Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241]:33734)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1angyv-00071k-8q; Wed, 06 Apr 2016 02:30:25 -0400
Received: by mail-wm0-x241.google.com with SMTP id i204so10235792wmd.0;
	Tue, 05 Apr 2016 23:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=aDm8qKaXU1gYqJ5vYUSPrnDOTnwSeQak98klzqWbMyU=;
	b=G5KLH9nfbr+R7K6psFZDAVoQrx1HO7fGLvgGqVSTWZ8OC7P5Dyw4IHpvyS6oLSUVpA
	iUrIVVelVNAcgV62TNgbQ+3HpsGMFZxROeKLq73LvqmsOWW/tCkgGEbkGr3N9II0nhD5
	Ig9odsNcaIxzBc82Wysn0vY/TuqMZwsN6rqJTX0BJxOjNVozNg7FhydIfEeFC0GjJ464
	3Rv/gVbJwts3BDaMrjpJt/95Ffu6CjeTt1DbTHdQF67c1FdDnGN4mzy99Z7IMUYrYqki
	Q9Nz805ZD50nok6YVcRYrgzb0sKYYwwQ9UsTLSU/TB7/7Zh0eUhaMBA4p1VO09tai1Zv
	4JtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=aDm8qKaXU1gYqJ5vYUSPrnDOTnwSeQak98klzqWbMyU=;
	b=i4+Tt/w+iaT2FLqCo4eJqexWaTqsYuWrsa5gsKVk66bg1AWjwpkwwsm5gwRpzZdTeG
	0Ti4U5tFgNvtgbeS+eDJvE9N+RdCrUNjMXo9bmPIHRW7nyTwE0Yef8a1ZMYbRbVxir6Q
	ORU9HQp0TKHH00Bs1seMDkHJRefqrUOKKiURU9x4RjBMWkbq3EGnxbN3dnhTGm41whyR
	GQOi4ET0yIo1w/5pkun5uE74Zfeuqph+VtaU+WkLxXFBZUFb6t1YrsEpHXnPYuzOOeng
	TTPBaBKzX6pKDpxxBWNOCiR5OGbvzR77BuSCFWVioLAarFE0DhlgANpocdf8m/zi9Arh
	oc+Q==
X-Gm-Message-State: AD7BkJKlFBZRF0uObECVPEcelxcZrZyaoq9VAktsVhb75q7K1eDKDI3M2MzdZF/u7dFWXQ==
X-Received: by 10.194.2.225 with SMTP id 1mr13365024wjx.29.1459924224550;
	Tue, 05 Apr 2016 23:30:24 -0700 (PDT)
Received: from [192.168.10.150] (94-39-141-76.adsl-ull.clienti.tiscali.it.
	[94.39.141.76]) by smtp.googlemail.com with ESMTPSA id
	c144sm23115811wmd.0.2016.04.05.23.30.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 05 Apr 2016 23:30:23 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
To: "Gonglei (Arei)" <arei.gonglei@huawei.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <1456998223-12356-1-git-send-email-arei.gonglei@huawei.com>
	<33183CC9F5247A488A2544077AF19020B030F344@SZXEMA503-MBS.china.huawei.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <5704ACFB.40408@redhat.com>
Date: Wed, 6 Apr 2016 08:30:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <33183CC9F5247A488A2544077AF19020B030F344@SZXEMA503-MBS.china.huawei.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::241
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
X-List-Received-Date: Wed, 06 Apr 2016 06:30:31 -0000



On 06/04/2016 04:12, Gonglei (Arei) wrote:
> Hi Paolo,
> 
> Would you pls pick patch 1,3,4,5 to qemu-2.6 ? 

Gerd, can you pick up the three spice and egl-helpers patches?

I'll take care of the backends/ one.

Paolo

> It seems the trivial-branch maintainer didn't notice them. :(
> 
> Regards,
> -Gonglei
> 
> 
>> -----Original Message-----
>> From: Gonglei (Arei)
>> Sent: Thursday, March 03, 2016 5:44 PM
>> To: qemu-devel@nongnu.org
>> Cc: pbonzini@redhat.com; qemu-trivial@nongnu.org; Gonglei (Arei)
>> Subject: [PATCH 0/6] fix some coverity complains
>>
>>
>> Gonglei (6):
>>   egl-helpers: fix possible resource leak
>>   sheepdog: fix possible resouce leak and out-of-bounds access
>>   spice: fix coverity complains
>>   hostmem-file: fix memory leak
>>   spapr: fix possible Negative array index read
>>   smbus: fix memory leak
>>
>>  backends/hostmem-file.c | 5 ++++-
>>  block/sheepdog.c        | 9 ++++++---
>>  hw/i2c/smbus_eeprom.c   | 2 ++
>>  hw/ppc/spapr.c          | 4 ++++
>>  ui/egl-helpers.c        | 9 +++------
>>  ui/spice-display.c      | 4 +---
>>  6 files changed, 20 insertions(+), 13 deletions(-)
>>
>> --
>> 1.8.5.2
>>
> 
> 
> 

