Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1drjQV-0005rZ-QC
	for mharc-qemu-trivial@gnu.org; Tue, 12 Sep 2017 07:32:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54789)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1drjQO-0005nJ-HV
	for qemu-trivial@nongnu.org; Tue, 12 Sep 2017 07:32:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1drjQN-0006R3-Jj
	for qemu-trivial@nongnu.org; Tue, 12 Sep 2017 07:32:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47606)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kwolf@redhat.com>)
	id 1drjQL-0006Ph-HZ; Tue, 12 Sep 2017 07:32:13 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 995663680E;
	Tue, 12 Sep 2017 11:32:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 995663680E
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=kwolf@redhat.com
Received: from localhost.localdomain (ovpn-117-138.ams2.redhat.com
	[10.36.117.138])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D598977DD6;
	Tue, 12 Sep 2017 11:32:06 +0000 (UTC)
Date: Tue, 12 Sep 2017 13:32:05 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: "Richard W.M. Jones" <rjones@redhat.com>
Cc: qemu-devel@nongnu.org, armbru@redhat.com, famz@redhat.com,
	qemu-trivial@nongnu.org, mjt@tls.msk.ru, berrange@redhat.com
Message-ID: <20170912113205.GG29136@localhost.localdomain>
References: <20170906085006.26983-1-rjones@redhat.com>
	<20170906101905.GD3753@dhcp-200-186.str.redhat.com>
	<20170906104451.GM20914@redhat.com>
	<20170906113845.GE3753@dhcp-200-186.str.redhat.com>
	<20170912094558.GO20914@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170912094558.GO20914@redhat.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Tue, 12 Sep 2017 11:32:12 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH for-2.10] qemu-options: Document the
 -drive locking parameter.
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
X-List-Received-Date: Tue, 12 Sep 2017 11:32:20 -0000

Am 12.09.2017 um 11:45 hat Richard W.M. Jones geschrieben:
> On Wed, Sep 06, 2017 at 01:38:45PM +0200, Kevin Wolf wrote:
> > This command line fragment looks correct to me. For me, it seems to
> > work. I'm starting a first qemu in the background with default locking
> > options:
> > 
> >     $ x86_64-softmmu/qemu-system-x86_64 -hda /tmp/test.qcow2
> > 
> > And then starting a second one with a command line resembling yours:
> > 
> >     $ x86_64-softmmu/qemu-system-x86_64 -device virtio-scsi \
> >       -drive file=/tmp/test.qcow2,cache=unsafe,format=qcow2,file.locking=off,id=hd0,if=none \
> >       -device scsi-hd,drive=hd0
> 
> The problem is with overlays, where file.locking doesn't propagate to
> the backing file.  Thus:
> 
>   $ qemu-system-x86_64 -drive file=backing,format=raw
> 
> while in another terminal:
> 
>   $ qemu-img create -b backing -f qcow2 overlay
>   $ qemu-system-x86_64 -drive file=overlay,format=qcow2,file.locking=off
>   qemu-system-x86_64: Failed to get shared "write" lock
>   Is another process using the image?

locking=off isn't the right tool for the case. Try this:

$ qemu-system-x86_64 -drive file=overlay,if=none -device virtio-blk-pci,drive=none0,share-rw=on

Unless you're doing really evil things, just telling qemu that your
guest can cope with concurrent writers to the same image is enough. This
propagates through the whole chain as appropriate.

Kevin

