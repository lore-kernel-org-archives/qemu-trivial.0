Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dwkcM-0006Gp-8m
	for mharc-qemu-trivial@gnu.org; Tue, 26 Sep 2017 03:49:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57787)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <otubo@redhat.com>) id 1dwkcJ-0006Ej-F3
	for qemu-trivial@nongnu.org; Tue, 26 Sep 2017 03:49:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <otubo@redhat.com>) id 1dwkcF-0004jd-IX
	for qemu-trivial@nongnu.org; Tue, 26 Sep 2017 03:49:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47026)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <otubo@redhat.com>)
	id 1dwkc5-0004gk-GH; Tue, 26 Sep 2017 03:49:05 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DDFBE91FCE;
	Tue, 26 Sep 2017 07:49:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com DDFBE91FCE
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=otubo@redhat.com
Received: from vader (ovpn-117-76.ams2.redhat.com [10.36.117.76])
	by smtp.corp.redhat.com (Postfix) with SMTP id 27E9860462;
	Tue, 26 Sep 2017 07:48:57 +0000 (UTC)
Date: Tue, 26 Sep 2017 09:48:57 +0200
From: Eduardo Otubo <otubo@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	Zhang Chen <zhangchen.fnst@cn.fujitsu.com>
Message-ID: <20170926074857.GA6415@vader>
References: <cover.1506288070.git.mjt@msgid.tls.msk.ru>
	<CAFEAcA9GtLniZNyO7Uv=vL9HiSBGjvWRYdR-Zi1E+W4N9qiB6A@mail.gmail.com>
	<55782343-4bb4-d5ed-2c5d-4dd0fc5764dd@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <55782343-4bb4-d5ed-2c5d-4dd0fc5764dd@msgid.tls.msk.ru>
User-Agent: Mutt/1.8.3+47 (5f034395e53d) (2017-05-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Tue, 26 Sep 2017 07:49:03 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PULL 00/31] Trivial patches for 2017-09-25
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
X-List-Received-Date: Tue, 26 Sep 2017 07:49:20 -0000

On Tue, Sep 26, 2017 at 08:57:00AM +0300, Michael Tokarev wrote:
> 26.09.2017 02:22, Peter Maydell wrote:
> []
> >> trivial patches for 2017-09-25
> > 
> > This fails 'make check' on most of my configs:
> > 
> >   GTESTER check-qtest-ppc64
> > qemu-system-ppc64: -object
> > filter-mirror,id=qtest-f0,netdev=qtest-bn0,queue=tx,outdev=mirror0:
> > Device 'qtest-bn0' not found
> > Broken pipe
> > GTester: last random seed: R02Sb816ff80b7d08ef6a5328ff373d8cd65
> > 
> > GLib-CRITICAL **: void g_hook_destroy_link(GHookList *, GHook *):
> > assertion `hook != NULL' failed
> > aborting...
> 

That's really weird, I'm pretty sure I did run make check before
sending it. Anyways, thanks for catching this. I'll fix and resend.

> For what it's worth, this time I just _forgot_ to run tests. What a shame..
> 
> It fails due to:
> 
> Author: Eduardo Otubo <otubo@redhat.com>
> Date:   Mon Aug 21 17:50:05 2017 +0200
> 
>     filter-mirror: segfault when specifying non existent device
> 
>     When using filter-mirror like the example below where the interface
>     'ndev0' does not exist on the host, QEMU crashes into segmentation
>     fault.
> 
>      $ qemu-system-x86_64 -S -machine pc -netdev user,id=ndev0 -object filter-mirror,id=test-object,netdev=ndev0
> 
>     This happens because the function filter_mirror_setup() does not checks
>     if the device actually exists and still keep on processing calling
>     qemu_chr_find(). This patch fixes this issue.
> 
>     Signed-off-by: Eduardo Otubo <otubo@redhat.com>
>     Reviewed-by: Zhang Chen <zhangchen.fnst@cn.fujitsu.com>
> 
> Reverting this patch makes it run again. Cc'ing Eduardo.
> 
> I'll remove this patch, patch "hw/isa/pc87312: Mark the device with
> user_creatable = false" (will be replaced with a better variant),
> and update another patch stripping one more trailing whitespace,
> and resend.
> 
> Thanks,
> 
> /mjt

-- 
Eduardo Otubo
Senior Software Engineer @ RedHat

