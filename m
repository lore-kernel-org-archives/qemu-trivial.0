Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lqKOy-0001nZ-2h
	for mharc-qemu-trivial@gnu.org; Mon, 07 Jun 2021 14:55:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lqKOv-0001n0-TP
 for qemu-trivial@nongnu.org; Mon, 07 Jun 2021 14:55:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30971)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lqKOs-0003u2-0g
 for qemu-trivial@nongnu.org; Mon, 07 Jun 2021 14:55:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623092099;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AdJCsWTfFWtTtyVrFrTOEQ4ysB0Oo9Sy7whx6cq7/Vg=;
 b=SwdE+T8NVKhu9J4v93kdC2auW1NMSYIA3v7Hwqe+Gy2aCoKFS3Pl3JVOPTVUhwrcs4nvoL
 pHOiGSsSRuyU9jyNT4S8yppOsgsgLF32DrZF81q7EHopm4kxldUsBJtghLeNLBtwgChHNG
 OavJARK8dUmy0vrW5vyleaqz3S/x0Ug=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-14-oxfmq6EvNROkCDaKyWIXpQ-1; Mon, 07 Jun 2021 14:54:58 -0400
X-MC-Unique: oxfmq6EvNROkCDaKyWIXpQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A96B8803635;
 Mon,  7 Jun 2021 18:54:57 +0000 (UTC)
Received: from work-vm (ovpn-114-228.ams2.redhat.com [10.36.114.228])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C3D160CC9;
 Mon,  7 Jun 2021 18:54:53 +0000 (UTC)
Date: Mon, 7 Jun 2021 19:54:50 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-trivial@nongnu.org
Subject: Re: [PATCH] docs/tools/virtiofsd.rst: Do not hard-code the QEMU
 binary name
Message-ID: <YL5revclBwJ9baTU@work-vm>
References: <20210607174250.920226-1-thuth@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210607174250.920226-1-thuth@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 07 Jun 2021 18:55:06 -0000

* Thomas Huth (thuth@redhat.com) wrote:
> In downstream, we want to use a different name for the QEMU binary,
> and some people might also use the docs for non-x86 binaries, that's
> why we already created the |qemu_system| placeholder in the past.
> Use it now in the virtiofsd doc, too.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  docs/tools/virtiofsd.rst | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/docs/tools/virtiofsd.rst b/docs/tools/virtiofsd.rst
> index 00554c75bd..265a39b0cf 100644
> --- a/docs/tools/virtiofsd.rst
> +++ b/docs/tools/virtiofsd.rst
> @@ -298,13 +298,13 @@ Examples
>  Export ``/var/lib/fs/vm001/`` on vhost-user UNIX domain socket
>  ``/var/run/vm001-vhost-fs.sock``:
>  
> -::
> +.. parsed-literal::
>  
>    host# virtiofsd --socket-path=/var/run/vm001-vhost-fs.sock -o source=/var/lib/fs/vm001
> -  host# qemu-system-x86_64 \
> -      -chardev socket,id=char0,path=/var/run/vm001-vhost-fs.sock \
> -      -device vhost-user-fs-pci,chardev=char0,tag=myfs \
> -      -object memory-backend-memfd,id=mem,size=4G,share=on \
> -      -numa node,memdev=mem \
> -      ...
> +  host# |qemu_system| \\
> +        -chardev socket,id=char0,path=/var/run/vm001-vhost-fs.sock \\
> +        -device vhost-user-fs-pci,chardev=char0,tag=myfs \\
> +        -object memory-backend-memfd,id=mem,size=4G,share=on \\
> +        -numa node,memdev=mem \\
> +        ...
>    guest# mount -t virtiofs myfs /mnt
> -- 
> 2.27.0
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


