Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Rql80-0001uq-F2
	for mharc-qemu-trivial@gnu.org; Fri, 27 Jan 2012 07:42:04 -0500
Received: from eggs.gnu.org ([140.186.70.92]:52500)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1Rql7v-0001tg-58
	for qemu-trivial@nongnu.org; Fri, 27 Jan 2012 07:42:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1Rql7q-0005tA-PL
	for qemu-trivial@nongnu.org; Fri, 27 Jan 2012 07:41:59 -0500
Received: from mail-gy0-f173.google.com ([209.85.160.173]:34161)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>)
	id 1Rql7q-0005t3-Me; Fri, 27 Jan 2012 07:41:54 -0500
Received: by ghrr20 with SMTP id r20so187645ghr.4
	for <multiple recipients>; Fri, 27 Jan 2012 04:41:53 -0800 (PST)
Received: by 10.236.193.70 with SMTP id j46mr9755075yhn.108.1327668113830;
	Fri, 27 Jan 2012 04:41:53 -0800 (PST)
Received: from [192.168.0.103] (cpe-70-123-132-139.austin.res.rr.com.
	[70.123.132.139])
	by mx.google.com with ESMTPS id k15sm13164995yhf.11.2012.01.27.04.41.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 27 Jan 2012 04:41:52 -0800 (PST)
Message-ID: <4F229B8E.6000908@codemonkey.ws>
Date: Fri, 27 Jan 2012 06:41:50 -0600
From: Anthony Liguori <anthony@codemonkey.ws>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.23) Gecko/20110922 Lightning/1.0b2 Thunderbird/3.1.15
MIME-Version: 1.0
To: =?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>
References: <1327425457-31313-1-git-send-email-afaerber@suse.de>	<20120127062355.GA20307@stefanha-thinkpad.localdomain>
	<4F2270A3.4060707@suse.de>
In-Reply-To: <4F2270A3.4060707@suse.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.160.173
Cc: Kevin Wolf <kwolf@redhat.com>, Blue Swirl <blauwirbel@gmail.com>,
	Anthony Liguori <aliguori@us.ibm.com>,
	Juan Quintela <quintela@redhat.com>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	Vasilis Liaskovitis <vasilis.liaskovitis@profitbricks.com>,
	Jan Kiszka <jan.kiszka@siemens.com>, Amit Shah <amit.shah@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>
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
X-List-Received-Date: Fri, 27 Jan 2012 12:42:03 -0000

On 01/27/2012 03:38 AM, Andreas Färber wrote:
> Am 27.01.2012 07:23, schrieb Stefan Hajnoczi:
>> On Tue, Jan 24, 2012 at 06:17:36PM +0100, Andreas Färber wrote:
>>> From: Andreas Färber<andreas.faerber@web.de>
>>>
>>> VMState supports the type bool but qdev instead supports bit, backed by
>>> uint32_t. Therefore let's add DEFINE_PROP_BOOL() and qdev_prop_set_bool().
>>>
>>> bool by definition is either true or false. Should the need arise to
>>> parse yes/no, on/off, 1/0 or whatever as well, we can still add that at
>>> a later point in time.
>>>
>>> Signed-off-by: Andreas Färber<andreas.faerber@web.de>
>>> Cc: Juan Quintela<quintela@redhat.com>
>>> Cc: Markus Armbruster<armbru@redhat.com>
>>> Cc: Jan Kiszka<jan.kiszka@siemens.com>
>>> Cc: Vasilis Liaskovitis<vasilis.liaskovitis@profitbricks.com>
>>> ---
>>>   v5 ->  v6:
>>
>> Please merge through a qemu.git committer.  v6 and discussion means this
>> isn't trivial.
>
> Unfortunately that hasn't happened for half a year though. Generally no
> qemu.git committer seems to care about cherry-picking useful
> infrastructures from bigger series even once discussions are resolved.

So... why are we introducing a type that's not being used anywhere?

Are you planning to use this type somewhere or is this purely speculative?

Regards,

Anthony Liguori

>
> And for the record, it's net v3 as shown in the part you snipped.
>
> Vasilis, unless Jan or someone has further nitpicks, just prepend my v8
> to your series and reuse its DEFINE_PROP_BOOL().
>
> Andreas
>


