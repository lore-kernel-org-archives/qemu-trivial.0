Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XJTNJ-0006VR-6W
	for mharc-qemu-trivial@gnu.org; Mon, 18 Aug 2014 16:17:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46971)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1XJTNC-0006Lk-Ve
	for qemu-trivial@nongnu.org; Mon, 18 Aug 2014 16:17:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1XJTN8-000084-LY
	for qemu-trivial@nongnu.org; Mon, 18 Aug 2014 16:17:46 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43168)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>)
	id 1XJTMz-00005j-KE; Mon, 18 Aug 2014 16:17:33 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s7IKHKOZ020988
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Mon, 18 Aug 2014 16:17:20 -0400
Received: from redhat.com (ovpn-116-37.ams2.redhat.com [10.36.116.37])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with SMTP
	id s7IKHFCt018621; Mon, 18 Aug 2014 16:17:16 -0400
Date: Mon, 18 Aug 2014 22:17:52 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Riku Voipio <riku.voipio@iki.fi>
Message-ID: <20140818201752.GC1121@redhat.com>
References: <1408001361-13580-1-git-send-email-zhang.zhanghailiang@huawei.com>
	<1408001361-13580-8-git-send-email-zhang.zhanghailiang@huawei.com>
	<20140814133135.GB30317@afflict.kos.to>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140814133135.GB30317@afflict.kos.to>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: kwolf@redhat.com, lkurusa@redhat.com,
	zhanghailiang <zhang.zhanghailiang@huawei.com>,
	qemu-trivial@nongnu.org, jan.kiszka@siemens.com, mjt@tls.msk.ru,
	qemu-devel@nongnu.org, peter.huangpeng@huawei.com,
	stefanha@redhat.com, luonengjun@huawei.com, pbonzini@redhat.com,
	lcapitulino@redhat.com, alex.bennee@linaro.org, rth@twiddle.net
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v6 07/10] linux-user: check
 return value of malloc()
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
X-List-Received-Date: Mon, 18 Aug 2014 20:17:51 -0000

On Thu, Aug 14, 2014 at 04:31:35PM +0300, Riku Voipio wrote:
> On Thu, Aug 14, 2014 at 03:29:18PM +0800, zhanghailiang wrote:
> > Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
> > Acked-by: Riku Voipio <riku.voipio@linaro.org>
> 
> Applied to linux-user as Michael seemed wary of passing these via
> trivial.
> 
> Riku

Pls remember to add Cc qemu-trivial on bugfixes in your tree.


> >---
> >  linux-user/syscall.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> > index a50229d..8e5ccf1 100644
> > --- a/linux-user/syscall.c
> > +++ b/linux-user/syscall.c
> > @@ -2870,6 +2870,10 @@ static inline abi_long do_msgsnd(int msqid, abi_long msgp,
> >      if (!lock_user_struct(VERIFY_READ, target_mb, msgp, 0))
> >          return -TARGET_EFAULT;
> >      host_mb = malloc(msgsz+sizeof(long));
> > +    if (!host_mb) {
> > +        unlock_user_struct(target_mb, msgp, 0);
> > +        return -TARGET_ENOMEM;
> > +    }
> >      host_mb->mtype = (abi_long) tswapal(target_mb->mtype);
> >      memcpy(host_mb->mtext, target_mb->mtext, msgsz);
> >      ret = get_errno(msgsnd(msqid, host_mb, msgsz, msgflg));
> > -- 
> > 1.7.12.4
> > 
> > 

