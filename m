Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hBOtH-00083x-5f
	for mharc-qemu-trivial@gnu.org; Tue, 02 Apr 2019 15:16:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48025)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1hBOtE-000830-Jc
	for qemu-trivial@nongnu.org; Tue, 02 Apr 2019 15:16:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1hBOtD-0001hJ-L1
	for qemu-trivial@nongnu.org; Tue, 02 Apr 2019 15:16:08 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43608)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1hBOtB-0001cY-Ek; Tue, 02 Apr 2019 15:16:05 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 04EEC308338F;
	Tue,  2 Apr 2019 19:16:04 +0000 (UTC)
Received: from localhost (ovpn-116-20.gru2.redhat.com [10.97.116.20])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8912760851;
	Tue,  2 Apr 2019 19:16:03 +0000 (UTC)
Date: Tue, 2 Apr 2019 16:16:02 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Markus Armbruster <armbru@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	Like Xu <like.xu@linux.intel.com>, Thomas Huth <thuth@redhat.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20190402191602.GE22884@habkost.net>
References: <1554194900-22817-1-git-send-email-like.xu@linux.intel.com>
	<871s2kejg1.fsf@dusky.pond.sub.org>
	<e72befe5-c931-5c80-6769-12e1a8e7d4fa@linux.intel.com>
	<20190402174749.71da1efe@redhat.com>
	<871s2k8jxo.fsf@dusky.pond.sub.org>
	<CAFEAcA8ogWn50wWBttM2QpfQoZ8UYnXfG3NSkuSc8j8WOWt6FA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA8ogWn50wWBttM2QpfQoZ8UYnXfG3NSkuSc8j8WOWt6FA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Tue, 02 Apr 2019 19:16:04 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] vl.c: make
 current_machine as non-global variable
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
X-List-Received-Date: Tue, 02 Apr 2019 19:16:09 -0000

On Tue, Apr 02, 2019 at 11:23:42PM +0700, Peter Maydell wrote:
> On Tue, 2 Apr 2019 at 23:13, Markus Armbruster <armbru@redhat.com> wrote:
> >
> > Igor Mammedov <imammedo@redhat.com> writes:
> > > maybe we can assert in qdev_get_machine() if machine hasn't been created yet?
> > > with this at least it will be hard to misuse function or catch invalid users.
> > > (but it still might miss some use cases/CLI options which are not tested)
> >
> > Good idea.  When my code created "/machine" as a container, debugging
> > the resulting crash took me a bit of time.  The assertion you propose
> > would've saved me some.
> 
> One wrinkle to watch out for is code paths that are used in the
> linux-user emulator, where there is no machine at all... For instance
> cpu_common_realizefn() handles this case by explicitly checking
> whether the thing it gets back from qdev_get_machine() is a
> TYPE_MACHINE or not.

Is there a real use case for calling qdev_get_machine() in user
mode?

I'd prefer to make qdev_get_machine() unavailable in user mode,
so we could detect these cases at compile time (and treat them as
bugs).

-- 
Eduardo

