Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b0A72-0003Bn-K5
	for mharc-qemu-trivial@gnu.org; Tue, 10 May 2016 12:02:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58739)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <quentin.casasnovas@oracle.com>) id 1b0A70-00039o-AA
	for qemu-trivial@nongnu.org; Tue, 10 May 2016 12:02:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <quentin.casasnovas@oracle.com>) id 1b0A6x-0006UX-02
	for qemu-trivial@nongnu.org; Tue, 10 May 2016 12:02:18 -0400
Received: from userp1040.oracle.com ([156.151.31.81]:28036)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <quentin.casasnovas@oracle.com>)
	id 1b0A6w-0006UQ-IL; Tue, 10 May 2016 12:02:14 -0400
Received: from userv0022.oracle.com (userv0022.oracle.com [156.151.31.74])
	by userp1040.oracle.com (Sentrion-MTA-4.3.2/Sentrion-MTA-4.3.2) with
	ESMTP id u4AG1sqF013775
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 May 2016 16:01:54 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
	by userv0022.oracle.com (8.14.4/8.13.8) with ESMTP id u4AG1sXV005904
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Tue, 10 May 2016 16:01:54 GMT
Received: from abhmp0009.oracle.com (abhmp0009.oracle.com [141.146.116.15])
	by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id u4AG1rD9001893;
	Tue, 10 May 2016 16:01:53 GMT
Received: from localhost (/10.175.241.84)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Tue, 10 May 2016 09:01:52 -0700
Date: Tue, 10 May 2016 18:04:38 +0200
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
Message-ID: <20160510160438.GD28315@chrystal.uk.oracle.com>
References: <1462524302-15558-1-git-send-email-quentin.casasnovas@oracle.com>
	<5731E99C.3000108@redhat.com>
	<3271D86E-D54C-44FC-9FD6-2E2C51F5FB6D@alex.org.uk>
	<5731FE53.6010602@redhat.com>
	<672ED845-88C6-4C96-B2DC-F4BCBD85F788@alex.org.uk>
	<20160510154545.GB28315@chrystal.uk.oracle.com>
	<592DA6FD-75F8-4B7F-AA21-DEA8D591B723@alex.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <592DA6FD-75F8-4B7F-AA21-DEA8D591B723@alex.org.uk>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Source-IP: userv0022.oracle.com [156.151.31.74]
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
X-List-Received-Date: Tue, 10 May 2016 16:02:19 -0000

On Tue, May 10, 2016 at 04:49:57PM +0100, Alex Bligh wrote:
> 
> On 10 May 2016, at 16:45, Quentin Casasnovas <quentin.casasnovas@oracle.com> wrote:
> 
> > I'm by no mean an expert in this, but why would the kernel break up those
> > TRIM commands?  After all, breaking things up makes sense when the length
> > of the request is big, not that much when it only contains the request
> > header, which is the case for TRIM commands.
> 
> 1. You are assuming that the only reason for limiting the size of operations is
>    limiting the data transferred within one request. That is not necessarily
>    the case. There are good reasons (if only orthogonality) to have limits
>    in place even where no data is transferred.
> 
> 2. As and when the blocksize extension is implemented in the kernel (it isn't
>    now), the protocol requires it.
> 
> 3. The maximum length of an NBD trim operation is 2^32. The maximum length
>    of a trim operation is larger. Therefore the kernel needs to do at least
>    some breaking up.

Alright, I assumed by 'length of an NBD request', the specification was
talking about the length of.. well, the request as opposed to whatever is
in the length field of the request header.

Is there a use case where you'd want to split up a single big TRIM request
in smaller ones (as in some hardware would not support it or something)?
Even then, it looks like this splitting up would be hardware dependant and
better implemented in block device drivers.

I'm just finding odd that something that fits inside the length field can't
be used.  I do agree with your point number 3, obviously if the lenght
field type doesn't allow something bigger than a u32, then the kernel has
to do some breaking up in that case.

Quentin

