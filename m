Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aj4uk-0000yZ-Vb
	for mharc-qemu-trivial@gnu.org; Thu, 24 Mar 2016 09:03:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56840)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1aj4ue-0000k7-3K
	for qemu-trivial@nongnu.org; Thu, 24 Mar 2016 09:03:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1aj4uZ-0001BO-4z
	for qemu-trivial@nongnu.org; Thu, 24 Mar 2016 09:02:56 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36123)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>)
	id 1aj4uN-000175-FN; Thu, 24 Mar 2016 09:02:39 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id 108A18AE73;
	Thu, 24 Mar 2016 13:02:39 +0000 (UTC)
Received: from localhost (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u2OD2aUJ024173; Thu, 24 Mar 2016 09:02:37 -0400
Date: Thu, 24 Mar 2016 09:02:35 -0400
From: Luiz Capitulino <lcapitulino@redhat.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20160324090235.7d19c5dd@redhat.com>
In-Reply-To: <1458743900-14742-1-git-send-email-sw@weilnetz.de>
References: <1458743900-14742-1-git-send-email-sw@weilnetz.de>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	zhang.zhanghailiang@huawei.com
Subject: Re: [Qemu-trivial] [PATCH] trace-events: Fix typos (found by
	codespell)
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 24 Mar 2016 13:03:02 -0000

On Wed, 23 Mar 2016 15:38:20 +0100
Stefan Weil <sw@weilnetz.de> wrote:

> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  trace-events | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/trace-events b/trace-events
> index d494de1..996a77f 100644
> --- a/trace-events
> +++ b/trace-events
> @@ -144,8 +144,8 @@ cpu_out(unsigned int addr, char size, unsigned int val) "addr %#x(%c) value %u"
>  # Since requests are raised via monitor, not many tracepoints are needed.
>  balloon_event(void *opaque, unsigned long addr) "opaque %p addr %lu"
>  virtio_balloon_handle_output(const char *name, uint64_t gpa) "section name: %s gpa: %"PRIx64
> -virtio_balloon_get_config(uint32_t num_pages, uint32_t acutal) "num_pages: %d acutal: %d"
> -virtio_balloon_set_config(uint32_t acutal, uint32_t oldacutal) "acutal: %d oldacutal: %d"
> +virtio_balloon_get_config(uint32_t num_pages, uint32_t actual) "num_pages: %d actual: %d"
> +virtio_balloon_set_config(uint32_t actual, uint32_t oldactual) "actual: %d oldactual: %d"
>  virtio_balloon_to_target(uint64_t target, uint32_t num_pages) "balloon target: %"PRIx64" num_pages: %d"
>  
>  # hw/intc/apic_common.c

Reviewed-by: Luiz Capitulino <lcapitulino@redhat.com>


