Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WmLO9-0005wq-Hi
	for mharc-qemu-trivial@gnu.org; Mon, 19 May 2014 07:05:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60046)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1WmLO2-0005sI-Ee
	for qemu-trivial@nongnu.org; Mon, 19 May 2014 07:05:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1WmLNx-0006QJ-4L
	for qemu-trivial@nongnu.org; Mon, 19 May 2014 07:05:42 -0400
Received: from mx1.redhat.com ([209.132.183.28]:62349)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1WmLNm-0006O9-O1; Mon, 19 May 2014 07:05:26 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s4JB5OU8009603
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Mon, 19 May 2014 07:05:25 -0400
Received: from yakj.usersys.redhat.com (ovpn-112-37.ams2.redhat.com
	[10.36.112.37])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s4JB5Cc4018867; Mon, 19 May 2014 07:05:13 -0400
Message-ID: <5379E568.2020005@redhat.com>
Date: Mon, 19 May 2014 13:05:12 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Hani Benhabiles <kroosec@gmail.com>, qemu-devel@nongnu.org
References: <1400410205-26152-1-git-send-email-kroosec@gmail.com>
	<1400410205-26152-2-git-send-email-kroosec@gmail.com>
In-Reply-To: <1400410205-26152-2-git-send-email-kroosec@gmail.com>
X-Enigmail-Version: 1.6
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, kwolf@redhat.com, stefanha@redhat.com
Subject: Re: [Qemu-trivial] [PATCH 2/2] nbd: Don't validate from and len in
	NBD_CMD_DISC.
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
X-List-Received-Date: Mon, 19 May 2014 11:05:48 -0000

Il 18/05/2014 12:50, Hani Benhabiles ha scritto:
> These values aren't used in this case.
>
> Currently, the from field in the request sent by the nbd kernel module leading
> to a false error message when ending the connection with the client.
>
> $ qemu-nbd some.img -v
> // After nbd-client -d /dev/nbd0
> nbd.c:nbd_trip():L1031: From: 18446744073709551104, Len: 0, Size: 20971520,
> Offset: 0
> nbd.c:nbd_trip():L1032: requested operation past EOF--bad client?
> nbd.c:nbd_receive_request():L638: read failed
>
> Signed-off-by: Hani Benhabiles <hani@linux.com>
> ---
>  nbd.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/nbd.c b/nbd.c
> index e5084b6..dc076d7 100644
> --- a/nbd.c
> +++ b/nbd.c
> @@ -1001,6 +1001,7 @@ static void nbd_trip(void *opaque)
>      struct nbd_request request;
>      struct nbd_reply reply;
>      ssize_t ret;
> +    uint32_t type;
>
>      TRACE("Reading request.");
>      if (client->closing) {
> @@ -1023,8 +1024,8 @@ static void nbd_trip(void *opaque)
>          reply.error = -ret;
>          goto error_reply;
>      }
> -
> -    if ((request.from + request.len) > exp->size) {
> +    type = request.type & NBD_CMD_MASK_COMMAND;
> +    if (type != NBD_CMD_DISC && (request.from + request.len) > exp->size) {
>              LOG("From: %" PRIu64 ", Len: %u, Size: %" PRIu64
>              ", Offset: %" PRIu64 "\n",
>                      request.from, request.len,
> @@ -1033,7 +1034,7 @@ static void nbd_trip(void *opaque)
>          goto invalid_request;
>      }
>
> -    switch (request.type & NBD_CMD_MASK_COMMAND) {
> +    switch (type) {
>      case NBD_CMD_READ:
>          TRACE("Request type is READ");
>
>

Applied after renaming the variable from type to command (for 
consistency with e.g. nbd_co_receive_request).

Paolo

