Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QRPuE-00053I-Ag
	for mharc-qemu-trivial@gnu.org; Tue, 31 May 2011 10:26:50 -0400
Received: from eggs.gnu.org ([140.186.70.92]:42315)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1QRPuB-000538-Sy
	for qemu-trivial@nongnu.org; Tue, 31 May 2011 10:26:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1QRPu7-0003f5-Ub
	for qemu-trivial@nongnu.org; Tue, 31 May 2011 10:26:47 -0400
Received: from mail-yx0-f173.google.com ([209.85.213.173]:44117)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>)
	id 1QRPu7-0003ex-SG; Tue, 31 May 2011 10:26:43 -0400
Received: by yxk8 with SMTP id 8so2146281yxk.4
	for <multiple recipients>; Tue, 31 May 2011 07:26:43 -0700 (PDT)
Received: by 10.100.104.1 with SMTP id b1mr3608029anc.163.1306852003104;
	Tue, 31 May 2011 07:26:43 -0700 (PDT)
Received: from [192.168.0.107] (cpe-70-123-132-139.austin.res.rr.com
	[70.123.132.139])
	by mx.google.com with ESMTPS id 10sm69230anw.23.2011.05.31.07.26.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 31 May 2011 07:26:42 -0700 (PDT)
Message-ID: <4DE4FAA1.7080109@codemonkey.ws>
Date: Tue, 31 May 2011 09:26:41 -0500
From: Anthony Liguori <anthony@codemonkey.ws>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: Jan Kiszka <jan.kiszka@siemens.com>
References: <1306705831-59385-1-git-send-email-andreas.faerber@web.de>	<4DE4F16D.6030009@codemonkey.ws>
	<4DE4F5E2.5020906@siemens.com>
In-Reply-To: <4DE4F5E2.5020906@siemens.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.213.173
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	=?UTF-8?B?QW5kcmU=?= =?UTF-8?B?YXMgRsOkcmJlcg==?= <andreas.faerber@web.de>,
	Marcelo Tosatti <mtosatti@redhat.com>,
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
X-List-Received-Date: Tue, 31 May 2011 14:26:48 -0000

On 05/31/2011 09:06 AM, Jan Kiszka wrote:
> On 2011-05-31 15:47, Anthony Liguori wrote:
>> On 05/29/2011 04:50 PM, Andreas Färber wrote:
>>> BeOS and Haiku don't define SIGIO. When undefined, it won't arrive
>>> and doesn't need to be blocked.
>>>
>>> Signed-off-by: Andreas Färber<andreas.faerber@web.de>
>>
>> Anything to do with signal masks is never a trivial patch BTW...
>>
>> But I actually think explicit handling of SIGIO is unneeded.  I think
>> this is a hold over from the pre-I/O thread days where we selectively
>> set SIGIO on certain file descriptors to make sure that when an IO fd
>> became readable, we received a signal to break out of the KVM emulation
>> loop.
>>
>> Can the folks on CC confirm/deny?
>>
>> I can't see any use of SIGIO in the current source tree.
>
> At least qemu-timer.c uses SIGIO in HPET mode. That only applies to
> Linux hosts, though.

Is there any reason we still carry multiple timer implementations these 
days?

HPET shouldn't be any better than dynticks.

Regards,

Anthony Liguori

>
> Jan
>


