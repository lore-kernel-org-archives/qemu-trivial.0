Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b0ATQ-0002qy-5S
	for mharc-qemu-trivial@gnu.org; Tue, 10 May 2016 12:25:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37567)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <quentin.casasnovas@oracle.com>) id 1b0ATM-0002mE-PR
	for qemu-trivial@nongnu.org; Tue, 10 May 2016 12:25:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <quentin.casasnovas@oracle.com>) id 1b0ATG-0004ez-LY
	for qemu-trivial@nongnu.org; Tue, 10 May 2016 12:25:23 -0400
Received: from userp1040.oracle.com ([156.151.31.81]:44340)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <quentin.casasnovas@oracle.com>)
	id 1b0ATG-0004en-9w; Tue, 10 May 2016 12:25:18 -0400
Received: from aserv0022.oracle.com (aserv0022.oracle.com [141.146.126.234])
	by userp1040.oracle.com (Sentrion-MTA-4.3.2/Sentrion-MTA-4.3.2) with
	ESMTP id u4AGP633015103
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 10 May 2016 16:25:07 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
	by aserv0022.oracle.com (8.13.8/8.13.8) with ESMTP id u4AGP53r014593
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 10 May 2016 16:25:06 GMT
Received: from abhmp0009.oracle.com (abhmp0009.oracle.com [141.146.116.15])
	by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id u4AGP4qr017845;
	Tue, 10 May 2016 16:25:05 GMT
Received: from localhost (/10.175.241.84)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Tue, 10 May 2016 09:25:04 -0700
Date: Tue, 10 May 2016 18:27:50 +0200
From: Quentin Casasnovas <quentin.casasnovas@oracle.com>
To: Alex Bligh <alex@alex.org.uk>
Cc: Quentin Casasnovas <quentin.casasnovas@oracle.com>,
	Eric Blake <eblake@redhat.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"nbd-general@lists.sourceforge.net" <nbd-general@lists.sourceforge.net>,
	"qemu-stable@nongnu.org" <qemu-stable@nongnu.org>,
	qemu block <qemu-block@nongnu.org>
Message-ID: <20160510162750.GE28315@chrystal.uk.oracle.com>
References: <1462524302-15558-1-git-send-email-quentin.casasnovas@oracle.com>
	<5731E99C.3000108@redhat.com>
	<3271D86E-D54C-44FC-9FD6-2E2C51F5FB6D@alex.org.uk>
	<5731FE53.6010602@redhat.com>
	<672ED845-88C6-4C96-B2DC-F4BCBD85F788@alex.org.uk>
	<20160510154545.GB28315@chrystal.uk.oracle.com>
	<592DA6FD-75F8-4B7F-AA21-DEA8D591B723@alex.org.uk>
	<20160510160438.GD28315@chrystal.uk.oracle.com>
	<8F0007CD-40E2-43C1-8196-B4BE401B8EF4@alex.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8F0007CD-40E2-43C1-8196-B4BE401B8EF4@alex.org.uk>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Source-IP: aserv0022.oracle.com [141.146.126.234]
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 156.151.31.81
Subject: Re: [Qemu-trivial] [Nbd] [Qemu-devel] [PATCH] nbd: fix trim/discard
 commands with a length bigger than NBD_MAX_BUFFER_SIZE
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
X-List-Received-Date: Tue, 10 May 2016 16:25:26 -0000

On Tue, May 10, 2016 at 05:23:21PM +0100, Alex Bligh wrote:
> 
> On 10 May 2016, at 17:04, Quentin Casasnovas <quentin.casasnovas@oracle.com> wrote:
> 
> > Alright, I assumed by 'length of an NBD request', the specification was
> > talking about the length of.. well, the request as opposed to whatever is
> > in the length field of the request header.
> 
> With NBD_CMD_TRIM the length in the header field is 32 bit and specifies
> the length of data to trim, not the length of the data transferred (which
> is none).
> 
> > Is there a use case where you'd want to split up a single big TRIM request
> > in smaller ones (as in some hardware would not support it or something)?
> > Even then, it looks like this splitting up would be hardware dependant and
> > better implemented in block device drivers.
> 
> Part of the point of the block size extension is to push such limits to the
> client.
> 
> I could make up use cases (e.g. that performing a multi-gigabyte trim in
> a single threaded server will effectively block all other I/O), but the
> main reason in my book is orthogonality, and the fact the client needs
> to do some breaking up anyway.
> 
> > I'm just finding odd that something that fits inside the length field can't
> > be used.
> 
> That's a different point. That's Qemu's 'Denial of Service Attack'
> prevention, *not* maximum block sizes. It isn't dropping it because
> of a maximum block size parameter. If it doesn't support the block size
> extension which the version you're looking at does not, it's meant
> to handle requests up to 2^32-1 long EXCEPT that it MAY error requests
> so long as to cause a denial of service attack. As this doesn't fit
> into that case (it's a TRIM), it shouldn't be erroring it on that grounds.
> 
> I agree Qemu should fix that.
> 
> (So in a sense Eric and I are arguing about something irrelevant to
> your current problem, which is how this would work /with/ the block
> size extensions, as Eric is in the process of implementing them).
> 

Riight!  OK understood, thanks for the explanation.

Quentin

