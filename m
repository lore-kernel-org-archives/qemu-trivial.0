Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XIx21-00029H-By
	for mharc-qemu-trivial@gnu.org; Sun, 17 Aug 2014 05:45:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56185)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1XIx1t-00022d-MT
	for qemu-trivial@nongnu.org; Sun, 17 Aug 2014 05:45:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1XIx1o-0004Qx-PP
	for qemu-trivial@nongnu.org; Sun, 17 Aug 2014 05:45:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:20805)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>)
	id 1XIx1e-0004Lu-JU; Sun, 17 Aug 2014 05:45:22 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s7H9j1WT007224
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Sun, 17 Aug 2014 05:45:01 -0400
Received: from redhat.com (ovpn-116-117.ams2.redhat.com [10.36.116.117])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with SMTP
	id s7H9isqX002061; Sun, 17 Aug 2014 05:44:55 -0400
Date: Sun, 17 Aug 2014 11:45:30 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Luiz Capitulino <lcapitulino@redhat.com>
Message-ID: <20140817094530.GE21143@redhat.com>
References: <1408001361-13580-1-git-send-email-zhang.zhanghailiang@huawei.com>
	<1408001361-13580-3-git-send-email-zhang.zhanghailiang@huawei.com>
	<20140814103010.GE31346@redhat.com>
	<20140815142551.5230d23a@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140815142551.5230d23a@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: kwolf@redhat.com, lkurusa@redhat.com,
	zhanghailiang <zhang.zhanghailiang@huawei.com>,
	qemu-trivial@nongnu.org, jan.kiszka@siemens.com,
	riku.voipio@iki.fi, mjt@tls.msk.ru, qemu-devel@nongnu.org,
	peter.huangpeng@huawei.com, stefanha@redhat.com,
	luonengjun@huawei.com, pbonzini@redhat.com,
	alex.bennee@linaro.org, rth@twiddle.net
Subject: Re: [Qemu-trivial] [PATCH v6 02/10] monitor: fix access freed memory
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
X-List-Received-Date: Sun, 17 Aug 2014 09:45:43 -0000

On Fri, Aug 15, 2014 at 02:25:51PM -0400, Luiz Capitulino wrote:
> On Thu, 14 Aug 2014 12:30:10 +0200
> "Michael S. Tsirkin" <mst@redhat.com> wrote:
> 
> > On Thu, Aug 14, 2014 at 03:29:13PM +0800, zhanghailiang wrote:
> > > The function monitor_fdset_dup_fd_find_remove() references member of 'mon_fdset'
> > > which may be freed in function monitor_fdset_cleanup()
> > > 
> > > Reviewed-by: Gonglei <arei.gonglei@huawei.com>
> > > Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
> > 
> > Id doesn't make sense after fdset is gone.
> > A cleaner way would be return -1 within that remove
> > clause.
> > 
> > --->
> > 
> > monitor: fix use after free
> > 
> > The function monitor_fdset_dup_fd_find_remove() references member of
> > 'mon_fdset' which - when remove flag is set - may be freed in function
> > monitor_fdset_cleanup().
> > remove is set by monitor_fdset_dup_fd_remove which in practice
> > does not need the returned value, so make it void,
> > and return -1 from monitor_fdset_dup_fd_find_remove.
> > 
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> 
> Looks correct to me, can you post as a toplevel patch please?

Done.

> > 
> > ---
> > 
> > diff --git a/include/monitor/monitor.h b/include/monitor/monitor.h
> > index 3d6929d..78a5fc8 100644
> > --- a/include/monitor/monitor.h
> > +++ b/include/monitor/monitor.h
> > @@ -64,7 +64,7 @@ AddfdInfo *monitor_fdset_add_fd(int fd, bool has_fdset_id, int64_t fdset_id,
> >                                  Error **errp);
> >  int monitor_fdset_get_fd(int64_t fdset_id, int flags);
> >  int monitor_fdset_dup_fd_add(int64_t fdset_id, int dup_fd);
> > -int monitor_fdset_dup_fd_remove(int dup_fd);
> > +void monitor_fdset_dup_fd_remove(int dup_fd);
> >  int monitor_fdset_dup_fd_find(int dup_fd);
> >  
> >  #endif /* !MONITOR_H */
> > diff --git a/monitor.c b/monitor.c
> > index 5bc70a6..ef28328 100644
> > --- a/monitor.c
> > +++ b/monitor.c
> > @@ -2541,8 +2541,10 @@ static int monitor_fdset_dup_fd_find_remove(int dup_fd, bool remove)
> >                      if (QLIST_EMPTY(&mon_fdset->dup_fds)) {
> >                          monitor_fdset_cleanup(mon_fdset);
> >                      }
> > +                    return -1;
> > +                } else {
> > +                    return mon_fdset->id;
> >                  }
> > -                return mon_fdset->id;
> >              }
> >          }
> >      }
> > @@ -2554,9 +2556,9 @@ int monitor_fdset_dup_fd_find(int dup_fd)
> >      return monitor_fdset_dup_fd_find_remove(dup_fd, false);
> >  }
> >  
> > -int monitor_fdset_dup_fd_remove(int dup_fd)
> > +void monitor_fdset_dup_fd_remove(int dup_fd)
> >  {
> > -    return monitor_fdset_dup_fd_find_remove(dup_fd, true);
> > +    monitor_fdset_dup_fd_find_remove(dup_fd, true);
> >  }
> >  
> >  int monitor_handle_fd_param(Monitor *mon, const char *fdname)
> > diff --git a/stubs/fdset-remove-fd.c b/stubs/fdset-remove-fd.c
> > index b3886d9..7f6d61e 100644
> > --- a/stubs/fdset-remove-fd.c
> > +++ b/stubs/fdset-remove-fd.c
> > @@ -1,7 +1,6 @@
> >  #include "qemu-common.h"
> >  #include "monitor/monitor.h"
> >  
> > -int monitor_fdset_dup_fd_remove(int dupfd)
> > +void monitor_fdset_dup_fd_remove(int dupfd)
> >  {
> > -    return -1;
> >  }
> > 

