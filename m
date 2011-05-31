Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QRUwD-0004nA-3n
	for mharc-qemu-trivial@gnu.org; Tue, 31 May 2011 15:49:13 -0400
Received: from eggs.gnu.org ([140.186.70.92]:53190)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1QRUw9-0004mG-Fp
	for qemu-trivial@nongnu.org; Tue, 31 May 2011 15:49:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1QRUw7-0007Yw-0I
	for qemu-trivial@nongnu.org; Tue, 31 May 2011 15:49:09 -0400
Received: from mail-yw0-f45.google.com ([209.85.213.45]:41264)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>)
	id 1QRUw6-0007Yf-Ms; Tue, 31 May 2011 15:49:06 -0400
Received: by ywl41 with SMTP id 41so2333737ywl.4
	for <multiple recipients>; Tue, 31 May 2011 12:49:04 -0700 (PDT)
Received: by 10.236.170.66 with SMTP id o42mr5937576yhl.109.1306871344807;
	Tue, 31 May 2011 12:49:04 -0700 (PDT)
Received: from [9.41.78.145] ([32.97.110.64])
	by mx.google.com with ESMTPS id t43sm379361yhm.28.2011.05.31.12.49.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 31 May 2011 12:49:04 -0700 (PDT)
Message-ID: <4DE5462E.80908@codemonkey.ws>
Date: Tue, 31 May 2011 14:49:02 -0500
From: Anthony Liguori <anthony@codemonkey.ws>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: Alexander Graf <agraf@suse.de>
References: <1306705831-59385-1-git-send-email-andreas.faerber@web.de>	<4DE4F16D.6030009@codemonkey.ws>	<4DE4F5E2.5020906@siemens.com>	<4DE4FAA1.7080109@codemonkey.ws>	<4DE5011C.80000@siemens.com>	<98DD53CD-B6E2-4739-A952-0F21019485A4@suse.de>	<4DE50DC5.2060806@codemonkey.ws>
	<35D43777-76C2-415D-83FF-143C4D2EF774@suse.de>
In-Reply-To: <35D43777-76C2-415D-83FF-143C4D2EF774@suse.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.213.45
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	Jan Kiszka <jan.kiszka@siemens.com>, Marcelo Tosatti <mtosatti@redhat.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	=?ISO-8859-1?Q?Andreas_F=E4rber?= <andreas.faerber@web.de>,
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
X-List-Received-Date: Tue, 31 May 2011 19:49:11 -0000

On 05/31/2011 11:16 AM, Alexander Graf wrote:
>
> On 31.05.2011, at 17:48, Anthony Liguori wrote:
>
>> On 05/31/2011 10:44 AM, Alexander Graf wrote:
>>>
>>> On 31.05.2011, at 16:54, Jan Kiszka wrote:
>>>
>>>> On 2011-05-31 16:26, Anthony Liguori wrote:
>>>>> On 05/31/2011 09:06 AM, Jan Kiszka wrote:
>>>>>> On 2011-05-31 15:47, Anthony Liguori wrote:
>>>>>>> On 05/29/2011 04:50 PM, Andreas Färber wrote:
>>>>>>>> BeOS and Haiku don't define SIGIO. When undefined, it won't arrive
>>>>>>>> and doesn't need to be blocked.
>>>>>>>>
>>>>>>>> Signed-off-by: Andreas Färber<andreas.faerber@web.de>
>>>>>>>
>>>>>>> Anything to do with signal masks is never a trivial patch BTW...
>>>>>>>
>>>>>>> But I actually think explicit handling of SIGIO is unneeded.  I think
>>>>>>> this is a hold over from the pre-I/O thread days where we selectively
>>>>>>> set SIGIO on certain file descriptors to make sure that when an IO fd
>>>>>>> became readable, we received a signal to break out of the KVM emulation
>>>>>>> loop.
>>>>>>>
>>>>>>> Can the folks on CC confirm/deny?
>>>>>>>
>>>>>>> I can't see any use of SIGIO in the current source tree.
>>>>>>
>>>>>> At least qemu-timer.c uses SIGIO in HPET mode. That only applies to
>>>>>> Linux hosts, though.
>>>>>
>>>>> Is there any reason we still carry multiple timer implementations these
>>>>> days?
>>>>>
>>>>> HPET shouldn't be any better than dynticks.
>>>>
>>>> On any recent kernel, for sure. BTW, the same applies to the RTC timer.
>>>
>>> So the obvious change would be to introduce CONFIG_HPET, ifdef the SIGIO handling on that and also ifdef the host hpet handling code on it? That way it's documented well and can preferably even be turned off with --disable-host-hpet during configure time, which we can then slowly turn to the default.
>>
>> Or just remove hpet and rtc.
>>
>> Does anyone really object to that?
>
> Do RHEL5 and SLES10 support dynticks? If yes, no objections. They're the oldest really supported distros we should possibly remotely even care about.

Yes, they do.  But it's not as accurate as RTC/HPET because there is no 
CONFIG_HRTIMERS.

But the problem with RTC/HPET is that there is only one /dev/rtc and one 
/dev/hpet so only one guest can use it at any given time.  It's really 
not a generally useful solution.

At one point in time, it was the only way to get a high res clock.  Now, 
it Just Works provided you don't have an ancient kernel.

Regards,

Anthony Liguori

