Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YcoqZ-0005oQ-NE
	for mharc-qemu-trivial@gnu.org; Tue, 31 Mar 2015 01:36:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45669)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jasowang@redhat.com>) id 1YcoqX-0005iy-2S
	for qemu-trivial@nongnu.org; Tue, 31 Mar 2015 01:36:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jasowang@redhat.com>) id 1YcoqW-0001HC-Aq
	for qemu-trivial@nongnu.org; Tue, 31 Mar 2015 01:36:17 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48328)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jasowang@redhat.com>)
	id 1YcoqP-0001G2-GK; Tue, 31 Mar 2015 01:36:09 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t2V5a61O006734
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Tue, 31 Mar 2015 01:36:06 -0400
Received: from [10.72.6.116] (vpn1-6-116.pek2.redhat.com [10.72.6.116])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t2V5a4Is023553; Tue, 31 Mar 2015 01:36:05 -0400
Message-ID: <551A3243.8010401@redhat.com>
Date: Tue, 31 Mar 2015 13:36:03 +0800
From: Jason Wang <jasowang@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Greg Kurz <gkurz@linux.vnet.ibm.com>, qemu-trivial@nongnu.org
References: <20150326111029.4249.43831.stgit@bahia.local>
In-Reply-To: <20150326111029.4249.43831.stgit@bahia.local>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] vhost: fix typo in vq_index
	description
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
X-List-Received-Date: Tue, 31 Mar 2015 05:36:18 -0000



On 03/26/2015 07:10 PM, Greg Kurz wrote:
> Signed-off-by: Greg Kurz <gkurz@linux.vnet.ibm.com>
> ---
>  include/hw/virtio/vhost.h |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
> index 71ef18f..88e1e56 100644
> --- a/include/hw/virtio/vhost.h
> +++ b/include/hw/virtio/vhost.h
> @@ -36,7 +36,7 @@ struct vhost_dev {
>      MemoryRegionSection *mem_sections;
>      struct vhost_virtqueue *vqs;
>      int nvqs;
> -    /* the first virtuque which would be used by this vhost dev */
> +    /* the first virtqueue which would be used by this vhost dev */
>      int vq_index;
>      unsigned long long features;
>      unsigned long long acked_features;
>
>

Acked-by: Jason Wang <jasowang@redhat.com>

