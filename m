Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SAQGW-0008G2-Ol
	for mharc-qemu-trivial@gnu.org; Wed, 21 Mar 2012 14:28:08 -0400
Received: from eggs.gnu.org ([208.118.235.92]:35976)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1SAQGQ-0008EE-1U
	for qemu-trivial@nongnu.org; Wed, 21 Mar 2012 14:28:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1SAQGO-0003pd-AE
	for qemu-trivial@nongnu.org; Wed, 21 Mar 2012 14:28:01 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46214)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>)
	id 1SAQGO-0003pJ-2j; Wed, 21 Mar 2012 14:28:00 -0400
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q2LIRtHS017454
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 21 Mar 2012 14:27:55 -0400
Received: from redhat.com (vpn-201-23.tlv.redhat.com [10.35.201.23])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with SMTP
	id q2LIRqKV001447; Wed, 21 Mar 2012 14:27:53 -0400
Date: Wed, 21 Mar 2012 20:28:11 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Anthony Liguori <anthony@codemonkey.ws>
Message-ID: <20120321182810.GA25289@redhat.com>
References: <CAJSP0QU4azkZic4GM++uXtj91b_vdXT=TETXTr1AD0qXxii28A@mail.gmail.com>
	<20120320101947.GA19542@truffala.fritz.box>
	<20120321112615.GA15090@stefanha-thinkpad.localdomain>
	<20120321130852.GC21467@redhat.com>
	<4F69E8E1.8050004@codemonkey.ws>
	<20120321151043.GA22707@redhat.com>
	<4F69F05B.5010500@codemonkey.ws>
	<20120321161155.GA23460@redhat.com> <4F6A014A.90704@codemonkey.ws>
	<4F6A02D1.9060404@codemonkey.ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4F6A02D1.9060404@codemonkey.ws>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Rusty Russell <rusty@rustcorp.com.au>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Remove PCI class code from
 virtio balloon device
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
X-List-Received-Date: Wed, 21 Mar 2012 18:28:07 -0000

On Wed, Mar 21, 2012 at 11:33:21AM -0500, Anthony Liguori wrote:
> On 03/21/2012 11:26 AM, Anthony Liguori wrote:
> >On 03/21/2012 11:11 AM, Michael S. Tsirkin wrote:
> >>Frankly I don't see value in making it visible to the user,
> >>at all. We are just triggering windows reactivations
> >>without any user benefit. Why not return a fixed value there
> >>to avoid that?
> >
> >I don't see a problem making it fixed for 1.1, but for 1.0 and older, we should
> >expose what we were supposed to expose.
> >
> >We need to fix the bug first, then we can change the behavior.
> 
> In some cases, like USB, we really do want to expose a version,

why, exactly?

> but
> we should probably only expose the major version, for instance, QEMU
> 1.x or 2.x.  This would only be exposed by the appropriate machine
> types.
> 
> Regards,
> 
> Anthony Liguori
> 
> >
> >Regards,
> >
> >Anthony Liguori
> >
> >>
> >>>>>>
> >>>>>>
> >
> >

