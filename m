Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YxE7V-0007ii-Nf
	for mharc-qemu-trivial@gnu.org; Tue, 26 May 2015 08:38:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47420)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcel.apfelbaum@gmail.com>) id 1YxAjE-0007Ol-No
	for qemu-trivial@nongnu.org; Tue, 26 May 2015 05:00:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcel.apfelbaum@gmail.com>) id 1YxAjA-0007Yr-Gd
	for qemu-trivial@nongnu.org; Tue, 26 May 2015 05:00:52 -0400
Received: from mail-lb0-x22d.google.com ([2a00:1450:4010:c04::22d]:35811)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcel.apfelbaum@gmail.com>)
	id 1YxAjA-0007YY-13; Tue, 26 May 2015 05:00:48 -0400
Received: by lbbuc2 with SMTP id uc2so65555274lbb.2;
	Tue, 26 May 2015 02:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:reply-to:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=WT+1F1YSSJs5MAp/KhxlskKiSTd3EOu7ptqnAjRGyKo=;
	b=wG7bxUmBO3nGPy+L3rkLdFiW11Bu/AObTwvc+R3JJ7tca8YoreMt+F8m2j/jxihDYr
	jGbt152qNICkPbLIk2mNOn8ClW1SQNzZBaKmSeLYHPgeamf40Ezl+3yDAV42IRitDVQY
	qUsSuLIPVV2ph+dT2ccbxIM2ytqgZ+Mvfdo6UiaEphn+JFjuKL9O/mlai6tQcXGFz1+U
	i5BNSysinxfxY2P5blwgMzOwPxlLQCq283HN6s2IlHb28turM1o1NeefMCkynLM3QYrD
	yZC4BRnoAKfp73FRtLRtWn55yte0cUWJJ3VJiKF2sfCYqsAxpIKbRutQ8FU8ifBlrdO9
	HbHg==
X-Received: by 10.152.19.162 with SMTP id g2mr21572193lae.46.1432630847138;
	Tue, 26 May 2015 02:00:47 -0700 (PDT)
Received: from [10.0.0.6] (87.68.245.222.adsl.012.net.il. [87.68.245.222])
	by mx.google.com with ESMTPSA id c2sm2878233laa.43.2015.05.26.02.00.44
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 26 May 2015 02:00:46 -0700 (PDT)
Message-ID: <5564363A.9090100@gmail.com>
Date: Tue, 26 May 2015 12:00:42 +0300
From: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Shannon Zhao <zhaoshenglong@huawei.com>, qemu-devel@nongnu.org
References: <1432604767-5964-1-git-send-email-zhaoshenglong@huawei.com>
	<1432604767-5964-2-git-send-email-zhaoshenglong@huawei.com>
In-Reply-To: <1432604767-5964-2-git-send-email-zhaoshenglong@huawei.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4010:c04::22d
X-Mailman-Approved-At: Tue, 26 May 2015 08:38:07 -0400
Cc: qemu-trivial@nongnu.org, shannon.zhao@linaro.org
Subject: Re: [Qemu-trivial] [PATCH v2 1/3] hw/i386/pc_piix: Fix memory leak
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
Reply-To: marcel@redhat.com
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 26 May 2015 09:00:58 -0000

On 05/26/2015 04:46 AM, Shannon Zhao wrote:
> From: Shannon Zhao <shannon.zhao@linaro.org>
>
> valgrind complains about:
> ==16447== 8 bytes in 1 blocks are definitely lost in loss record 552 of 3,310
> ==16447==    at 0x4C2845D: malloc (in /usr/lib64/valgrind/vgpreload_memcheck-amd64-linux.so)
> ==16447==    by 0x2E4FD7: malloc_and_trace (vl.c:2546)
> ==16447==    by 0x64C770E: g_malloc (in /usr/lib64/libglib-2.0.so.0.3600.3)
> ==16447==    by 0x36FB47: qemu_extend_irqs (irq.c:55)
> ==16447==    by 0x36FBD3: qemu_allocate_irqs (irq.c:64)
> ==16447==    by 0x24E622: pc_init1 (pc_piix.c:287)
> ==16447==    by 0x24E76A: pc_init_pci (pc_piix.c:310)
> ==16447==    by 0x2E9360: main (vl.c:4226)
>
> ==16447== 128 bytes in 1 blocks are definitely lost in loss record 2,569 of 3,310
> ==16447==    at 0x4C2845D: malloc (in /usr/lib64/valgrind/vgpreload_memcheck-amd64-linux.so)
> ==16447==    by 0x2E4FD7: malloc_and_trace (vl.c:2546)
> ==16447==    by 0x64C770E: g_malloc (in /usr/lib64/libglib-2.0.so.0.3600.3)
> ==16447==    by 0x36FB47: qemu_extend_irqs (irq.c:55)
> ==16447==    by 0x36FBD3: qemu_allocate_irqs (irq.c:64)
> ==16447==    by 0x25BEB2: kvm_i8259_init (i8259.c:133)
> ==16447==    by 0x24E1F1: pc_init1 (pc_piix.c:219)
> ==16447==    by 0x24E76A: pc_init_pci (pc_piix.c:310)
> ==16447==    by 0x2E9360: main (vl.c:4226)
>
> Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
> Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
> ---
>   hw/i386/pc_piix.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index 1fe7bfb..d567887 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -89,7 +89,7 @@ static void pc_init1(MachineState *machine,
>       qemu_irq *cpu_irq;
>       qemu_irq *gsi;
>       qemu_irq *i8259;
> -    qemu_irq *smi_irq;
> +    qemu_irq smi_irq;
>       GSIState *gsi_state;
>       DriveInfo *hd[MAX_IDE_BUS * MAX_IDE_DEVS];
>       BusState *idebus[MAX_IDE_BUS];
> @@ -227,6 +227,7 @@ static void pc_init1(MachineState *machine,
>       for (i = 0; i < ISA_NUM_IRQS; i++) {
>           gsi_state->i8259_irq[i] = i8259[i];
>       }
> +    g_free(i8259);
>       if (pci_enabled) {
>           ioapic_init_gsi(gsi_state, "i440fx");
>       }
> @@ -284,10 +285,10 @@ static void pc_init1(MachineState *machine,
>           DeviceState *piix4_pm;
>           I2CBus *smbus;
>
> -        smi_irq = qemu_allocate_irqs(pc_acpi_smi_interrupt, first_cpu, 1);
> +        smi_irq = qemu_allocate_irq(pc_acpi_smi_interrupt, first_cpu, 0);
>           /* TODO: Populate SPD eeprom data.  */
>           smbus = piix4_pm_init(pci_bus, piix3_devfn + 3, 0xb100,
> -                              gsi[9], *smi_irq,
> +                              gsi[9], smi_irq,
>                                 kvm_enabled(), fw_cfg, &piix4_pm);
>           smbus_eeprom_init(smbus, 8, NULL, 0);
>
>

Reviewed-by: Marcel Apfelbaum <marcel@redhat.com>

Thanks,
Marcel


