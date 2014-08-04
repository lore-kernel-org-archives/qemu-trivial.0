Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XEJ1P-0001Yp-7n
	for mharc-qemu-trivial@gnu.org; Mon, 04 Aug 2014 10:13:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50417)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1XEJ1G-0001YF-9T
	for qemu-trivial@nongnu.org; Mon, 04 Aug 2014 10:13:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1XEJ19-0007ij-FL
	for qemu-trivial@nongnu.org; Mon, 04 Aug 2014 10:13:46 -0400
Received: from mail-pd0-x22a.google.com ([2607:f8b0:400e:c02::22a]:57152)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>)
	id 1XEJ19-0007id-73; Mon, 04 Aug 2014 10:13:39 -0400
Received: by mail-pd0-f170.google.com with SMTP id g10so9748316pdj.29
	for <multiple recipients>; Mon, 04 Aug 2014 07:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=M9zxyburPKdmHczzgJLvnWvx3ruxEjy4j5tNqdTIcEs=;
	b=T7wHfk6iJbU2hbYF9f562ZkMitDR2AktpUhpJYwgnejF5508PWcncv1aSLHzOYIarH
	KSknh6XGkaB7vFER2z9m0Hi8fmMzXTWaU5NoZXTv+wLEb8OQamkqEt2M/o3Hacfzvd2A
	xFim/F3bBl3gIyihLNB32UwNnu6tDS4lG29natau5IYUH/NpiZYyMc8zUKO3Q6Z5BT5C
	gVPkIt4xqYoHOfwaTJyNcIRU5x2vCkFu1IJ0gos78HLVuiXL+i8MPnZpS6+L46PPefCD
	zpn85YwkGa3046uTIzGshRnIoibtkZrkW0tcyrxc89pYMf24xCxj+KQXvzB51heFSVMX
	UnMw==
X-Received: by 10.66.141.109 with SMTP id rn13mr3004562pab.117.1407161618045; 
	Mon, 04 Aug 2014 07:13:38 -0700 (PDT)
Received: from [192.168.1.102] ([223.72.65.31])
	by mx.google.com with ESMTPSA id
	v17sm26962533pdj.11.2014.08.04.07.13.36 for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 04 Aug 2014 07:13:37 -0700 (PDT)
Message-ID: <53DF9505.2020809@gmail.com>
Date: Mon, 04 Aug 2014 22:13:25 +0800
From: Chen Gang <gang.chen.5i5j@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130625 Thunderbird/17.0.7
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>
References: <53DE5538.1020701@gmail.com> <53DF3D74.9070503@msgid.tls.msk.ru>
In-Reply-To: <53DF3D74.9070503@msgid.tls.msk.ru>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c02::22a
Cc: qemu-trivial@nongnu.org, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] Cc'ing emails [was: [PATCH] dump.c: Fix memory
 leak issue in cleanup processing for dump_init()]
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
X-List-Received-Date: Mon, 04 Aug 2014 14:13:53 -0000

On 08/04/2014 03:59 PM, Michael Tokarev wrote:
> Please stop Cc'ing me emails sent to, at least, qemu-trivial@.
> 

OK, next, I shall notice about it: "stop Cc to you and to 'qemu-trivial'
(although for me, I still feel my patch is related with 'qemu-trivial').


> I'm about to filter personal emails which are also sent to
> some mailinglists I receive.  I'd not do that, because this is
> a good practice to Cc someone like that for various really
> important or urgent emails, and if I to apply such a filter,
> these urgent emails will be filtered too, obviously.
> 

For me, can use multiple emails, e.g: one for open mailing list, one for
personal, and one for company wide work.

> I'm not sure how people treat these cases or deal with them.
> We are subscribed to, in particular, qemu-devel@, and active
> maintainers look there too, so receive more than one copy of
> many emails.
> 

For me, I guess so (they will receive redundant emails)

> It is becoming worse.  With get_maintainer.pl pulling addresses
> of people who made changes or commits to files by default,
> contributing to the project becomes a bit dangerous.  Because
> as a result, once you fix something, you're essentially being
> subscribed to a spam list, because other contributors start
> Ccing you for the patches with which you have absolutely nothing
> to do, and if a discussion emerges, you can't opt out of it
> anymore (especially for patches which raise hot discussions).
> So I'd rather think twice before contributing anything...
> 

For some members (e.g. me), may use one email for open mailing list, but
use another email for apply patch, so Cc to them will let them notice
about soon.

By the way, in honest, as a gmail member, I almost do not check my email
in open mailing list, but always check personal mail which for sending
patches.


Thanks.
-- 
Chen Gang

Open share and attitude like air water and life which God blessed

