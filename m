Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hNbcf-0003Zo-2E
	for mharc-qemu-trivial@gnu.org; Mon, 06 May 2019 07:17:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33774)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hNbcd-0003YB-FA
	for qemu-trivial@nongnu.org; Mon, 06 May 2019 07:17:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hNbcc-0006IV-M8
	for qemu-trivial@nongnu.org; Mon, 06 May 2019 07:17:27 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53628)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1hNbca-0006FM-E5; Mon, 06 May 2019 07:17:24 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5AB94301E11B;
	Mon,  6 May 2019 11:17:22 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-28.ams2.redhat.com
	[10.36.116.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 27078611C5;
	Mon,  6 May 2019 11:17:22 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id BF0971132B35; Mon,  6 May 2019 13:17:20 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Cc: Like Xu <like.xu@linux.intel.com>, Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org, like.xu@intel.com,
	Igor Mammedov <imammedo@redhat.com>
References: <1555315185-16414-1-git-send-email-like.xu@linux.intel.com>
	<1555315185-16414-3-git-send-email-like.xu@linux.intel.com>
	<20190416212003.GB2272@habkost.net>
	<87ftqh1ae5.fsf@dusky.pond.sub.org>
	<20190417171059.GC25134@habkost.net>
	<3fc39df9-9c4e-219c-e7dc-c93754fd1315@linux.intel.com>
	<20190424172143.GC18406@habkost.net>
	<a8aa414d-b393-83a7-61dd-01b15b27d93d@linux.intel.com>
	<20190425174802.GQ18406@habkost.net>
Date: Mon, 06 May 2019 13:17:20 +0200
In-Reply-To: <20190425174802.GQ18406@habkost.net> (Eduardo Habkost's message
	of "Thu, 25 Apr 2019 14:48:02 -0300")
Message-ID: <878svjsugv.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Mon, 06 May 2019 11:17:22 +0000 (UTC)
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
X-List-Received-Date: Mon, 06 May 2019 11:17:28 -0000

Eduardo Habkost <ehabkost@redhat.com> writes:

> On Thu, Apr 25, 2019 at 11:12:29AM +0800, Like Xu wrote:
>> On 2019/4/25 1:21, Eduardo Habkost wrote:
> [...]
>> > 
>> > I think we all agree that qdev_get_machine() should eventually be
>> > available in softmmu only.
>> 
>> I think we need to make it happen to avoid calling qdev_get_machine()
>> in user-only mode.

That would be ideal.

> Agreed.  My point is that we we shouldn't need a
> qdev_get_machine_unchecked() function at all if we first get rid
> of all user-only qdev_get_machine() calls.

Concur.

