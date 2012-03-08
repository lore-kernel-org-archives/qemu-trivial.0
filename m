Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S5ftQ-0004wu-6g
	for mharc-qemu-trivial@gnu.org; Thu, 08 Mar 2012 11:08:40 -0500
Received: from eggs.gnu.org ([208.118.235.92]:55562)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1S5ftI-0004vS-OD
	for qemu-trivial@nongnu.org; Thu, 08 Mar 2012 11:08:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1S5fst-0007rS-D8
	for qemu-trivial@nongnu.org; Thu, 08 Mar 2012 11:08:32 -0500
Received: from mail-ww0-f53.google.com ([74.125.82.53]:61596)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1S5fst-0007qe-3Y; Thu, 08 Mar 2012 11:08:07 -0500
Received: by wgbfm10 with SMTP id fm10so593010wgb.10
	for <multiple recipients>; Thu, 08 Mar 2012 08:08:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=Va5PbHHTLuXC1AGR+gNeXYrMpbyppmQMWi05iCPNyd0=;
	b=sxwi7JA3Bh2bEEyCNr6NCaQ2jv0Q6AHucPLKfBLHShNzKkgXaRYVlV2DSv3ry4zdUJ
	rLujz3dL39K6Khn8U8ToaxtcDavXH7P3SCvxBwEgMyGqCaw9APaBlLqO4Q0Qw/FzLcgm
	Nfn8ErozC8MRVWCtaBcs+i4m+1Kycwi49m3yFgNWeDZZ7Et+wXv9fYqK9tHzLIpxphwj
	Czc8/QF1J0yNGsZggGkfHS9u5P7vYddNbtswCTUClP1JqzpwfAtc6LrA1ZlCSxmGe0AF
	P9RKwpqv05LFpjd8myX3PJXXdnqFbBe7jl8cmILnLaSmEBoQFZt/Aqh1vXjYGldqE6Sv
	Irdw==
Received: by 10.180.102.129 with SMTP id fo1mr14020107wib.6.1331222884382;
	Thu, 08 Mar 2012 08:08:04 -0800 (PST)
Received: from yakj.usersys.redhat.com (93-34-182-16.ip50.fastwebnet.it.
	[93.34.182.16])
	by mx.google.com with ESMTPS id w10sm10584012wiy.3.2012.03.08.08.08.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 08 Mar 2012 08:08:03 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <4F58D961.70706@redhat.com>
Date: Thu, 08 Mar 2012 17:08:01 +0100
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Stefan Hajnoczi <stefanha@gmail.com>
References: <1330176948-14379-1-git-send-email-sw@weilnetz.de>
	<CAJSP0QXAc5S6dvh-6EJkL8RNfDCkD=7QcbT0DMZTiS5D+xTQsg@mail.gmail.com>
In-Reply-To: <CAJSP0QXAc5S6dvh-6EJkL8RNfDCkD=7QcbT0DMZTiS5D+xTQsg@mail.gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.125.82.53
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Stefan Weil <sw@weilnetz.de>,
	Anthony Liguori <aliguori@us.ibm.com>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] vnc: Fix packed boolean struct members
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
X-List-Received-Date: Thu, 08 Mar 2012 16:08:38 -0000

Il 08/03/2012 16:26, Stefan Hajnoczi ha scritto:
> I had to drop this patch from the trivial patches tree, it tickles a
> new gcc warning.  Please resend with the necessary change.
> 
> I cannot reproduce it on my build host here with gcc Debian 4.6.2-12
> but Anthony reports the following Ubuntu/Linaro 4.5.2-8ubuntu4:
> 
>   CC    ui/vnc-auth-sasl.o
> cc1: warnings being treated as errors
> /home/anthony/git/qemu/ui/vnc-auth-sasl.c: In function
> ‘vnc_sasl_client_cleanup’:
> /home/anthony/git/qemu/ui/vnc-auth-sasl.c:34:9: error: suggest
> parentheses around assignment used as truth value
> make: *** [ui/vnc-auth-sasl.o] Error 1

Looks like a GCC bug where

   x = y = 0;

is converted to

   x = (y = 0) != 0;

and the magic that does this inside the compiler causes the warning.

We should add a configure check to only add -Werror on compilers newer
than X (for example X could leave out GCC 4.5), so that this patch can
be reapplied.

Paolo

