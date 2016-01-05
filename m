Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aGMIl-00050k-Cf
	for mharc-qemu-trivial@gnu.org; Tue, 05 Jan 2016 02:45:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34529)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sitsofe@yahoo.com>) id 1aGMIi-0004wz-Fi
	for qemu-trivial@nongnu.org; Tue, 05 Jan 2016 02:45:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sitsofe@yahoo.com>) id 1aGMIa-0001W6-HR
	for qemu-trivial@nongnu.org; Tue, 05 Jan 2016 02:45:04 -0500
Received: from nm6-vm5.bullet.mail.gq1.yahoo.com ([98.136.218.196]:53200)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sitsofe@yahoo.com>) id 1aGMIa-0001VY-64
	for qemu-trivial@nongnu.org; Tue, 05 Jan 2016 02:44:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
	t=1451979894; bh=bE9aztxAS4u0MTLISaNjH+6MmPYSImrAzBBnalQ+SJ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From:Subject;
	b=oe3f78+ecD3WFodcNI2y7SyxReZIi71uho+dxJMbYqkjQfORNZg1TGnNGfWD5JxEvR/RVz3gixlHSDysNfesMJC4VgNdzlqX9Dtw5v5J/KTteN2CkjibXY1tB76LG1EmRzh66w4KAXciw++ZZes3Q7lvsn8FaiE8g28MZPlLfGLwcI2xY+wROOmSSDISBBvQ7HHRBbYkjz6VVbYIIVDEgCUhl31ozOIPyfOqKSkq7b6dh+83ccubG6CSzIQXSbMy9svizEN65dcOdpbVycy0nxE95PKXeGNlGzUth48kPzBfy/UuDq9cB/4WBAcZtAsI3s/IKtQmQj9/txqAzdiydA==
Received: from [98.137.12.61] by nm6.bullet.mail.gq1.yahoo.com with NNFMP;
	05 Jan 2016 07:44:54 -0000
Received: from [208.71.42.198] by tm6.bullet.mail.gq1.yahoo.com with NNFMP;
	05 Jan 2016 07:44:54 -0000
Received: from [127.0.0.1] by smtp209.mail.gq1.yahoo.com with NNFMP;
	05 Jan 2016 07:44:54 -0000
X-Yahoo-Newman-Id: 629823.53766.bm@smtp209.mail.gq1.yahoo.com
X-Yahoo-Newman-Property: ymail-3
X-YMail-OSG: J33AfmcVM1mb1OgMEd0mV42eL4NfEZUgcLmWopvGJEhfiUD
	93B9ps8OxKBpINEfq62nOUgVLsKT_ZgNe71S8CO4VIdOpiiVr3P7hxu2nVSO
	vNIS977DKenNZI.BHpU0AxMasoXEI6oRBaaYZF7u99wJhyPCJaMtpFyEI4J6
	BNwCGG41CllKHsnSv3zQKZRwN3.PhBAfEy.t3Nbo4xSMS6hEVfjLA4B0jcEd
	4nZin5JG5ASXxnKzww9XD11qPye7Z_xAxMawSpm0.ZzhVLS4ySQkaXgv7GWU
	JlzfIBUXQX91mwJF9SwH2tdCDm2UoYDdR4.8OxNOArZSQJi4EVhMm0pXdfd6
	.o6Y0XwOQ9WPcjzYDDFa44RvkJtXKYxr2_FE_CSj4VSsaQduAUVUx7ee7o9J
	hW6h4K5lGqCaeqsxuw6RNcczXdfnVR8QzPhwxz2QNhgqHpsRpuY32eXT5KgX
	Dxfqf.gAKgAeX77C8jID1uxV_BMvj472PRUneKpExBuh_k0bd0cghwHJz0R1
	b8IP1NHmDkfNcevsIsQnHhV_ZrHuwMzjEx5gaOQfQ6A--
X-Yahoo-SMTP: mEA9emqswBDufi8V3X8MBXZonFM-
Date: Tue, 5 Jan 2016 07:44:45 +0000
From: Sitsofe Wheeler <sitsofe@yahoo.com>
To: Eric Blake <eblake@redhat.com>
Message-ID: <20160105074443.GA26667@sucs.org>
References: <20151230195338.GA25149@sucs.org> <20151230195744.GA26893@sucs.org>
	<568AB6E3.5010302@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <568AB6E3.5010302@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 98.136.218.196
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/2] qemu-nbd: Minor texi
	updates
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
X-List-Received-Date: Tue, 05 Jan 2016 07:45:05 -0000

On Mon, Jan 04, 2016 at 11:16:03AM -0700, Eric Blake wrote:
> On 12/30/2015 12:57 PM, Sitsofe Wheeler wrote:
> > +@item -f, --format=@var{fmt}
> > +force the use of the block driver for format @var{fmt} instead of
> > +auto-detecting
> 
> Why are you abbreviating 'format' to 'fmt'? Oh, because that's how the
> other duplicate one was worded.

The problem is who to be consistent with? There are a few choices:
o qemu(1)
o qemu --help
o qemu-img(1)
o qemu-img --help
o qemu-nbd --help
o (For NBD options) nbd-server(1)

In the end I decided to try and avoid changing what was already there.

> Should probably start with 'Force', to match the capitalization used
> earlier....
> 
> >  @item -r, --read-only
> >  export read-only
> >  @item -P, --partition=@var{num}
> > @@ -44,17 +45,22 @@ the emulator's @code{-drive cache=...} option for allowed values.
> >  choose asynchronous I/O mode between @samp{threads} (the default)
> >  and @samp{native} (Linux only).
> >  @item --discard=@var{discard}
> > -toggles whether @dfn{discard} (also known as @dfn{trim} or @dfn{unmap})
> 
> ...then again, later lines are not starting with upper case. Maybe
> that's worth its own patch to make it uniformly consistent?

OK I've posted an updated patch set with the capitalisation fixed as
another patch.

> > +@item --detect-zeroes=@var{detect-zeroes}
> > +enables the automatic conversion of plain zero writes by the OS to driver
> > +specific optimized zero write commands.  @var{detect-zeroes} is one of
> 
> I'd probably write this one as 'driver-specific'

OK I've changed this in the updated patch set (although this makes
things inconsistent with qemu(1)).

-- 
Sitsofe | http://sucs.org/~sits/

