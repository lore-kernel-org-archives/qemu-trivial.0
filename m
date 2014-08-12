Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XHKQj-0002jr-AT
	for mharc-qemu-trivial@gnu.org; Tue, 12 Aug 2014 18:20:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38414)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1XHKQY-0002dy-Sc
	for qemu-trivial@nongnu.org; Tue, 12 Aug 2014 18:20:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1XHKQP-0006hp-Qu
	for qemu-trivial@nongnu.org; Tue, 12 Aug 2014 18:20:22 -0400
Received: from mail-pd0-x22b.google.com ([2607:f8b0:400e:c02::22b]:47084)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>)
	id 1XHKQ7-0006N0-9t; Tue, 12 Aug 2014 18:19:55 -0400
Received: by mail-pd0-f171.google.com with SMTP id z10so13369337pdj.30
	for <multiple recipients>; Tue, 12 Aug 2014 15:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=dS79J469s12JCiyG4pFdJgxZpljKe0c44uXt+U5rWac=;
	b=dX3638Nc36bnluZjsodVoV333j20+YR3/HWXZniM3T8hG/So36EedZECIm0trcjU0x
	HcCx0zPIeAezYCA756zukgEb5EMcSzymJlbZ9GmmpA8tlGiFpENsgd7IdOMjaT550xpp
	CzkJiaRdljlH5H+RsfxbKYE6QudSX8WHbKVw9uTtplWbp8gPieNXtmXtRK5oj197ORAD
	LAPAWrc/Vv31CCgxnvdl69cmOzgdYI4wl36QtdnyJ+khjpoB3vek1dARMeVNvrbiPfir
	Ij52FD2IW/1D1ux/TG0jJ86Bo4ihsMjyXaXZZ47sJtXrwxcq/eXLRABYu05wz8wKBXP0
	ev1A==
X-Received: by 10.68.202.199 with SMTP id kk7mr378194pbc.119.1407881992996;
	Tue, 12 Aug 2014 15:19:52 -0700 (PDT)
Received: from [192.168.1.102] ([223.72.65.20])
	by mx.google.com with ESMTPSA id uw4sm40075pab.40.2014.08.12.15.19.49
	for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Tue, 12 Aug 2014 15:19:52 -0700 (PDT)
Message-ID: <53EA92FC.6000305@gmail.com>
Date: Wed, 13 Aug 2014 06:19:40 +0800
From: Chen Gang <gang.chen.5i5j@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130625 Thunderbird/17.0.7
MIME-Version: 1.0
To: Laszlo Ersek <lersek@redhat.com>
References: <53DE5538.1020701@gmail.com> <53EA3604.5020402@redhat.com>
In-Reply-To: <53EA3604.5020402@redhat.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c02::22b
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel@nongnu.org, agraf@suse.de, qiaonuohan@cn.fujitsu.com,
	pbonzini@redhat.com, lcapitulino@redhat.com
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
X-List-Received-Date: Tue, 12 Aug 2014 22:20:32 -0000

On 08/12/2014 11:43 PM, Laszlo Ersek wrote:
> On 08/03/14 17:28, Chen Gang wrote:
>> In dump_init(), when failure occurs, need notice about 'fd' and memory
>> mapping. So call dump_cleanup() for it (need let all initializations at
>> front).
>>
>> Also simplify dump_cleanup(): remove redundant 'ret' and redundant 'fd'
>> checking.
>>
>> Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
>> ---
>>
[...]
> 
> The patch is not trivial at all, because the lifecycles of the affected
> resources are not trivial.
> 

OK, thanks.

For me, next, I shall split it into 2 pieces, one for resource leak, and
the other for improving current code, which may let reviewers easier
(maybe 2 patches belong to 2 different maintainers).

> The commit message is an abomination. If you want to contribute to open
> source, please learn proper English, and make a *serious* effort to
> document your changes. Don't expect earlier contributors to have any
> working knowledge about a file they have *maybe* touched several months
> ago. People have to swap out a whole load of crap from their minds, and
> swap in the old crap, to understand your patch. Help them by writing
> good commit messages.
> 

OK, thanks, And I am just trying to be improving.

 - always communicate with open source (qemu/kvm/kernel/binutils/gcc) in
   English (it must be).

 - I read/listen to Holy Bible in English every day: morning and evening
   in subway (I spend 2 hours from home to office, so 4 hours total),
   so at least, I spend about 1-1.5 hours for reading/listening per day.

> That said, no matter how annoying this submission is, my conscience
> didn't allow me to let it go ignored, so I spent the time and made an
> effort to track the lifetimes of "s->fd" and "s->list" in, and around,
> dump_init().
> 

OK, thanks, next, you can notify me for it, and I shall try to give some
related test (or we can test together for it), although it is not quite
easy for me.

> The patch seems correct. That's your only excuse for the loss of gray
> matter I've suffered while parsing your commit message.
> 
> Reviewed-by: Laszlo Ersek <lersek@redhat.com>
> 

OK, thank you very much.


Thanks.
-- 
Chen Gang

Open share and attitude like air water and life which God blessed

