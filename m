Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YFZ4X-0003dO-M1
	for mharc-qemu-trivial@gnu.org; Sun, 25 Jan 2015 21:06:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60789)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alwillia@redhat.com>) id 1YFZ4R-0003co-JP
	for qemu-trivial@nongnu.org; Sun, 25 Jan 2015 21:06:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alwillia@redhat.com>) id 1YFZ4N-0004lr-95
	for qemu-trivial@nongnu.org; Sun, 25 Jan 2015 21:06:31 -0500
Received: from mx4-phx2.redhat.com ([209.132.183.25]:42490)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alwillia@redhat.com>)
	id 1YFZ4N-0004lk-17; Sun, 25 Jan 2015 21:06:27 -0500
Received: from zmail14.collab.prod.int.phx2.redhat.com
	(zmail14.collab.prod.int.phx2.redhat.com [10.5.83.16])
	by mx4-phx2.redhat.com (8.13.8/8.13.8) with ESMTP id t0Q26LqJ012593;
	Sun, 25 Jan 2015 21:06:21 -0500
Date: Sun, 25 Jan 2015 21:06:20 -0500 (EST)
From: Alex Williamson <alex.williamson@redhat.com>
To: Chen Fan <chen.fan.fnst@cn.fujitsu.com>
Message-ID: <1400861803.231065.1422237980435.JavaMail.zimbra@redhat.com>
In-Reply-To: <54C59333.8080005@cn.fujitsu.com>
References: <1421898608-10313-1-git-send-email-chen.fan.fnst@cn.fujitsu.com>
	<54C0B156.3080608@linaro.org> <54C59333.8080005@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.5.82.6]
X-Mailer: Zimbra 8.0.6_GA_5922 (ZimbraWebClient - GC39 (Linux)/8.0.6_GA_5922)
Thread-Topic: vfio: fix wrong initialize vfio_group_list
Thread-Index: S2keycWi3FXTFfxznBujk/VgVs9b4Q==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 209.132.183.25
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Eric Auger <eric.auger@linaro.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] vfio: fix wrong initialize
	vfio_group_list
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
X-List-Received-Date: Mon, 26 Jan 2015 02:06:36 -0000



----- Original Message -----
> CC: qemu-trivial@nongnu.org
> 
> On 01/22/2015 04:14 PM, Eric Auger wrote:
> > Hi Chen,
> >
> > thanks for correcting this mistake I introduced when moving code from
> > pci to common.
> 
> so, can you check in this patch?

I've got it queued up and while it's clearly an error, I don't see that the fix actually changes the resulting code, the parameter is ignored in the macro.  Am I missing something?  If that's the case, I'll include it in my next pull request, but I don't see any pressing reason to rush that request.  Thanks,

Alex

> > On 01/22/2015 04:50 AM, Chen Fan wrote:
> >> Signed-off-by: Chen Fan <chen.fan.fnst@cn.fujitsu.com>
> >> ---
> >>   hw/vfio/common.c | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> >> index cf483ff..e71385e 100644
> >> --- a/hw/vfio/common.c
> >> +++ b/hw/vfio/common.c
> >> @@ -32,7 +32,7 @@
> >>   #include "trace.h"
> >>   
> >>   struct vfio_group_head vfio_group_list =
> >> -    QLIST_HEAD_INITIALIZER(vfio_address_spaces);
> >> +    QLIST_HEAD_INITIALIZER(vfio_group_list);
> >>   struct vfio_as_head vfio_address_spaces =
> >>       QLIST_HEAD_INITIALIZER(vfio_address_spaces);
> >>   
> >>
> >
> 
> 

