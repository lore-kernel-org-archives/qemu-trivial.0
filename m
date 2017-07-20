Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dYJDM-0007w5-PG
	for mharc-qemu-trivial@gnu.org; Thu, 20 Jul 2017 17:42:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57341)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dYJDK-0007uM-Vn
	for qemu-trivial@nongnu.org; Thu, 20 Jul 2017 17:42:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dYJDK-0001k1-2u
	for qemu-trivial@nongnu.org; Thu, 20 Jul 2017 17:42:31 -0400
Received: from mail-wr0-x22d.google.com ([2a00:1450:400c:c0c::22d]:34419)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dYJDJ-0001jJ-Q9
	for qemu-trivial@nongnu.org; Thu, 20 Jul 2017 17:42:29 -0400
Received: by mail-wr0-x22d.google.com with SMTP id 12so75736905wrb.1
	for <qemu-trivial@nongnu.org>; Thu, 20 Jul 2017 14:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=LS1khxvwKCAMpicOrR6JyVEshmixjDdqOBgbNeXOg60=;
	b=EdeSmrtFygsa82bY0FgHeFCnGeXejueM9XZUCTmXDoTkslIEdHrabJXcjNJI+XrJlx
	BCnULo7kN+P3WEF54KdVUxDFDRrHnTqNk9rt3hZvCFS0nEDlpBzUlp0WIE6uil1qKSbK
	kMcbNT63TnRPQqAsHKs9v2tZrLP1694LRxqGM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=LS1khxvwKCAMpicOrR6JyVEshmixjDdqOBgbNeXOg60=;
	b=CHBDlbOUJ17eLFPhB1inKZ1bcCrz/l8Yxvm6tP3sr2+U9y0giago0LsjfRUfQ+A5OB
	ZjaSqJsmkgI/c2sYE9nTySzUb+V6Jum5wyWG5mjOLlY4f51wW4J4dUNmk749NgSuhHt/
	EasuNLUwGOlcwoGVeIGMD8sX+HY+DfHcA3UxgbYvjlf0mvfF37B383w3EBr7z/RDUbWh
	e2OFV8fanIdosesos2fiD2WP2gKDiW+/ceaMlmRr8SK3j1Qa0nH7kASMJzpryOwBU9OI
	zDMZZ3DjAka/XPPuNBS/sGIyh3X/yzMaCqBwTuZJSzHMB3wPdwGYoGEG0cb6tDeSHao8
	F1aA==
X-Gm-Message-State: AIVw112L8psdnJQbwzpZBb8kU7r2pWmmIaRjYm9DatkfVUJZWWYq6cmt
	H+Bk00AXVXfsRTyBmv/s+LNTy33RRKcf
X-Received: by 10.223.163.16 with SMTP id c16mr8653994wrb.173.1500586948677;
	Thu, 20 Jul 2017 14:42:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.2 with HTTP; Thu, 20 Jul 2017 14:42:08 -0700 (PDT)
In-Reply-To: <2bba3c89-e4f0-655b-c9ed-aab911beaaa7@redhat.com>
References: <1500568290-7966-1-git-send-email-peter.maydell@linaro.org>
	<d4b6f6a0-3479-795a-97b2-68c98a6b0c24@twiddle.net>
	<CAFEAcA8tkW2bk_O3iDO-wWpY9EUbUNkUL93OShipsvckj-jkoQ@mail.gmail.com>
	<2bba3c89-e4f0-655b-c9ed-aab911beaaa7@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 20 Jul 2017 22:42:08 +0100
Message-ID: <CAFEAcA9ZhxrnKzw9WUVCNrSJxy_y4pPyX92_DqXn89LRq7LVbQ@mail.gmail.com>
To: Eric Blake <eblake@redhat.com>
Cc: Richard Henderson <rth@twiddle.net>,
	"patches@linaro.org" <patches@linaro.org>, 
	QEMU Trivial <qemu-trivial@nongnu.org>, Cornelia Huck <cohuck@redhat.com>, 
	Alexander Graf <agraf@suse.de>, QEMU Developers <qemu-devel@nongnu.org>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Kamil Rytarowski <kamil@netbsd.org>, 
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, 
	David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::22d
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for-2.10] Use qemu_tolower()
 and qemu_toupper(), not tolower() and toupper()
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 20 Jul 2017 21:42:32 -0000

On 20 July 2017 at 22:29, Eric Blake <eblake@redhat.com> wrote:
> On 07/20/2017 04:03 PM, Peter Maydell wrote:
>> https://ftp.netbsd.org/pub/NetBSD/NetBSD-current/src/sys/sys/ctype_inline.h
>> The implementation is
>>   #define toupper(c) ((int)((_toupper_tab_ + 1)[(c)]))
>>
>> (where I assume _toupper_tab_ is the obvious array.)
>
> In fact, if NetBSD's implementation is anything like Cygwin's, then it
> is a safe bet that _toupper_tab_ is a symbol that lands in the middle of
> a larger 384-byte array, such that _toupper_tab_[-1] (for (signed
> char)'\xfe') happens to resolve to a valid image address, and will have
> the same contents as _toupper_tab_[255] (for (unsigned char)'\xfe'),
> precisely to cater to so many clueless programs have forgotten about
> signed char widening to negative values (even though the standard says
> the behavior is undefined, quality-of-implementation demands that you
> try to do the sane thing anyway).

Nope, looks like they just implement as _toupper_tab_[0] is for
EOF, and indexes >0 are for the characters, if I've found the
right bit of their libc:
https://ftp.netbsd.org/pub/NetBSD/NetBSD-current/src/lib/libc/locale/rune.c

thanks
-- PMM

