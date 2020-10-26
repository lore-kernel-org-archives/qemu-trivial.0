Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kX65m-0004DL-Pw
	for mharc-qemu-trivial@gnu.org; Mon, 26 Oct 2020 13:15:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kX65j-0004AU-G8
 for qemu-trivial@nongnu.org; Mon, 26 Oct 2020 13:15:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kX65g-0007qW-9y
 for qemu-trivial@nongnu.org; Mon, 26 Oct 2020 13:15:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603732524;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nIbkRPojou0/9NMHW1B/ur67WVggS3hynEBJUA7QjQw=;
 b=fUGRT4u9TEaNwum9Sohe6qPOZ2EsRc/fuLGmXnzLzZL5BUIgcGknRIM6wwhNAZOmZjm7aX
 L7Hsq7ofNpC9oiJ+DnpvyYaEeO/4zL9w26t7Hth0vpr5hNeCqDicx7dxEB1iLseB/NhJYC
 78RmReYjz/EU78GfEtTN/FYV+V7fr+I=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-352-2T5nIUBaOKOLmspJGVxHuw-1; Mon, 26 Oct 2020 13:15:21 -0400
X-MC-Unique: 2T5nIUBaOKOLmspJGVxHuw-1
Received: by mail-wr1-f70.google.com with SMTP id 47so8958995wrc.19
 for <qemu-trivial@nongnu.org>; Mon, 26 Oct 2020 10:15:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nIbkRPojou0/9NMHW1B/ur67WVggS3hynEBJUA7QjQw=;
 b=KfXomQEePwcQkCg+fRP7Gco9pxEg95RiNCQ3QBZoSOyANbGXVm8WzAARPVsP15Gcel
 9g6c1BjZu1ASbMNtdeCLANhxlGzmSFkt+GXP6Jy/G/PHMLLy02OHM5k+KAt72oAe4i25
 YglS1PHoHPO36g1KlbOHXyWCNTcQewUis0syhe3RTSZxWUjhVd+75A6FVv7BSEcwYOzK
 OUI0BGcdzdMenBeZgfJDlRwvwrdzzbELfs90yT9RDj0Ijs19+0UuoeE3grMnxQBPN0Gy
 Zr5dg4UPByfj5ZoDbRpgm1B1umUHKfdSx9tIQ7Pb4vUwn7FUMYH5Cbr3ITCmCxDn7eqc
 TPFg==
X-Gm-Message-State: AOAM532eEw/I3eQHnblySZNYv/SecmedG9ncrkdEK9TUyjxGBeUAwmc5
 c0FGBP7LXUQD9/aLEHvXaCNkCTmU+iST3O/vZ2vJ/aVT/FJbZD91ShBK0U6pKGBjR8HArRe/bGc
 vS9H7z3/0dHewenUF2A==
X-Received: by 2002:a1c:192:: with SMTP id 140mr8247529wmb.73.1603732519519;
 Mon, 26 Oct 2020 10:15:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwP+DS5SywOOxB6bGLC0Yfb1oM6OvTTahqjxrscOxWLvSD6PPAMfL27fBQCWBkF+N+Kb069VA==
X-Received: by 2002:a1c:192:: with SMTP id 140mr8247499wmb.73.1603732519258;
 Mon, 26 Oct 2020 10:15:19 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id w1sm23297474wrp.95.2020.10.26.10.15.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Oct 2020 10:15:18 -0700 (PDT)
Subject: Re: [PATCH v2 0/3] hw/ssi: Rename SSI 'slave' as 'peripheral'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, Andrew Jeffery <andrew@aj.id.au>,
 Alistair Francis <alistair@alistair23.me>, Max Reitz <mreitz@redhat.com>,
 qemu-trivial@nongnu.org, qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
References: <20201012124955.3409127-1-f4bug@amsat.org>
 <e15493bf-f31e-daf2-d216-b9d67ea638b1@amsat.org>
 <11aef83d-64ae-8954-e61f-911282896455@amsat.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <ecae635c-6780-b01e-4efb-2f52e2cd7081@redhat.com>
Date: Mon, 26 Oct 2020 18:15:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <11aef83d-64ae-8954-e61f-911282896455@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/25 21:03:19
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.167, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
X-List-Received-Date: Mon, 26 Oct 2020 17:15:31 -0000

On 26/10/20 18:05, Philippe Mathieu-Daudé wrote:
> ping^2?
> 
> On 10/19/20 6:04 PM, Philippe Mathieu-Daudé wrote:
>> Ping for review?
>>
>> On 10/12/20 2:49 PM, Philippe Mathieu-Daudé wrote:
>>> Since v1:
>>> - Fixed patch #1 subject (Kevin)
>>>
>>> In order to use inclusive terminology, rename SSI 'slave' as
>>> 'peripheral', following the resolution Paolo pointed in [*]:
>>> https://www.oshwa.org/a-resolution-to-redefine-spi-signal-names/
>>>
>>> Candidate to be merged via the ARM or Trivial trees.
>>>
>>> [*] https://www.mail-archive.com/qemu-devel@nongnu.org/msg739108.html
>>>
>>> Philippe Mathieu-Daudé (3):
>>>    hw/ssi/aspeed_smc: Rename 'max_slaves' variable as 'max_peripherals'
>>>    hw/ssi: Update coding style to make checkpatch.pl happy
>>>    hw/ssi: Rename SSI 'slave' as 'peripheral'
>>>
>>>   include/hw/misc/max111x.h   |  2 +-
>>>   include/hw/ssi/aspeed_smc.h |  2 +-
>>>   include/hw/ssi/ssi.h        | 56 +++++++++++++++++++------------------
>>>   hw/arm/spitz.c              | 32 ++++++++++-----------
>>>   hw/arm/stellaris.c          |  4 +--
>>>   hw/arm/tosa.c               | 12 ++++----
>>>   hw/arm/z2.c                 | 14 +++++-----
>>>   hw/block/m25p80.c           | 14 +++++-----
>>>   hw/display/ads7846.c        | 12 ++++----
>>>   hw/display/ssd0323.c        | 12 ++++----
>>>   hw/misc/max111x.c           | 18 ++++++------
>>>   hw/sd/ssi-sd.c              | 12 ++++----
>>>   hw/ssi/aspeed_smc.c         | 53 ++++++++++++++++++-----------------
>>>   hw/ssi/pl022.c              |  2 +-
>>>   hw/ssi/ssi.c                | 48 +++++++++++++++----------------
>>>   hw/ssi/xilinx_spips.c       |  7 +++--
>>>   16 files changed, 152 insertions(+), 148 deletions(-)
>>>
>>
> 

Queued, thanks.

Paolo


