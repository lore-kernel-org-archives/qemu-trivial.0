Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kaFpL-0008JF-MS
	for mharc-qemu-trivial@gnu.org; Wed, 04 Nov 2020 05:15:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kaFpH-0008Eg-8W
 for qemu-trivial@nongnu.org; Wed, 04 Nov 2020 05:15:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kaFpE-0001SO-HG
 for qemu-trivial@nongnu.org; Wed, 04 Nov 2020 05:15:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604484931;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lwuvA39jbEcdtp0U/yaIRsiu5l7xOHecQGDBWipOLVI=;
 b=RNX573iNYSSIwo+4uxt3snXzbRrR3fPpcUI4LdiVi9+hDxbSwh1fyh3Abj0RYjA2/PXd7U
 4UOaGFe4Iv6etlDXalOG56JeqqWBX5u6arppAhtgdCX4xoT6WUf07B3JJgBqdvcWImWwBN
 W53T1Zk4e8Oa/9rhiPbCVj4KQYUQc/s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-457-IGFAIwPuOdalQiFWxjPErw-1; Wed, 04 Nov 2020 05:15:28 -0500
X-MC-Unique: IGFAIwPuOdalQiFWxjPErw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 05DD61009E26;
 Wed,  4 Nov 2020 10:15:27 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-151.ams2.redhat.com [10.36.112.151])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5A2C35B4D6;
 Wed,  4 Nov 2020 10:15:24 +0000 (UTC)
Subject: Re: [PATCH] target/microblaze: Fix possible array out of bounds in
 mmu_write()
To: AlexChen <alex.chen@huawei.com>, edgar.iglesias@gmail.com
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org,
 zhang.zhanghailiang@huawei.com
References: <5FA10ABA.1080109@huawei.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <5afc6947-804b-e168-96a8-ee325f208542@redhat.com>
Date: Wed, 4 Nov 2020 11:15:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <5FA10ABA.1080109@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/03 00:03:41
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
X-List-Received-Date: Wed, 04 Nov 2020 10:15:35 -0000

On 03/11/2020 08.46, AlexChen wrote:
> The size of env->mmu.regs is 3, but the range of 'rn' is [0, 5].
> To avoid data access out of bounds, only if 'rn' is less than 3, we
> can print env->mmu.regs[rn]. In other cases, we can print
> env->mmu.regs[MMU_R_TLBX].

... since env->mmu.regs[MMU_R_TLBX] is used in the other cases in this
function. Makes sense, indeed.

> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Alex Chen <alex.chen@huawei.com>
> ---
>  target/microblaze/mmu.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/target/microblaze/mmu.c b/target/microblaze/mmu.c
> index 1dbbb271c4..917ad6d69e 100644
> --- a/target/microblaze/mmu.c
> +++ b/target/microblaze/mmu.c
> @@ -234,7 +234,8 @@ void mmu_write(CPUMBState *env, bool ext, uint32_t rn, uint32_t v)
>      unsigned int i;
> 
>      qemu_log_mask(CPU_LOG_MMU,
> -                  "%s rn=%d=%x old=%x\n", __func__, rn, v, env->mmu.regs[rn]);
> +                  "%s rn=%d=%x old=%x\n", __func__, rn, v,
> +                  rn < 3 ? env->mmu.regs[rn] : env->mmu.regs[MMU_R_TLBX]);
> 
>      if (cpu->cfg.mmu < 2 || !cpu->cfg.mmu_tlb_access) {
>          qemu_log_mask(LOG_GUEST_ERROR, "MMU access on MMU-less system\n");
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


