Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hBHZb-0008Iv-IN
	for mharc-qemu-trivial@gnu.org; Tue, 02 Apr 2019 07:27:23 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37835)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hBHZY-0008Ei-Sq
	for qemu-trivial@nongnu.org; Tue, 02 Apr 2019 07:27:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hBHZW-0002YX-35
	for qemu-trivial@nongnu.org; Tue, 02 Apr 2019 07:27:20 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47472)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1hBHZR-0002SW-Fq; Tue, 02 Apr 2019 07:27:14 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1D3727F746;
	Tue,  2 Apr 2019 11:27:12 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-116.ams2.redhat.com
	[10.36.116.116])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B7F545D9C4;
	Tue,  2 Apr 2019 11:27:11 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 3043D1138648; Tue,  2 Apr 2019 13:27:10 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Like Xu <like.xu@linux.intel.com>
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <1554194900-22817-1-git-send-email-like.xu@linux.intel.com>
Date: Tue, 02 Apr 2019 13:27:10 +0200
In-Reply-To: <1554194900-22817-1-git-send-email-like.xu@linux.intel.com> (Like
	Xu's message of "Tue, 2 Apr 2019 16:48:20 +0800")
Message-ID: <871s2kejg1.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 02 Apr 2019 11:27:12 +0000 (UTC)
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
X-List-Received-Date: Tue, 02 Apr 2019 11:27:21 -0000

Like Xu <like.xu@linux.intel.com> writes:

> This patch makes the remaining dozen or so uses of the global
> current_machine outside vl.c use qdev_get_machine() instead,
> and then make current_machine local to vl.c instead of global.
>
> Signed-off-by: Like Xu <like.xu@linux.intel.com>

You effectively replace

    current_machine

by

    MACHINE(qdev_get_machine())

qdev_get_machine() uses container_get(), which has a side effect: any
path component that doesn't exist already gets created as "container"
object.  In case of qdev_get_machine(), that's just "/machine".

Creating "/machine" as "container" is of course wrong.  You therefore
must not use qdev_get_machine() before main() creates "/machine".  It
does like this:

    object_property_add_child(object_get_root(), "machine",
                              OBJECT(current_machine), &error_abort);

I recently had several cases of code rearrangements explode because the
reordered code called qdev_get_machine() too early.  Makes me rather
skeptical about this patch.  To be frank, I consider qdev_get_machine()
a trap for the unwary.  container_get(), too.

If we decide using it to make current_machine static a good idea anyway,
we need to check the new uses carefully to make sure they can't run
before main() creates "/machine".

