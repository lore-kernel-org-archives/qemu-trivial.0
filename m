Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Rq46b-0007mO-Q9
	for mharc-qemu-trivial@gnu.org; Wed, 25 Jan 2012 09:45:45 -0500
Received: from eggs.gnu.org ([140.186.70.92]:46372)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1RpkeQ-0000fw-D2
	for qemu-trivial@nongnu.org; Tue, 24 Jan 2012 12:59:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1RpkeO-0006xH-Ve
	for qemu-trivial@nongnu.org; Tue, 24 Jan 2012 12:59:22 -0500
Received: from mail-iy0-f173.google.com ([209.85.210.173]:44411)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>)
	id 1RpkeO-0006xC-R1; Tue, 24 Jan 2012 12:59:20 -0500
Received: by iahk25 with SMTP id k25so4946069iah.4
	for <multiple recipients>; Tue, 24 Jan 2012 09:59:19 -0800 (PST)
Received: by 10.50.46.166 with SMTP id w6mr3246474igm.6.1327427959860;
	Tue, 24 Jan 2012 09:59:19 -0800 (PST)
Received: from [192.168.0.103] (cpe-70-123-132-139.austin.res.rr.com.
	[70.123.132.139])
	by mx.google.com with ESMTPS id lu10sm30480228igc.0.2012.01.24.09.59.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 24 Jan 2012 09:59:18 -0800 (PST)
Message-ID: <4F1EF171.4030406@codemonkey.ws>
Date: Tue, 24 Jan 2012 11:59:13 -0600
From: Anthony Liguori <anthony@codemonkey.ws>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.23) Gecko/20110922 Lightning/1.0b2 Thunderbird/3.1.15
MIME-Version: 1.0
To: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
References: <1327425457-31313-1-git-send-email-afaerber@suse.de>	<4F1EEA64.2080704@siemens.com>
	<4F1EEC88.8060803@suse.de>
In-Reply-To: <4F1EEC88.8060803@suse.de>
X-Gm-Message-State: ALoCoQk5ixV1UTJQd/TjsDm3pDIVwuA4vhcbaFrVHvDK0teoj9kK3JfB/j7NIPH/j953W712IKoj
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.210.173
X-Mailman-Approved-At: Wed, 25 Jan 2012 09:45:41 -0500
Cc: Kevin Wolf <kwolf@redhat.com>,
	Vasilis Liaskovitis <vasilis.liaskovitis@profitbricks.com>,
	Anthony Liguori <aliguori@us.ibm.com>, Juan Quintela <quintela@redhat.com>,
	"qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	Jan Kiszka <jan.kiszka@siemens.com>, Markus Armbruster <armbru@redhat.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Blue Swirl <blauwirbel@gmail.com>,
	=?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <andreas.faerber@web.de>,
	Amit Shah <amit.shah@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v6] qdev: Add support for
	property type bool
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
X-List-Received-Date: Tue, 24 Jan 2012 17:59:28 -0000

On 01/24/2012 11:38 AM, Andreas Färber wrote:
> Am 24.01.2012 18:29, schrieb Jan Kiszka:
>> On 2012-01-24 18:17, Andreas Färber wrote:
>>> From: Andreas Färber<andreas.faerber@web.de>
>>>
>>> VMState supports the type bool but qdev instead supports bit, backed by
>>> uint32_t. Therefore let's add DEFINE_PROP_BOOL() and qdev_prop_set_bool().
>>>
>>> bool by definition is either true or false. Should the need arise to
>>> parse yes/no, on/off, 1/0 or whatever as well, we can still add that at
>>> a later point in time.
>>
>> To make it a real replacement for PROP_TYPE_BIT, let's use on/off, also
>> for printing. Not only programmers may use this interface. ;)
>
> Actually non-programmers are the reason for this: cache=on/off makes a
> great deal of sense in English (noun), but not enabled=off (adjective),
> which was my use case of this patch for ISA devices.
>
> I'm fine with accepting the whole range of possibilities for parsing.
> For printing I see no reason to, since there's no legacy users of this
> new type we could break. true/false seemed better than yes/no.
>
>>> +PropertyInfo qdev_prop_bool = {
>>> +    .name = "bool",
>>
>> Now we have "bool" and "boolean". Can we rename the latter to bit?
>
> I'd be fine with that, just don't know if that would break anything
> elsewhere for qdev or QOM?

Nothing breaks.  Legacy properties (yes, these are legacy) will stick around 
until we stabilize the QOM public interface.

I think that's probably 2.0 material.

Regards,

Anthony Liguori

>
> Andreas
>


