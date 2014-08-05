Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XEdjg-0000Iv-0F
	for mharc-qemu-trivial@gnu.org; Tue, 05 Aug 2014 08:21:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45817)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1XEdjZ-0000H1-1c
	for qemu-trivial@nongnu.org; Tue, 05 Aug 2014 08:20:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1XEdjT-0002pb-SV
	for qemu-trivial@nongnu.org; Tue, 05 Aug 2014 08:20:52 -0400
Received: from mail-pa0-x22a.google.com ([2607:f8b0:400e:c03::22a]:42251)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>)
	id 1XEdjT-0002pP-Ju; Tue, 05 Aug 2014 08:20:47 -0400
Received: by mail-pa0-f42.google.com with SMTP id lf10so1340221pab.1
	for <multiple recipients>; Tue, 05 Aug 2014 05:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=HSWlhfeuhBfY0OaMWK4mMObh/TewZg8slWlvjy1JTzo=;
	b=rYhGJd//WglbQxY7ByW3jV4kcbl3G5LOE0fg6RYfKSY/wkxR/XW6kdjyIefj/2xLrD
	/04VF+QrS15ptNeESk0PGzVDUFAPTDD43/UZPXATbUCDWD+vTh+DkHCcOL5/oRB0nzzJ
	Wp0efv4kVUwwD2ZDuiysi+gQ3HPDH/fA6LB50tY4pRBDCe/cB36T45INEDN6X2L4A+0t
	vDDXaLMvylUysWPGh5uRLhMRDIGtZVnlmYx0K7IyfBdT21TcLgMfXJ5PONEbds1zfCSG
	0EycNwAzDvgaesTFJQzx72KuKXcwioQpI9YXZvwKypZbXLLeu+HuA4o3DM4/82urp2U+
	/Fzw==
X-Received: by 10.66.246.229 with SMTP id xz5mr3708053pac.119.1407241245943;
	Tue, 05 Aug 2014 05:20:45 -0700 (PDT)
Received: from [192.168.1.23] ([124.127.118.42])
	by mx.google.com with ESMTPSA id h10sm5922421pat.11.2014.08.05.05.20.43
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 05 Aug 2014 05:20:45 -0700 (PDT)
Message-ID: <53E0CC18.7070403@gmail.com>
Date: Tue, 05 Aug 2014 20:20:40 +0800
From: Chen Gang <gang.chen.5i5j@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>, Michael Tokarev <mjt@tls.msk.ru>
References: <53DE5538.1020701@gmail.com> <53DF3D74.9070503@msgid.tls.msk.ru>
	<87d2cguupa.fsf@blackfin.pond.sub.org> <53E06083.7080909@gmail.com>
	<53E082EF.9090007@msgid.tls.msk.ru>
	<CAFEAcA_9+5VEzf4dpyrs9tR-jici+ea6rr6qh6F+nX296PH8hQ@mail.gmail.com>
In-Reply-To: <CAFEAcA_9+5VEzf4dpyrs9tR-jici+ea6rr6qh6F+nX296PH8hQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c03::22a
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
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
X-List-Received-Date: Tue, 05 Aug 2014 12:20:58 -0000



On 08/05/2014 04:07 PM, Peter Maydell wrote:
> n 5 August 2014 08:08, Michael Tokarev <mjt@tls.msk.ru> wrote:
>> 05.08.2014 08:41, Chen Gang wrote:
>>>
>>> Every members have their own tastes, and one working flow may be not
>>> suitable for all members. I can understand, and hope other members
>>> understand too.
>>>
>>> At least for me, next, I shall send patch to the members which I can get
>>> from 'get_maintainers.pl' and only Cc to qemu-devel. And shall skip
>>> qemu-trivial and Michael Tokarev.
>>
>> Why skip both?  It's your call, but I'm curious.
> 
> I think that is a misunderstanding. You asked not to get mails
> cc'd to both you personally and qemu-trivial at the same time,
> and Chen misread this to mean not to cc either address.
> 
> Trivial patches should still be sent "To: qemu-devel + Cc: qemu-trivial".
>

OK, thank you for your explanation. Excuse me, my English is not quite
well, originally, I really misunderstood what Michael Tokarev said.

>> What I _think_ wrong is that get_maintainers.pl lists many random
>> "patchers" for a given file by default.
> 
> Yes, I think it's probably reasonable to change it to make it not
> default to "--git-fallback". Do you want to submit a patch?
> 
> (Perhaps we could make it cc qemu-orphan@ if we wanted to
> flag up holes in our MAINTAINERS coverage and patches liable
> to get lost, but that probably only makes sense if we have people
> who would care enough to do that monitoring work.)
> 

Originally, I assumed Michael Tokarev is that role (be the people who
would care enough to do that monitoring work), but sorry, at present,
I know, I misunderstand him (he is not this role).

It is really hard to find a member to act as this role (I guess, for act
as this role, he/she will be a real global maintainer of qemu).


Thanks.
-- 
Chen Gang

Open, share, and attitude like air, water, and life which God blessed

