Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1sJoO3-0003oH-5z
	for mharc-qemu-trivial@gnu.org; Wed, 19 Jun 2024 02:01:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1sJoNx-0003mj-2S
 for qemu-trivial@nongnu.org; Wed, 19 Jun 2024 02:01:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1sJoNv-0003lC-CX
 for qemu-trivial@nongnu.org; Wed, 19 Jun 2024 02:01:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718776890;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=0Y0GtWcMX2y0zaI4VvqROSIOoPgBAf0RqtH/WOxhJiM=;
 b=VQC0qmL7nFLLy7lxZlPIcilOmmxLHCSOT97Y7rJsvgz8o2jz3qWfHATUT7C73kOB/gX/k6
 UStu1vflrHT1ciugOsmfpPjFqXs3U9u9kSBZNz6kcN+52WfifQ3jfeuAoag7sBgJ0gA6dp
 tLg2C635SWkige2q/mFqs4nq+9GzmVk=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-197-felm9MNoOFOX3rbqD7mjiQ-1; Wed, 19 Jun 2024 02:01:25 -0400
X-MC-Unique: felm9MNoOFOX3rbqD7mjiQ-1
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6b5093b20d9so1698316d6.2
 for <qemu-trivial@nongnu.org>; Tue, 18 Jun 2024 23:01:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718776885; x=1719381685;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0Y0GtWcMX2y0zaI4VvqROSIOoPgBAf0RqtH/WOxhJiM=;
 b=FsX73yAbrk3vLm80rJ83fW2B0A2Ng+iWK6U3q5JL/2smc/ifLwapAuXXGhf8yR7nCj
 Io7zba2fY2TlPBLxRsY3Ig7Cln+jUWDAMr/KD4xptEQuazB47bMR9V5BsTjFbrHyq19N
 VYpxbsPvG7ViYBJL1bScu3Le5Guj1kY83kmZCksqi2F8RcmdDTi0ExctnJKBt4FFM6Qf
 kNg+nhdNr9BeEVo9eI1jEtIpxyMOA4yzWJe3Ods3uleyyERM/MpxPrIadzG6zgI9V8zj
 S0pR1DydNV1sciO10MMZBkam+byI82hh7U5dj3F201Vc6tuhmqL1aNsY6NSk06C2qwQW
 Ipgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOXfgP3gYEoRPRhE/NbzrZ0eMcNmSXa4L4+Up9L1JZCJKkdSjZjUj/iWAA5ePBdanxW9ymqctE5VPdcKpFW/746KiJpyhipQ==
X-Gm-Message-State: AOJu0YwWqqDVc5BAMNW+oRwcnNS+G468AXUeQ0ezJNJY3EF31RVwM7Ux
 B/AAB12Y/qu0XZDOtFhiMYM1AC4qFH1xyCg+S9nIsTGFEj+C4ZLF1t5+qBncy6GdrW/fR5Mbb+z
 DvJf5c4k5Yo8EOp/QZITb+0Xcv54L1roDGmNboLH3gcnsoEbKdIicGW8=
X-Received: by 2002:a0c:e0c3:0:b0:6b4:fe1a:eeee with SMTP id
 6a1803df08f44-6b501e9f637mr19468296d6.46.1718776884887; 
 Tue, 18 Jun 2024 23:01:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOlQPtOt/WDLisxVRRXxxBkAti9S9bN87HfHM0ed0j5B1K960SeuORXaGfkqnNFcbzBoh5bA==
X-Received: by 2002:a0c:e0c3:0:b0:6b4:fe1a:eeee with SMTP id
 6a1803df08f44-6b501e9f637mr19468126d6.46.1718776884528; 
 Tue, 18 Jun 2024 23:01:24 -0700 (PDT)
Received: from [192.168.0.4] (ip-109-43-178-117.web.vodafone.de.
 [109.43.178.117]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b506e7525esm2400526d6.108.2024.06.18.23.01.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jun 2024 23:01:24 -0700 (PDT)
Message-ID: <431324a5-d455-464c-a4cb-1b2fc457b31b@redhat.com>
Date: Wed, 19 Jun 2024 08:01:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] target/ppc/arch_dump: set prstatus pid to cpuid
To: Omar Sandoval <osandov@osandov.com>, qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 linux-debuggers@vger.kernel.org, QEMU Trivial <qemu-trivial@nongnu.org>
References: <cover.1718771802.git.osandov@osandov.com>
 <ac09da04c8e6dd777945219815d1c53b02291b5b.1718771802.git.osandov@osandov.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <ac09da04c8e6dd777945219815d1c53b02291b5b.1718771802.git.osandov@osandov.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.148,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Jun 2024 06:01:35 -0000

