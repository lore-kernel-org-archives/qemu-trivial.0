Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jZFOe-0007WQ-Ql
	for mharc-qemu-trivial@gnu.org; Thu, 14 May 2020 11:03:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jZFOc-0007Pc-Jn
 for qemu-trivial@nongnu.org; Thu, 14 May 2020 11:03:38 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:25524
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jZFOb-0007Qc-30
 for qemu-trivial@nongnu.org; Thu, 14 May 2020 11:03:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589468616;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ib1jZqcZTKUreBUO4yjOAVNa95yQ87ye9PVw4urA0FA=;
 b=XGLKQbZBPSrtMHLzAy4jJFJcuI6NOfwAW7KJ1iXdP0GfoWVCvpc+/SOjh3gxOaW42tfcpp
 ZP0RnC5ntpumDYQX8gyYhwTphtqN0oDyw/rm6FUevUInHzgGneSDX4XH0m3CyDitof15DM
 NlcvpZsfxpPFL9ZBnpA8fs6AiRdQXQU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-336-GmNnlNE5M8-b_pYroanbEA-1; Thu, 14 May 2020 11:03:34 -0400
X-MC-Unique: GmNnlNE5M8-b_pYroanbEA-1
Received: by mail-wr1-f70.google.com with SMTP id p2so1717446wrm.6
 for <qemu-trivial@nongnu.org>; Thu, 14 May 2020 08:03:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ib1jZqcZTKUreBUO4yjOAVNa95yQ87ye9PVw4urA0FA=;
 b=Ynp3IzYP2PLtEa8yhRTdB22A7u6HxhN6mOHJNspWSzsSLWjcLWBLJJEtU8/m3XNy2Z
 UuJrBnLiBdJo7/KHb6QClUzZWdhzfDob+6BrLs+rRTYQrRgyaGfM92F2P5bAvubVUgpK
 UKeARtJ22ECLrnDWpAu9JksIQfXVtziR4Sy4npF/tyxgd/jx4b7kBtBBCOxxCvM+ktS/
 TMVZtLlzJ+AU7uhPZGFSRWL5U0fx16NBrFVaryHqEMRfMqFf5v91ilNOmB+ePCiWUU1r
 CYi+v25ILc982YoKBYN7400ngn8/fmASLkCJNuksKigWZPJCE4QoHCVpqqQ2qQeLQ/rm
 hkbw==
X-Gm-Message-State: AOAM531THrssf41FXdw1apvUc/HPHMoQyWzNIW/KNRkDDt4OpHi3LsTw
 jIGQwmaT/+pZYTj55jVAZOJu5/epbVSI3gwhLKExKNkFZ+ORG+MRxM0syEAoy8XZWY3sXUSLiYy
 O00FGU0qL1sVPEGkv8Q==
X-Received: by 2002:adf:edc1:: with SMTP id v1mr5797864wro.125.1589468613058; 
 Thu, 14 May 2020 08:03:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy00maDHf8cimdjR1C6Ru3uS76/XtbEmi+B3N6unTmAYGQSGYsrxBWu6p6p/Azz1712ap1o5Q==
X-Received: by 2002:adf:edc1:: with SMTP id v1mr5797835wro.125.1589468612770; 
 Thu, 14 May 2020 08:03:32 -0700 (PDT)
Received: from [192.168.1.39] (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id w15sm4288516wrl.73.2020.05.14.08.03.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 May 2020 08:03:31 -0700 (PDT)
Subject: Re: [PATCH 0/2] block/block-copy: Fix uninitialized variable in
 block_copy_task_entry
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
 qemu-block@nongnu.org, qemu-trivial@nongnu.org
References: <20200507121129.29760-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <6073e714-cf37-8f8b-364e-8392ceedc327@redhat.com>
Date: Thu, 14 May 2020 17:03:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200507121129.29760-1-philmd@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/13 22:25:42
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Thu, 14 May 2020 15:03:39 -0000

On 5/7/20 2:11 PM, Philippe Mathieu-Daudé wrote:
> block_copy_task_entry() might be written differently to avoid
> the initialization. This silents the warning and let me build.
> 
> Philippe Mathieu-Daudé (2):
>    block/block-copy: Fix uninitialized variable in block_copy_task_entry
>    block/block-copy: Simplify block_copy_do_copy()
> 
>   block/block-copy.c | 14 ++++----------
>   1 file changed, 4 insertions(+), 10 deletions(-)
> 

ping?


