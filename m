Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ws82N-0002op-2v
	for mharc-qemu-trivial@gnu.org; Wed, 04 Jun 2014 06:03:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39860)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1Ws82E-0002nl-AJ
	for qemu-trivial@nongnu.org; Wed, 04 Jun 2014 06:03:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1Ws826-0000Dj-QT
	for qemu-trivial@nongnu.org; Wed, 04 Jun 2014 06:03:06 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59436)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>)
	id 1Ws826-0000DH-J5; Wed, 04 Jun 2014 06:02:58 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s54A1rLN007031
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Wed, 4 Jun 2014 06:01:53 -0400
Received: from work-vm (vpn1-7-57.ams2.redhat.com [10.36.7.57])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s54A1n7T026266
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NO);
	Wed, 4 Jun 2014 06:01:51 -0400
Date: Wed, 4 Jun 2014 11:01:49 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Chen Gang <gang.chen.5i5j@gmail.com>
Message-ID: <20140604100148.GC2618@work-vm>
References: <538C6F98.5070005@gmail.com> <538D79D4.5000900@huawei.com>
	<538DD187.5050400@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <538DD187.5050400@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: ChenLiang <chenliang88@huawei.com>, quintela@redhat.com,
	QEMU Trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>,
	QEMU Developers <qemu-devel@nongnu.org>, arei.gonglei@huawei.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH-trivial] arch_init.c: Always
 be sure that 'encoded_buf' and 'current_buf' are lock protected
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
X-List-Received-Date: Wed, 04 Jun 2014 10:03:14 -0000

* Chen Gang (gang.chen.5i5j@gmail.com) wrote:
> 
> Firstly, thank you very much for reviewing the related 2 patches.
> 
> On 06/03/2014 03:31 PM, ChenLiang wrote:
> > On 2014/6/2 20:35, Chen Gang wrote:
> > 
> >> 'encoded_buf' and 'current_buf' are lock protected during using in
> >> save_xbzrle_page() in ram_save_page(), and during freeing in
> >> migration_end().
> >>
> >> So recommend to let them lock protected during starting, just like we
> >> have done to 'cache'.

This isn't one for Trivial - it needs some thought.  Locks always need thought.

> >> Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
> >> ---
> >>  arch_init.c | 4 +++-
> >>  1 file changed, 3 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/arch_init.c b/arch_init.c
> >> index 23044c1..784922c 100644
> >> --- a/arch_init.c
> >> +++ b/arch_init.c
> >> @@ -783,12 +783,12 @@ static int ram_save_setup(QEMUFile *f, void *opaque)
> >>              error_report("Error creating cache");
> >>              return -1;
> >>          }
> >> -        XBZRLE_cache_unlock();
> >>
> >>          /* We prefer not to abort if there is no memory */
> >>          XBZRLE.encoded_buf = g_try_malloc0(TARGET_PAGE_SIZE);
> >>          if (!XBZRLE.encoded_buf) {
> >>              error_report("Error allocating encoded_buf");
> >> +            XBZRLE_cache_unlock();
> >>              return -1;
> >>          }
> >>
> >> @@ -797,8 +797,10 @@ static int ram_save_setup(QEMUFile *f, void *opaque)
> >>              error_report("Error allocating current_buf");
> >>              g_free(XBZRLE.encoded_buf);
> >>              XBZRLE.encoded_buf = NULL;
> >> +            XBZRLE_cache_unlock();
> >>              return -1;
> >>          }
> >> +        XBZRLE_cache_unlock();
> >>
> >>          acct_clear();
> >>      }
> > 
> > 
> > It isn't necessary.
> > 
> 
> For me, it is still necessary to be improved.
> 
>  - If this code is not performance sensitive:
> 
>    "always lock protected" will let source code easy understanding for
>    readers, and easy sustainable for maintainers.
> 
>  - Else (performance sensitive):
> 
>    Need give related comments to it (e.g. for performance reason, let it
>    out of lock protected). So readers easily understand, and the related
>    maintainers may notice about it at any time.
> 
>      It is not good to give comments in a function, except the code is
>      not used in normal way.

I think the locks for the cache were originally there to handle the race
between a resize (on the main thread) against the use (in the migration thread).
That doesn't happen for the encoded_buf so I don't think we have that problem.

Is there any other case that it could race?
I can't see one - I think all of the other start/end is done within the migration
thread.

Dave
> 
> 
> Thanks.
> -- 
> Chen Gang
> 
> Open, share, and attitude like air, water, and life which God blessed
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

