Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YVGZv-0006mx-Ea
	for mharc-qemu-trivial@gnu.org; Tue, 10 Mar 2015 05:35:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43061)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1YVGZo-0006Xp-Gj
	for qemu-trivial@nongnu.org; Tue, 10 Mar 2015 05:35:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1YVGZn-0003ja-H8
	for qemu-trivial@nongnu.org; Tue, 10 Mar 2015 05:35:48 -0400
Received: from mail-wg0-x235.google.com ([2a00:1450:400c:c00::235]:45924)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1YVGZg-0003cE-E2; Tue, 10 Mar 2015 05:35:40 -0400
Received: by wggx13 with SMTP id x13so332968wgg.12;
	Tue, 10 Mar 2015 02:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=rZHO3D1Efris98iMPMtcCJ3p0cyZsl+iNXNSt46mdOY=;
	b=gF+IdKr9Ad5NMQoSqcbhIIP4LdNoIfrMm7S9U0SWp4B9z1ZQS80fY4G2YsgLAa6+9T
	43X4MF1/X2VuCDEoVv4Fqly2JVvq6u63+yRU8IjzPJUxpv8ycFBKuIheYtSfO/85ks+Y
	zJG/WeWqTn5FATwzUYqFglHcEhdLg7I0aqRNGHw/rhpnQD/N324vnoSGZFgfyCMuW+Az
	jScB2Qu+kGypt7IAXGWuYxHJSP7WlfVEspREgX42fjV52cICuHpQpmkoYe9ggQv90hVx
	DExXNQGoH//2ysMvZvx/n07WUYh21MODiCl0PJInxrngvuEXuaeg3YQyst0r3eUqND2K
	ioPg==
X-Received: by 10.180.96.197 with SMTP id du5mr41834765wib.68.1425980139825;
	Tue, 10 Mar 2015 02:35:39 -0700 (PDT)
Received: from [192.168.10.150] (net-188-216-23-124.cust.vodafonedsl.it.
	[188.216.23.124]) by mx.google.com with ESMTPSA id
	hd10sm18710715wib.7.2015.03.10.02.35.37
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Mar 2015 02:35:38 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <54FEBAE7.6030905@redhat.com>
Date: Tue, 10 Mar 2015 10:35:35 +0100
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Stefan Berger <stefanb@linux.vnet.ibm.com>, mst@redhat.com, 
	qemu-trivial@nongnu.org, qemu-devel@nongnu.org
References: <1425945099-215293-1-git-send-email-stefanb@linux.vnet.ibm.com>
In-Reply-To: <1425945099-215293-1-git-send-email-stefanb@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c00::235
Cc: Stefan Berger <stefanb@us.ibm.com>
Subject: Re: [Qemu-trivial] [PATCH] tpm: Move memory initialization into
	realize function
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
X-List-Received-Date: Tue, 10 Mar 2015 09:35:54 -0000



On 10/03/2015 00:51, Stefan Berger wrote:
> From: Stefan Berger <stefanb@us.ibm.com>
> 
> Move the memory initialization into the DeviceClass realize function due to
> isa_address_space crashing if called in the instance init function.
> A recent change must have changed the order in which structures are
> initialized so that this move is now necessary.
> 
> Signed-off-by: Stefan Berger <stefanb@linux.vnet.ibm.com>
> ---
>  hw/tpm/tpm_tis.c | 11 ++---------
>  1 file changed, 2 insertions(+), 9 deletions(-)
> 
> diff --git a/hw/tpm/tpm_tis.c b/hw/tpm/tpm_tis.c
> index d0bb97f..339e1bf 100644
> --- a/hw/tpm/tpm_tis.c
> +++ b/hw/tpm/tpm_tis.c
> @@ -959,18 +959,12 @@ static void tpm_tis_realizefn(DeviceState *dev, Error **errp)
>      tis->bh = qemu_bh_new(tpm_tis_receive_bh, s);
>  
>      isa_init_irq(&s->busdev, &tis->irq, tis->irq_num);
> -}
> -
> -static void tpm_tis_initfn(Object *obj)
> -{
> -    ISADevice *dev = ISA_DEVICE(obj);
> -    TPMState *s = TPM(obj);
>  
>      memory_region_init_io(&s->mmio, OBJECT(s), &tpm_tis_memory_ops,
>                            s, "tpm-tis-mmio",
>                            TPM_TIS_NUM_LOCALITIES << TPM_TIS_LOCALITY_SHIFT);
> -    memory_region_add_subregion(isa_address_space(dev), TPM_TIS_ADDR_BASE,
> -                                &s->mmio);
> +    memory_region_add_subregion(isa_address_space(ISA_DEVICE(dev)),
> +                                TPM_TIS_ADDR_BASE, &s->mmio);
>  }

Please leave memory_region_init_io in the instance_init function, though.

Thanks,

Paolo

>  static void tpm_tis_class_init(ObjectClass *klass, void *data)
> @@ -987,7 +981,6 @@ static const TypeInfo tpm_tis_info = {
>      .name = TYPE_TPM_TIS,
>      .parent = TYPE_ISA_DEVICE,
>      .instance_size = sizeof(TPMState),
> -    .instance_init = tpm_tis_initfn,
>      .class_init  = tpm_tis_class_init,
>  };
>  
> 

