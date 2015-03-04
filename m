Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YT8IQ-0003ke-3G
	for mharc-qemu-trivial@gnu.org; Wed, 04 Mar 2015 07:21:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52897)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1YT8IM-0003ap-DF
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 07:20:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1YT8II-0001o9-Kd
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 07:20:58 -0500
Received: from mx1.redhat.com ([209.132.183.28]:49693)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>)
	id 1YT8II-0001nI-6M; Wed, 04 Mar 2015 07:20:54 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t24CKr9q023308
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Wed, 4 Mar 2015 07:20:53 -0500
Received: from work-vm (ovpn-116-91.ams2.redhat.com [10.36.116.91])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t24CKnDv026488
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=NO);
	Wed, 4 Mar 2015 07:20:51 -0500
Date: Wed, 4 Mar 2015 12:20:49 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20150304122048.GD2530@work-vm>
References: <1425146983-16015-1-git-send-email-sw@weilnetz.de>
	<1425146983-16015-2-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1425146983-16015-2-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Amit Shah <amit.shah@redhat.com>,
	QEMU Developer <qemu-devel@nongnu.org>, Juan Quintela <quintela@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/3] migration: Fix coding
 style (whitespace issues)
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
X-List-Received-Date: Wed, 04 Mar 2015 12:20:59 -0000

* Stefan Weil (sw@weilnetz.de) wrote:
> * Remove trailing whitespace (fixes 9 errors from checkpatch.pl).
>   One comment line was longer than 80 characters, so wrap it
>   and fix a typo, too.
> * Replace tabs by blanks (fixes 1 error).
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>

Needs merging with Michael's fixes, but otherwise:

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
> 
> My editor automatically removes trailing whitespace, so before fixing code,
> I had to fix the coding style.
> 
>  migration/rdma.c |   22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/migration/rdma.c b/migration/rdma.c
> index 6bee30c..67c5701 100644
> --- a/migration/rdma.c
> +++ b/migration/rdma.c
> @@ -703,7 +703,7 @@ static void qemu_rdma_dump_id(const char *who, struct ibv_context *verbs)
>                  verbs->device->ibdev_path,
>                  port.link_layer,
>                  (port.link_layer == IBV_LINK_LAYER_INFINIBAND) ? "Infiniband" :
> -                 ((port.link_layer == IBV_LINK_LAYER_ETHERNET) 
> +                 ((port.link_layer == IBV_LINK_LAYER_ETHERNET)
>                      ? "Ethernet" : "Unknown"));
>  }
>  
> @@ -738,7 +738,7 @@ static void qemu_rdma_dump_gid(const char *who, struct rdma_cm_id *id)
>   * and validate what time of hardware it is.
>   *
>   * Unfortunately, this puts the user in a fix:
> - * 
> + *
>   *  If the source VM connects with an IPv4 address without knowing that the
>   *  destination has bound to '[::]' the migration will unconditionally fail
>   *  unless the management software is explicitly listening on the the IPv4
> @@ -746,13 +746,13 @@ static void qemu_rdma_dump_gid(const char *who, struct rdma_cm_id *id)
>   *
>   *  If the source VM connects with an IPv6 address, then we're OK because we can
>   *  throw an error on the source (and similarly on the destination).
> - * 
> + *
>   *  But in mixed environments, this will be broken for a while until it is fixed
>   *  inside linux.
>   *
>   * We do provide a *tiny* bit of help in this function: We can list all of the
>   * devices in the system and check to see if all the devices are RoCE or
> - * Infiniband. 
> + * Infiniband.
>   *
>   * If we detect that we have a *pure* RoCE environment, then we can safely
>   * thrown an error even if the management software has specified '[::]' as the
> @@ -771,17 +771,17 @@ static int qemu_rdma_broken_ipv6_kernel(Error **errp, struct ibv_context *verbs)
>      /* This bug only exists in linux, to our knowledge. */
>  #ifdef CONFIG_LINUX
>  
> -    /* 
> +    /*
>       * Verbs are only NULL if management has bound to '[::]'.
> -     * 
> +     *
>       * Let's iterate through all the devices and see if there any pure IB
>       * devices (non-ethernet).
> -     * 
> +     *
>       * If not, then we can safely proceed with the migration.
>       * Otherwise, there are no guarantees until the bug is fixed in linux.
>       */
>      if (!verbs) {
> -	    int num_devices, x;
> +        int num_devices, x;
>          struct ibv_device ** dev_list = ibv_get_device_list(&num_devices);
>          bool roce_found = false;
>          bool ib_found = false;
> @@ -826,8 +826,8 @@ static int qemu_rdma_broken_ipv6_kernel(Error **errp, struct ibv_context *verbs)
>  
>      /*
>       * If we have a verbs context, that means that some other than '[::]' was
> -     * used by the management software for binding. In which case we can actually 
> -     * warn the user about a potential broken kernel;
> +     * used by the management software for binding. In which case we can
> +     * actually warn the user about a potentially broken kernel.
>       */
>  
>      /* IB ports start with 1, not 0 */
> @@ -2421,7 +2421,7 @@ static int qemu_rdma_dest_init(RDMAContext *rdma, Error **errp)
>                          continue;
>                      }
>                  }
> -                    
> +
>                  goto listen;
>              }
>          }
> -- 
> 1.7.10.4
> 
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

