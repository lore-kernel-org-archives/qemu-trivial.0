Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WQx89-0006bb-GP
	for mharc-qemu-trivial@gnu.org; Fri, 21 Mar 2014 06:56:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35139)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1WQx83-0006ZT-S2
	for qemu-trivial@nongnu.org; Fri, 21 Mar 2014 06:56:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1WQx7z-0005d3-Om
	for qemu-trivial@nongnu.org; Fri, 21 Mar 2014 06:56:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:25504)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>)
	id 1WQx7z-0005bx-GF; Fri, 21 Mar 2014 06:56:43 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s2LAud5f017468
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 21 Mar 2014 06:56:39 -0400
Received: from nial.usersys.redhat.com (dhcp-1-126.brq.redhat.com
	[10.34.1.126])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s2LAuafr009841; Fri, 21 Mar 2014 06:56:36 -0400
Date: Fri, 21 Mar 2014 11:56:34 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <20140321115634.2a909acd@nial.usersys.redhat.com>
In-Reply-To: <532B157A.7000601@msgid.tls.msk.ru>
References: <1394098765-12727-1-git-send-email-imammedo@redhat.com>
	<532B157A.7000601@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: kwolf@redhat.com, stefanha@redhat.com, qemu-trivial@nongnu.org,
	coreyb@linux.vnet.ibm.com, qemu-devel@nongnu.org,
	mreitz@redhat.com, aliguori@amazon.com, pbonzini@redhat.com,
	lcapitulino@redhat.com, lersek@redhat.com, afaerber@suse.de
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v4 0/2] convert -m to
 QemuOpts
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
X-List-Received-Date: Fri, 21 Mar 2014 10:56:52 -0000

On Thu, 20 Mar 2014 20:21:14 +0400
Michael Tokarev <mjt@tls.msk.ru> wrote:

> 06.03.2014 13:39, Igor Mammedov wrote:
> > Igor Mammedov (1):
> >   vl: convert -m to QemuOpts
> 
> This patch (2/2) was mime-damaged, I had to edit it manually
> in order for it to apply.  Please take a look at
> http://git.corpit.ru/?p=qemu.git;a=shortlog;h=refs/heads/trivial-patches-next
> to verify it's okay.
I'm sorry for not providing link to git repo to pull from.
I can't check because it looks like site is unreachable from my place.

here is git tree with patch rebased on top of today's tree to compare with/pull from:
https://github.com/imammedo/qemu/commits/qoptify-m.v4

https://github.com/imammedo/qemu/commit/548b68295bf4967b1dd950f6d84a88b782f17f41

Thanks,
 Igor

> 
> Applied to -trivial.
> 
> Thanks,
> 
> /mjt
> 


