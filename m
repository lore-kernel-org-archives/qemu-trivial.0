Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1juutR-00040l-5k
	for mharc-qemu-trivial@gnu.org; Mon, 13 Jul 2020 05:37:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1juutP-0003xu-KT
 for qemu-trivial@nongnu.org; Mon, 13 Jul 2020 05:36:59 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:47912
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1juutN-0007bu-Tk
 for qemu-trivial@nongnu.org; Mon, 13 Jul 2020 05:36:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594633017;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=dEbd4VsrKVGIM/9BhMWknzMy6iWi3aCS5Jaseoo8y4Y=;
 b=S9yklKRmDfJgsk7deVxSQeY7SIxKh9vcviniu7+cOuV+JhBHy2b5LWWunJ95P+4agWgE/0
 +zyyhiGSusULqlerlfXSwC4AYX/0WUUUD5vZRnBHsab8RSMJu+Fk+O3eZqujOsumCtprAN
 9bf53g7KpT3pUUABg5Q694FLJ/RCwE4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-447-flmphAZdOEKW0CSC8J_dvA-1; Mon, 13 Jul 2020 05:36:53 -0400
X-MC-Unique: flmphAZdOEKW0CSC8J_dvA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 41F161902EA1;
 Mon, 13 Jul 2020 09:36:52 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-125.ams2.redhat.com [10.36.112.125])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 99DC960BEC;
 Mon, 13 Jul 2020 09:36:50 +0000 (UTC)
Subject: Re: [PATCH 08/12] block/vmdk: Remove superfluous breaks
To: Yi Wang <wang.yi59@zte.com.cn>, qemu-devel@nongnu.org
Cc: Liao Pingfang <liao.pingfang@zte.com.cn>, wang.liang82@zte.com.cn,
 xue.zhihong@zte.com.cn, Qemu-block <qemu-block@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <1594631107-36574-1-git-send-email-wang.yi59@zte.com.cn>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <ea32b527-7d78-1c7a-a2a2-30ffa2a9e528@redhat.com>
Date: Mon, 13 Jul 2020 11:36:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1594631107-36574-1-git-send-email-wang.yi59@zte.com.cn>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=thuth@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/13 02:19:41
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Mon, 13 Jul 2020 09:36:59 -0000

On 13/07/2020 11.05, Yi Wang wrote:
> From: Liao Pingfang <liao.pingfang@zte.com.cn>
> 
> Remove superfluous breaks, as there is a "return" before them.
> 
> Signed-off-by: Liao Pingfang <liao.pingfang@zte.com.cn>
> Signed-off-by: Yi Wang <wang.yi59@zte.com.cn>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  block/vmdk.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/block/vmdk.c b/block/vmdk.c
> index 28cec50..8f222e3 100644
> --- a/block/vmdk.c
> +++ b/block/vmdk.c
> @@ -1053,14 +1053,11 @@ static int vmdk_open_sparse(BlockDriverState *bs, BdrvChild *file, int flags,
>      switch (magic) {
>          case VMDK3_MAGIC:
>              return vmdk_open_vmfs_sparse(bs, file, flags, errp);
> -            break;
>          case VMDK4_MAGIC:
>              return vmdk_open_vmdk4(bs, file, flags, options, errp);
> -            break;
>          default:
>              error_setg(errp, "Image not in VMDK format");
>              return -EINVAL;
> -            break;
>      }
>  }
>  
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


