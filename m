Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hGd5V-0006m4-Ka
	for mharc-qemu-trivial@gnu.org; Wed, 17 Apr 2019 01:26:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50175)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hGd5T-0006iy-AA
	for qemu-trivial@nongnu.org; Wed, 17 Apr 2019 01:26:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hGd5S-0006S3-EC
	for qemu-trivial@nongnu.org; Wed, 17 Apr 2019 01:26:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56610)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1hGd5N-0006Nb-KT; Wed, 17 Apr 2019 01:26:17 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4A205307EA82;
	Wed, 17 Apr 2019 05:26:16 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-116.ams2.redhat.com
	[10.36.116.116])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EFBFB608C1;
	Wed, 17 Apr 2019 05:26:15 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 8375F1138648; Wed, 17 Apr 2019 07:26:14 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Like Xu <like.xu@linux.intel.com>
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, like.xu@intel.com,
	qemu-devel@nongnu.org, Igor Mammedov <imammedo@redhat.com>
References: <1555315185-16414-1-git-send-email-like.xu@linux.intel.com>
	<1555315185-16414-2-git-send-email-like.xu@linux.intel.com>
Date: Wed, 17 Apr 2019 07:26:14 +0200
In-Reply-To: <1555315185-16414-2-git-send-email-like.xu@linux.intel.com> (Like
	Xu's message of "Mon, 15 Apr 2019 15:59:44 +0800")
Message-ID: <87bm1519u1.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Wed, 17 Apr 2019 05:26:16 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v3 1/2] vl.c: refactor
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
X-List-Received-Date: Wed, 17 Apr 2019 05:26:24 -0000

Like Xu <like.xu@linux.intel.com> writes:

> This patch makes the remaining dozen or so uses of the global
> current_machine outside vl.c use qdev_get_machine() instead,
> and then make current_machine local to vl.c instead of global.
>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Like Xu <like.xu@linux.intel.com>

I'm afraid I dislike this one, too.

The patch does not reduce global state, it's merely MICAHI (make it
complicated and hide it).

It does not improve safety, it merely turns dereferences of null
current_machine into unwanted creation of "/machine" as container (ugh),
which the next patch then fixes up to assertion failure.

The only benefit I can see is you can't assign to current_machine
outside vl.c anymore.  Nobody ever did, thus complete non-issue.

If you want to hide global state without actually reducing it, create an
accessor function.  You can then use that to replace qdev_get_machine(),
getting rid of its surprising side effect.  *That* would be an
improvement I could get behind.

Better that *hiding* use of global state would be *eliminating* use of
global state: pass current_machine around.  This isn't always practical.
But where it is, the dependence on "machine created" becomes obvious in
the code.

