Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kc89t-0007le-4a
	for mharc-qemu-trivial@gnu.org; Mon, 09 Nov 2020 09:28:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kc89q-0007jj-M1
 for qemu-trivial@nongnu.org; Mon, 09 Nov 2020 09:28:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38077)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kc89n-0000Kd-EG
 for qemu-trivial@nongnu.org; Mon, 09 Nov 2020 09:28:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604932109;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ABO0bW17s4QNEdm6V2eCUdU2YixR478CWuHPtyoqNC4=;
 b=Iu65hCDzf4hhvnR1HjvSxtOOlEsmrrdi7044DbfWv/6hDhs6tVAcTEIS36muiYlqqcssrG
 HHbkbWgyv2hPWgkgJwMauDj4p2+I26+h546iR0outaUTI4Fz40VLnOTgM4qbodx6nO6eE8
 yFylZWJa02Thgc5YmV758Cfe+EWe3Bc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-374-Yocyr7LXOaWsaAajGRBWIg-1; Mon, 09 Nov 2020 09:28:28 -0500
X-MC-Unique: Yocyr7LXOaWsaAajGRBWIg-1
Received: by mail-wr1-f71.google.com with SMTP id f4so1343896wru.21
 for <qemu-trivial@nongnu.org>; Mon, 09 Nov 2020 06:28:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2BSyDWaNauZ185d46Vlt3NsMFtE+c2wSUIgkW3yWY7c=;
 b=eAIzbBm77ZBe9NtdESqcDQcAVw6T6Gf1aDJKduIH84yo4ww4kgY8Y4WHr0y6hW+iYk
 +Ddm2oC6dWG3NIcMR90tOYAzgBdPLNnXHLui2sijiEx360lrNDh7woodUph2xKLMIr0h
 pA87PC+sj52MwBRqsDmqMP6PRAF/K9GYLityCf0lCN4LtTvlsoirwoW3IHoHH7TR3iUF
 NpwbBWHQaaL+UfJmZSZhPZ+R+UxNasCqpQH7GqYPqjRDNbd1lXb9XxFP7+zuXMcWurjV
 3iRHLQK7vIxCc/Vg11ZpyvFwCsEr4230wZwjqnCw9Q7wKqm2J8Ayv6g9s28PFMshsCTm
 sKsA==
X-Gm-Message-State: AOAM530l/4bPUFO4CAsOv5xTgIcyNlJDozbXGxqgbOZfGQiZFx7VzlU2
 /NMBJnYNNVdsD3RIgklxumsf80CzuQG2aNjFCg+MqiqsCdhf9Ts9sDVmQVQOs+YiUTJhaYKHoN/
 74RcEnq6smtigcQJgrQ==
X-Received: by 2002:a05:6000:372:: with SMTP id
 f18mr19924465wrf.149.1604932106947; 
 Mon, 09 Nov 2020 06:28:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw8oKyOkd3sUuAvswGyqjkFta8SI1cd5uCp/LFXTXAmwrYFjFO7gS3/Qk6+7wsZ+5xB9T97Zg==
X-Received: by 2002:a05:6000:372:: with SMTP id
 f18mr19924436wrf.149.1604932106704; 
 Mon, 09 Nov 2020 06:28:26 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id q1sm2293784wrj.59.2020.11.09.06.28.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Nov 2020 06:28:25 -0800 (PST)
Subject: Re: [PATCH-for-5.2 3/4] hw/ppc/spapr_tpm_proxy: Fix hexadecimal
 format string specifier
To: David Gibson <david@gibson.dropbear.id.au>
Cc: qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>,
 qemu-ppc@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Gerd Hoffmann <kraxel@redhat.com>, Dov Murik <dovmurik@linux.vnet.ibm.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-trivial@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>
References: <20201103112558.2554390-1-philmd@redhat.com>
 <20201103112558.2554390-4-philmd@redhat.com>
 <20201103113948.GG143651@yekko.fritz.box>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <91914453-4c0a-c364-22e2-92ca9d1e50e4@redhat.com>
Date: Mon, 9 Nov 2020 15:28:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201103113948.GG143651@yekko.fritz.box>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/09 01:25:23
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 09 Nov 2020 14:28:35 -0000

Hi David,

On 11/3/20 12:39 PM, David Gibson wrote:
> On Tue, Nov 03, 2020 at 12:25:57PM +0100, Philippe Mathieu-Daudé wrote:
>> The '%u' conversion specifier is for decimal notation.
>> When prefixing a format with '0x', we want the hexadecimal
>> specifier ('%x').
>>
>> Inspired-by: Dov Murik <dovmurik@linux.vnet.ibm.com>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
> Acked-by: David Gibson <david@gibson.dropbear.id.au>

As there is no qemu-trivial@ pull request during freeze/rc,
can you queue this patch via your ppc tree?

Thanks,

Phil.

> 
>> ---
>>  hw/ppc/trace-events | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/ppc/trace-events b/hw/ppc/trace-events
>> index dcc06d49b5a..6d8d095aa28 100644
>> --- a/hw/ppc/trace-events
>> +++ b/hw/ppc/trace-events
>> @@ -19,7 +19,7 @@ spapr_update_dt_failed_size(unsigned cbold, unsigned cbnew, unsigned magic) "Old
>>  spapr_update_dt_failed_check(unsigned cbold, unsigned cbnew, unsigned magic) "Old blob %u bytes, new blob %u bytes, magic 0x%x"
>>  
>>  # spapr_tpm_proxy.c
>> -spapr_h_tpm_comm(const char *device_path, uint64_t operation) "tpm_device_path=%s operation=0x%"PRIu64
>> +spapr_h_tpm_comm(const char *device_path, uint64_t operation) "tpm_device_path=%s operation=0x%"PRIx64
>>  spapr_tpm_execute(uint64_t data_in, uint64_t data_in_sz, uint64_t data_out, uint64_t data_out_sz) "data_in=0x%"PRIx64", data_in_sz=%"PRIu64", data_out=0x%"PRIx64", data_out_sz=%"PRIu64
>>  
>>  # spapr_iommu.c
> 


