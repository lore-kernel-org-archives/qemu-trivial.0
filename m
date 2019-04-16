Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hGVUx-0002CP-Hz
	for mharc-qemu-trivial@gnu.org; Tue, 16 Apr 2019 17:20:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33203)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1hGVUv-0002B1-8x
	for qemu-trivial@nongnu.org; Tue, 16 Apr 2019 17:20:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1hGVUu-0002SX-DQ
	for qemu-trivial@nongnu.org; Tue, 16 Apr 2019 17:20:09 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46132)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1hGVUs-0002O1-6P; Tue, 16 Apr 2019 17:20:06 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6C97888317;
	Tue, 16 Apr 2019 21:20:05 +0000 (UTC)
Received: from localhost (ovpn-116-9.gru2.redhat.com [10.97.116.9])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EF8A219C6A;
	Tue, 16 Apr 2019 21:20:04 +0000 (UTC)
Date: Tue, 16 Apr 2019 18:20:03 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Like Xu <like.xu@linux.intel.com>
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>, like.xu@intel.com,
	qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>
Message-ID: <20190416212003.GB2272@habkost.net>
References: <1555315185-16414-1-git-send-email-like.xu@linux.intel.com>
	<1555315185-16414-3-git-send-email-like.xu@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1555315185-16414-3-git-send-email-like.xu@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Tue, 16 Apr 2019 21:20:05 +0000 (UTC)
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
X-List-Received-Date: Tue, 16 Apr 2019 21:20:10 -0000

On Mon, Apr 15, 2019 at 03:59:45PM +0800, Like Xu wrote:
> To avoid the misuse of qdev_get_machine() if machine hasn't been created yet,
> this patch uses qdev_get_machine_uncheck() for obj-common (share with user-only
> mode) and adds type assertion to qdev_get_machine() in system-emulation mode.
> 
> Suggested-by: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Like Xu <like.xu@linux.intel.com>

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

I'm queueing the series on machine-next, thanks!

-- 
Eduardo

