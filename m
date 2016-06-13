Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bCOio-0005xe-0P
	for mharc-qemu-trivial@gnu.org; Mon, 13 Jun 2016 06:03:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54515)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1bCOim-0005wF-1m
	for qemu-trivial@nongnu.org; Mon, 13 Jun 2016 06:03:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1bCOih-0007Wb-0i
	for qemu-trivial@nongnu.org; Mon, 13 Jun 2016 06:03:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45418)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1bCOid-0007Vz-6m; Mon, 13 Jun 2016 06:03:43 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B3F6F461E2;
	Mon, 13 Jun 2016 10:03:42 +0000 (UTC)
Received: from [10.36.112.17] (ovpn-112-17.ams2.redhat.com [10.36.112.17])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5DA3dVd022760
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 13 Jun 2016 06:03:41 -0400
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <1465805418-15906-1-git-send-email-thuth@redhat.com>
Cc: qemu-trivial@nongnu.org
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <d17a6489-512a-0b57-3c50-463f52cffbbf@redhat.com>
Date: Mon, 13 Jun 2016 12:03:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.0
MIME-Version: 1.0
In-Reply-To: <1465805418-15906-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Mon, 13 Jun 2016 10:03:42 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] scsi-disk: Use (unsigned long) typecasts
 when using "%lu" format string
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
X-List-Received-Date: Mon, 13 Jun 2016 10:03:53 -0000



On 13/06/2016 10:10, Thomas Huth wrote:
> Some source code analyzers like cppcheck spill out a warning if
> the sign of the argument does not match the format string.
> 
> Ticket: https://bugs.launchpad.net/qemu/+bug/1589564
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/scsi/scsi-disk.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
> index 1881969..36f8a85 100644
> --- a/hw/scsi/scsi-disk.c
> +++ b/hw/scsi/scsi-disk.c
> @@ -2060,13 +2060,13 @@ static int32_t scsi_disk_emulate_command(SCSIRequest *req, uint8_t *buf)
>          }
>          break;
>      case MODE_SELECT:
> -        DPRINTF("Mode Select(6) (len %lu)\n", (long)r->req.cmd.xfer);
> +        DPRINTF("Mode Select(6) (len %lu)\n", (unsigned long)r->req.cmd.xfer);
>          break;
>      case MODE_SELECT_10:
> -        DPRINTF("Mode Select(10) (len %lu)\n", (long)r->req.cmd.xfer);
> +        DPRINTF("Mode Select(10) (len %lu)\n", (unsigned long)r->req.cmd.xfer);
>          break;
>      case UNMAP:
> -        DPRINTF("Unmap (len %lu)\n", (long)r->req.cmd.xfer);
> +        DPRINTF("Unmap (len %lu)\n", (unsigned long)r->req.cmd.xfer);
>          break;
>      case VERIFY_10:
>      case VERIFY_12:
> @@ -2080,7 +2080,7 @@ static int32_t scsi_disk_emulate_command(SCSIRequest *req, uint8_t *buf)
>      case WRITE_SAME_16:
>          DPRINTF("WRITE SAME %d (len %lu)\n",
>                  req->cmd.buf[0] == WRITE_SAME_10 ? 10 : 16,
> -                (long)r->req.cmd.xfer);
> +                (unsigned long)r->req.cmd.xfer);
>          break;
>      default:
>          DPRINTF("Unknown SCSI command (%2.2x=%s)\n", buf[0],
> 

Queued, thanks.

Paolo

