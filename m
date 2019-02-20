Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gwTjn-0008BA-So
	for mharc-qemu-trivial@gnu.org; Wed, 20 Feb 2019 10:24:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42272)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1gwTjj-00088t-4V
	for qemu-trivial@nongnu.org; Wed, 20 Feb 2019 10:24:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1gwTjh-0007bD-5Q
	for qemu-trivial@nongnu.org; Wed, 20 Feb 2019 10:24:38 -0500
Received: from mx1.redhat.com ([209.132.183.28]:37996)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1gwTjL-00073y-KI; Wed, 20 Feb 2019 10:24:20 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F0C8FC0D088F;
	Wed, 20 Feb 2019 15:11:50 +0000 (UTC)
Received: from [10.3.116.222] (ovpn-116-222.phx2.redhat.com [10.3.116.222])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 509DB1868C;
	Wed, 20 Feb 2019 15:11:50 +0000 (UTC)
To: Like Xu <like.xu@linux.intel.com>, qemu-trivial@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <1550640446-18788-1-git-send-email-like.xu@linux.intel.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <e5e6a091-4b83-3392-7851-959bf350dc7f@redhat.com>
Date: Wed, 20 Feb 2019 09:11:49 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <1550640446-18788-1-git-send-email-like.xu@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Wed, 20 Feb 2019 15:11:51 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] doc: fix typos for
 documents in tree
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
X-List-Received-Date: Wed, 20 Feb 2019 15:24:40 -0000

On 2/19/19 11:27 PM, Like Xu wrote:
> Signed-off-by: Like Xu <like.xu@linux.intel.com>
> ---
>  docs/COLO-FT.txt               | 2 +-
>  docs/amd-memory-encryption.txt | 2 +-
>  docs/can.txt                   | 2 +-
>  docs/colo-proxy.txt            | 6 +++---
>  docs/cpu-hotplug.rst           | 2 +-
>  docs/qcow2-cache.txt           | 2 +-
>  docs/qemu-block-drivers.texi   | 2 +-
>  docs/qemu-cpu-models.texi      | 8 ++++----
>  docs/rdma.txt                  | 4 ++--
>  docs/replay.txt                | 2 +-
>  docs/vfio-ap.txt               | 2 +-
>  11 files changed, 17 insertions(+), 17 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org

