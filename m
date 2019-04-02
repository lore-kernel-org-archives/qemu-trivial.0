Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hBLdw-0001NH-4Q
	for mharc-qemu-trivial@gnu.org; Tue, 02 Apr 2019 11:48:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52830)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1hBLdt-0001Ks-LB
	for qemu-trivial@nongnu.org; Tue, 02 Apr 2019 11:48:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1hBLds-0002NE-9J
	for qemu-trivial@nongnu.org; Tue, 02 Apr 2019 11:48:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38858)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1hBLdp-0002Lz-5W; Tue, 02 Apr 2019 11:48:01 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A7B82C049598;
	Tue,  2 Apr 2019 15:47:56 +0000 (UTC)
Received: from localhost (ovpn-204-71.brq.redhat.com [10.40.204.71])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8B7245C234;
	Tue,  2 Apr 2019 15:47:54 +0000 (UTC)
Date: Tue, 2 Apr 2019 17:47:49 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Like Xu <like.xu@linux.intel.com>
Cc: Markus Armbruster <armbru@redhat.com>, Peter Maydell
	<peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>, Eduardo Habkost
	<ehabkost@redhat.com>, qemu-trivial@nongnu.org, qemu-devel@nongnu.org, 
	Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20190402174749.71da1efe@redhat.com>
In-Reply-To: <e72befe5-c931-5c80-6769-12e1a8e7d4fa@linux.intel.com>
References: <1554194900-22817-1-git-send-email-like.xu@linux.intel.com>
	<871s2kejg1.fsf@dusky.pond.sub.org>
	<e72befe5-c931-5c80-6769-12e1a8e7d4fa@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Tue, 02 Apr 2019 15:47:56 +0000 (UTC)
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
X-List-Received-Date: Tue, 02 Apr 2019 15:48:06 -0000

On Tue, 2 Apr 2019 21:09:39 +0800
Like Xu <like.xu@linux.intel.com> wrote:

> On 2019/4/2 19:27, Markus Armbruster wrote:
> > Like Xu <like.xu@linux.intel.com> writes:
> >   
> >> This patch makes the remaining dozen or so uses of the global
> >> current_machine outside vl.c use qdev_get_machine() instead,
> >> and then make current_machine local to vl.c instead of global.
> >>
> >> Signed-off-by: Like Xu <like.xu@linux.intel.com>  
> > 
> > You effectively replace
> > 
> >      current_machine
> > 
> > by
> > 
> >      MACHINE(qdev_get_machine())
> > 
> > qdev_get_machine() uses container_get(), which has a side effect: any
> > path component that doesn't exist already gets created as "container"
> > object.  In case of qdev_get_machine(), that's just "/machine".
> > 
> > Creating "/machine" as "container" is of course wrong.  You therefore
> > must not use qdev_get_machine() before main() creates "/machine".  It
> > does like this:
> > 
> >      object_property_add_child(object_get_root(), "machine",
> >                                OBJECT(current_machine), &error_abort);
> > 
> > I recently had several cases of code rearrangements explode because the
> > reordered code called qdev_get_machine() too early.  Makes me rather
> > skeptical about this patch.  To be frank, I consider qdev_get_machine()
> > a trap for the unwary.  container_get(), too.
> > 
> > If we decide using it to make current_machine static a good idea anyway,
> > we need to check the new uses carefully to make sure they can't run
> > before main() creates "/machine".

maybe we can assert in qdev_get_machine() if machine hasn't been created yet?
with this at least it will be hard to misuse function or catch invalid users.
(but it still might miss some use cases/CLI options which are not tested)

> >   
> 
> Thanks for your comments and this issue may not exist in this patch.
> 
> I am curious when and where we would call qdev_get_machine() before 
> main() initializes current_machine and adds it to QOM store which is
> called very early.


