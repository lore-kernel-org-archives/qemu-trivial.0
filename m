Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cZPcp-0000v7-SV
	for mharc-qemu-trivial@gnu.org; Thu, 02 Feb 2017 17:13:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59693)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1cZPcn-0000sp-0g
	for qemu-trivial@nongnu.org; Thu, 02 Feb 2017 17:13:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1cZPcl-0001dn-UZ
	for qemu-trivial@nongnu.org; Thu, 02 Feb 2017 17:13:04 -0500
Received: from mx1.redhat.com ([209.132.183.28]:50698)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mst@redhat.com>)
	id 1cZPci-0001YD-H5; Thu, 02 Feb 2017 17:13:00 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7852BC0567B2;
	Thu,  2 Feb 2017 22:13:00 +0000 (UTC)
Received: from redhat.com (ovpn-121-43.rdu2.redhat.com [10.10.121.43] (may be
	forged))
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with SMTP
	id v12MCwmM020216; Thu, 2 Feb 2017 17:12:59 -0500
Date: Fri, 3 Feb 2017 00:12:57 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefan Weil <sw@weilnetz.de>
Cc: Eric Blake <eblake@redhat.com>, Richard Henderson <rth@twiddle.net>,
	qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Message-ID: <20170203000618-mutt-send-email-mst@kernel.org>
References: <20170202195601.11286-1-sw@weilnetz.de>
	<bdfbc0e6-e630-a1ac-5132-24b6a2dd6122@redhat.com>
	<a5309467-337b-2827-489d-2abbce8356e4@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a5309467-337b-2827-489d-2abbce8356e4@weilnetz.de>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Thu, 02 Feb 2017 22:13:00 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] tci: Remove invalid
 assertions
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
X-List-Received-Date: Thu, 02 Feb 2017 22:13:06 -0000

On Thu, Feb 02, 2017 at 09:10:26PM +0100, Stefan Weil wrote:
> Am 02.02.2017 um 21:00 schrieb Eric Blake:
> > On 02/02/2017 01:56 PM, Stefan Weil wrote:
> > > tb_jmp_insn_offset and tb_jmp_reset_offset are pointers
> > > and cannot be used with ARRAY_SIZE.
> > > 
> > > Signed-off-by: Stefan Weil <sw@weilnetz.de>
> > > ---
> > >  tcg/tci/tcg-target.inc.c | 2 --
> > >  1 file changed, 2 deletions(-)
> > 
> > mst posted an alternative patch:
> > https://lists.gnu.org/archive/html/qemu-devel/2017-02/msg00551.html
> 
> 
> Yes, I noticed that, too. It's not obvious that this new
> assertion will be correct, and none of the other targets
> has that kind of assertion. Only two targets use an
> assertion which detects NULL pointers, but NULL pointers
> will result in an abort anyway.
> 
> Do you think that there are reasons why TCI should use
> the assertion suggested by Michael?
> 
> Stefan

You know what this code does and I don't, not really.
I just did a monkey patch guessing at what was intended
(value is used as an array index, so we do a bounds check).

I sent the patch before I saw yours simply to fix the build in a way
that's as unintrusive as possible: args[0] seemed to come from guest so
I thought it might be prudent to do a bounds check.

So feel free to ignore mine. Here's an ack for yours

Acked-by: Michael S. Tsirkin <mst@redhat.com>


-- 
MST

