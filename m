Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k69Uj-000338-8e
	for mharc-qemu-trivial@gnu.org; Thu, 13 Aug 2020 05:25:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1k69Uh-00032T-Ch
 for qemu-trivial@nongnu.org; Thu, 13 Aug 2020 05:25:55 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:24553
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1k69Uf-0007Ag-Gw
 for qemu-trivial@nongnu.org; Thu, 13 Aug 2020 05:25:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597310752;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kEXhygaAWt1d0DDxMWg97iK96Wh3TGtzlS66BvoHDqk=;
 b=jGSHW6mx/OcYOVG31gh6DiJin2hde1y3MRdytiQAkbrffnel6Zhug8BQhX+OOWyid4pZL8
 k66qq+8wtg3juTnAUBUDycfsmVT2599KTCQTMkk7DHOTjSO+bqZOHEvJ8yaBqXjids58Ay
 KmRqSkzjaTj6pNa4iakiMi4dvjZiBTc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-488-0M0UNxqSP4-3VFj8oh_93g-1; Thu, 13 Aug 2020 05:25:50 -0400
X-MC-Unique: 0M0UNxqSP4-3VFj8oh_93g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 923671800D41;
 Thu, 13 Aug 2020 09:25:49 +0000 (UTC)
Received: from [10.36.113.93] (ovpn-113-93.ams2.redhat.com [10.36.113.93])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0BA1E5D759;
 Thu, 13 Aug 2020 09:25:43 +0000 (UTC)
Subject: Re: [PATCH 07/11] vfio/platform: Remove dead assignment in
 vfio_intp_interrupt()
To: Chen Qun <kuhn.chenqun@huawei.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
Cc: zhang.zhanghailiang@huawei.com, pannengyuan@huawei.com,
 Alex Williamson <alex.williamson@redhat.com>,
 Euler Robot <euler.robot@huawei.com>
References: <20200813073712.4001404-1-kuhn.chenqun@huawei.com>
 <20200813073712.4001404-8-kuhn.chenqun@huawei.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <c0e9ec22-eca7-f7d7-790b-19c09755b871@redhat.com>
Date: Thu, 13 Aug 2020 11:25:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200813073712.4001404-8-kuhn.chenqun@huawei.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.120;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/13 03:44:21
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
X-List-Received-Date: Thu, 13 Aug 2020 09:25:55 -0000

Hi,

On 8/13/20 9:37 AM, Chen Qun wrote:
> Clang static code analyzer show warning:
> hw/vfio/platform.c:239:9: warning: Value stored to 'ret' is never read
>         ret = event_notifier_test_and_clear(intp->interrupt);
>         ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric

> ---
> Cc: Alex Williamson <alex.williamson@redhat.com>
> Cc: Eric Auger <eric.auger@redhat.com>
> ---
>  hw/vfio/platform.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/vfio/platform.c b/hw/vfio/platform.c
> index ac2cefc9b1..869ed2c39d 100644
> --- a/hw/vfio/platform.c
> +++ b/hw/vfio/platform.c
> @@ -236,7 +236,7 @@ static void vfio_intp_interrupt(VFIOINTp *intp)
>          trace_vfio_intp_interrupt_set_pending(intp->pin);
>          QSIMPLEQ_INSERT_TAIL(&vdev->pending_intp_queue,
>                               intp, pqnext);
> -        ret = event_notifier_test_and_clear(intp->interrupt);
> +        event_notifier_test_and_clear(intp->interrupt);
>          return;
>      }
>  
> 


