Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YVMOX-0006Zm-To
	for mharc-qemu-trivial@gnu.org; Tue, 10 Mar 2015 11:48:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51753)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1YVMOV-0006V9-Fk
	for qemu-trivial@nongnu.org; Tue, 10 Mar 2015 11:48:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1YVMOU-0007Dp-Ju
	for qemu-trivial@nongnu.org; Tue, 10 Mar 2015 11:48:31 -0400
Received: from mail-wi0-x22d.google.com ([2a00:1450:400c:c05::22d]:46793)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1YVMOO-0007Az-Mo; Tue, 10 Mar 2015 11:48:24 -0400
Received: by wiwh11 with SMTP id h11so4114053wiw.5;
	Tue, 10 Mar 2015 08:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=wyeiMwk7AWIDvId7EBhpVMWLFgGwpIN9xglKMXM/68Q=;
	b=oiLeTpgbV8iFl5KrpbDeTZiFhUcC7rfiEPUqBgU+rZjrDREcCSYXKKoz0H+HhajTQY
	nHr2oyk0SbVrVUpHVg8vXADj+YQHeTQoLK0vLhIIlhl1h4bzDqN+LxIvayeywQtIO/+a
	rBdD7nNGq5BYUfQLoMDv//qGxrIqvLoZKvtsNER+FUMxSIbWLZoH8lcQgGPaz0Sz3aIp
	zsdzig1UjbStENLcnE3GA5PQbkDgLX5Y8EVU7riRd6zfeD25ApO514pegczhwT5QmgXZ
	AJZkscc4yo6BcSvv2uFPGH1CAx7fEDhnK4uCp+OPEyo5MJzsZKhu9gw3D5T9xujpW7UC
	wVew==
X-Received: by 10.194.11.9 with SMTP id m9mr68489872wjb.82.1426002503971;
	Tue, 10 Mar 2015 08:48:23 -0700 (PDT)
Received: from [192.168.10.165] (net-188-216-23-124.cust.vodafonedsl.it.
	[188.216.23.124])
	by mx.google.com with ESMTPSA id ha5sm20834828wib.1.2015.03.10.08.48.22
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Mar 2015 08:48:23 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <54FF1244.2080906@redhat.com>
Date: Tue, 10 Mar 2015 16:48:20 +0100
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: "Michael S. Tsirkin" <mst@redhat.com>, 
	Stefan Berger <stefanb@linux.vnet.ibm.com>
References: <1425983641-216781-1-git-send-email-stefanb@linux.vnet.ibm.com>
	<20150310160704-mutt-send-email-mst@redhat.com>
In-Reply-To: <20150310160704-mutt-send-email-mst@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::22d
Cc: qemu-trivial@nongnu.org, Stefan Berger <stefanb@us.ibm.com>,
	qemu-devel@nongnu.org
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
X-List-Received-Date: Tue, 10 Mar 2015 15:48:32 -0000



On 10/03/2015 16:07, Michael S. Tsirkin wrote:
> On Tue, Mar 10, 2015 at 06:34:01AM -0400, Stefan Berger wrote:
>> From: Stefan Berger <stefanb@us.ibm.com>
>>
>> Move the memory subregion function into the DeviceClass realize function
>> due to isa_address_space (now) crashing if called in the instance init
>> function.
>>
>> Signed-off-by: Stefan Berger <stefanb@linux.vnet.ibm.com>
> 
> Paolo can you ack pls?

Yup.

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>

> 
>> ---
>>  hw/tpm/tpm_tis.c | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/hw/tpm/tpm_tis.c b/hw/tpm/tpm_tis.c
>> index d0bb97f..9084ca4 100644
>> --- a/hw/tpm/tpm_tis.c
>> +++ b/hw/tpm/tpm_tis.c
>> @@ -959,18 +959,18 @@ static void tpm_tis_realizefn(DeviceState *dev, Error **errp)
>>      tis->bh = qemu_bh_new(tpm_tis_receive_bh, s);
>>  
>>      isa_init_irq(&s->busdev, &tis->irq, tis->irq_num);
>> +
>> +    memory_region_add_subregion(isa_address_space(ISA_DEVICE(dev)),
>> +                                TPM_TIS_ADDR_BASE, &s->mmio);
>>  }
>>  
>>  static void tpm_tis_initfn(Object *obj)
>>  {
>> -    ISADevice *dev = ISA_DEVICE(obj);
>>      TPMState *s = TPM(obj);
>>  
>>      memory_region_init_io(&s->mmio, OBJECT(s), &tpm_tis_memory_ops,
>>                            s, "tpm-tis-mmio",
>>                            TPM_TIS_NUM_LOCALITIES << TPM_TIS_LOCALITY_SHIFT);
>> -    memory_region_add_subregion(isa_address_space(dev), TPM_TIS_ADDR_BASE,
>> -                                &s->mmio);
>>  }
>>  
>>  static void tpm_tis_class_init(ObjectClass *klass, void *data)
>> -- 
>> 2.1.0
> 
> 

