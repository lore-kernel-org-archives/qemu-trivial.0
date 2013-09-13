Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VKSYK-00037T-64
	for mharc-qemu-trivial@gnu.org; Fri, 13 Sep 2013 08:32:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52087)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1VKSYD-00033L-UG
	for qemu-trivial@nongnu.org; Fri, 13 Sep 2013 08:32:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1VKSY4-0006mI-Vw
	for qemu-trivial@nongnu.org; Fri, 13 Sep 2013 08:32:41 -0400
Received: from mail-ob0-f173.google.com ([209.85.214.173]:61054)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1VKSY4-0006m7-Qz
	for qemu-trivial@nongnu.org; Fri, 13 Sep 2013 08:32:32 -0400
Received: by mail-ob0-f173.google.com with SMTP id vb8so1017995obc.32
	for <qemu-trivial@nongnu.org>; Fri, 13 Sep 2013 05:32:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=LN5IPFlOujWQByBl29fWRBy/x8qlJpSljTLlEioFC5o=;
	b=A08edgc2+RIEzc0D50HhLQI9GjiXBDX/YsOS0NPQa/R2WikaKddYw5L1wXG7+SxyWC
	7pMy1C0D0Bd+fbqfJDJo0I7BxrfghGZgpQcN8ptqxjhxxR0qOjDxCzNgi9qVM3cZbJY5
	69eiK6seRtidFnwWV/9fcmKH6A/e6LW6pjHBoO624GcDRAgVmgc8fOZi6ZhVBKsEzq2V
	CqKXSRoM6UBRbseEdDiqJkEbjfPysxnrTKUbifKl6ZWgzGKfDMGlrvXYdvEoiF+VHYJB
	TCiAciASREsHZAD2wQYyDHvor60Em2j9AIiV+KhS1t+08U8kgvUwCwSRqLyLm1oelXyj
	cxZg==
X-Gm-Message-State: ALoCoQnqXnnOQ8QbYJX5Dfocp5QK7auz+tpJYNEnRjesNfgGv5a0/d/LLM1SXWvkQyA3tni0WA8l
MIME-Version: 1.0
X-Received: by 10.60.50.135 with SMTP id c7mr11856765oeo.41.1379075552203;
	Fri, 13 Sep 2013 05:32:32 -0700 (PDT)
Received: by 10.60.54.104 with HTTP; Fri, 13 Sep 2013 05:32:32 -0700 (PDT)
In-Reply-To: <5232AB6D.7020609@weilnetz.de>
References: <5232A934.90701@redhat.com>
	<5232AB6D.7020609@weilnetz.de>
Date: Fri, 13 Sep 2013 07:32:32 -0500
Message-ID: <CA+aC4kt4uGZoxBUGk=VZiHvT1T=7NMZm1yU7OQhaLogjt9Vaog@mail.gmail.com>
From: Anthony Liguori <anthony@codemonkey.ws>
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset=ISO-8859-1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.214.173
Cc: qemu-trivial@nongnu.org, Michal Privoznik <mprivozn@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] Wiki vandalism
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
X-List-Received-Date: Fri, 13 Sep 2013 12:32:46 -0000

On Fri, Sep 13, 2013 at 1:06 AM, Stefan Weil <sw@weilnetz.de> wrote:
> Am 13.09.2013 07:57, schrieb Michal Privoznik:
>> So I've just got another trivial patch ACKed. Yay! So I wanted to check
>> it out in the next-trivial branch. Therefore I went on the qemu-trivial
>> wiki and found two things:
>>
>> 1) Plenty of wiki vandalism (tracked down to user Jennypear [2]), e.g.
>> appending ads in URL form to several pages [2]
>>
>> 2) The url for trivial patches repo is outdated.
>>
>> Michal
>>
>> 1: http://wiki.qemu.org/Special:Contributions/Jennypear
>>
>> 2:
>> http://wiki.qemu.org/index.php?title=Google_Summer_of_Code_2011&diff=prev&oldid=1694
>>
>
> Thanks for reporting.
>
> Anthony, please disable that user account. I started fixing the
> vandalized pages.

Done.  Thanks for reporting!

Regards,

Anthony Liguori

>

