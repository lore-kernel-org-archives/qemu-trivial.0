Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kSmRG-0007Pt-Pq
	for mharc-qemu-trivial@gnu.org; Wed, 14 Oct 2020 15:28:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kSmRE-0007Ny-B5
 for qemu-trivial@nongnu.org; Wed, 14 Oct 2020 15:27:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24076)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kSmRB-0002ZK-GB
 for qemu-trivial@nongnu.org; Wed, 14 Oct 2020 15:27:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602703668;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=23lwnE/SWKwdg1DKhVYOsZFotB7XBPWrVm8smyqV3co=;
 b=f/0lzvbX10eD+t5IlEzx5TU8xcZt9SjtZTRkKGlEnElzGohyAPgXh0vRQEjA63pDWel4dd
 mVrNCgL/JbMBlp+2++4CkblOPkGsNmuudJ8h36xmtO3+aPbTidfXSSW1jAV939YHSYVPEO
 z6Qs7f+lj7xY9wrieifVbRLW2AhtOvM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-396-qmFhrRdFPHKSRk2vqV2X5w-1; Wed, 14 Oct 2020 15:27:45 -0400
X-MC-Unique: qmFhrRdFPHKSRk2vqV2X5w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 208C4100746B;
 Wed, 14 Oct 2020 19:27:44 +0000 (UTC)
Received: from work-vm (ovpn-113-95.ams2.redhat.com [10.36.113.95])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 91DA676673;
 Wed, 14 Oct 2020 19:27:42 +0000 (UTC)
Date: Wed, 14 Oct 2020 20:27:40 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Bihong Yu <yubihong@huawei.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, quintela@redhat.com,
 alex.chen@huawei.com, wanghao232@huawei.com, zhengchuan@huawei.com
Subject: Re: [PATCH v2 2/8] migration: Don't use '#' flag of printf format
Message-ID: <20201014192740.GN2996@work-vm>
References: <1602508140-11372-1-git-send-email-yubihong@huawei.com>
 <1602508140-11372-3-git-send-email-yubihong@huawei.com>
MIME-Version: 1.0
In-Reply-To: <1602508140-11372-3-git-send-email-yubihong@huawei.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
X-List-Received-Date: Wed, 14 Oct 2020 19:27:52 -0000

* Bihong Yu (yubihong@huawei.com) wrote:
> Signed-off-by: Bihong Yu <yubihong@huawei.com>
> Reviewed-by: Chuan Zheng <zhengchuan@huawei.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/block.c | 2 +-
>  migration/ram.c   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/migration/block.c b/migration/block.c
> index 4b8576b..273392b 100644
> --- a/migration/block.c
> +++ b/migration/block.c
> @@ -998,7 +998,7 @@ static int block_load(QEMUFile *f, void *opaque, int version_id)
>                     (addr == 100) ? '\n' : '\r');
>              fflush(stdout);
>          } else if (!(flags & BLK_MIG_FLAG_EOS)) {
> -            fprintf(stderr, "Unknown block migration flags: %#x\n", flags);
> +            fprintf(stderr, "Unknown block migration flags: 0x%x\n", flags);
>              return -EINVAL;
>          }
>          ret = qemu_file_get_error(f);
> diff --git a/migration/ram.c b/migration/ram.c
> index 433489d..6ed4f9e 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -3298,7 +3298,7 @@ static int ram_load_postcopy(QEMUFile *f)
>              multifd_recv_sync_main();
>              break;
>          default:
> -            error_report("Unknown combination of migration flags: %#x"
> +            error_report("Unknown combination of migration flags: 0x%x"
>                           " (postcopy mode)", flags);
>              ret = -EINVAL;
>              break;
> @@ -3576,7 +3576,7 @@ static int ram_load_precopy(QEMUFile *f)
>              if (flags & RAM_SAVE_FLAG_HOOK) {
>                  ram_control_load_hook(f, RAM_CONTROL_HOOK, NULL);
>              } else {
> -                error_report("Unknown combination of migration flags: %#x",
> +                error_report("Unknown combination of migration flags: 0x%x",
>                               flags);
>                  ret = -EINVAL;
>              }
> -- 
> 1.8.3.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


