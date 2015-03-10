Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YVHzv-0003ZP-A3
	for mharc-qemu-trivial@gnu.org; Tue, 10 Mar 2015 07:06:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43833)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1YVHzo-0003NM-M5
	for qemu-trivial@nongnu.org; Tue, 10 Mar 2015 07:06:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1YVHzk-0005Ez-Pp
	for qemu-trivial@nongnu.org; Tue, 10 Mar 2015 07:06:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47371)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>)
	id 1YVHzf-0005Du-J3; Tue, 10 Mar 2015 07:06:35 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t2AB6XbF027495
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Tue, 10 Mar 2015 07:06:34 -0400
Received: from nial.brq.redhat.com (dhcp-1-125.brq.redhat.com [10.34.1.125])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t2AB6WAr008385; Tue, 10 Mar 2015 07:06:33 -0400
Date: Tue, 10 Mar 2015 12:06:29 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Paulo Vital <paulo.vital@profitbricks.com>
Message-ID: <20150310120629.0db9d481@nial.brq.redhat.com>
In-Reply-To: <1425984177-10608-1-git-send-email-paulo.vital@profitbricks.com>
References: <1425984177-10608-1-git-send-email-paulo.vital@profitbricks.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] pc-dimm: Add description
	for device list.
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
X-List-Received-Date: Tue, 10 Mar 2015 11:06:48 -0000

On Tue, 10 Mar 2015 11:42:57 +0100
Paulo Vital <paulo.vital@profitbricks.com> wrote:

> The pc-dimm option presented on device list (by argument "-device \?")
> is the unique option that don't have any information about it. This
> patch adds a description for the pc-dimm device to help users to
> identify it.
> 
> Signed-off-by: Paulo Vital <paulo.vital@profitbricks.com>
> ---
>  hw/mem/pc-dimm.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/mem/pc-dimm.c b/hw/mem/pc-dimm.c
> index de81b9c..d3f7b5b 100644
> --- a/hw/mem/pc-dimm.c
> +++ b/hw/mem/pc-dimm.c
> @@ -351,6 +351,7 @@ static void pc_dimm_class_init(ObjectClass *oc, void *data)
>  
>      dc->realize = pc_dimm_realize;
>      dc->props = pc_dimm_properties;
> +    dc->desc = "Dimm device for Memory Hotplug";
it's not necessarily only for hotplug, I'd suggest:
"DIMM memory module"

>  
>      ddc->get_memory_region = pc_dimm_get_memory_region;
>  }


