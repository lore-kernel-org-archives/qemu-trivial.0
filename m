Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eyT9u-00036c-P4
	for mharc-qemu-trivial@gnu.org; Tue, 20 Mar 2018 22:07:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58280)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1eyT9s-00035R-S8
	for qemu-trivial@nongnu.org; Tue, 20 Mar 2018 22:07:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1eyT9s-0001BO-3q
	for qemu-trivial@nongnu.org; Tue, 20 Mar 2018 22:07:20 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:35058 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <famz@redhat.com>)
	id 1eyT9n-0001B2-E8; Tue, 20 Mar 2018 22:07:15 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 15EFA402664E;
	Wed, 21 Mar 2018 02:07:15 +0000 (UTC)
Received: from localhost (ovpn-12-80.pek2.redhat.com [10.72.12.80])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1562E10EE963;
	Wed, 21 Mar 2018 02:07:11 +0000 (UTC)
Date: Wed, 21 Mar 2018 10:07:09 +0800
From: Fam Zheng <famz@redhat.com>
To: Marcel Apfelbaum <marcel@redhat.com>
Cc: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org, Yuval Shaia <yuval.shaia@oracle.com>
Message-ID: <20180321020709.GA16095@lemon.usersys.redhat.com>
References: <20180319215335.1119213-1-eblake@redhat.com>
	<56ec7ba5-a6e1-2268-3313-8babc640c024@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <56ec7ba5-a6e1-2268-3313-8babc640c024@redhat.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Wed, 21 Mar 2018 02:07:15 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Wed, 21 Mar 2018 02:07:15 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'famz@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [PATCH for-2.12] rdma: Fix 32-bit compilation
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
X-List-Received-Date: Wed, 21 Mar 2018 02:07:21 -0000

On Tue, 03/20 12:30, Marcel Apfelbaum wrote:
> Hi Eric,
> 
> On 19/03/2018 23:53, Eric Blake wrote:
> > Use the correct printf formats, so that a 32-bit compile doesn't
> > spit out lots of warnings about %lx being incompatible with uint64_t.
> > Broken since initial commit ef6d4ccd.
> > 
> > Signed-off-by: Eric Blake <eblake@redhat.com>
> > ---
> > 
> > I don't know if 'make vm-build-ubuntu.i368' would catch this (it failed
> > for me for other reasons); I found it via a 32-bit rawhide VM.
> > 
> 
> I couldn't run 'make vm-build-ubuntu.i368' either. (Stuck on "Booting from Hard Disk...")

I tried this now and it works for me. Could you delete "$HOME/.cache/qemu-vm"
and do it again from a git tree, then pastbin the full log?

Fam

