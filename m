Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Uan0q-0000AB-QF
	for mharc-qemu-trivial@gnu.org; Fri, 10 May 2013 09:05:28 -0400
Received: from eggs.gnu.org ([208.118.235.92]:54413)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1Uan0k-000075-Uq
	for qemu-trivial@nongnu.org; Fri, 10 May 2013 09:05:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1Uan0g-0000IF-U4
	for qemu-trivial@nongnu.org; Fri, 10 May 2013 09:05:22 -0400
Received: from mail-oa0-f50.google.com ([209.85.219.50]:33667)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1Uan0g-0000Hv-O8
	for qemu-trivial@nongnu.org; Fri, 10 May 2013 09:05:18 -0400
Received: by mail-oa0-f50.google.com with SMTP id l20so1832415oag.23
	for <qemu-trivial@nongnu.org>; Fri, 10 May 2013 06:05:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:in-reply-to:references:user-agent
	:date:message-id:mime-version:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=xdPFQRSyu4akEouXBbK/sLRQK4SNqFihfvakqqw91YY=;
	b=PMIUNk1eE7vNOWO2kXHF1d1jLgfY4cQWxnRe1/7kpSvNr6qnIRPLKxqjzI3xgDL/Du
	QYwFX3Ylh512EfRV71iYcEvIBwZj8OWs4pgXtFSUemjmrm0MGX9U6pENdANNLtR9UfZy
	A6UN+Q7DD8YpEpwNAPsyZNqG0hDn6oiWH0888dcih5MrwtUi8PFh7Uxcwq4QNDRVCsX2
	b+ALzN7r0zXKIR9gBz33OKNIwUnLg8q4fesmIxVVW1MLWfXLdk/65lbuYfDuMWGSOhjY
	6KkLzEeRA7cx5iLkbDSS0yVmeaGrYdYo47GlS5wF3BkCqyW1KVLz0L2fk0dxYEiAUDji
	bDKA==
X-Received: by 10.60.84.102 with SMTP id x6mr6949441oey.73.1368191117808;
	Fri, 10 May 2013 06:05:17 -0700 (PDT)
Received: from titi.smtp.gmail.com (cpe-70-112-157-87.austin.res.rr.com.
	[70.112.157.87])
	by mx.google.com with ESMTPSA id dt3sm2544733obb.12.2013.05.10.06.05.16
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 10 May 2013 06:05:17 -0700 (PDT)
From: Anthony Liguori <anthony@codemonkey.ws>
To: Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>, Michael Tokarev
	<mjt@tls.msk.ru>
In-Reply-To: <518CAB0D.7040904@suse.de>
References: <1368006380-3125-1-git-send-email-trivial@linux.vnet.ibm.com>
	<1368006380-3125-2-git-send-email-trivial@linux.vnet.ibm.com>
	<518A4A2E.200@msgid.tls.msk.ru> <87vc6t61te.fsf@codemonkey.ws>
	<518B40CD.7030604@msgid.tls.msk.ru> <518CAB0D.7040904@suse.de>
User-Agent: Notmuch/0.15.2+77~g661dcf8 (http://notmuchmail.org) Emacs/23.3.1
	(x86_64-pc-linux-gnu)
Date: Fri, 10 May 2013 08:05:15 -0500
Message-ID: <871u9fdlys.fsf@codemonkey.ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Gm-Message-State: ALoCoQlhLsnMSVbGfRVB99FJZH7ZJo7uUomPT8u3CHY/rMxhzg2jPvYncS2LcS+3e4CIUsC2L6BH
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.219.50
Cc: qemu-trivial@nongnu.org, Trival <trivial@linux.vnet.ibm.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/2] remove needless
	semicolon
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
X-List-Received-Date: Fri, 10 May 2013 13:05:27 -0000

Andreas F=C3=A4rber <afaerber@suse.de> writes:

> Am 09.05.2013 08:23, schrieb Michael Tokarev:
>> 08.05.2013 17:25, Anthony Liguori wrote:
>>> Michael Tokarev <mjt@tls.msk.ru> writes:
>>>
>>>> 08.05.2013 13:46, Trival wrote:
>>>>> Signed-off-by: Trival <trivial@linux.vnet.ibm.com>
>>>
>>> Something went wrong in sending this.  This is not a valid SoB.
>>=20
>> So, do we not accept it?
>
> No, we don't. See SubmitAPatch.

What constitutes a legally valid name is quite complex and demands on
the country of origin.  I don't challenge SoBs unless I know with
certainity that they are not legally valid.

In this case, Dong Xu is a colleague of mine and I clearly recognize
that it was a mistake.

That doesn't mean I expect submaintainers to challenge SoBs on a regular
basis.  Assume it's valid unless you have a reason not to.

Regards,

Anthony Liguori

>
>>  Should I revert it in the
>> trivial-patches-next ?
>
> Yes, please drop it from your queue until you get a replacement (or
> instructions from the author how to fix it up).
>
> Cheers,
> Andreas
>
> --=20
> SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=C3=
=BCrnberg

