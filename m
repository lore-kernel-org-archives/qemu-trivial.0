Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cQiIt-0007lm-Hy
	for mharc-qemu-trivial@gnu.org; Mon, 09 Jan 2017 17:20:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44005)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1cQiIr-0007jJ-A0
	for qemu-trivial@nongnu.org; Mon, 09 Jan 2017 17:20:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1cQiIq-0001oH-GE
	for qemu-trivial@nongnu.org; Mon, 09 Jan 2017 17:20:33 -0500
Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243]:35513)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1cQiIk-0001l7-9p; Mon, 09 Jan 2017 17:20:26 -0500
Received: by mail-lf0-x243.google.com with SMTP id v186so6872064lfa.2;
	Mon, 09 Jan 2017 14:20:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=vX4Y/2WDJ8FNFdLgT2EBPdQ3IB6nJwdYX1mS6duIRKs=;
	b=tOxcoMOV4zP9PXDYLSywyM1qoOYJrhlTmwHg9ZUPEbLZFXtsE/AehYpIwVcbnHpzRi
	0qnuWfA2thYJ4AomxwVRAL1gyXq39SldRYA+BTq3F2JqY5uPS0RUp0fyvN7wR3M4kQke
	2iamuqaYHT2f5qIhc5K6wxSxDCG8AOsNy6MSQ9L623Qkxkm4UfJd3RBSf5OZv7yriAqe
	LofKri9dk2Cc9GKK7n/B8jm4R84zodkn5wwWiiglyT8/fT8xf9hnggCCFc7mVyxrcCYS
	Oqlw45IHHOWlSf1dBAtiC2yacs5U+7hVWwH1DilY3jqXGDnUm5uhk2F5JXdzoRbyZnfl
	zDUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=vX4Y/2WDJ8FNFdLgT2EBPdQ3IB6nJwdYX1mS6duIRKs=;
	b=Hzxb1lSZvgMUbvN43plK1F7gN/ajZjvKejmAnJprUZBbCwAeuypeSuTi4qB3h/OXB5
	Qh8qIh6BU/nuZC0IUqKAhj52asz6pyIcctBqNJymcphaKOecabZ5FiuMyf4KKnt6fSTV
	TC1gWzqCe+4HU3gRXeHGTPouzvi/3I02EiZKNc3fpWaRgU65i+/DmXR6++M3FQOJn2WZ
	SZVDfjakf/PoT9DOgWRg4DowRevhhCg7RsK1cRCPWWQasGCshT3yhy739N12Y+1R8Scx
	0O1PxbxAZZnJTDyUEB0TYqoze5SNO+JHAvXu08QQoj2OCNg2Cn24knY+S4NPO5xSAeqs
	jiXg==
X-Gm-Message-State: AIkVDXJgFAm7yYPx+OktuyQ53liZ8roVB2bnNEWSkDOYGy4yKu1fts/JQFJvvfEp/0ZZtg==
X-Received: by 10.46.22.6 with SMTP id w6mr4488341ljd.31.1484000424572;
	Mon, 09 Jan 2017 14:20:24 -0800 (PST)
Received: from localhost (81-231-233-234-no56.tbcn.telia.com. [81.231.233.234])
	by smtp.gmail.com with ESMTPSA id
	z26sm21913281lja.49.2017.01.09.14.20.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 09 Jan 2017 14:20:23 -0800 (PST)
Date: Mon, 9 Jan 2017 23:20:22 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Fam Zheng <famz@redhat.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>
Message-ID: <20170109222022.GW9606@toto>
References: <1483988759-14606-1-git-send-email-peter.maydell@linaro.org>
	<148398903105.208.13573655327114962163@790289a7ca88>
	<CAFEAcA-S6txZ79_N1PTzAGb0dQSV9zpQ-kKyjnYDyyZzsv_4Ug@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA-S6txZ79_N1PTzAGb0dQSV9zpQ-kKyjnYDyyZzsv_4Ug@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::243
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] disas/cris.c: Fix Coverity
 warning about unchecked NULL
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
X-List-Received-Date: Mon, 09 Jan 2017 22:20:34 -0000

On Mon, Jan 09, 2017 at 09:35:16PM +0000, Peter Maydell wrote:
> On 9 January 2017 at 19:10,  <no-reply@patchew.org> wrote:
> > Checking PATCH 1/1: disas/cris.c: Fix Coverity warning about unchecked NULL...
> > ERROR: code indent should never use tabs
> > #24: FILE: disas/cris.c:2493:
> > +^Iif (sregp == NULL || sregp->name == NULL)$
> >
> > ERROR: suspect code indent for conditional statements (8, 10)
> > #24: FILE: disas/cris.c:2493:
> > +       if (sregp == NULL || sregp->name == NULL)
> >           /* Should have been caught as a non-match earlier.  */
> >
> > ERROR: braces {} are necessary for all arms of this statement
> > #24: FILE: disas/cris.c:2493:
> > +       if (sregp == NULL || sregp->name == NULL)
> > [...]
> >
> > total: 3 errors, 0 warnings, 8 lines checked
> 
> This is because the whole file is GNU coding standards
> style, being a binutils import. Better to stick with it rather
> than rework, I think.

Yes, I agree.

Cheers,
Edgar

