Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eYxy0-0006xs-RK
	for mharc-qemu-trivial@gnu.org; Tue, 09 Jan 2018 12:45:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41585)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1eYxxx-0006vm-Cw
	for qemu-trivial@nongnu.org; Tue, 09 Jan 2018 12:45:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1eYxxw-0006hJ-KD
	for qemu-trivial@nongnu.org; Tue, 09 Jan 2018 12:45:37 -0500
Received: from mx1.redhat.com ([209.132.183.28]:60888)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cohuck@redhat.com>)
	id 1eYxxn-0006ca-UM; Tue, 09 Jan 2018 12:45:28 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E25B987630;
	Tue,  9 Jan 2018 17:45:26 +0000 (UTC)
Received: from gondolin (dhcp-192-222.str.redhat.com [10.33.192.222])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A5EB15DD91;
	Tue,  9 Jan 2018 17:45:25 +0000 (UTC)
Date: Tue, 9 Jan 2018 18:45:23 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Alistair Francis <alistair.francis@xilinx.com>
Cc: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>,
	alistair23@gmail.com, armbru@redhat.com, qemu-s390x@nongnu.org
Message-ID: <20180109184523.3d0aab51.cohuck@redhat.com>
In-Reply-To: <3f49c0ff601f27534d4536c87c00d01c233e067f.1513790495.git.alistair.francis@xilinx.com>
References: <cover.1513790494.git.alistair.francis@xilinx.com>
	<3f49c0ff601f27534d4536c87c00d01c233e067f.1513790495.git.alistair.francis@xilinx.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Tue, 09 Jan 2018 17:45:27 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v6 21/29] hw/s390x: Replace
 fprintf(stderr, "*\n" with error_report()
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
X-List-Received-Date: Tue, 09 Jan 2018 17:45:39 -0000

On Wed, 20 Dec 2017 09:24:41 -0800
Alistair Francis <alistair.francis@xilinx.com> wrote:

> Replace a large number of the fprintf(stderr, "*\n" calls with
> error_report(). The functions were renamed with these commands and then
> compiler issues where manually fixed.
> 
> find ./* -type f -exec sed -i \
>     'N;N;N;N;N;N;N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
>     {} +
> find ./* -type f -exec sed -i \
>     'N;N;N;N;N;N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
>     {} +
> find ./* -type f -exec sed -i \
>     'N;N;N;N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
>     {} +
> find ./* -type f -exec sed -i \
>     'N;N;N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
>     {} +
> find ./* -type f -exec sed -i \
>     'N;N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
>     {} +
> find ./* -type f -exec sed -i \
>     'N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
>     {} +
> find ./* -type f -exec sed -i \
>     'N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
>     {} +
> find ./* -type f -exec sed -i \
>     'N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
>     {} +
> find ./* -type f -exec sed -i \
>     'N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
>     {} +
> find ./* -type f -exec sed -i \
>     'N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
>     {} +
> find ./* -type f -exec sed -i \
>     'N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
>     {} +
> 
> Some lines where then manually tweaked to pass checkpatch.
> 
> One fprintf(stderr, was manually converted to a
> qemu_log_mask(LOG_GUEST_ERROR,
> 
> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> ---
> V3:
>  - Use a qemu_log_mask(LOG_GUEST_ERROR,
> V2:
>  - Split hw patch into individual directories
> 
>  hw/s390x/virtio-ccw.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/s390x/virtio-ccw.c b/hw/s390x/virtio-ccw.c
> index 38f6a8afc9..3d8f26949b 100644
> --- a/hw/s390x/virtio-ccw.c
> +++ b/hw/s390x/virtio-ccw.c
> @@ -426,8 +426,9 @@ static int virtio_ccw_cb(SubchDev *sch, CCW1 ccw)
>                   * passes us zeroes for those we don't support.
>                   */
>                  if (features.features) {
> -                    fprintf(stderr, "Guest bug: features[%i]=%x (expected 0)\n",
> -                            features.index, features.features);
> +                    qemu_log_mask(LOG_GUEST_ERROR,
> +                                  "Guest bug: features[%i]=%x (expected 0)",
> +                                  features.index, features.features);
>                      /* XXX: do a unit check here? */
>                  }
>              }

I'll queue this to s390-next so this doesn't get lost.

I'll also tweak the commit message, as nothing is converted to
error_report().

