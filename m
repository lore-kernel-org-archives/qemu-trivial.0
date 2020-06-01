Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jftyS-0000zR-AS
	for mharc-qemu-trivial@gnu.org; Mon, 01 Jun 2020 19:36:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jftyO-0000v6-K2
 for qemu-trivial@nongnu.org; Mon, 01 Jun 2020 19:36:04 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:43487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jftyM-0004va-Na
 for qemu-trivial@nongnu.org; Mon, 01 Jun 2020 19:36:04 -0400
Received: by mail-pf1-x442.google.com with SMTP id g5so4166150pfm.10
 for <qemu-trivial@nongnu.org>; Mon, 01 Jun 2020 16:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hGrlH3PqgBr3ZkLXs0ICSwS5m6e98ZxaoB6gTALk4to=;
 b=GFWJNcIJwd07F0D6M4IVLW6PM8NwXWcTh05r+2LsqCuNKmw3KcaiHOLhKJcdunMpKy
 k8C7roaMyHD4kAFgeLh1abx6yLpKVPoLQr+e1sZVtY3Aw9W8WkhIiKz6w76YB+JqcH4P
 MxkAomMSNK8vmd+4Jxt+xrrsCTPQEsE8onWo67228m4xttiom20ukivbUAHX8Q8JUeWg
 0S/zSvXhSxLPN+S8RUH60vBO3/IgfMPExKMPz0QsEnIpgApVtllcayn9Qb0l9VfAtI6h
 +YQXQOC2rlmxeKBLJRIZWtdy0au/+c1OsjwAQZ0kpGZpn/9flGgboP2H4IxvkCRz+1fm
 FVJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hGrlH3PqgBr3ZkLXs0ICSwS5m6e98ZxaoB6gTALk4to=;
 b=cm7nA3tzDohVAiQuKT0vR2xqcmwZcKSTbaovV/pziMEzQATuMKz2m3xliZOo4gVhs/
 +BQY4Qa/KSvxWBaQmBfQmTPbvj+RxQ8kL117Z2odl+08QTp4quhqTpHXVt++xhoAyq95
 EhD2V45UNEWbj66iyjDmzv8htLjUU6qak/ycrxtOImn6hua38da6v0UKEbgXivzTeu4B
 72DSXw8ynOY+hyY4EFHIhTrpKVDyCy3QA8/6qL+glAxAXXiGw8cLZ1QXH7Xn8USqyEmU
 /QPVCEbJEtwJ8oEVWFw0e1dgIVFQtjRZQF1xpczjrIEenFgDekd6qVc79+mVnXgPSi3+
 4e3g==
X-Gm-Message-State: AOAM530yzlyZ7n+jYt+uFcMkR8Vf6sh1FhJjs9GWUPkVQRxTPWOrrPe0
 Q4Z38WOhQAmiWI4Jx3IkVdac4A==
X-Google-Smtp-Source: ABdhPJzQLtQYfpPCKrXikLqS/8usRLci/JPY1d5rfCIMc2sTmw/wqAqfi33AqaxVZO9QQc4TtjWvNw==
X-Received: by 2002:a62:ee07:: with SMTP id e7mr22044574pfi.42.1591054561486; 
 Mon, 01 Jun 2020 16:36:01 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id m14sm445894pgn.83.2020.06.01.16.36.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jun 2020 16:36:00 -0700 (PDT)
Subject: Re: [PATCH v2 3/8] hw/pci/pci_bridge: Correct pci_bridge_io memory
 region size
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 Helge Deller <deller@gmx.de>, Paul Durrant <paul@xen.org>,
 qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Richard Henderson <rth@twiddle.net>, qemu-ppc@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
References: <20200601142930.29408-1-f4bug@amsat.org>
 <20200601142930.29408-4-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <35f77178-dc79-3b4a-7562-9bc37fad9d9b@linaro.org>
Date: Mon, 1 Jun 2020 16:35:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200601142930.29408-4-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::442;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
X-List-Received-Date: Mon, 01 Jun 2020 23:36:05 -0000

On 6/1/20 7:29 AM, Philippe Mathieu-Daudé wrote:
> memory_region_set_size() handle the 16 Exabytes limit by
> special-casing the UINT64_MAX value. This is not a problem
> for the 32-bit maximum, 4 GiB.
> By using the UINT32_MAX value, the pci_bridge_io MemoryRegion
> ends up missing 1 byte:
> 
>   (qemu) info mtree
>   memory-region: pci_bridge_io
>     0000000000000000-00000000fffffffe (prio 0, i/o): pci_bridge_io
>       0000000000000060-0000000000000060 (prio 0, i/o): i8042-data
>       0000000000000064-0000000000000064 (prio 0, i/o): i8042-cmd
>       00000000000001ce-00000000000001d1 (prio 0, i/o): vbe
>       0000000000000378-000000000000037f (prio 0, i/o): parallel
>       00000000000003b4-00000000000003b5 (prio 0, i/o): vga
>       ...
> 
> Fix by using the correct value. We now have:
> 
>   memory-region: pci_bridge_io
>     0000000000000000-00000000ffffffff (prio 0, i/o): pci_bridge_io
>       0000000000000060-0000000000000060 (prio 0, i/o): i8042-data
>       0000000000000064-0000000000000064 (prio 0, i/o): i8042-cmd
>       ...
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/pci/pci_bridge.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


