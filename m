Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iuHnA-0003D1-Qu
	for mharc-qemu-trivial@gnu.org; Wed, 22 Jan 2020 10:19:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37314)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1iuHn8-0003Ci-Fn
 for qemu-trivial@nongnu.org; Wed, 22 Jan 2020 10:19:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1iuHn6-0007hl-0s
 for qemu-trivial@nongnu.org; Wed, 22 Jan 2020 10:19:36 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:55570
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1iuHn5-0007hR-Qb
 for qemu-trivial@nongnu.org; Wed, 22 Jan 2020 10:19:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579706374;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=voEQnMwPd3Kno9wrkxk6ceQj6qg1Y6hRuAhfwfjh9tU=;
 b=cRhNdMrx9rbiCah+I4Q77T9tIfZzrgy0lSN44rLfwAyP5LABCARVsYkF/BIhGoNWra0aIR
 aV9tDh5cOGuM6NFjANtxCh7Q2pN188+HTRjlu5b2EsceP2KOQPkkbHxrtF1vUgUySWSC97
 ChoQBWXYro9hZQjA6B+3y/GfaqqRtt8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-blCWiqDnPy2yMJBITq_IGQ-1; Wed, 22 Jan 2020 10:19:33 -0500
Received: by mail-wm1-f71.google.com with SMTP id l11so1675207wmi.0
 for <qemu-trivial@nongnu.org>; Wed, 22 Jan 2020 07:19:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=voEQnMwPd3Kno9wrkxk6ceQj6qg1Y6hRuAhfwfjh9tU=;
 b=uklu1fBd5UMFSj5umZwfIETG7LUP/zuttTbbV7eFpYq7bkmWUXuahdxD/HruiXfT9F
 Y4roCzHE37/axHEzpkSApYwfR7ZRY198b5eNLELTz5DD3V2Ij8A9ZFR+6IWk6Nv+e3nE
 Y/farNiMPcyUYshM2If0hHhnbKjm2Xo9X/ZlRDPqWJnunvvBJUUcE+v95OOWl3BqOoYX
 L8wrx/tktV+oPxNHM5baw/sHqj/M+xJYN5dlEQdlX5P9257radJu3EL0jVhbFBFT/USB
 OwVgR7PdUIaVZTLb4EYd+zDCLoGhtAf2+J8KHBLo5ogUdjdNeNELcbeK07jeDvxCVpUo
 N4MQ==
X-Gm-Message-State: APjAAAXrttIz3MLZPchsrpFIIvu6wvER7jDFBf7HV2EoiGp5sgVFqsna
 QSfFisvLvcXOJ2yH9ItUAuLM1SSN8dZCIwL4RFCS6lVPzOWpeL7hEku9n3oJkZB5W/RPCNMhOwV
 8WSR8lmAWZdhjTASuDg==
X-Received: by 2002:a7b:c5cd:: with SMTP id n13mr3500753wmk.172.1579706372416; 
 Wed, 22 Jan 2020 07:19:32 -0800 (PST)
X-Google-Smtp-Source: APXvYqzK+VB38KPTsDAaT0NznE21uqJWmQZOIxhIdVqIrbY5IEHaARQ7WFAZLA1Kc8CNcRK7Fynqaw==
X-Received: by 2002:a7b:c5cd:: with SMTP id n13mr3500732wmk.172.1579706372116; 
 Wed, 22 Jan 2020 07:19:32 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:b8fe:679e:87eb:c059?
 ([2001:b07:6468:f312:b8fe:679e:87eb:c059])
 by smtp.gmail.com with ESMTPSA id h2sm62069050wrt.45.2020.01.22.07.19.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Jan 2020 07:19:31 -0800 (PST)
Subject: Re: [PATCH v2 0/2] fix mismatches between g_strsplit and g_free
To: pannengyuan@huawei.com, mdroth@linux.vnet.ibm.com
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 zhang.zhanghailiang@huawei.com
References: <20200110091710.53424-1-pannengyuan@huawei.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <3ab5b3a7-b0e3-71e0-cfc8-30773157b176@redhat.com>
Date: Wed, 22 Jan 2020 16:19:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20200110091710.53424-1-pannengyuan@huawei.com>
Content-Language: en-US
X-MC-Unique: blCWiqDnPy2yMJBITq_IGQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
X-List-Received-Date: Wed, 22 Jan 2020 15:19:39 -0000

On 10/01/20 10:17, pannengyuan@huawei.com wrote:
> From: Pan Nengyuan <pannengyuan@huawei.com>
> 
> v1: fix a mismatch in vl.c
> v2: fix mismatch in vl.c and qga/main.c
> 
> Pan Nengyuan (2):
>   vl: Don't mismatch g_strsplit()/g_free()
>   qga/main: Don't mismatch g_strsplit/g_free in split_list()
> 
>  qga/main.c | 2 +-
>  vl.c       | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 

Queued patch 1, thanks.

Paolo


