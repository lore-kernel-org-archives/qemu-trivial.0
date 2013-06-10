Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Um5Y6-0005FB-BJ
	for mharc-qemu-trivial@gnu.org; Mon, 10 Jun 2013 13:06:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48186)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1Um5Y1-00055p-KG
	for qemu-trivial@nongnu.org; Mon, 10 Jun 2013 13:06:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1Um5Xy-0003ia-I3
	for qemu-trivial@nongnu.org; Mon, 10 Jun 2013 13:06:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39074)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>)
	id 1Um5Xs-0003hB-J4; Mon, 10 Jun 2013 13:06:16 -0400
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r5AH6ELH018188
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 10 Jun 2013 13:06:14 -0400
Received: from redhat.com (vpn1-6-190.ams2.redhat.com [10.36.6.190])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with SMTP
	id r5AH6Agx011643; Mon, 10 Jun 2013 13:06:11 -0400
Date: Mon, 10 Jun 2013 20:06:49 +0300
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
Message-ID: <20130610170649.GA31588@redhat.com>
References: <1370439748-18092-1-git-send-email-hpoussin@reactos.org>
	<51B2E26F.8030106@msgid.tls.msk.ru> <51B563CC.5040907@redhat.com>
	<CAEgOgz6PmZ+gvhH9vVFiVqMvNXOBDn3Y+ny=tW+QHEu-eZ-LcQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEgOgz6PmZ+gvhH9vVFiVqMvNXOBDn3Y+ny=tW+QHEu-eZ-LcQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	=?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH] ioport/memory: check that both .read and
 .write callbacks are defined
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
X-List-Received-Date: Mon, 10 Jun 2013 17:06:28 -0000

On Mon, Jun 10, 2013 at 07:14:45PM +1000, Peter Crosthwaite wrote:
> Hi,
> 
> On Mon, Jun 10, 2013 at 3:27 PM, Gerd Hoffmann <kraxel@redhat.com> wrote:
> >   Hi,
> >
> >> Maybe instead (or in addition to), we should provide a dummy
> >> read or write functions -- instead of fixing each such occurence
> >> to use its own dummy function
> >
> > Makes sense, especially for write where we can just ignore what the
> > guest attempts to write.  Not sure we can have a generic handler for
> > reads.  Maybe two, one which returns 0xff and one which returns 0x00.
> >
> 
> FWIW, I have one in my tree that qemu_log(LOG_GUEST_ERROR's such
> accesses that I use for unimplemented devices. It's worthwhile to trap
> such accesses and speaking for the Xilinx LQSPI case, my preference is
> for some form of failure rather than silent write-ignore. And can we
> have an option where a invalid writes have consistent behavior with
> unassigned accesses?
> 
> Regards,
> Peter

Probably not a good idea. Ignoring unassigned addresses
is very handy for compatibility: we can run new guests
on old qemu and They don't crash or log errors.

> > cheers,
> >   Gerd
> >
> >

