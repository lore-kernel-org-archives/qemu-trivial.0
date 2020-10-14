Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kSmHE-00057G-GJ
	for mharc-qemu-trivial@gnu.org; Wed, 14 Oct 2020 15:17:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kSmH3-00055t-Nl
 for qemu-trivial@nongnu.org; Wed, 14 Oct 2020 15:17:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kSmH1-0001Dx-Ff
 for qemu-trivial@nongnu.org; Wed, 14 Oct 2020 15:17:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602703037;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LZ7mcQif/ISq9tqTvAVHiuZ0njTujdLxuizBQAIHeBU=;
 b=bUHDQjKFcwL0nUIyr8iKXr9FS/X7BwI2jrp8GAejO95ftbjARiCYj7d0KKsHxiobSuNqHS
 Y3fS4ACAEAgICU88jsEWpQSJwDb/jcEg1MCitFBOZ3+m5W8wkVamOcoQgdwIqhT/97fzOs
 0Ar+gA14GommXuWYrYMHtoq8iRHJwgM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-590-Wuu-2S0LNd-lrCUiO8QbSQ-1; Wed, 14 Oct 2020 15:17:16 -0400
X-MC-Unique: Wuu-2S0LNd-lrCUiO8QbSQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B3F5E5705A;
 Wed, 14 Oct 2020 19:17:14 +0000 (UTC)
Received: from work-vm (ovpn-113-95.ams2.redhat.com [10.36.113.95])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3E7A460C0F;
 Wed, 14 Oct 2020 19:17:13 +0000 (UTC)
Date: Wed, 14 Oct 2020 20:17:10 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Bihong Yu <yubihong@huawei.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, quintela@redhat.com,
 alex.chen@huawei.com, wanghao232@huawei.com, zhengchuan@huawei.com
Subject: Re: [PATCH v2 5/8] migration: Add braces {} for if statement
Message-ID: <20201014191710.GK2996@work-vm>
References: <1602508140-11372-1-git-send-email-yubihong@huawei.com>
 <1602508140-11372-6-git-send-email-yubihong@huawei.com>
MIME-Version: 1.0
In-Reply-To: <1602508140-11372-6-git-send-email-yubihong@huawei.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/14 03:37:33
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 14 Oct 2020 19:17:25 -0000

* Bihong Yu (yubihong@huawei.com) wrote:
> Signed-off-by: Bihong Yu <yubihong@huawei.com>
> Reviewed-by: Chuan Zheng <zhengchuan@huawei.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/ram.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/migration/ram.c b/migration/ram.c
> index 0aea78f..09178cc 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -101,14 +101,16 @@ static struct {
>  
>  static void XBZRLE_cache_lock(void)
>  {
> -    if (migrate_use_xbzrle())
> +    if (migrate_use_xbzrle()) {
>          qemu_mutex_lock(&XBZRLE.lock);
> +    }
>  }
>  
>  static void XBZRLE_cache_unlock(void)
>  {
> -    if (migrate_use_xbzrle())
> +    if (migrate_use_xbzrle()) {
>          qemu_mutex_unlock(&XBZRLE.lock);
> +    }
>  }
>  
>  /**
> -- 
> 1.8.3.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


