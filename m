Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XNLjN-0002J4-Cb
	for mharc-qemu-trivial@gnu.org; Fri, 29 Aug 2014 08:56:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56350)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1XNLjH-0002A4-4B
	for qemu-trivial@nongnu.org; Fri, 29 Aug 2014 08:56:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1XNLjC-0002Qg-50
	for qemu-trivial@nongnu.org; Fri, 29 Aug 2014 08:56:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40084)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>)
	id 1XNLj1-0002O9-UR; Fri, 29 Aug 2014 08:56:20 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s7TCtPAG027409
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Fri, 29 Aug 2014 08:55:25 -0400
Received: from localhost (ovpn-116-35.ams2.redhat.com [10.36.116.35])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s7TCtMXX012276; Fri, 29 Aug 2014 08:55:23 -0400
Date: Fri, 29 Aug 2014 08:55:21 -0400
From: Luiz Capitulino <lcapitulino@redhat.com>
To: zhanghailiang <zhang.zhanghailiang@huawei.com>
Message-ID: <20140829085521.788ce268@redhat.com>
In-Reply-To: <5400347A.9040105@huawei.com>
References: <1409138333-12644-1-git-send-email-zhang.zhanghailiang@huawei.com>
	<20140827091827.4de1dc59@redhat.com> <5400347A.9040105@huawei.com>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, luonengjun@huawei.com, lersek@redhat.com,
	qemu-devel@nongnu.org, peter.huangpeng@huawei.com
Subject: Re: [Qemu-trivial] [PATCH] dump: let dump_error printf the error
	reason
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
X-List-Received-Date: Fri, 29 Aug 2014 12:56:40 -0000

On Fri, 29 Aug 2014 16:06:18 +0800
zhanghailiang <zhang.zhanghailiang@huawei.com> wrote:

> On 2014/8/27 21:18, Luiz Capitulino wrote:
> > On Wed, 27 Aug 2014 19:18:53 +0800
> > zhanghailiang<zhang.zhanghailiang@huawei.com>  wrote:
> >
> >> The second parameter of dump_error is unused, but one purpose of
> >> using this function is to report the error info.
> >>
> >> Signed-off-by: zhanghailiang<zhang.zhanghailiang@huawei.com>
> >> ---
> >>   dump.c | 3 +++
> >>   1 file changed, 3 insertions(+)
> >>
> >> diff --git a/dump.c b/dump.c
> >> index 71d3e94..0f44e9d 100644
> >> --- a/dump.c
> >> +++ b/dump.c
> >> @@ -83,6 +83,9 @@ static int dump_cleanup(DumpState *s)
> >>
> >>   static void dump_error(DumpState *s, const char *reason)
> >>   {
> >> +    if (reason) {
> >> +        error_report("%s", reason);
> >> +    }
> >>       dump_cleanup(s);
> >>   }
> >>
> >
> > Good catch, but error_report() will report the error only to the user. This
> > is QMP code, so we have to use the Error API.
> >
> > I think that the best way to solve this is to make dump_error() fill an
> > Error object (eg. by calling error_setg()) and then returning it after
> > the call to dump_cleanup(). Of course that you will have to change _all_
> > code paths calling dump_error() to propagate the error up.
> >
> > For more information on this, please read docs/writing-qmp-commands.txt.
> > You can also take a look at simple commands doing error propagation, like
> > qmp_cont() or qmp_block_passwd().
> >
> > .
> >
> Hi,
> 
> Thanks for your review.
> 
> Actually, for all paths that call dump_error, at last they will come into a
> common path which will call error_setg().
> 
> The call process as below:
> qmp_dump_guest_memory
> (1)	-->create_kdump_vmcore
> 		-->write_start_flat_header
> 			-->dump_error
> 		-->write_end_flat_header
> 			-->dump_error
> 		...
>          -->error_set(errp, QERR_IO_ERROR)(if create_kdump_vmcore failed)
> (2)	-->create_vmcore
> 		-->dump_begin
> 			-->write_elf64_header
> 				-->dump_error
> 			-->write_elf64_note
> 				-->dump_error
> 			...
> 		-->dump_iterate
> 			-->write_data
> 				-->dump_error
> 			...
> 	-->error_set(errp, QERR_IO_ERROR)(if create_kdump_vmcore failed)
> 
> And a short *IO ERROR* info will be returned to the caller of qmp_dump_guest_memory.
> 
> So, is it OK in dump_error just report the detailed error info to users
> (actually, it will be stored in qemu log)? Or should these error info
> also returned to the caller?

The errors should be propagated up to the caller. This way they can be
consumed by QMP and HMP.

> 
> What's your suggestion? Thanks.:)
> 
> Best Regards,
> zhanghailiang
> 
> 
> 
> 


