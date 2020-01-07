Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ioqHp-0004G2-VP
	for mharc-qemu-trivial@gnu.org; Tue, 07 Jan 2020 09:56:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49591)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1ioqHn-0004Am-U6
 for qemu-trivial@nongnu.org; Tue, 07 Jan 2020 09:56:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1ioqHl-0005ia-Gp
 for qemu-trivial@nongnu.org; Tue, 07 Jan 2020 09:56:46 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:57687
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1ioqHl-0005i1-CA
 for qemu-trivial@nongnu.org; Tue, 07 Jan 2020 09:56:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578409004;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R0RrzZgv66jhK7LMA3RAoxyp5F5E4qkxn7mKXQVUqJE=;
 b=V3IVWdWPc0SgmlN+qLwuFnG7rEqfOOFBZjMPY2cR3R3VS9aisHBkNnuEfCONoQPx2Q1HvO
 tFdOcbOaj1OgVvRFAibXqtxn3gkmyP36603XrJENRVmM5/lIhFaxiCx6vwTHFsavlzwerF
 K3EZuDeeJ6DeEknxNbpMXBgHLPaMqtQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-168-CCjPyEfqNGqAvG8M08ajkQ-1; Tue, 07 Jan 2020 09:56:43 -0500
Received: by mail-wm1-f71.google.com with SMTP id s25so2024888wmj.3
 for <qemu-trivial@nongnu.org>; Tue, 07 Jan 2020 06:56:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=R0RrzZgv66jhK7LMA3RAoxyp5F5E4qkxn7mKXQVUqJE=;
 b=cxuI+fdTuC0ebSYrCwGB+6ssiaroLZMHvpR/AuXJu3V8P9IFBynJZ1TZAuXPGGyIWu
 roUuiSBfGBXUAhDiW6QtqjINT7nzOae7kdPioD/8oFZL6wOe5bsltb6+rAYJO5D9bFnB
 NHSKA7AxO3igJWA44vS1qsfJv8QEQOG44jYUIl3vNp97vXdiSg0g7XOLOyOnmmE4qcbM
 u9WXF6JEDqZEvWqZf1KNBNrRKjr6O3lyQrcHBU8YjV4uZweyFnp0arpaATB5q1dbpVgZ
 Pz3fmp58+Grrwh07Tat52mZMMBO3dMFSWGUkFryrwxJwF5gA+Mqb5a6IY12slvvOS45I
 +Asw==
X-Gm-Message-State: APjAAAUe0lF6r94EXtw498VkaQA/aSbb2/Jmw4OOnkOlI4RnBLqs5mTx
 v8aMcapvVG1PlpZZP2rCsOccUli0udZro1JxzYtZ3PcdBmdWPqPNfWasqGAtiy4IiEb2iLkutGc
 7joiIzQg6EyLCiOhtQg==
X-Received: by 2002:a7b:cfc9:: with SMTP id f9mr42395394wmm.1.1578409001865;
 Tue, 07 Jan 2020 06:56:41 -0800 (PST)
X-Google-Smtp-Source: APXvYqwFXZz5Lvb9UTJc8bmGOVgoKv5Yn5b0xYiia9ZaeHgK1hfq+LjN+nSIjE0UdrtwU4y5bCFvJw==
X-Received: by 2002:a7b:cfc9:: with SMTP id f9mr42395374wmm.1.1578409001640;
 Tue, 07 Jan 2020 06:56:41 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c6d:4079:b74c:e329?
 ([2001:b07:6468:f312:c6d:4079:b74c:e329])
 by smtp.gmail.com with ESMTPSA id o4sm109503wrx.25.2020.01.07.06.56.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jan 2020 06:56:41 -0800 (PST)
Subject: Re: [PATCH 5/6] hw/scsi/megasas: Silent GCC9 duplicated-cond warning
To: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: Fam Zheng <fam@euphon.net>, Hannes Reinecke <hare@suse.com>,
 qemu-block@nongnu.org, qemu-trivial@nongnu.org,
 Hannes Reinecke <hare@suse.de>
References: <20191217173425.5082-1-philmd@redhat.com>
 <20191217173425.5082-6-philmd@redhat.com>
 <b29f856a-5199-6f62-4aee-5a2cfc9f05a3@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <8e06e74a-901d-acb3-67f0-006732abdba9@redhat.com>
Date: Tue, 7 Jan 2020 15:56:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <b29f856a-5199-6f62-4aee-5a2cfc9f05a3@linaro.org>
Content-Language: en-US
X-MC-Unique: CCjPyEfqNGqAvG8M08ajkQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
X-List-Received-Date: Tue, 07 Jan 2020 14:56:49 -0000

On 18/12/19 05:03, Richard Henderson wrote:
>>      if (!s->hba_serial) {
>>          s->hba_serial = g_strdup(MEGASAS_HBA_SERIAL);
>>      }
>> -    if (s->fw_sge >= MEGASAS_MAX_SGE - MFI_PASS_FRAME_SIZE) {
>> +    if (MEGASAS_MAX_SGE > 128
>> +        && s->fw_sge >= MEGASAS_MAX_SGE - MFI_PASS_FRAME_SIZE) {
>>          s->fw_sge = MEGASAS_MAX_SGE - MFI_PASS_FRAME_SIZE;
>>      } else if (s->fw_sge >= 128 - MFI_PASS_FRAME_SIZE) {
>>          s->fw_sge = 128 - MFI_PASS_FRAME_SIZE;
>>      } else {
>>          s->fw_sge = 64 - MFI_PASS_FRAME_SIZE;
>>      }
>
> I'm not keen on this.  It looks to me like the raw 128 case should be removed
> -- surely that's the point of the symbolic constant.  But I'll defer if a
> maintainer disagrees.

I don't really understand this chain of ifs.  Hannes, does it make sense
to just remove the "if (s->fw_sge >= 128 - MFI_PASS_FRAME_SIZE)" case,
or does Phil's variation (quoted in the patch fragment above) makes sense?

Or perhaps this rewrite:

        max_sge = s->fw_sge + MFI_PASS_FRAME_SIZE;
        if (max_sge < MEGASAS_MAX_SGE) {
            if (max_sge < 64) {
                error(...);
            } else {
                max_sge = max_sge < 128 ? 64 : 128;
            }
        }
	s->fw_sge = max_sge - MFI_PASS_FRAME_SIZE;

Paolo


