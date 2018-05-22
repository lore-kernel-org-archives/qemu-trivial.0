Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fLFQD-0004y0-8b
	for mharc-qemu-trivial@gnu.org; Tue, 22 May 2018 18:06:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40312)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1fLFQB-0004wn-Q1
	for qemu-trivial@nongnu.org; Tue, 22 May 2018 18:06:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1fLFQ8-0004tq-Kj
	for qemu-trivial@nongnu.org; Tue, 22 May 2018 18:06:19 -0400
Received: from mail-pl0-f65.google.com ([209.85.160.65]:36631)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1fLFQ8-0004tH-ET
	for qemu-trivial@nongnu.org; Tue, 22 May 2018 18:06:16 -0400
Received: by mail-pl0-f65.google.com with SMTP id v24-v6so11706596plo.3
	for <qemu-trivial@nongnu.org>; Tue, 22 May 2018 15:06:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=2fGMkcCwSHkMf41Xj3GDT6fe3VofsAXPmYBirSwi7tA=;
	b=QM2uCKNk3iJ+U++8PcpFTlPJJepzCbPANV9hve1oh0tEQH0yR/2NG0GZqGT44zCFZC
	ns/IPJUJVqwNAbh27wAWE+LaS0P4fLjjqzat3yNe1DfkOmQCRmDafCGEEyYflO93hcQ0
	tbz/6ZkkudSGCTS1NIQYNPyqQlgbXdF0MSfRLKUVW4Mqiy1MaGPCkBF9Hq0gZHEXGixW
	JsXGjiAL6ijhJtTzGpL086T6vggWF1UJ8cl6Zx8Ofxw8GPHDJr23tTUjJxJb8IkPb1gS
	f71+aYlueJF4xjRcavvINO+ThmIO0HvaMskRfFptrurtwL/Uzd/QB8npxakICdliOsVX
	5pMw==
X-Gm-Message-State: ALKqPweXuvnbuZl7P3K+CQR7bjJYE9tltQ7naScXoa7R9X5W9zZLMZpd
	RO230qTkJgmNs2rEZZSwSzu1lA==
X-Google-Smtp-Source: AB8JxZoVodwbvF+msHWBzeggoe5r/EEi/SB6Jjr4yEESwO9SqTrZ231RJCIK/kwRChfFv4ABw70c4g==
X-Received: by 2002:a17:902:1aa:: with SMTP id
	b39-v6mr269127plb.120.1527026775465; 
	Tue, 22 May 2018 15:06:15 -0700 (PDT)
Received: from [172.16.10.49] ([72.28.93.232])
	by smtp.gmail.com with ESMTPSA id
	f189-v6sm8082235pgc.51.2018.05.22.15.06.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 May 2018 15:06:14 -0700 (PDT)
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, thuth@redhat.com, david@redhat.com
References: <20180522192034.13318-1-pbonzini@redhat.com>
	<724510e7-e739-5f88-b20b-9e27376a3438@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <9a4ac337-762c-7ad7-5cfe-dfc6554bcc71@redhat.com>
Date: Wed, 23 May 2018 00:06:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <724510e7-e739-5f88-b20b-9e27376a3438@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.160.65
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] tcg: remove softfloat from
 --disable-tcg builds
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 22 May 2018 22:06:20 -0000

On 22/05/2018 22:53, Richard Henderson wrote:
> On 05/22/2018 12:20 PM, Paolo Bonzini wrote:
>> Even though the presence of softfloat does not cause --disable-tcg builds to fail,
>> it is the single largest .o file in them.  Remove it, since TCG is the only client.
>>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> ---
>>  Makefile.target          |   2 +-
>>  hw/i386/x86-iommu-stub.c | 132 +++++++++++++++++++++++++++++++++++++++
> 
> Assuming this wasn't supposed to be here.

Oops, no it wasn't.  Thanks for the quick review!

Paolo

>>  2 files changed, 133 insertions(+), 1 deletion(-)
>>  create mode 100644 hw/i386/x86-iommu-stub.c
>>
>> diff --git a/Makefile.target b/Makefile.target
>> index d0ec77a307..dad2cf8778 100644
>> --- a/Makefile.target
>> +++ b/Makefile.target
>> @@ -97,7 +97,7 @@ obj-$(CONFIG_TCG) += tcg/tcg.o tcg/tcg-op.o tcg/tcg-op-vec.o tcg/tcg-op-gvec.o
>>  obj-$(CONFIG_TCG) += tcg/tcg-common.o tcg/optimize.o
>>  obj-$(CONFIG_TCG_INTERPRETER) += tcg/tci.o
>>  obj-$(CONFIG_TCG_INTERPRETER) += disas/tci.o
>> -obj-y += fpu/softfloat.o
>> +obj-$(CONFIG_TCG) += fpu/softfloat.o
> 
> But for this change alone,
> Acked-by: Richard Henderson <richard.henderson@linaro.org>
> 
> r~
> 


