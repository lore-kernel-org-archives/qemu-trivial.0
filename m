Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UjQkE-0005j4-CC
	for mharc-qemu-trivial@gnu.org; Mon, 03 Jun 2013 05:08:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58306)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1UjQk7-0005Zj-Bh
	for qemu-trivial@nongnu.org; Mon, 03 Jun 2013 05:08:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1UjQk2-0002Vo-A0
	for qemu-trivial@nongnu.org; Mon, 03 Jun 2013 05:07:55 -0400
Received: from mx1.redhat.com ([209.132.183.28]:19303)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1UjQjq-0002UL-DX; Mon, 03 Jun 2013 05:07:38 -0400
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r5397aNP007341
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 3 Jun 2013 05:07:36 -0400
Received: from yakj.usersys.redhat.com (ovpn-112-45.ams2.redhat.com
	[10.36.112.45])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r5397VG3020369; Mon, 3 Jun 2013 05:07:33 -0400
Message-ID: <51AC5CCA.90701@redhat.com>
Date: Mon, 03 Jun 2013 11:07:22 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Stefan Hajnoczi <stefanha@redhat.com>
References: <1370249911-19708-1-git-send-email-stefanha@redhat.com>
	<1370249911-19708-2-git-send-email-stefanha@redhat.com>
In-Reply-To: <1370249911-19708-2-git-send-email-stefanha@redhat.com>
X-Enigmail-Version: 1.5.1
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Nicholas Bellinger <nab@linux-iscsi.org>, qemu-stable@nongnu.org,
	Asias He <asias@redhat.com>, Eric Blake <eblake@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH v2 1/2] vhost-scsi: fix
 k->set_guest_notifiers() NULL dereference
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
X-List-Received-Date: Mon, 03 Jun 2013 09:08:01 -0000

Il 03/06/2013 10:58, Stefan Hajnoczi ha scritto:
> Coverity picked up a copy-paste bug.  In vhost_scsi_start() we check for
> !k->set_guest_notifiers and error out.  The check probably got copied
> but instead of erroring we actually use the function pointer!

Exactly. :)

Applied to scsi branch, thanks.

Paolo

> Cc: Nicholas Bellinger <nab@linux-iscsi.org>
> Cc: Asias He <asias@redhat.com>
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  hw/scsi/vhost-scsi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/scsi/vhost-scsi.c b/hw/scsi/vhost-scsi.c
> index d7a1c33..785e93f 100644
> --- a/hw/scsi/vhost-scsi.c
> +++ b/hw/scsi/vhost-scsi.c
> @@ -123,7 +123,7 @@ static void vhost_scsi_stop(VHostSCSI *s)
>      VirtioBusClass *k = VIRTIO_BUS_GET_CLASS(qbus);
>      int ret = 0;
>  
> -    if (!k->set_guest_notifiers) {
> +    if (k->set_guest_notifiers) {
>          ret = k->set_guest_notifiers(qbus->parent, s->dev.nvqs, false);
>          if (ret < 0) {
>                  error_report("vhost guest notifier cleanup failed: %d\n", ret);
> 


