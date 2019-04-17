Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hGctm-00056G-TK
	for mharc-qemu-trivial@gnu.org; Wed, 17 Apr 2019 01:14:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48452)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hGctl-000550-1l
	for qemu-trivial@nongnu.org; Wed, 17 Apr 2019 01:14:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hGctk-0007VM-8s
	for qemu-trivial@nongnu.org; Wed, 17 Apr 2019 01:14:17 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40842)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1hGcti-0007T7-4G; Wed, 17 Apr 2019 01:14:14 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4AEEB3084213;
	Wed, 17 Apr 2019 05:14:12 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-116.ams2.redhat.com
	[10.36.116.116])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DC81A5C220;
	Wed, 17 Apr 2019 05:14:11 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 66F721138648; Wed, 17 Apr 2019 07:14:10 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Cc: Like Xu <like.xu@linux.intel.com>, Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org, like.xu@intel.com,
	Igor Mammedov <imammedo@redhat.com>
References: <1555315185-16414-1-git-send-email-like.xu@linux.intel.com>
	<1555315185-16414-3-git-send-email-like.xu@linux.intel.com>
	<20190416212003.GB2272@habkost.net>
Date: Wed, 17 Apr 2019 07:14:10 +0200
In-Reply-To: <20190416212003.GB2272@habkost.net> (Eduardo Habkost's message of
	"Tue, 16 Apr 2019 18:20:03 -0300")
Message-ID: <87ftqh1ae5.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Wed, 17 Apr 2019 05:14:12 +0000 (UTC)
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
X-List-Received-Date: Wed, 17 Apr 2019 05:14:18 -0000

Eduardo Habkost <ehabkost@redhat.com> writes:

> On Mon, Apr 15, 2019 at 03:59:45PM +0800, Like Xu wrote:
>> To avoid the misuse of qdev_get_machine() if machine hasn't been created yet,
>> this patch uses qdev_get_machine_uncheck() for obj-common (share with user-only
>> mode) and adds type assertion to qdev_get_machine() in system-emulation mode.
>> 
>> Suggested-by: Igor Mammedov <imammedo@redhat.com>
>> Signed-off-by: Like Xu <like.xu@linux.intel.com>
>
> Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
>
> I'm queueing the series on machine-next, thanks!

Hold your horses, please.

I dislike the name qdev_get_machine_uncheck().  I could live with
qdev_get_machine_unchecked().

However, I doubt this is the right approach.

The issue at hand is undisciplined creation of QOM object /machine.

This patch adds an asseertion "undisciplined creation of /machine didn't
create crap", but only in some places.

I think we should never create /machine as (surprising!) side effect of
qdev_get_machine().  Create it explicitly instead, and have
qdev_get_machine() use object_resolve_path("/machine", NULL) to get it.
Look ma, no side effects.

