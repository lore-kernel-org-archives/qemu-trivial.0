Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WoZg2-0000Ri-Sd
	for mharc-qemu-trivial@gnu.org; Sun, 25 May 2014 10:45:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51271)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <tamlokveer@gmail.com>) id 1WoZg0-0000NP-Cg
	for qemu-trivial@nongnu.org; Sun, 25 May 2014 10:45:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <tamlokveer@gmail.com>) id 1WoZfz-00005Q-7Z
	for qemu-trivial@nongnu.org; Sun, 25 May 2014 10:45:28 -0400
Received: from mail-qc0-x235.google.com ([2607:f8b0:400d:c01::235]:46529)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <tamlokveer@gmail.com>)
	id 1WoZfx-0008WS-4t; Sun, 25 May 2014 10:45:25 -0400
Received: by mail-qc0-f181.google.com with SMTP id m20so10731233qcx.26
	for <multiple recipients>; Sun, 25 May 2014 07:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=odBgk5FLY7Rvgc6Fx11HUJTzYTcfJnpkOG1D6Q2d+Ag=;
	b=gfIsIn8EztUqb0RsojVj/Xi8kID3Dzkzycq14gDh6Qd1G5xHjO3NWeeasOtBQD+XSl
	hSUk3UAoQZFTJj/1GUppa/6WIx/rIR1Y7ZI2wgUmgSsJwqR6MR1fz03XqwH+JfWqmv6W
	FaEogkWs5TT8/beMCr+pqSimZ5aNSMcywBTsKNl1DCWkKyH3YSQJXWKpekuqvFWmAU8O
	t7Po/FZ22keEnU6e09yWN6MVSpB8Q7WGkQ0FFBdnFmELl9zPoc2j2CC1DuQoTHL51PcX
	GSiExMYDSuVLT9ZDq3Ha4IXhL9ClVkzAoJGsaWUYOYt+Lgu2Xs6XfU9br9Ps+cE7GB+t
	+K5Q==
MIME-Version: 1.0
X-Received: by 10.224.30.70 with SMTP id t6mr25190605qac.30.1401029124431;
	Sun, 25 May 2014 07:45:24 -0700 (PDT)
Received: by 10.140.24.51 with HTTP; Sun, 25 May 2014 07:45:24 -0700 (PDT)
In-Reply-To: <5381FFD4.8080107@msgid.tls.msk.ru>
References: <1400985853-25594-1-git-send-email-tamlokveer@gmail.com>
	<5381FE37.80904@web.de> <5381FFD4.8080107@msgid.tls.msk.ru>
Date: Sun, 25 May 2014 22:45:24 +0800
Message-ID: <CACrq+iLp07O-r8LLnEG67gFPKVNnh7bMy6g90dPUB_L2cKj18w@mail.gmail.com>
From: Le Tan <tamlokveer@gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400d:c01::235
Cc: Kevin Wolf <kwolf@redhat.com>,
	Peter Crosthwaite <peter.crosthwaite@xilinx.com>,
	qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
	Jan Kiszka <jan.kiszka@web.de>, Stefan Hajnoczi <stefanha@redhat.com>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Subject: Re: [Qemu-trivial] [PATCH v3] block: replace fprintf(stderr,
 ...) with error_report()
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
X-List-Received-Date: Sun, 25 May 2014 14:45:29 -0000

Oh, yes, I may misunderstood it. I just ran ./scripts/checkpatch.pl to
check files that I touched and fixed those I can fix. So I will send
the v4 of this patch which just fix the whitespace issues based on v2.
Is that right? Forgive my being naive. :)
Thanks very much for all!

Le

2014-05-25 22:36 GMT+08:00 Michael Tokarev <mjt@tls.msk.ru>:
> 25.05.2014 18:29, Jan Kiszka wrote:
>> On 2014-05-25 10:44, Le Tan wrote:
>>> Replace fprintf(stderr,...) with error_report() in files block/*, block.c,
>>> block-migration.c and blockdev.c. The trailing "\n"s of the @fmt argument
>>> have been removed because @fmt of error_report() should not contain newline.
>>> Also fix some coding style issues.
>>
>> Let's do the "also" part in a separate patch. It's more than one or two
>> trivial pass-by style fixes, and some people may like the fprintf
>> conversion while having different views on the other changes.
>
> I think he misunderstood.
>
> I told him that his previous patch had its own whitespace issues,
> ie, it _adds_ whitespace errors.
>
> In another reply I told him it is usually a good idea to fix style
> issues in the code the patch touches -- this means, close to, if a
> line being changed for something else has an unrelated style issue,
> it should be fixed too.  (An example was space between function name
> and its arguments in fprintf argument list, while converting that
> fprintf to error_report).
>
> But it looks like he took this advise in much more broad way and
> fixed _all_ whitespace/style issues in the files he touches.  Oh
> well.. :)
>
> And yes, definitely, please don't mix it like this.  Usually, these
> code style issues should not be touched by its own, only if you
> change nearby code.
>
> Thanks,
>
> /mjt

