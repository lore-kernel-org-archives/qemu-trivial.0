Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hGo5T-0007Xc-R5
	for mharc-qemu-trivial@gnu.org; Wed, 17 Apr 2019 13:11:07 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59389)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1hGo5R-0007V8-V5
	for qemu-trivial@nongnu.org; Wed, 17 Apr 2019 13:11:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1hGo5Q-0007Qk-UR
	for qemu-trivial@nongnu.org; Wed, 17 Apr 2019 13:11:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34730)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1hGo5O-0007N7-KW; Wed, 17 Apr 2019 13:11:02 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B989C88AAA;
	Wed, 17 Apr 2019 17:11:01 +0000 (UTC)
Received: from localhost (ovpn-116-9.gru2.redhat.com [10.97.116.9])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F1C0B1001DCC;
	Wed, 17 Apr 2019 17:11:00 +0000 (UTC)
Date: Wed, 17 Apr 2019 14:10:59 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: Like Xu <like.xu@linux.intel.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org, like.xu@intel.com,
	Igor Mammedov <imammedo@redhat.com>
Message-ID: <20190417171059.GC25134@habkost.net>
References: <1555315185-16414-1-git-send-email-like.xu@linux.intel.com>
	<1555315185-16414-3-git-send-email-like.xu@linux.intel.com>
	<20190416212003.GB2272@habkost.net>
	<87ftqh1ae5.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ftqh1ae5.fsf@dusky.pond.sub.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Wed, 17 Apr 2019 17:11:01 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v3 2/2] core/qdev: refactor
 qdev_get_machine() with type assertion
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
X-List-Received-Date: Wed, 17 Apr 2019 17:11:07 -0000

On Wed, Apr 17, 2019 at 07:14:10AM +0200, Markus Armbruster wrote:
> Eduardo Habkost <ehabkost@redhat.com> writes:
> 
> > On Mon, Apr 15, 2019 at 03:59:45PM +0800, Like Xu wrote:
> >> To avoid the misuse of qdev_get_machine() if machine hasn't been created yet,
> >> this patch uses qdev_get_machine_uncheck() for obj-common (share with user-only
> >> mode) and adds type assertion to qdev_get_machine() in system-emulation mode.
> >> 
> >> Suggested-by: Igor Mammedov <imammedo@redhat.com>
> >> Signed-off-by: Like Xu <like.xu@linux.intel.com>
> >
> > Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
> >
> > I'm queueing the series on machine-next, thanks!
> 
> Hold your horses, please.
> 
> I dislike the name qdev_get_machine_uncheck().  I could live with
> qdev_get_machine_unchecked().
> 
> However, I doubt this is the right approach.
> 
> The issue at hand is undisciplined creation of QOM object /machine.
> 
> This patch adds an asseertion "undisciplined creation of /machine didn't
> create crap", but only in some places.
> 
> I think we should never create /machine as (surprising!) side effect of
> qdev_get_machine().  Create it explicitly instead, and have
> qdev_get_machine() use object_resolve_path("/machine", NULL) to get it.
> Look ma, no side effects.

OK, I'm dropping this one while we discuss it.

I really miss a good explanation why qdev_get_machine_unchecked()
needs to exist.  When exactly do we want /machine to exist but
not be TYPE_MACHINE?  Why?

Once the expectations and use cases are explained, we can choose
a better name for qdev_get_machine_unchecked() and document it
properly.

-- 
Eduardo

