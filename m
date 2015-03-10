Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YVLkt-0005H2-Mw
	for mharc-qemu-trivial@gnu.org; Tue, 10 Mar 2015 11:07:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34911)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1YVLkn-000577-Rr
	for qemu-trivial@nongnu.org; Tue, 10 Mar 2015 11:07:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1YVLkk-0007Cm-Ew
	for qemu-trivial@nongnu.org; Tue, 10 Mar 2015 11:07:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38544)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>)
	id 1YVLkk-0007Cc-83; Tue, 10 Mar 2015 11:07:26 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t2AF7NdM002006
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Tue, 10 Mar 2015 11:07:23 -0400
Received: from redhat.com (ovpn-116-113.ams2.redhat.com [10.36.116.113])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with SMTP
	id t2AF7KLW031010; Tue, 10 Mar 2015 11:07:21 -0400
Date: Tue, 10 Mar 2015 16:07:20 +0100
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefan Berger <stefanb@linux.vnet.ibm.com>
Message-ID: <20150310160704-mutt-send-email-mst@redhat.com>
References: <1425983641-216781-1-git-send-email-stefanb@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1425983641-216781-1-git-send-email-stefanb@linux.vnet.ibm.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com,
	Stefan Berger <stefanb@us.ibm.com>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH v2] tpm: Move memory subregion function
 into realize function
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
X-List-Received-Date: Tue, 10 Mar 2015 15:07:34 -0000

On Tue, Mar 10, 2015 at 06:34:01AM -0400, Stefan Berger wrote:
> From: Stefan Berger <stefanb@us.ibm.com>
> 
> Move the memory subregion function into the DeviceClass realize function
> due to isa_address_space (now) crashing if called in the instance init
> function.
> 
> Signed-off-by: Stefan Berger <stefanb@linux.vnet.ibm.com>

Paolo can you ack pls?

> ---
>  hw/tpm/tpm_tis.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/tpm/tpm_tis.c b/hw/tpm/tpm_tis.c
> index d0bb97f..9084ca4 100644
> --- a/hw/tpm/tpm_tis.c
> +++ b/hw/tpm/tpm_tis.c
> @@ -959,18 +959,18 @@ static void tpm_tis_realizefn(DeviceState *dev, Error **errp)
>      tis->bh = qemu_bh_new(tpm_tis_receive_bh, s);
>  
>      isa_init_irq(&s->busdev, &tis->irq, tis->irq_num);
> +
> +    memory_region_add_subregion(isa_address_space(ISA_DEVICE(dev)),
> +                                TPM_TIS_ADDR_BASE, &s->mmio);
>  }
>  
>  static void tpm_tis_initfn(Object *obj)
>  {
> -    ISADevice *dev = ISA_DEVICE(obj);
>      TPMState *s = TPM(obj);
>  
>      memory_region_init_io(&s->mmio, OBJECT(s), &tpm_tis_memory_ops,
>                            s, "tpm-tis-mmio",
>                            TPM_TIS_NUM_LOCALITIES << TPM_TIS_LOCALITY_SHIFT);
> -    memory_region_add_subregion(isa_address_space(dev), TPM_TIS_ADDR_BASE,
> -                                &s->mmio);
>  }
>  
>  static void tpm_tis_class_init(ObjectClass *klass, void *data)
> -- 
> 2.1.0

