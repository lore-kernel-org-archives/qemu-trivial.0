Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1sJoKX-0000L0-IA
	for mharc-qemu-trivial@gnu.org; Wed, 19 Jun 2024 01:58:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1sJoKV-0000Jt-G4
 for qemu-trivial@nongnu.org; Wed, 19 Jun 2024 01:57:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1sJoKU-0002vd-0k
 for qemu-trivial@nongnu.org; Wed, 19 Jun 2024 01:57:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718776677;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=BW0f/jx+kDhhZS2H6o9qj2psvjx8/jWoOCoGT7/QvAg=;
 b=SRVswsTZhjSzHQNp4URrPgJ0flp17yG10BUXlhM9iE7hlhFgPi6bsnApwrzk3t7IfPNv+3
 uVii3A/B05WxT3PWxBQT0qrXwrUJhe5PnbLOlDQgf4NzXsAmcGclomi1QoQ+xYcPJl0gkR
 sAkmRZdOTxo7bBMT0toW7DBPuH3sl8E=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-130-dN0fom4lPday34t202DiLg-1; Wed, 19 Jun 2024 01:57:55 -0400
X-MC-Unique: dN0fom4lPday34t202DiLg-1
Received: by mail-yw1-f197.google.com with SMTP id
 00721157ae682-631b498f981so96834867b3.0
 for <qemu-trivial@nongnu.org>; Tue, 18 Jun 2024 22:57:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718776675; x=1719381475;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BW0f/jx+kDhhZS2H6o9qj2psvjx8/jWoOCoGT7/QvAg=;
 b=PmypwCZga4Q7IJVhUIFsHgMNHKXievzu5bAb2mogMABK7/w3Zs1LgqrGep6bsvsJg3
 dmP4VNESsCNO1nZzFXrxBRAwHH5j+XDI7EEVn/ufRJVLA2jEOuYbqHgLcCnnbjvBlY77
 uI/0ms3KLVjx8sAUGhoHrqJHb+RDU+GDvtlHplLCw76DySm5JzrC/eWdxYDSKM0tLwAl
 uFRYcYgJgXztdkKXSyWbUmO6wJfW6zcQeCqk3O/A3pn8hc70hvAnrZks7/W+dD3+9ebB
 O8ZIY7X5DnQrL1SHTmt7PfsVa5Qwr3rc35oXC7Il+WiwFIyiZh9/ceSbpBXxi0FYralR
 ZxXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVa/2mqC6ylyF+CFPqNzFjANUBuKesVdKJYvWzbnIvT6KE0SKk7qOa+MAioqce94OBOUhqy75+LCslUR7baUG5uAtSgNMyWUw==
X-Gm-Message-State: AOJu0YwlmKtbBgjp7QWwYkMR/4oJ9v2Id91nxdHf6dT5OI0ZE7mi4y3q
 COQEsNGypfHqpdhikOJnkcqUIrPlS28z8muZWrRPPahhZAEqZQ67Wc7jPpJvnYfBO02H/D90Fsc
 huwhj+9KLjDugNmfunXn+cP85VWF2jWFGXvsXS9Q3KruyGztvWHCM0f0=
X-Received: by 2002:a81:9e0d:0:b0:62c:c65d:8d1c with SMTP id
 00721157ae682-63a8faf2eb6mr15316007b3.52.1718776675037; 
 Tue, 18 Jun 2024 22:57:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFfdXU3DmXCfiJkGoBKT2c7MqL3WPW2xtqGkz9n54NjK9uaNzQI9DAZdpp0JE6Pq0XV+lOz+w==
X-Received: by 2002:a81:9e0d:0:b0:62c:c65d:8d1c with SMTP id
 00721157ae682-63a8faf2eb6mr15315857b3.52.1718776674643; 
 Tue, 18 Jun 2024 22:57:54 -0700 (PDT)
Received: from [192.168.0.4] (ip-109-43-178-117.web.vodafone.de.
 [109.43.178.117]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b2a5ef497esm73881606d6.124.2024.06.18.22.57.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jun 2024 22:57:54 -0700 (PDT)
Message-ID: <4687c59a-1427-4215-a58d-cb84dd27f9ff@redhat.com>
Date: Wed, 19 Jun 2024 07:57:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] target/s390x/arch_dump: use correct byte order for pid
To: Omar Sandoval <osandov@osandov.com>, qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 linux-debuggers@vger.kernel.org, QEMU Trivial <qemu-trivial@nongnu.org>
References: <cover.1718771802.git.osandov@osandov.com>
 <5929f76d536d355afd04af51bf293695a1065118.1718771802.git.osandov@osandov.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <5929f76d536d355afd04af51bf293695a1065118.1718771802.git.osandov@osandov.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.148,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 19 Jun 2024 05:57:59 -0000

On 19/06/2024 07.00, Omar Sandoval wrote:
> The pid field of prstatus needs to be big endian like all of the other
> fields.
> 
> Fixes: f738f296eaae ("s390x/arch_dump: pass cpuid into notes sections")
> Signed-off-by: Omar Sandoval <osandov@osandov.com>
> ---
>   target/s390x/arch_dump.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/s390x/arch_dump.c b/target/s390x/arch_dump.c
> index 7e8a1b4fc0..029d91d93a 100644
> --- a/target/s390x/arch_dump.c
> +++ b/target/s390x/arch_dump.c
> @@ -102,7 +102,7 @@ static void s390x_write_elf64_prstatus(Note *note, S390CPU *cpu, int id)
>           regs->acrs[i] = cpu_to_be32(cpu->env.aregs[i]);
>           regs->gprs[i] = cpu_to_be64(cpu->env.regs[i]);
>       }
> -    note->contents.prstatus.pid = id;
> +    note->contents.prstatus.pid = cpu_to_be32(id);
>   }
>   
>   static void s390x_write_elf64_fpregset(Note *note, S390CPU *cpu, int id)

Reviewed-by: Thomas Huth <thuth@redhat.com>


