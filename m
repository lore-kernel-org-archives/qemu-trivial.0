Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VKlqR-0000dC-Jh
	for mharc-qemu-trivial@gnu.org; Sat, 14 Sep 2013 05:08:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38927)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rjones@redhat.com>) id 1VKlqK-0007wN-1v
	for qemu-trivial@nongnu.org; Sat, 14 Sep 2013 05:08:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rjones@redhat.com>) id 1VKlnh-000448-3l
	for qemu-trivial@nongnu.org; Sat, 14 Sep 2013 05:06:01 -0400
Received: from mx1.redhat.com ([209.132.183.28]:29325)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rjones@redhat.com>)
	id 1VKlnb-00042V-7A; Sat, 14 Sep 2013 05:05:52 -0400
Received: from int-mx01.intmail.prod.int.phx2.redhat.com
	(int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r8E95mbh006357
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Sat, 14 Sep 2013 05:05:48 -0400
Received: from localhost (vpn1-4-64.ams2.redhat.com [10.36.4.64])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r8E95lOg004552; Sat, 14 Sep 2013 05:05:48 -0400
Date: Sat, 14 Sep 2013 10:05:45 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <20130914090545.GA19209@redhat.com>
References: <1378129416-21762-1-git-send-email-rjones@redhat.com>
	<523422B3.6070908@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <523422B3.6070908@msgid.tls.msk.ru>
User-Agent: Mutt/1.5.20 (2009-12-10)
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.11
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] q35: Fix typo in constant DEFUALT ->
 DEFAULT.
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
X-List-Received-Date: Sat, 14 Sep 2013 09:08:46 -0000

On Sat, Sep 14, 2013 at 12:47:47PM +0400, Michael Tokarev wrote:
> 02.09.2013 17:43, Richard W.M. Jones wrote:
> >From: "Richard W.M. Jones" <rjones@redhat.com>
> >
> >Signed-off-by: Richard W.M. Jones <rjones@redhat.com>
> 
> Thanks, applied to the trivial-patches queue.

Thanks :-)  I case you were wondering, the substring "FUA" was
hindering my searches for SCSI force-unit-access code ...

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
virt-p2v converts physical machines to virtual machines.  Boot with a
live CD or over the network (PXE) and turn machines into KVM guests.
http://libguestfs.org/virt-v2v

