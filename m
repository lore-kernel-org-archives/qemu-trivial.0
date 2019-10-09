Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iIJMe-0004hT-VH
	for mharc-qemu-trivial@gnu.org; Wed, 09 Oct 2019 17:19:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46990)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1iIJMb-0004cM-At
 for qemu-trivial@nongnu.org; Wed, 09 Oct 2019 17:19:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1iIJMZ-000400-Su
 for qemu-trivial@nongnu.org; Wed, 09 Oct 2019 17:19:17 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50898)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1iIJMZ-0003zh-FZ
 for qemu-trivial@nongnu.org; Wed, 09 Oct 2019 17:19:15 -0400
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 88EFBC01B808
 for <qemu-trivial@nongnu.org>; Wed,  9 Oct 2019 21:19:14 +0000 (UTC)
Received: by mail-wr1-f69.google.com with SMTP id o10so1660722wrm.22
 for <qemu-trivial@nongnu.org>; Wed, 09 Oct 2019 14:19:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Zz5bhF6zfv+jR4MxHD4U4Soo4rdcQIP8qAHAJ/r2e0g=;
 b=XNtUQRkVdcXq+KVzd8lccJtbwSfqoSijNKOtoEXIjayBep9MuvR72v34x6GYuXzRAE
 cvU5Nur67IS9MPPSxvu8HDAIyERF+6K4pp2HcY5259IzopqpeVmdw/ayMkvvQdtAJVb1
 a+pUzXSIeU/v3bSe9WCP8B32pzFWEDuh0yCFJzpfLIEFK9IxKFSPz4/BmOg7pAC6qrjY
 2tWheciu+slFj0KLCTLPrO6enHESs2lXUzk3meJUXlLPRqTZ1vVeLNyiSAyxKmJaUnCP
 aDw0DJ8u4A+RfgE7gM8WLiagdZCYVK/tWX6gmW48u4HGWnYe5X5euKSbaRI5NOphLAUk
 ssHQ==
X-Gm-Message-State: APjAAAVOtjezKvdboYqXe0lkG1ByELfX+lEoRNTSLwOzHZt88/PQ5TPt
 9qo3fP2kkINSbGvqiA9XXfMAAMqJHEwBQPu+fTVED62BVx1NzY5GtE1+Qc7/lkUni37UISHhQCV
 AEu1DT3zPcvyvM8HRIg==
X-Received: by 2002:a5d:6592:: with SMTP id q18mr5040492wru.382.1570655953127; 
 Wed, 09 Oct 2019 14:19:13 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwNCZNQfZZgNTPhUBtSUSZTx06BSOQ3+OhjHfq/mE2O2uyDEy86uvCIFtB++XKELdIzcCgSew==
X-Received: by 2002:a5d:6592:: with SMTP id q18mr5040470wru.382.1570655952808; 
 Wed, 09 Oct 2019 14:19:12 -0700 (PDT)
Received: from [192.168.10.150] ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id q15sm5644526wrg.65.2019.10.09.14.19.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Oct 2019 14:19:12 -0700 (PDT)
Subject: Re: [PATCHv2 0/2] log guest name and memory error type AO, AR for MCEs
To: Mario Smarduch <msmarduch@digitalocean.com>, philmd@redhat.com,
 mtosatti@redhat.com, armbru@redhat.com
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, rth@twiddle.net,
 ehabkost@redhat.com
References: <20191009164459.8209-1-msmarduch@digitalocean.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <71149051-f7b9-b3ef-8493-4e2db1644a8d@redhat.com>
Date: Wed, 9 Oct 2019 23:19:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191009164459.8209-1-msmarduch@digitalocean.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
X-List-Received-Date: Wed, 09 Oct 2019 21:19:19 -0000

On 09/10/19 18:44, Mario Smarduch wrote:
> In a large VPC environment we want to log memory error occurrences
> and log them with guest name and type - there are few use cases
> 
> 
> - if VM crashes on AR mce inform the user about the reason and resolve the case
> - if VM hangs notify the user to reboot and resume processing
> - if VM continues to run let the user know, he/she maybe able to correlate
>   to vm internal outage
> - Rawhammer attacks - isolate/determine the attacker possible migrating it off
>   the hypervisor
> - In general track memory errors on a hyperviosr over time to determine trends
> 
> Monitoring our fleet we come across quite a few of these and been
> able to take action where before there were no clues to the causes.
> 
> When memory error occurs we get a log entry in qemu log:
> 
> Guest [Droplet-12345678] 2019-08-02T05:00:11.940270Z qemu-system-x86_64:
> Guest MCE Memory Error at QEMU addr 0x7f3c7622f000 and GUEST 0x78e42f000
> addr of type BUS_MCEERR_AR injected
> 
> with enterprise logging environment we can to take further actions.
> 
> v1 -> v2:
> - split into two patches one to get the gustname second to log MCEs 
> - addressed comments for MCE logging
> 
> Mario Smarduch (2):
>   util/qemu-error: add guest name helper with -msg options
>   target/i386: log MCE guest and host addresses
> 
>  include/qemu/error-report.h |  1 +
>  qemu-options.hx             | 10 ++++++----
>  target/i386/kvm.c           | 29 ++++++++++++++++++++++++-----
>  util/qemu-error.c           | 31 +++++++++++++++++++++++++++++++
>  vl.c                        |  5 +++++
>  5 files changed, 67 insertions(+), 9 deletions(-)
> 

Queued, thanks.

Paolo

