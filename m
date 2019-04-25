Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hJiYY-0007BJ-Nf
	for mharc-qemu-trivial@gnu.org; Thu, 25 Apr 2019 13:53:10 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40474)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1hJiYX-0007AW-Bv
	for qemu-trivial@nongnu.org; Thu, 25 Apr 2019 13:53:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1hJiYW-0001od-DP
	for qemu-trivial@nongnu.org; Thu, 25 Apr 2019 13:53:09 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52078)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1hJiTe-0005FM-8y; Thu, 25 Apr 2019 13:48:06 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3C24B308CF88;
	Thu, 25 Apr 2019 17:48:05 +0000 (UTC)
Received: from localhost (ovpn-116-9.gru2.redhat.com [10.97.116.9])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 81D50600C5;
	Thu, 25 Apr 2019 17:48:04 +0000 (UTC)
Date: Thu, 25 Apr 2019 14:48:02 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Like Xu <like.xu@linux.intel.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>, qemu-trivial@nongnu.org,
	Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
	like.xu@intel.com, Igor Mammedov <imammedo@redhat.com>
Message-ID: <20190425174802.GQ18406@habkost.net>
References: <1555315185-16414-1-git-send-email-like.xu@linux.intel.com>
	<1555315185-16414-3-git-send-email-like.xu@linux.intel.com>
	<20190416212003.GB2272@habkost.net>
	<87ftqh1ae5.fsf@dusky.pond.sub.org>
	<20190417171059.GC25134@habkost.net>
	<3fc39df9-9c4e-219c-e7dc-c93754fd1315@linux.intel.com>
	<20190424172143.GC18406@habkost.net>
	<a8aa414d-b393-83a7-61dd-01b15b27d93d@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a8aa414d-b393-83a7-61dd-01b15b27d93d@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Thu, 25 Apr 2019 17:48:05 +0000 (UTC)
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
X-List-Received-Date: Thu, 25 Apr 2019 17:53:10 -0000

On Thu, Apr 25, 2019 at 11:12:29AM +0800, Like Xu wrote:
> On 2019/4/25 1:21, Eduardo Habkost wrote:
[...]
> > 
> > I think we all agree that qdev_get_machine() should eventually be
> > available in softmmu only.
> 
> I think we need to make it happen to avoid calling qdev_get_machine()
> in user-only mode.

Agreed.  My point is that we we shouldn't need a
qdev_get_machine_unchecked() function at all if we first get rid
of all user-only qdev_get_machine() calls.

> > 
> > But I don't think we agree when it would be appropriate to call
> > qdev_get_machine_unchecked() instead of qdev_get_machine().
> > 
> > On both examples in your patch, the code checks for TYPE_MACHINE
> > immediately after calling qdev_get_machine_unchecked().  If that
> > code is only useful in softmmu mode, when would anybody want to
> > call qdev_get_machine_unchecked() in user-only mode?
> > 
> > 

-- 
Eduardo

