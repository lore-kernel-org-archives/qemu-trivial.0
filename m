Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XEWZS-0007qx-8c
	for mharc-qemu-trivial@gnu.org; Tue, 05 Aug 2014 00:41:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48854)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1XEWZL-0007qW-5T
	for qemu-trivial@nongnu.org; Tue, 05 Aug 2014 00:41:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1XEWZF-0005Ty-Ua
	for qemu-trivial@nongnu.org; Tue, 05 Aug 2014 00:41:51 -0400
Received: from mail-pa0-x233.google.com ([2607:f8b0:400e:c03::233]:47881)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>)
	id 1XEWZF-0005To-Mc; Tue, 05 Aug 2014 00:41:45 -0400
Received: by mail-pa0-f51.google.com with SMTP id ey11so626222pad.38
	for <multiple recipients>; Mon, 04 Aug 2014 21:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=0R+RxBBAa3MiLcC9U0IDL/MQVyA9mWP3VCCi2tThgyc=;
	b=noD9gXdC4miIMX5HZzS1EO8D6Ia37sTQCdGmwkk3CpDYDsdSpX95UJZ5k0l4t6/3V2
	D7GCyDs9M3Z7ldBXQ8kz4bM1YLvnlPOi8/pwCQT21+WdtTCe/kqlaJDsBt8Ev8J0fFl+
	KHw+sS3VtkWRAgf+r3TU9fdtsg/zTXfymrEDLXqoKO1aUePcT1/6ALA1gx0BVdPaW1mK
	ccnJ5ldfPwzVczpPlLVjESYd5t0wpB83NWuBrDkGc39YYePamLEThefk/xQ+3BB385yv
	V95EDDAsXPVEEL/42A6gT7B6ruKEAHv8ZhaWr+jPrVEXWytwtF8Y48Ht5qPjKxd/H8M6
	rM7A==
X-Received: by 10.68.113.165 with SMTP id iz5mr1244245pbb.105.1407213704425;
	Mon, 04 Aug 2014 21:41:44 -0700 (PDT)
Received: from [192.168.1.23] ([124.127.118.42])
	by mx.google.com with ESMTPSA id ni5sm831582pdb.35.2014.08.04.21.41.42
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 04 Aug 2014 21:41:43 -0700 (PDT)
Message-ID: <53E06083.7080909@gmail.com>
Date: Tue, 05 Aug 2014 12:41:39 +0800
From: Chen Gang <gang.chen.5i5j@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>, 
 Michael Tokarev <mjt@tls.msk.ru>
References: <53DE5538.1020701@gmail.com> <53DF3D74.9070503@msgid.tls.msk.ru>
	<87d2cguupa.fsf@blackfin.pond.sub.org>
In-Reply-To: <87d2cguupa.fsf@blackfin.pond.sub.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c03::233
Cc: qemu-trivial@nongnu.org, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] Cc'ing emails [
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
X-List-Received-Date: Tue, 05 Aug 2014 04:41:56 -0000


Every members have their own tastes, and one working flow may be not
suitable for all members. I can understand, and hope other members
understand too.

At least for me, next, I shall send patch to the members which I can get
from 'get_maintainers.pl' and only Cc to qemu-devel. And shall skip
qemu-trivial and Michael Tokarev.

If any member feels my patch may related with qemu-trivial, please add
it in replying mailing list during reply, and mark Cc to qemu-trivial.

Welcome any other members' ideas, suggestions or completions.

Thanks.

On 08/04/2014 11:43 PM, Markus Armbruster wrote:
> Michael Tokarev <mjt@tls.msk.ru> writes:
> 
>> Please stop Cc'ing me emails sent to, at least, qemu-trivial@.
> 
> I'll try to remember, but in general you can't expect everyone to keep
> tabs on who wants and who doesn't want to be copied.
> 
>> I'm about to filter personal emails which are also sent to
>> some mailinglists I receive.  I'd not do that, because this is
>> a good practice to Cc someone like that for various really
>> important or urgent emails, and if I to apply such a filter,
>> these urgent emails will be filtered too, obviously.
>>
>> I'm not sure how people treat these cases or deal with them.
>> We are subscribed to, in particular, qemu-devel@, and active
>> maintainers look there too, so receive more than one copy of
>> many emails.
> 
> I believe fighting the established convention to copy is futile.  I
> embrace it instead, and make it help me prioritize my reading.  Copy me,
> and I'll at least skim cover letters and other thread-starters to
> determine whether I need to follow this thread.  Don't copy me, and I'll
> at best glance at the subject in passing.
> 
> Automatic filing into folders and marking copies so I don't have to mark
> them read twice helps.
> 
> The additional traffic is a drop in a bucket.
> 
>> It is becoming worse.  With get_maintainer.pl pulling addresses
>> of people who made changes or commits to files by default,
>> contributing to the project becomes a bit dangerous.  Because
>> as a result, once you fix something, you're essentially being
>> subscribed to a spam list, because other contributors start
>> Ccing you for the patches with which you have absolutely nothing
>> to do, and if a discussion emerges, you can't opt out of it
>> anymore (especially for patches which raise hot discussions).
>> So I'd rather think twice before contributing anything...
> 
> That's sad.
> 

-- 
Chen Gang

Open, share, and attitude like air, water, and life which God blessed

