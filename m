Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UowgH-000592-VM
	for mharc-qemu-trivial@gnu.org; Tue, 18 Jun 2013 10:14:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35386)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1UowgF-00051l-3L
	for qemu-trivial@nongnu.org; Tue, 18 Jun 2013 10:14:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1UowgA-0000Zj-AE
	for qemu-trivial@nongnu.org; Tue, 18 Jun 2013 10:14:42 -0400
Received: from mx1.redhat.com ([209.132.183.28]:5271)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1UowgA-0000Zd-31; Tue, 18 Jun 2013 10:14:38 -0400
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r5IEEaGe028802
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 18 Jun 2013 10:14:37 -0400
Received: from yakj.usersys.redhat.com (ovpn-112-25.ams2.redhat.com
	[10.36.112.25])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r5IEEYIH021383; Tue, 18 Jun 2013 10:14:35 -0400
Message-ID: <51C06B49.9030405@redhat.com>
Date: Tue, 18 Jun 2013 16:14:33 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1370895896-10546-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1370895896-10546-1-git-send-email-sw@weilnetz.de>
X-Enigmail-Version: 1.5.1
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] hw/scsi: Don't increment a boolean value
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
X-List-Received-Date: Tue, 18 Jun 2013 14:14:44 -0000

Il 10/06/2013 22:24, Stefan Weil ha scritto:
> This fixes a warning from cppcheck.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  hw/scsi/vmw_pvscsi.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/scsi/vmw_pvscsi.c b/hw/scsi/vmw_pvscsi.c
> index 48d12f4..446f723 100644
> --- a/hw/scsi/vmw_pvscsi.c
> +++ b/hw/scsi/vmw_pvscsi.c
> @@ -389,7 +389,7 @@ pvscsi_process_completion_queue(void *opaque)
>          QTAILQ_REMOVE(&s->completion_queue, pvscsi_req, next);
>          pvscsi_cmp_ring_put(s, &pvscsi_req->cmp);
>          g_free(pvscsi_req);
> -        has_completed++;
> +        has_completed = true;
>      }
>  
>      if (has_completed) {
> 

Applied to scsi-next branch, thanks.

Paolo

