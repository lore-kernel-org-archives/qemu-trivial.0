Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k7b3X-0006l7-6V
	for mharc-qemu-trivial@gnu.org; Mon, 17 Aug 2020 05:03:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1k7b3V-0006hp-UC
 for qemu-trivial@nongnu.org; Mon, 17 Aug 2020 05:03:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1k7b3U-0006bE-83
 for qemu-trivial@nongnu.org; Mon, 17 Aug 2020 05:03:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597655027;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X35wZYIYnvgTdM0PIU+9mMGzSR72ducVZms1cOn7WOU=;
 b=Cz2trLeQV54xU9/5OrDropOedHmlWl3b26MjczJxIAzi0zeO4b2gXjhMlc8il0fn4WzlB9
 0swn+RqAGnhy6S09AYTIN8Lx7apqUCWlLJ6ueLm+3pXA9XM4cPGrlq+rUE28Re5dgGdX5l
 bq3Z8H+A35lLiDhNST7oAHbi02f8YLA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-425-dH2HpAvTNtG2gKPG0qpbAQ-1; Mon, 17 Aug 2020 05:03:45 -0400
X-MC-Unique: dH2HpAvTNtG2gKPG0qpbAQ-1
Received: by mail-wr1-f72.google.com with SMTP id b13so6758405wrq.19
 for <qemu-trivial@nongnu.org>; Mon, 17 Aug 2020 02:03:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=10W6+w8S8KVTvPPTYuD7O76lRKEN8eCw/p+UvSihqdQ=;
 b=mhQ4koy3XdcuphuR5YdiA2SYebC94cJlmpssrNikur1OSnQpaw3z2B76Qe0zi2Dqu/
 cUZ6AQHbj2TqaFtcuW05TGp5OdogSIah4jufRDgscfUgxLIyknbq8R0mGwd1BNPNwfLj
 qIppWN9367JZ39IR15VNYCQQvcDON3kFGt2GN/Sv791INKy/OUayHj1xnPkj5t0ZL8eV
 yg4gSJhciIT2/K7VT+0ZhAvntofpnQgdDjsQiAnkIv6ae3MHfcpiKEMhqDpoFXZQndfR
 lY2Gv4fSB3EqZEx7Gq7sR32b8HNpAVu22OJVxT4SiQFsuQbKpFMqRY6+SbUDCh7Q3Szv
 ER3Q==
X-Gm-Message-State: AOAM5339vVZycGw9oaSNmiMgiK7wICbZC6C5dL/Z8/hp7+kc9GKckqX5
 Bn1fXTjcyVC6wTvZSThUhqLxyEEjDpewpyfhHzlFzTPrekP/rZmkVs1K6l6WFAqUxcLcZIh219g
 goJCBhgYmmHL4oyDzeg==
X-Received: by 2002:adf:fdce:: with SMTP id i14mr14115115wrs.273.1597655024603; 
 Mon, 17 Aug 2020 02:03:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwrhB8FU/5JHe6zeIVlYGOii6t7WWTqkQihhTXB5P//FXUmgnZAwGzZCJgtV/aUZasbmTFlUg==
X-Received: by 2002:adf:fdce:: with SMTP id i14mr14115085wrs.273.1597655024370; 
 Mon, 17 Aug 2020 02:03:44 -0700 (PDT)
Received: from steredhat ([5.180.207.22])
 by smtp.gmail.com with ESMTPSA id e5sm32177018wrc.37.2020.08.17.02.03.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 02:03:43 -0700 (PDT)
Date: Mon, 17 Aug 2020 11:03:35 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, Fam Zheng <fam@euphon.net>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 0/7] block: Use definitions instead of magic values
Message-ID: <20200817090335.kgjvqnyjk2qujjia@steredhat>
References: <20200814082841.27000-1-f4bug@amsat.org>
MIME-Version: 1.0
In-Reply-To: <20200814082841.27000-1-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/17 02:47:08
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 17 Aug 2020 09:03:50 -0000

On Fri, Aug 14, 2020 at 10:28:34AM +0200, Philippe Mathieu-Daudé wrote:
> Trivial block patches:
> - Fix a typo
> - Replace '1 << 30' by '1 * GiB' in null-co
> - Replace 512 by BDRV_SECTOR_SIZE when appropriate.
> 
> Philippe Mathieu-Daudé (7):
>   block/null: Make more explicit the driver default size is 1GiB
>   hw/ide/core: Trivial typo fix
>   hw/ide/core: Replace magic '512' value by BDRV_SECTOR_SIZE
>   hw/ide/ahci: Replace magic '512' value by BDRV_SECTOR_SIZE
>   hw/ide/atapi: Replace magic '512' value by BDRV_SECTOR_SIZE
>   hw/ide/pci: Replace magic '512' value by BDRV_SECTOR_SIZE
>   hw/scsi/scsi-disk: Replace magic '512' value by BDRV_SECTOR_SIZE
> 
>  block/null.c        |  4 +++-
>  hw/ide/ahci.c       |  5 +++--
>  hw/ide/atapi.c      |  8 ++++----
>  hw/ide/core.c       | 25 +++++++++++++------------
>  hw/ide/pci.c        |  2 +-
>  hw/scsi/scsi-disk.c | 44 +++++++++++++++++++++++---------------------
>  6 files changed, 47 insertions(+), 41 deletions(-)

Series:
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>


Thanks for the cleaning that makes the code more readable!
Stefano


