Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UmfOC-0001Gz-6u
	for mharc-qemu-trivial@gnu.org; Wed, 12 Jun 2013 03:22:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52252)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1UmfO7-00019t-Jj
	for qemu-trivial@nongnu.org; Wed, 12 Jun 2013 03:22:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1UmfO4-00088L-Qv
	for qemu-trivial@nongnu.org; Wed, 12 Jun 2013 03:22:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37698)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>)
	id 1UmfNy-00087O-JV; Wed, 12 Jun 2013 03:22:26 -0400
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r5C7MNfO024503
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 12 Jun 2013 03:22:24 -0400
Received: from localhost (dhcp-64-106.muc.redhat.com [10.32.64.106])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r5C7MMij018125; Wed, 12 Jun 2013 03:22:23 -0400
Date: Wed, 12 Jun 2013 09:22:21 +0200
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Message-ID: <20130612072221.GA946@stefanha-thinkpad.muc.redhat.com>
References: <1370249911-19708-1-git-send-email-stefanha@redhat.com>
	<1370249911-19708-3-git-send-email-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1370249911-19708-3-git-send-email-stefanha@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Cam Macdonell <cam@cs.ualberta.ca>,
	Eric Blake <eblake@redhat.com>, qemu-stable@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH v2 2/2] ivshmem: add missing error exit(2)
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
X-List-Received-Date: Wed, 12 Jun 2013 07:22:38 -0000

On Mon, Jun 03, 2013 at 10:58:31AM +0200, Stefan Hajnoczi wrote:
> If the user fails to specify 'chardev' or 'shm' then we cannot continue.
> Exit right away so that we don't invoke shm_open(3) with a NULL pointer.
> 
> It would be nice to replace exit(1) with error returns in the PCI device
> .init() function, but leave that for another patch since exit(1) is
> currently used elsewhere.
> 
> Spotted by Coverity.
> 
> Cc: Cam Macdonell <cam@cs.ualberta.ca>
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  hw/misc/ivshmem.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/misc/ivshmem.c b/hw/misc/ivshmem.c
> index a19a6d6..5658f73 100644
> --- a/hw/misc/ivshmem.c
> +++ b/hw/misc/ivshmem.c
> @@ -735,6 +735,7 @@ static int pci_ivshmem_init(PCIDevice *dev)
>  
>          if (s->shmobj == NULL) {
>              fprintf(stderr, "Must specify 'chardev' or 'shm' to ivshmem\n");
> +            exit(1);
>          }
>  
>          IVSHMEM_DPRINTF("using shm_open (shm object = %s)\n", s->shmobj);
> -- 
> 1.8.1.4
> 

Ping?

