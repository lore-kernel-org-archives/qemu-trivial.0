Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UVgKj-0000sI-HE
	for mharc-qemu-trivial@gnu.org; Fri, 26 Apr 2013 06:56:53 -0400
Received: from eggs.gnu.org ([208.118.235.92]:36843)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UVgKh-0000s5-4t
	for qemu-trivial@nongnu.org; Fri, 26 Apr 2013 06:56:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UVgKd-0001N4-K8
	for qemu-trivial@nongnu.org; Fri, 26 Apr 2013 06:56:51 -0400
Received: from mail-bk0-x22b.google.com ([2a00:1450:4008:c01::22b]:41880)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UVgKd-0001Mt-Cz
	for qemu-trivial@nongnu.org; Fri, 26 Apr 2013 06:56:47 -0400
Received: by mail-bk0-f43.google.com with SMTP id jm19so1689224bkc.2
	for <qemu-trivial@nongnu.org>; Fri, 26 Apr 2013 03:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=MAkfNIh2uOfmCcuD6S9qk8sGlXVhhNdQziJmW1ExauU=;
	b=SZwuCBWqavd0L7TYhV7WifXCD6W6PYqqP3mNGsnNSwopUaz/G6ZNBklN2PEMedQjfv
	WXT30+HPdFlwVI0hje9+0HtAHR53ux6aDGFJueunsarlmLKPn6gkz8BytNZVg84yAdKo
	+jWPFuz2kdf9qzq+wm8Jd0evNymmgOQ+IHjeaLSJbuD/WZQBOc+e7+rvBz9x+dtXyLjT
	xKl8byl7Cg3ZbgfN3YJR27yqbESWDfLhAwVbuA9cHk5rifDiaMP6jfY9YUo4BhF+6n2l
	P6/YsCztVDWwhNp5EFGxr0aVVMYgKkax2FjKbexL9J6yt/7Mta8Cv1sl9obaxTIa/nR2
	w5Kg==
X-Received: by 10.204.56.68 with SMTP id x4mr11556979bkg.33.1366973806430;
	Fri, 26 Apr 2013 03:56:46 -0700 (PDT)
Received: from localhost ([2a02:810d:ec0:195:933:b278:833c:e7be])
	by mx.google.com with ESMTPSA id tl1sm2988062bkb.7.2013.04.26.03.56.44
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 26 Apr 2013 03:56:45 -0700 (PDT)
Date: Fri, 26 Apr 2013 12:56:43 +0200
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Ed Maste <emaste@freebsd.org>
Message-ID: <20130426105643.GF22315@stefanha-thinkpad.hitronhub.home>
References: <1366911508-11078-1-git-send-email-emaste@freebsd.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1366911508-11078-1-git-send-email-emaste@freebsd.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4008:c01::22b
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] Fix compilation without CONFIG_VHOST_SCSI
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
X-List-Received-Date: Fri, 26 Apr 2013 10:56:52 -0000

On Thu, Apr 25, 2013 at 01:38:28PM -0400, Ed Maste wrote:

Please always include qemu-devel@nongnu.org, the development mailing
list.

> 
> Signed-off-by: Ed Maste <emaste@freebsd.org>
> ---
>  hw/s390x/s390-virtio-bus.c | 2 ++
>  hw/s390x/virtio-ccw.c      | 2 ++
>  hw/s390x/virtio-ccw.h      | 2 ++
>  3 files changed, 6 insertions(+)
> 
> diff --git a/hw/s390x/s390-virtio-bus.c b/hw/s390x/s390-virtio-bus.c
> index cf51a85..a7e81d1 100644
> --- a/hw/s390x/s390-virtio-bus.c
> +++ b/hw/s390x/s390-virtio-bus.c
> @@ -691,7 +691,9 @@ static void s390_virtio_register_types(void)
>      type_register_static(&s390_virtio_blk);
>      type_register_static(&s390_virtio_net);
>      type_register_static(&s390_virtio_scsi);
> +#ifdef CONFIG_VHOST_SCSI
>      type_register_static(&s390_vhost_scsi);
> +#endif
>      type_register_static(&s390_virtio_rng);
>      type_register_static(&s390_virtio_bridge_info);
>  }
> diff --git a/hw/s390x/virtio-ccw.c b/hw/s390x/virtio-ccw.c
> index 56e4872..86b1477 100644
> --- a/hw/s390x/virtio-ccw.c
> +++ b/hw/s390x/virtio-ccw.c
> @@ -1089,7 +1089,9 @@ static void virtio_ccw_register(void)
>      type_register_static(&virtio_ccw_net);
>      type_register_static(&virtio_ccw_balloon);
>      type_register_static(&virtio_ccw_scsi);
> +#ifdef CONFIG_VHOST_SCSI
>      type_register_static(&vhost_ccw_scsi);
> +#endif
>      type_register_static(&virtio_ccw_rng);
>      type_register_static(&virtual_css_bridge_info);
>  }
> diff --git a/hw/s390x/virtio-ccw.h b/hw/s390x/virtio-ccw.h
> index 04ba1b9..121a5f8 100644
> --- a/hw/s390x/virtio-ccw.h
> +++ b/hw/s390x/virtio-ccw.h
> @@ -101,6 +101,7 @@ typedef struct VirtIOSCSICcw {
>      VirtIOSCSI vdev;
>  } VirtIOSCSICcw;
>  
> +#ifdef CONFIG_VHOST_SCSI
>  /* vhost-scsi-ccw */
>  
>  #define TYPE_VHOST_SCSI_CCW "vhost-scsi-ccw"
> @@ -111,6 +112,7 @@ typedef struct VHostSCSICcw {
>      VirtioCcwDevice parent_obj;
>      VHostSCSI vdev;
>  } VHostSCSICcw;
> +#endif
>  
>  /* virtio-blk-ccw */
>  
> -- 
> 1.7.11.5
> 
> 

