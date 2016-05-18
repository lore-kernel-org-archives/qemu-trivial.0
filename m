Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b31Aa-000538-MQ
	for mharc-qemu-trivial@gnu.org; Wed, 18 May 2016 09:05:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45422)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cornelia.huck@de.ibm.com>) id 1b31AY-000531-U0
	for qemu-trivial@nongnu.org; Wed, 18 May 2016 09:05:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cornelia.huck@de.ibm.com>) id 1b31AT-0000CO-Sf
	for qemu-trivial@nongnu.org; Wed, 18 May 2016 09:05:46 -0400
Received: from e06smtp07.uk.ibm.com ([195.75.94.103]:37419)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cornelia.huck@de.ibm.com>) id 1b31AT-0000Bs-Go
	for qemu-trivial@nongnu.org; Wed, 18 May 2016 09:05:41 -0400
Received: from localhost
	by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <cornelia.huck@de.ibm.com>;
	Wed, 18 May 2016 14:05:39 +0100
Received: from d06dlp01.portsmouth.uk.ibm.com (9.149.20.13)
	by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Wed, 18 May 2016 14:05:36 +0100
X-IBM-Helo: d06dlp01.portsmouth.uk.ibm.com
X-IBM-MailFrom: cornelia.huck@de.ibm.com
X-IBM-RcptTo: qemu-devel@nongnu.org;qemu-trivial@nongnu.org
Received: from b06cxnps4075.portsmouth.uk.ibm.com
	(d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
	by d06dlp01.portsmouth.uk.ibm.com (Postfix) with ESMTP id 0577E17D807A; 
	Wed, 18 May 2016 14:06:36 +0100 (BST)
Received: from d06av04.portsmouth.uk.ibm.com (d06av04.portsmouth.uk.ibm.com
	[9.149.37.216])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id u4ID5Z9b7537030; Wed, 18 May 2016 13:05:35 GMT
Received: from d06av04.portsmouth.uk.ibm.com (localhost [127.0.0.1])
	by d06av04.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with
	ESMTP id u4ID5YiQ005887; Wed, 18 May 2016 07:05:34 -0600
Received: from gondolin (dyn-9-152-224-125.boeblingen.de.ibm.com
	[9.152.224.125])
	by d06av04.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with
	ESMTP id u4ID5VLR005597; Wed, 18 May 2016 07:05:31 -0600
Date: Wed, 18 May 2016 15:05:30 +0200
From: Cornelia Huck <cornelia.huck@de.ibm.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Message-ID: <20160518150530.13cd9fa8.cornelia.huck@de.ibm.com>
In-Reply-To: <1463575397-20438-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1463575397-20438-1-git-send-email-mjt@msgid.tls.msk.ru>
Organization: IBM Deutschland Research & Development GmbH Vorsitzende des
	Aufsichtsrats: Martina Koederitz
	=?UTF-8?B?R2VzY2jDpGZ0c2bDvGhydW5nOg==?=
	Dirk Wittkopp Sitz der Gesellschaft: =?UTF-8?B?QsO2Ymxpbmdlbg==?=
	Registergericht: Amtsgericht Stuttgart, HRB 243294
X-Mailer: Claws Mail 3.11.1 (GTK+ 2.24.23; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16051813-0029-0000-0000-00001EAF07A1
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.75.94.103
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH trivial] s390x/virtio-ccw:
 fix spelling
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
X-List-Received-Date: Wed, 18 May 2016 13:05:47 -0000

On Wed, 18 May 2016 15:43:17 +0300
Michael Tokarev <mjt@tls.msk.ru> wrote:

> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
>  hw/s390x/virtio-ccw.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/s390x/virtio-ccw.c b/hw/s390x/virtio-ccw.c
> index d51642d..5e77b27 100644
> --- a/hw/s390x/virtio-ccw.c
> +++ b/hw/s390x/virtio-ccw.c
> @@ -1475,7 +1475,7 @@ static void virtio_ccw_device_plugged(DeviceState *d, Error **errp)
>      int n = virtio_get_num_queues(vdev);
> 
>      if (virtio_get_num_queues(vdev) > VIRTIO_CCW_QUEUE_MAX) {
> -        error_setg(errp, "The nubmer of virtqueues %d "
> +        error_setg(errp, "The number of virtqueues %d "
>                     "exceeds ccw limit %d", n,
>                     VIRTIO_CCW_QUEUE_MAX);
>          return;

Acked-by: Cornelia Huck <cornelia.huck@de.ibm.com>


