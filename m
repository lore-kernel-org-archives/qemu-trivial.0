Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XyX2T-0008BI-Qh
	for mharc-qemu-trivial@gnu.org; Tue, 09 Dec 2014 21:30:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56990)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <amit.shah@redhat.com>) id 1XyX2N-00089b-Ff
	for qemu-trivial@nongnu.org; Tue, 09 Dec 2014 21:30:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <amit.shah@redhat.com>) id 1XyX2I-0000LG-KR
	for qemu-trivial@nongnu.org; Tue, 09 Dec 2014 21:29:59 -0500
Received: from mx1.redhat.com ([209.132.183.28]:51753)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <amit.shah@redhat.com>)
	id 1XyX2I-0000Kx-DN; Tue, 09 Dec 2014 21:29:54 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id sBA2Ti5E023350
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Tue, 9 Dec 2014 21:29:44 -0500
Received: from localhost (ovpn-113-89.phx2.redhat.com [10.3.113.89])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sBA2TgEQ031747; Tue, 9 Dec 2014 21:29:43 -0500
Date: Wed, 10 Dec 2014 07:59:37 +0530
From: Amit Shah <amit.shah@redhat.com>
To: Eric Blake <eblake@redhat.com>
Message-ID: <20141210022937.GA6189@grmbl.mre>
References: <1418107117-9892-1-git-send-email-zhang.zhanghailiang@huawei.com>
	<548716A9.3040009@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <548716A9.3040009@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, peter.huangpeng@huawei.com, qemu-devel@nongnu.org,
	zhanghailiang <zhang.zhanghailiang@huawei.com>, lcapitulino@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qmp-command.hx: add missing
 docs for migration capabilites
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
X-List-Received-Date: Wed, 10 Dec 2014 02:30:04 -0000

On (Tue) 09 Dec 2014 [08:35:05], Eric Blake wrote:
> On 12/08/2014 11:38 PM, zhanghailiang wrote:
> > Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
> > ---
> >  qmp-commands.hx | 6 ++++++
> >  1 file changed, 6 insertions(+)
> 
> 
> >  - "xbzrle": XBZRLE support
> > +- "rdma-pin-all": pin all pages when use of RDMA during migration
> 
> s/use of/using/
> 
> With the grammar fix,
> Reviewed-by: Eric Blake <eblake@redhat.com>

Fixed and applied.

Thanks,

		Amit

