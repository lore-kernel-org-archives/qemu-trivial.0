Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1drJCm-0000Qo-U6
	for mharc-qemu-trivial@gnu.org; Mon, 11 Sep 2017 03:32:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42522)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1drJCf-0000Ma-U5
	for qemu-trivial@nongnu.org; Mon, 11 Sep 2017 03:32:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1drJCe-00061g-Od
	for qemu-trivial@nongnu.org; Mon, 11 Sep 2017 03:32:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57424)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cohuck@redhat.com>)
	id 1drJCZ-0005xL-In; Mon, 11 Sep 2017 03:32:15 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8DBD6101722;
	Mon, 11 Sep 2017 07:32:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 8DBD6101722
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=cohuck@redhat.com
Received: from gondolin (ovpn-116-234.ams2.redhat.com [10.36.116.234])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D72356365E;
	Mon, 11 Sep 2017 07:32:10 +0000 (UTC)
Date: Mon, 11 Sep 2017 09:32:07 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, Laurent Vivier
	<lvivier@redhat.com>, Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?=
	<f4bug@amsat.org>, =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau
	<marcandre.lureau@redhat.com>, David Gibson <david@gibson.dropbear.id.au>
Message-ID: <20170911093207.4375c534.cohuck@redhat.com>
In-Reply-To: <1504030416-18618-1-git-send-email-thuth@redhat.com>
References: <1504030416-18618-1-git-send-email-thuth@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Mon, 11 Sep 2017 07:32:14 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for-2.11] tests: Fix broken
 ivshmem-server-msi/-irq tests
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
X-List-Received-Date: Mon, 11 Sep 2017 07:32:27 -0000

On Tue, 29 Aug 2017 20:13:36 +0200
Thomas Huth <thuth@redhat.com> wrote:

> Broken with commit b4ba67d9a7025 ("libqos: Change PCI accessors to take
> opaque BAR handle") a while ago, but nobody noticed since the tests are
> only run in SPEED=slow mode: The msix_pba_bar is not correctly initialized
> anymore if bir_pba has the same value as bir_table. With this fix,
> "make check SPEED=slow" should work fine again.
> 
> Fixes: b4ba67d9a702507793c2724e56f98e9b0f7be02b
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  tests/libqos/pci.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)

There really should be a better tree for that than my s390 tree, but
the other ivshmem patch was feeling a bit lonely, so I queued this as
well. Better than having the patch languish on the list.

