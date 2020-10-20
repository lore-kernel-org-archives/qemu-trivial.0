Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kUlTH-000172-Q3
	for mharc-qemu-trivial@gnu.org; Tue, 20 Oct 2020 02:50:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kUlTG-00015i-SN
 for qemu-trivial@nongnu.org; Tue, 20 Oct 2020 02:50:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kUlTD-0005nc-Rf
 for qemu-trivial@nongnu.org; Tue, 20 Oct 2020 02:50:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603176606;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zI61C+/cCdwJiwXyYw7kNQO38ypGGSQinuBf+hm3izw=;
 b=X8CVfuimZVMySmWpPXH6ckArh9XQHZwO+eUOvigqShzGiqGxxdpa8buQsCldLB7dSFDZXQ
 ybAWFwnVsO247iLzCX+wys05xTOT1C0yP3Op4Y5I/oohF44Hdr2lAkoLD7VvCdFINZyrkL
 4nnDNcfMNWQBwiTVW4c/y1rsRJJLQmw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-101-MXHhkyTtPYqvFXLBm3R0BQ-1; Tue, 20 Oct 2020 02:50:05 -0400
X-MC-Unique: MXHhkyTtPYqvFXLBm3R0BQ-1
Received: by mail-wr1-f72.google.com with SMTP id u15so404616wrn.4
 for <qemu-trivial@nongnu.org>; Mon, 19 Oct 2020 23:50:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zI61C+/cCdwJiwXyYw7kNQO38ypGGSQinuBf+hm3izw=;
 b=qcWLxUXN8XLKNcbDRpKcDYinfGvM0uOkbXpLfqQ9SLo+doR/m1ueJFAMHOPcc/RTR8
 hkLU8ET3wtAFvu+aMu+ESg3AzSem53+xTxxpH/2ef1DXakd5F1Ct/J7zW0AQz0q0N2U2
 QJfYRoHptvGYzCQrkqaZjerSmJMxWqsM4gb5VMcZOTW967gOsqjSLeTddB7zMMCUhiif
 e9AvvnmkU8OD4GLkj1+uqfXnBk+hdvpff0BxT5Cgz1AdpGz35BpHbD5+bVSwb6heA+nR
 0YCt+TS9iNrOG3MOn1ImsT7UT5d4auFTq+w54OB9KpEA4PITQoern2ZGfeJ0GP1uXwqx
 RqvA==
X-Gm-Message-State: AOAM532/VTTdTzs6EFIYuCaJVLSO5t4dRaAhzowCbM1YmoZ/9IxnmYDs
 iy9tkKQLJVIvthYVlN9ezXsndkWIVejSX2YDSRxla3+oC/UKz2BGXtiE50Qe2OlxsrtLkuYHEo6
 txA7x7whVbcZ+DHxEYA==
X-Received: by 2002:a1c:1946:: with SMTP id 67mr1218801wmz.15.1603176603819;
 Mon, 19 Oct 2020 23:50:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzwd94dY8DMmfdzMWCyQj8/wvS46+MGbTSUYMKG7JzV2+4qytNP26+4rWMZP3TonlrJzKYR2w==
X-Received: by 2002:a1c:1946:: with SMTP id 67mr1218775wmz.15.1603176603575;
 Mon, 19 Oct 2020 23:50:03 -0700 (PDT)
Received: from [192.168.1.36] (237.red-88-18-140.staticip.rima-tde.net.
 [88.18.140.237])
 by smtp.gmail.com with ESMTPSA id x81sm1180869wmb.11.2020.10.19.23.50.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Oct 2020 23:50:02 -0700 (PDT)
Subject: Re: [PATCH v2 6/8] migration: Do not initialise statics and globals
 to 0 or NULL
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Bihong Yu <yubihong@huawei.com>
Cc: zhengchuan@huawei.com, quintela@redhat.com, qemu-trivial@nongnu.org,
 qemu-devel@nongnu.org, alex.chen@huawei.com, wanghao232@huawei.com
References: <1602508140-11372-1-git-send-email-yubihong@huawei.com>
 <1602508140-11372-7-git-send-email-yubihong@huawei.com>
 <20201014192142.GL2996@work-vm>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <c957f13b-a2f2-3ec6-2906-a96426fdc5c5@redhat.com>
Date: Tue, 20 Oct 2020 08:50:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201014192142.GL2996@work-vm>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/20 01:16:16
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
X-List-Received-Date: Tue, 20 Oct 2020 06:50:11 -0000

On 10/14/20 9:21 PM, Dr. David Alan Gilbert wrote:
> * Bihong Yu (yubihong@huawei.com) wrote:
>> Signed-off-by: Bihong Yu <yubihong@huawei.com>
>> Reviewed-by: Chuan Zheng <zhengchuan@huawei.com>
> 
> OK, sometimes  I find initialisation clearer
> 
> 
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> 
>> ---
>>   migration/ram.c    | 2 +-
>>   migration/savevm.c | 2 +-
>>   2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/migration/ram.c b/migration/ram.c
>> index 09178cc..2da2b62 100644
>> --- a/migration/ram.c
>> +++ b/migration/ram.c
>> @@ -2743,7 +2743,7 @@ static int load_xbzrle(QEMUFile *f, ram_addr_t addr, void *host)
>>    */
>>   static inline RAMBlock *ram_block_from_stream(QEMUFile *f, int flags)
>>   {
>> -    static RAMBlock *block = NULL;
>> +    static RAMBlock *block;

OK.

>>       char id[256];
>>       uint8_t len;
>>   
>> diff --git a/migration/savevm.c b/migration/savevm.c
>> index 9e95df1..f808bc2 100644
>> --- a/migration/savevm.c
>> +++ b/migration/savevm.c
>> @@ -64,7 +64,7 @@
>>   #include "qemu/bitmap.h"
>>   #include "net/announce.h"
>>   
>> -const unsigned int postcopy_ram_discard_version = 0;
>> +const unsigned int postcopy_ram_discard_version;

I agree with Dave, this one is clearer initialized.

>>   
>>   /* Subcommands for QEMU_VM_COMMAND */
>>   enum qemu_vm_cmd {
>> -- 
>> 1.8.3.1
>>


