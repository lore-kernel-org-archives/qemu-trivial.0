Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UDuIw-0002X1-5S
	for mharc-qemu-trivial@gnu.org; Fri, 08 Mar 2013 05:13:34 -0500
Received: from eggs.gnu.org ([208.118.235.92]:59624)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UDuIs-0002UL-Cw
	for qemu-trivial@nongnu.org; Fri, 08 Mar 2013 05:13:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UDuIq-0000ID-Sk
	for qemu-trivial@nongnu.org; Fri, 08 Mar 2013 05:13:30 -0500
Received: from mail-we0-x232.google.com ([2a00:1450:400c:c03::232]:39897)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1UDuIq-0000I2-MG; Fri, 08 Mar 2013 05:13:28 -0500
Received: by mail-we0-f178.google.com with SMTP id o45so772465wer.37
	for <multiple recipients>; Fri, 08 Mar 2013 02:13:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=OclYEn8jqSb1Qd3Pp2wBsrOKQNvqQjwf/A1zgQ1x6tU=;
	b=XpdpmrrxaldYFk83aN5ZUyj4vknQkciOLPvgcYtaLw7JCILhp6suljhk8LLJbcMX+1
	3ddTRtD6ttWx7lBvMPXC9PIqIfPl5zQ3xeOnZEcV9ZW+hewIM/LaeWB0aBqwLsz84K73
	3DBtKzVC6g1JAeqDMBubkfv4T2CCPiUO0b7F36yso6mQ5golTg0Cm8fxTQbU6nzZaLeZ
	wWpvS0/8L5+MOLHtsjknvf/xJnG58C/BwXWQNmJGZwfglHH5P6+EOYnLhJe7DUE7der9
	G+h/PbP4cx7HKkjkOKRLAE2BHY+yi36CGyXlJUAI4xyZQGsyMajIuvlrXYSzl7uIjziy
	FVGw==
X-Received: by 10.180.74.228 with SMTP id x4mr39602808wiv.0.1362737607656;
	Fri, 08 Mar 2013 02:13:27 -0800 (PST)
Received: from localhost ([2a02:810d:ec0:195:852b:b477:8102:5356])
	by mx.google.com with ESMTPS id n2sm38348249wiy.6.2013.03.08.02.13.25
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 08 Mar 2013 02:13:26 -0800 (PST)
Date: Fri, 8 Mar 2013 11:13:24 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20130308101324.GA32107@stefanha-thinkpad.redhat.com>
References: <20130307033301.GA48996@cs.nctu.edu.tw>
	<20130308092102.GD9597@stefanha-thinkpad.redhat.com>
	<CAFEAcA_2JCrZOVTmg8d=YHSPD0-txcXNmjmjvc0AFYihabyfcQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFEAcA_2JCrZOVTmg8d=YHSPD0-txcXNmjmjvc0AFYihabyfcQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c03::232
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	=?utf-8?B?6Zmz6Z+L5Lu7IChXZWktUmVuIENoZW4p?= <chenwj@iis.sinica.edu.tw>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Use proper term in TCG
	README
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
X-List-Received-Date: Fri, 08 Mar 2013 10:13:32 -0000

On Fri, Mar 08, 2013 at 05:29:29PM +0800, Peter Maydell wrote:
> On 8 March 2013 17:21, Stefan Hajnoczi <stefanha@gmail.com> wrote:
> > On Thu, Mar 07, 2013 at 11:33:01AM +0800, 陳韋任 (Wei-Ren Chen) wrote:
> >>   In TCG, "target" means the host architecture for which TCG generates the
> >> code. Using "guest" rather than "target" to make the document more consistent.
> 
> >> @@ -379,7 +379,7 @@ double-word product T0.  The later is returned in two single-word outputs.
> >>
> >>  Similar to mulu2, except the two inputs T1 and T2 are signed.
> >>
> >> -********* 64-bit target on 32-bit host support
> >> +********* 64-bit guest on 32-bit host support
> >>
> >>  The following opcodes are internal to TCG.  Thus they are to be implemented by
> >>  32-bit host code generators, but are not to be emitted by guest translators.
> >
> > Review from TCG experts please.
> >
> > It seems we have multiple meanings for "target" (e.g. ./configure
> > --target-list= does not mean "the host architecture for which TCG
> > generates code"), if this is really the way TCG uses the term then fine.
> 
> Yes, this is an unfortunate terminology clash, but in a TCG context
> 'target' does mean 'host architecture which the backend compiles for'
> (see the tcg/README definition in section 2). This is partly because
> of TCG's history as a C compiler backend, where 'target' is unambiguous
> and may be different from the 'host' architecture the compiler itself
> executes on.
> 
> There are several places in tcg/README which use 'target' in the
> sense 'QEMU target, ie guest' (as well as lots of uses in the
> 'TCG target, ie host' sense), not just this one; it might be a good
> idea to put a note in the Definitions section that this document uses
> 'guest' when it means what in other areas of QEMU is often referred to
> as the 'target', and fix the places where we've accidentally used 'target'
> and 'guest would be better.

Wei-Ren, can you please convert the other instances in tcg/README where
'target' is used in the 'guest' sense, too?

Stefan

