Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QRWET-0007U8-WD
	for mharc-qemu-trivial@gnu.org; Tue, 31 May 2011 17:12:10 -0400
Received: from eggs.gnu.org ([140.186.70.92]:60778)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andreas.faerber@web.de>) id 1QRWER-0007TO-8k
	for qemu-trivial@nongnu.org; Tue, 31 May 2011 17:12:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andreas.faerber@web.de>) id 1QRWEQ-0006ce-1u
	for qemu-trivial@nongnu.org; Tue, 31 May 2011 17:12:07 -0400
Received: from fmmailgate01.web.de ([217.72.192.221]:60374)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andreas.faerber@web.de>)
	id 1QRWEL-0006c2-5K; Tue, 31 May 2011 17:12:02 -0400
Received: from smtp04.web.de  ( [172.20.0.225])
	by fmmailgate01.web.de (Postfix) with ESMTP id 9123618FEB7AF;
	Tue, 31 May 2011 23:11:57 +0200 (CEST)
Received: from [87.173.113.150] (helo=[10.0.1.1])
	by smtp04.web.de with asmtp (TLSv1:AES128-SHA:128) (WEB.DE 4.110 #2)
	id 1QRWEH-00021F-00; Tue, 31 May 2011 23:11:57 +0200
Message-Id: <DBD1BECA-1726-455B-8A11-E9E8D6C79389@web.de>
From: =?ISO-8859-1?Q?Andreas_F=E4rber?= <andreas.faerber@web.de>
To: Anthony Liguori <anthony@codemonkey.ws>
In-Reply-To: <4DE5462E.80908@codemonkey.ws>
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0 (Apple Message framework v936)
Date: Tue, 31 May 2011 23:11:55 +0200
References: <1306705831-59385-1-git-send-email-andreas.faerber@web.de>	<4DE4F16D.6030009@codemonkey.ws>	<4DE4F5E2.5020906@siemens.com>	<4DE4FAA1.7080109@codemonkey.ws>	<4DE5011C.80000@siemens.com>	<98DD53CD-B6E2-4739-A952-0F21019485A4@suse.de>	<4DE50DC5.2060806@codemonkey.ws>
	<35D43777-76C2-415D-83FF-143C4D2EF774@suse.de>
	<4DE5462E.80908@codemonkey.ws>
X-Mailer: Apple Mail (2.936)
Sender: andreas.faerber@web.de
X-Sender: Andreas.Faerber@web.de
X-Provags-ID: V01U2FsdGVkX1/D9N98koSeL8sfUC048qjlsKor2uS4l9s1tUpP
	289q/5RaN8LbzUwutpir5ck3koWMR8bjmnhkCfeSp+Md0c0P7+
	meJkjimKjs5x/XV2hwNw==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 217.72.192.221
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	Jan Kiszka <jan.kiszka@siemens.com>, Marcelo Tosatti <mtosatti@redhat.com>,
	Alexander Graf <agraf@suse.de>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Avi Kivity <avi@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Use SIGIO with caution
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
X-List-Received-Date: Tue, 31 May 2011 21:12:08 -0000

Am 31.05.2011 um 21:49 schrieb Anthony Liguori:

> On 05/31/2011 11:16 AM, Alexander Graf wrote:
>>
>> On 31.05.2011, at 17:48, Anthony Liguori wrote:
>>
>>> On 05/31/2011 10:44 AM, Alexander Graf wrote:
>>>>
>>>> On 31.05.2011, at 16:54, Jan Kiszka wrote:
>>>>
>>>>> On 2011-05-31 16:26, Anthony Liguori wrote:
>>>>>> Is there any reason we still carry multiple timer  
>>>>>> implementations these
>>>>>> days?
>>>>>>
>>>>>> HPET shouldn't be any better than dynticks.
>>>>>
>>>>> On any recent kernel, for sure. BTW, the same applies to the RTC  
>>>>> timer.
>>>>
>>>> So the obvious change would be to introduce CONFIG_HPET, ifdef  
>>>> the SIGIO handling on that and also ifdef the host hpet handling  
>>>> code on it? That way it's documented well and can preferably even  
>>>> be turned off with --disable-host-hpet during configure time,  
>>>> which we can then slowly turn to the default.
>>>
>>> Or just remove hpet and rtc.
>>>
>>> Does anyone really object to that?

--verbose please: We're not talking about "removal" of emulation of  
such acronyms for i386 guests, but about ceasing to use some Linux- 
only host facilities, right?

>> Do RHEL5 and SLES10 support dynticks? If yes, no objections.  
>> They're the oldest really supported distros we should possibly  
>> remotely even care about.
>
> Yes, they do.  But it's not as accurate as RTC/HPET because there is  
> no CONFIG_HRTIMERS.
>
> But the problem with RTC/HPET is that there is only one /dev/rtc and  
> one /dev/hpet so only one guest can use it at any given time.  It's  
> really not a generally useful solution.
>
> At one point in time, it was the only way to get a high res clock.   
> Now, it Just Works provided you don't have an ancient kernel.

I'm curious, what's ancient these days? 2.6.29 or more like 2.4.x?

Andreas

