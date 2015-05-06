Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ypy0q-00031l-Fd
	for mharc-qemu-trivial@gnu.org; Wed, 06 May 2015 08:01:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38244)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent.desnogues@gmail.com>) id 1Ypy0m-0002ww-Ug
	for qemu-trivial@nongnu.org; Wed, 06 May 2015 08:01:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent.desnogues@gmail.com>) id 1Ypy0l-00087k-UQ
	for qemu-trivial@nongnu.org; Wed, 06 May 2015 08:01:12 -0400
Received: from mail-oi0-x235.google.com ([2607:f8b0:4003:c06::235]:34577)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent.desnogues@gmail.com>)
	id 1Ypy0f-00084s-Nz; Wed, 06 May 2015 08:01:06 -0400
Received: by oiko83 with SMTP id o83so5308388oik.1;
	Wed, 06 May 2015 05:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=OFfno7SjeOmkMQ4Xt0WPRmOxKOpa4PfgfIWO8C/g96s=;
	b=ULUxAS1xwqlb47cHMA93BlS/1YA1/byJcmgo8KL2H+lYCmi3HNrjXOq1wfSgiwwY+C
	xx1O0ix1TPn2pa9LqbEIfufjiIbG+FJxGVaxmQq5y/nuQFDOYoO6Bx4BOtKxEDEBDK83
	WjGBFAhdqF541DX5n11h8nXuV/ntkN066hV4EBATD5mnXQmOoiGgyQgCu4rjtSHsW0Wl
	kF6RwIqPtoMy1U69oFjhSxH0g4SbB0p+54PdbWyhtYgB5+oHzHL0qoajr1B2hN8Yi735
	0zAf6TJUmcfqvoO1f4xumhmNGKpeTdzYA3txEIAHcHdgmq6lYQhlKbi3ZFJetMALjEi4
	p4OA==
MIME-Version: 1.0
X-Received: by 10.202.102.199 with SMTP id m68mr25047073oik.98.1430913665030; 
	Wed, 06 May 2015 05:01:05 -0700 (PDT)
Received: by 10.182.14.68 with HTTP; Wed, 6 May 2015 05:01:04 -0700 (PDT)
In-Reply-To: <5549E760.6030208@msgid.tls.msk.ru>
References: <1430141220-20123-1-git-send-email-mjt@msgid.tls.msk.ru>
	<CABoDooPkbFvVsC8i0XF9-9+dZQK16aJGDVoE7LAd_L9=COagqA@mail.gmail.com>
	<5549E760.6030208@msgid.tls.msk.ru>
Date: Wed, 6 May 2015 14:01:04 +0200
Message-ID: <CABoDooN+49=EZ74w2k5XO5khPF-Dvix3xwqzmf5VVreo8rC0ZA@mail.gmail.com>
From: Laurent Desnogues <laurent.desnogues@gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:4003:c06::235
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] libcacard: stop
	including qemu-common.h
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
X-List-Received-Date: Wed, 06 May 2015 12:01:14 -0000

On Wed, May 6, 2015 at 12:05 PM, Michael Tokarev <mjt@tls.msk.ru> wrote:
> 06.05.2015 12:23, Laurent Desnogues wrote:
>> Hello,
>>
>> On Mon, Apr 27, 2015 at 3:27 PM, Michael Tokarev <mjt@tls.msk.ru> wrote:
>>> From: Paolo Bonzini <pbonzini@redhat.com>
>>>
>>> This is a small step towards making libcacard standalone.
>>
>> on my system the removal of qemu-common.h inclusion broke compilation
>> due to assert being used in glib-compat.h.
>
> Interesting. What kind of build environment is that?  I compile-tested on
> several platforms, all went fine.. ;)

That's a CentOS 6.6 machine with glib2 2.28.8.

>>     A  fix might be to include
>> assert.h in glib-compat.h.
>
> I prefer s/assert/g_assert/ in glib-compat.h.

That indeed looks better :-)

Thanks,

Laurent

> Thanks,
>
> /mjt
>

