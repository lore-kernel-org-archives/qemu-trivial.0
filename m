Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kkQ3K-0002Ci-QZ
	for mharc-qemu-trivial@gnu.org; Wed, 02 Dec 2020 06:12:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kkQ3G-000283-Cq
 for qemu-trivial@nongnu.org; Wed, 02 Dec 2020 06:12:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kkQ38-00065J-JG
 for qemu-trivial@nongnu.org; Wed, 02 Dec 2020 06:12:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606907511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FVsOiuOpkLiYdWHX3DGRPCHlhA0cq6VqmHJNGxO0910=;
 b=QyGdLaeQyi2LSV1108qCZWVe2GY+4HB1drYKt2rb9vVx1/GPGCeVnV3hBeFIpDjDiMnnZ5
 P1oOePYl6YuW+lQd+FcobnaGQ9vHNGjWl64wbEMmnMwf8uVF0uqDNecG1TeL2NljQnt4XP
 TO9RemKJ+cuL6XH0HXso08zZ/KkNRwY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-541-5B5I1OdRP6-V6FKdQumRWA-1; Wed, 02 Dec 2020 06:11:49 -0500
X-MC-Unique: 5B5I1OdRP6-V6FKdQumRWA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7AC35100F340;
 Wed,  2 Dec 2020 11:11:48 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-113-199.ams2.redhat.com [10.36.113.199])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9DC065D6AC;
 Wed,  2 Dec 2020 11:11:43 +0000 (UTC)
Date: Wed, 2 Dec 2020 12:11:42 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Gan Qixin <ganqixin@huawei.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, pbonzini@redhat.com,
 mreitz@redhat.com, stefanha@redhat.com, dnbrdsky@gmail.com,
 zhang.zhanghailiang@huawei.com, kuhn.chenqun@huawei.com
Subject: Re: [PATCH 4/4] block/iscsi.c: Use lock guard macros
Message-ID: <20201202111142.GC16765@merkur.fritz.box>
References: <20201109154327.325675-1-ganqixin@huawei.com>
 <20201109154327.325675-5-ganqixin@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20201109154327.325675-5-ganqixin@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 02 Dec 2020 11:12:03 -0000

Am 09.11.2020 um 16:43 hat Gan Qixin geschrieben:
> Replace manual lock()/unlock() calls with lock guard macros
> (QEMU_LOCK_GUARD/WITH_QEMU_LOCK_GUARD) in block/iscsi.c.
> 
> Signed-off-by: Gan Qixin <ganqixin@huawei.com>
> ---
>  block/iscsi.c | 28 +++++++++++++---------------
>  1 file changed, 13 insertions(+), 15 deletions(-)
> 
> diff --git a/block/iscsi.c b/block/iscsi.c
> index e30a7e3606..f5f657b582 100644
> --- a/block/iscsi.c
> +++ b/block/iscsi.c
> @@ -322,7 +322,7 @@ iscsi_aio_cancel(BlockAIOCB *blockacb)
>      IscsiAIOCB *acb = (IscsiAIOCB *)blockacb;
>      IscsiLun *iscsilun = acb->iscsilun;
>  
> -    qemu_mutex_lock(&iscsilun->mutex);
> +    QEMU_LOCK_GUARD(&iscsilun->mutex);
>  
>      /* If it was cancelled or completed already, our work is done here */
>      if (acb->cancelled || acb->status != -EINPROGRESS) {
           qemu_mutex_unlock(&iscsilun->mutex);
           return;
       }

I don't think this qemu_mutex_unlock() is right any more now.

Kevin


