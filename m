Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XI37w-00023A-7O
	for mharc-qemu-trivial@gnu.org; Thu, 14 Aug 2014 18:04:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46042)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1XI37l-0001rC-U0
	for qemu-trivial@nongnu.org; Thu, 14 Aug 2014 18:04:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1XI37c-0002ia-G1
	for qemu-trivial@nongnu.org; Thu, 14 Aug 2014 18:03:57 -0400
Received: from mail-pd0-x22c.google.com ([2607:f8b0:400e:c02::22c]:43076)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>)
	id 1XI37J-0002ZU-Vo; Thu, 14 Aug 2014 18:03:30 -0400
Received: by mail-pd0-f172.google.com with SMTP id y13so2289595pdi.17
	for <multiple recipients>; Thu, 14 Aug 2014 15:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=UO/f0uzQH9HgUhZsAu0vxixrJkV0rFYwsiUOZAVKd9Y=;
	b=k6DJ8ko3xdoRlaoYFYXxsXUsxOHzUkhpvy45UvIka5HgcsFIZedJoud5l053eifX4/
	lSmfiEl2Tq5ZvhGX/kdx3sWUIVDJIEjH1btTbAtUJf2VAbFITYKdAXu7pcN56j0O9Glo
	9pzGPbhsut/vFu2cIcXYWuJF4kqXnrNrKje6F0J8iMgt7d/PzEUui0nWWYELvy31G+PS
	+xlI4qPAjD4hAp5iQGnRL6wTz9ZmRSAfcrfJU1o/JOOIo4901c12OSdY7hTaqGkXUQmU
	fsq1gZ2rJHTutMquH3z2kGNOpZnwfNJDbDhhcCcHidgJF2GiuBl0u9HtVN49gsxD72DI
	dqpw==
X-Received: by 10.68.111.193 with SMTP id ik1mr7136375pbb.145.1408053808114;
	Thu, 14 Aug 2014 15:03:28 -0700 (PDT)
Received: from [192.168.1.102] ([223.72.65.32])
	by mx.google.com with ESMTPSA id xq3sm21280029pab.0.2014.08.14.15.03.25
	for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Thu, 14 Aug 2014 15:03:27 -0700 (PDT)
Message-ID: <53ED3224.70801@gmail.com>
Date: Fri, 15 Aug 2014 06:03:16 +0800
From: Chen Gang <gang.chen.5i5j@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130625 Thunderbird/17.0.7
MIME-Version: 1.0
To: Luiz Capitulino <lcapitulino@redhat.com>
References: <53DE5538.1020701@gmail.com> <20140814164945.2a0290fb@redhat.com>
In-Reply-To: <20140814164945.2a0290fb@redhat.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c02::22c
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>, agraf@suse.de,
	qemu-devel@nongnu.org, qiaonuohan@cn.fujitsu.com,
	pbonzini@redhat.com, lersek@redhat.com
Subject: Re: [Qemu-trivial] [PATCH] dump.c: Fix memory leak issue in cleanup
 processing for dump_init()
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
X-List-Received-Date: Thu, 14 Aug 2014 22:04:07 -0000

On 08/15/2014 04:49 AM, Luiz Capitulino wrote:
> On Sun, 03 Aug 2014 23:28:56 +0800
> Chen Gang <gang.chen.5i5j@gmail.com> wrote:
> 
>> > In dump_init(), when failure occurs, need notice about 'fd' and memory
>> > mapping. So call dump_cleanup() for it (need let all initializations at
>> > front).
>> > 
>> > Also simplify dump_cleanup(): remove redundant 'ret' and redundant 'fd'
>> > checking.
>> > 
>> > Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
> Applied to the qmp branch, thanks.
> 

Thanks.

> PS: I still find it hard to track the file-descriptor's life time. IMO,
>     the best would be to always release it where it's allocated which is
>     qmp_dump_guest_memory().
> 

If it is really hard to track, for me, I prefer to let dump_cleanup()
common enough, so can simplify every members thinking.

When use genric *_cleanup(), it means the resource manage management is
a little complex, need use a generic cleanup function for it to be sure
that every thing is not missed, and always save enough.


Thanks.
-- 
Chen Gang

Open share and attitude like air water and life which God blessed

