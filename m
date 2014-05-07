Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Whr7W-0001sN-Qn
	for mharc-qemu-trivial@gnu.org; Tue, 06 May 2014 21:58:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60317)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1Whr7Q-0001jt-Ag
	for qemu-trivial@nongnu.org; Tue, 06 May 2014 21:58:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1Whr7L-00026b-3y
	for qemu-trivial@nongnu.org; Tue, 06 May 2014 21:58:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47939)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>)
	id 1Whr77-00023X-Uh; Tue, 06 May 2014 21:57:42 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s471veGX003672
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Tue, 6 May 2014 21:57:41 -0400
Received: from localhost (dhcp-14-247.nay.redhat.com [10.66.14.247])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s471vdZ4032734; Tue, 6 May 2014 21:57:40 -0400
Date: Wed, 7 May 2014 09:57:52 +0800
From: Fam Zheng <famz@redhat.com>
To: Eric Blake <eblake@redhat.com>
Message-ID: <20140507015752.GH1574@T430.nay.redhat.com>
References: <1399341953-14387-1-git-send-email-famz@redhat.com>
	<53698CBA.7040901@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <53698CBA.7040901@redhat.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-trivial@nongnu.org,
	Luiz Capitulino <lcapitulino@redhat.com>, qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] qapi: Document optional
 arguments' backwards compatibility
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
X-List-Received-Date: Wed, 07 May 2014 01:58:05 -0000

On Tue, 05/06 19:30, Eric Blake wrote:
> On 05/05/2014 08:05 PM, Fam Zheng wrote:
> > Signed-off-by: Fam Zheng <famz@redhat.com>
> > 
> > ---
> > v2: Employ the text suggested by Eric. (Thanks!)
> 
> Since much of it is my wording, it's probably better to credit me as an
> author, by adding:
> 
> Signed-off-by: Eric Blake <eblake@redhat.com>

Gladly!

> 
> > 
> > Signed-off-by: Fam Zheng <famz@redhat.com>
> > ---
> >  docs/qapi-code-gen.txt | 26 ++++++++++++++++++++++----
> >  1 file changed, 22 insertions(+), 4 deletions(-)
> > 
> > +The use of '*' as a prefix to the name means the member is optional.
> > +
> > +The default initialization value of an optional argument should not be changed
> > +between versions of QEMU unless the new default maintains backward
> > +compatibility to the user-visible behavior of the old default.
> 
> Maybe worth adding:
> 
> With proper documentation, this policy still allows some flexibility;
> for example, documenting that a default of 0 picks an optimal buffer
> size allows one release to declare the optimal size at 512 while another
> release declares the optimal size at 4096 - the user-visible behavior is
> not the bytes used by the buffer, but the fact that the buffer was
> optimal size.

OK, will add this and your s-o-b in V3.

Thanks,
Fam

> 
> > +
> > +On input structures (only mentioned in the 'data' side of a command), changing
> > +from mandatory to optional is safe (older clients will supply the option, and
> > +newer clients can benefit from the default); changing from optional to
> > +mandatory is backwards incompatible (older clients may be omitting the option,
> > +and must continue to work).
> > +
> > +On output structures (only mentioned in the 'returns' side of a command),
> > +changing from mandatory to optional is in general unsafe (older clients may be
> > +expecting the field, and could crash if it is missing), although it can be done
> > +if the only way that the optional argument will be omitted is when it is
> > +triggered by the presence of a new input flag to the command that older clients
> > +don't know to send.  Changing from optional to mandatory is safe.
> > +
> > +A structure that is used in both input and output of various commands
> > +must consider the backwards compatibility constraints of both directions
> > +of use.
> 
> 
> -- 
> Eric Blake   eblake redhat com    +1-919-301-3266
> Libvirt virtualization library http://libvirt.org
> 



