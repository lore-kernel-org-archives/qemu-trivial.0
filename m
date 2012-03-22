Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SAfFV-0000PH-07
	for mharc-qemu-trivial@gnu.org; Thu, 22 Mar 2012 06:28:05 -0400
Received: from eggs.gnu.org ([208.118.235.92]:39960)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SAfFP-000091-Sz
	for qemu-trivial@nongnu.org; Thu, 22 Mar 2012 06:28:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SAfFO-0002i1-67
	for qemu-trivial@nongnu.org; Thu, 22 Mar 2012 06:27:59 -0400
Received: from mail-lpp01m010-f45.google.com ([209.85.215.45]:63880)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1SAfFB-0002fJ-TC; Thu, 22 Mar 2012 06:27:46 -0400
Received: by lahe6 with SMTP id e6so1566786lah.4
	for <multiple recipients>; Thu, 22 Mar 2012 03:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=d3qDZzMAl4PlE8kJxDXJpBoCv5ePnLhv38IFFeaARl0=;
	b=uVSJvnAQh4s28448zw2TX7SSQESpunc98HYcdIQYtgtLfVsWG5muR0FoWPgJfll7Ck
	FzNW4U5eAJg/MX9Qrddc3+VC/kxG2dGwmiW8VSSyrTLfzl4HLWvA9UIGWIyPejl/ZGH0
	Ut8T+nnR2jAWla0FQBKmpc1gejPjuG7G0CR7B/z8lor4DOQnWgFtXbFauQc0l0+BWbI2
	k/p4vJvaT7PQdiQ/X/oCGT1h5Tg3aRRYJ+RuMfpCOkZA0kS54lAGt7yU1skJKxVSFuHG
	AFgUBk32IREbUTrB/TVfSzwA/+KKY7+LKspXh6rAa15yJEG2RqgV6xZescPMgbHJjWGk
	5X4A==
MIME-Version: 1.0
Received: by 10.112.102.65 with SMTP id fm1mr2476465lbb.82.1332412062872; Thu,
	22 Mar 2012 03:27:42 -0700 (PDT)
Received: by 10.112.80.167 with HTTP; Thu, 22 Mar 2012 03:27:42 -0700 (PDT)
In-Reply-To: <4F6A6CCE.4000904@redhat.com>
References: <1332363767-21327-1-git-send-email-peter.portante@redhat.com>
	<4F6A6CCE.4000904@redhat.com>
Date: Thu, 22 Mar 2012 10:27:42 +0000
Message-ID: <CAJSP0QU4j3Fpki3vV8dKgC4a=OBuNiuepCMm4Qenw6AUuWZPFQ@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
To: peter.portante@redhat.com
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.215.45
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH 0/4] More whitespace and coding style
 clean ups ahead of future changes
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
X-List-Received-Date: Thu, 22 Mar 2012 10:28:04 -0000

On Thu, Mar 22, 2012 at 12:05 AM, Paolo Bonzini <pbonzini@redhat.com> wrote=
:
> Il 21/03/2012 22:02, Peter Portante ha scritto:
>> Hi Folks,
>>
>> Please forgive me if you find these changes are annoying, as I am trying=
 to
>> learn the ropes of patch submission with git ahead of making a real patc=
h.
>>
>> While working on the code, I found that scripts/checkpatch.pl will flag =
lines
>> that I am changing as not adhereing to the codeing standard due to
>> pre-existing coding violations. So I figured I could learn a bit about h=
ow to
>> submit patches by fixing these files I will be touching before submittin=
g the
>> code changes.
>
> I think slirp is a mess and it's not worth doing this kind of sweeping
> change. =A0Just ignore checkpatch output for slirp.

Please resend without slirp changes.  I suggest including the
individual block/raw-posix.c patch you sent in the new series too.

> For the others, the changes are pretty small so they could be doable.
> If you want to change them then please also add braces around if statemen=
ts.

If you're doing a whitespace patch please include the 3-space
indentation issues that checkpatch.pl reports in block/raw-posix.c.

> In any case, your patch submission workflow seems to be fine. :P

Please use a prefix in your commit messages, for example "raw-posix:
whitespace cleanup".  This gives each commit a unique, useful message
which communicates more than "Yet another whitespace cleanup"-style
messages.

Stefan

