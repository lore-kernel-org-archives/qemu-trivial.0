Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b30sz-00077V-6A
	for mharc-qemu-trivial@gnu.org; Wed, 18 May 2016 08:47:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40103)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <borntraeger@de.ibm.com>) id 1b30su-000757-4v
	for qemu-trivial@nongnu.org; Wed, 18 May 2016 08:47:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <borntraeger@de.ibm.com>) id 1b30sl-0003ju-67
	for qemu-trivial@nongnu.org; Wed, 18 May 2016 08:47:31 -0400
Received: from e06smtp05.uk.ibm.com ([195.75.94.101]:57913)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <borntraeger@de.ibm.com>) id 1b30sk-0003if-Rs
	for qemu-trivial@nongnu.org; Wed, 18 May 2016 08:47:23 -0400
Received: from localhost
	by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <borntraeger@de.ibm.com>;
	Wed, 18 May 2016 13:47:18 +0100
Received: from d06dlp03.portsmouth.uk.ibm.com (9.149.20.15)
	by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Wed, 18 May 2016 13:47:16 +0100
X-IBM-Helo: d06dlp03.portsmouth.uk.ibm.com
X-IBM-MailFrom: borntraeger@de.ibm.com
X-IBM-RcptTo: qemu-devel@nongnu.org;qemu-trivial@nongnu.org
Received: from b06cxnps4076.portsmouth.uk.ibm.com
	(d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by d06dlp03.portsmouth.uk.ibm.com (Postfix) with ESMTP id C85381B08061; 
	Wed, 18 May 2016 13:48:11 +0100 (BST)
Received: from d06av03.portsmouth.uk.ibm.com (d06av03.portsmouth.uk.ibm.com
	[9.149.37.213])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id u4IClFQj8061384; Wed, 18 May 2016 12:47:15 GMT
Received: from d06av03.portsmouth.uk.ibm.com (localhost [127.0.0.1])
	by d06av03.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with
	ESMTP id u4IClESc013465; Wed, 18 May 2016 06:47:14 -0600
Received: from oc1450873852.ibm.com (dyn-9-152-224-164.boeblingen.de.ibm.com
	[9.152.224.164])
	by d06av03.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with
	ESMTP id u4IClEaN013457; Wed, 18 May 2016 06:47:14 -0600
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
References: <1463575397-20438-1-git-send-email-mjt@msgid.tls.msk.ru>
Cc: qemu-trivial@nongnu.org
From: Christian Borntraeger <borntraeger@de.ibm.com>
Message-ID: <573C6452.60805@de.ibm.com>
Date: Wed, 18 May 2016 14:47:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.0
MIME-Version: 1.0
In-Reply-To: <1463575397-20438-1-git-send-email-mjt@msgid.tls.msk.ru>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16051812-0021-0000-0000-00001BD03ECF
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.75.94.101
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
X-List-Received-Date: Wed, 18 May 2016 12:47:35 -0000

On 05/18/2016 02:43 PM, Michael Tokarev wrote:
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
> 

Acked-by: Christian Borntraeger <borntraeger@de.ibm.com>