On 19/06/2024 07.00, Omar Sandoval wrote:
> Every other architecture does this, and debuggers need it to be able to
> identify which prstatus note corresponds to which CPU.
> 
> Signed-off-by: Omar Sandoval <osandov@osandov.com>
> ---
>   target/ppc/arch_dump.c | 21 ++++++++++++---------
>   1 file changed, 12 insertions(+), 9 deletions(-)
> 
> diff --git a/target/ppc/arch_dump.c b/target/ppc/arch_dump.c
> index a8315659d9..78b4205319 100644
> --- a/target/ppc/arch_dump.c
> +++ b/target/ppc/arch_dump.c
> @@ -47,9 +47,11 @@ struct PPCUserRegStruct {
>   } QEMU_PACKED;
>   
>   struct PPCElfPrstatus {
> -    char pad1[112];
> +    char pad1[32];
> +    uint32_t pid;
> +    uint8_t pad2[76];
>       struct PPCUserRegStruct pr_reg;
> -    char pad2[40];
> +    char pad3[40];
>   } QEMU_PACKED;
>   
>   
> @@ -96,7 +98,7 @@ typedef struct NoteFuncArg {
>       DumpState *state;
>   } NoteFuncArg;
>   
> -static void ppc_write_elf_prstatus(NoteFuncArg *arg, PowerPCCPU *cpu)
> +static void ppc_write_elf_prstatus(NoteFuncArg *arg, PowerPCCPU *cpu, int id)
>   {
>       int i;
>       reg_t cr;
> @@ -109,6 +111,7 @@ static void ppc_write_elf_prstatus(NoteFuncArg *arg, PowerPCCPU *cpu)
>   
>       prstatus = &note->contents.prstatus;
>       memset(prstatus, 0, sizeof(*prstatus));
> +    prstatus->pid = cpu_to_dump32(s, id);
>       reg = &prstatus->pr_reg;
>   
>       for (i = 0; i < 32; i++) {
> @@ -127,7 +130,7 @@ static void ppc_write_elf_prstatus(NoteFuncArg *arg, PowerPCCPU *cpu)
>       reg->ccr = cpu_to_dump_reg(s, cr);
>   }
>   
> -static void ppc_write_elf_fpregset(NoteFuncArg *arg, PowerPCCPU *cpu)
> +static void ppc_write_elf_fpregset(NoteFuncArg *arg, PowerPCCPU *cpu, int id)
>   {
>       int i;
>       struct PPCElfFpregset  *fpregset;
> @@ -146,7 +149,7 @@ static void ppc_write_elf_fpregset(NoteFuncArg *arg, PowerPCCPU *cpu)
>       fpregset->fpscr = cpu_to_dump_reg(s, cpu->env.fpscr);
>   }
>   
> -static void ppc_write_elf_vmxregset(NoteFuncArg *arg, PowerPCCPU *cpu)
> +static void ppc_write_elf_vmxregset(NoteFuncArg *arg, PowerPCCPU *cpu, int id)
>   {
>       int i;
>       struct PPCElfVmxregset *vmxregset;
> @@ -178,7 +181,7 @@ static void ppc_write_elf_vmxregset(NoteFuncArg *arg, PowerPCCPU *cpu)
>       vmxregset->vscr.u32[3] = cpu_to_dump32(s, ppc_get_vscr(&cpu->env));
>   }
>   
> -static void ppc_write_elf_vsxregset(NoteFuncArg *arg, PowerPCCPU *cpu)
> +static void ppc_write_elf_vsxregset(NoteFuncArg *arg, PowerPCCPU *cpu, int id)
>   {
>       int i;
>       struct PPCElfVsxregset *vsxregset;
> @@ -195,7 +198,7 @@ static void ppc_write_elf_vsxregset(NoteFuncArg *arg, PowerPCCPU *cpu)
>       }
>   }
>   
> -static void ppc_write_elf_speregset(NoteFuncArg *arg, PowerPCCPU *cpu)
> +static void ppc_write_elf_speregset(NoteFuncArg *arg, PowerPCCPU *cpu, int id)
>   {
>       struct PPCElfSperegset *speregset;
>       Note *note = &arg->note;
> @@ -211,7 +214,7 @@ static void ppc_write_elf_speregset(NoteFuncArg *arg, PowerPCCPU *cpu)
>   
>   static const struct NoteFuncDescStruct {
>       int contents_size;
> -    void (*note_contents_func)(NoteFuncArg *arg, PowerPCCPU *cpu);
> +    void (*note_contents_func)(NoteFuncArg *arg, PowerPCCPU *cpu, int id);
>   } note_func[] = {
>       {sizeof_field(Note, contents.prstatus),  ppc_write_elf_prstatus},
>       {sizeof_field(Note, contents.fpregset),  ppc_write_elf_fpregset},
> @@ -282,7 +285,7 @@ static int ppc_write_all_elf_notes(const char *note_name,
>           arg.note.hdr.n_descsz = cpu_to_dump32(s, nf->contents_size);
>           strncpy(arg.note.name, note_name, sizeof(arg.note.name));
>   
> -        (*nf->note_contents_func)(&arg, cpu);
> +        (*nf->note_contents_func)(&arg, cpu, id);
>   
>           note_size =
>               sizeof(arg.note) - sizeof(arg.note.contents) + nf->contents_size;

Reviewed-by: Thomas Huth <thuth@redhat.com>


