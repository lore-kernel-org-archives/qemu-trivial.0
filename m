Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z9g6l-0002CM-Cs
	for mharc-qemu-trivial@gnu.org; Mon, 29 Jun 2015 16:56:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43561)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1Z9g6j-00028j-EH
	for qemu-trivial@nongnu.org; Mon, 29 Jun 2015 16:56:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1Z9g6i-0005HT-JT
	for qemu-trivial@nongnu.org; Mon, 29 Jun 2015 16:56:49 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44586)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>)
	id 1Z9g6e-0005FJ-0E; Mon, 29 Jun 2015 16:56:44 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id 8DC76AEF0E;
	Mon, 29 Jun 2015 20:56:43 +0000 (UTC)
Received: from scv.usersys.redhat.com (dhcp-17-29.bos.redhat.com [10.18.17.29])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t5TKuglJ031490; Mon, 29 Jun 2015 16:56:43 -0400
Message-ID: <5591B10A.8070807@redhat.com>
Date: Mon, 29 Jun 2015 16:56:42 -0400
From: John Snow <jsnow@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: qemu-devel@nongnu.org
References: <1435609557-14137-1-git-send-email-jsnow@redhat.com>
In-Reply-To: <1435609557-14137-1-git-send-email-jsnow@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] trivial: remove trailing
	newline from error_report
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
X-List-Received-Date: Mon, 29 Jun 2015 20:56:50 -0000



On 06/29/2015 04:25 PM, John Snow wrote:
> Minor cleanup.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  hw/vfio/platform.c | 2 +-
>  net/tap-linux.c    | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/vfio/platform.c b/hw/vfio/platform.c
> index 5c678b9..932d631 100644
> --- a/hw/vfio/platform.c
> +++ b/hw/vfio/platform.c
> @@ -225,7 +225,7 @@ static void vfio_intp_interrupt(VFIOINTp *intp)
>  
>      ret = event_notifier_test_and_clear(&intp->interrupt);
>      if (!ret) {
> -        error_report("Error when clearing fd=%d (ret = %d)\n",
> +        error_report("Error when clearing fd=%d (ret = %d)",
>                       event_notifier_get_fd(&intp->interrupt), ret);
>      }
>  
> diff --git a/net/tap-linux.c b/net/tap-linux.c
> index 394f2a6..5bd9d21 100644
> --- a/net/tap-linux.c
> +++ b/net/tap-linux.c
> @@ -211,7 +211,7 @@ int tap_fd_set_vnet_le(int fd, int is_le)
>          return -errno;
>      }
>  
> -    error_report("TUNSETVNETLE ioctl() failed: %s.\n", strerror(errno));
> +    error_report("TUNSETVNETLE ioctl() failed: %s.", strerror(errno));
>      abort();
>  }
>  
> @@ -228,7 +228,7 @@ int tap_fd_set_vnet_be(int fd, int is_be)
>          return -errno;
>      }
>  
> -    error_report("TUNSETVNETBE ioctl() failed: %s.\n", strerror(errno));
> +    error_report("TUNSETVNETBE ioctl() failed: %s.", strerror(errno));
>      abort();
>  }
>  
> 

NACK, missed one, see v2

