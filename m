Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kVrOz-0003Du-HB
	for mharc-qemu-trivial@gnu.org; Fri, 23 Oct 2020 03:22:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kVrOx-0003D3-Dz
 for qemu-trivial@nongnu.org; Fri, 23 Oct 2020 03:22:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kVrOv-0007aH-M1
 for qemu-trivial@nongnu.org; Fri, 23 Oct 2020 03:22:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603437732;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HtDaecbBO2ZinQWqIdD15w2rDER3Fear8OX10QuCADA=;
 b=d4JqfkExxJKGNSEpa79I6g/jPlmrQNfgFjv7k5S8NKDqZLAQZgAM83agq+rv0NBDrKw9lJ
 aJGQhjAlzoJHBVa3z+JGGw8RAqSiOrwkdRrOydnFyrhH9XRgYGhIGDje8f5ACPYPGeD50D
 caojy48GY7XU+nYpP3js4+vF6Cpdhu4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-201-ihNbxqClOXqCLoMX35JREA-1; Fri, 23 Oct 2020 03:22:10 -0400
X-MC-Unique: ihNbxqClOXqCLoMX35JREA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A82F85705E;
 Fri, 23 Oct 2020 07:22:08 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-123.ams2.redhat.com [10.36.112.123])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 08DCE5D9CC;
 Fri, 23 Oct 2020 07:22:04 +0000 (UTC)
Subject: Re: [PATCH RESEND v2 3/7] elf2dmp/qemu_elf: Plug memleak in
 QEMU_Elf_init
To: Chen Qun <kuhn.chenqun@huawei.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
Cc: lvivier@redhat.com, zhang.zhanghailiang@huawei.com,
 Viktor Prutyanov <viktor.prutyanov@phystech.edu>, Li Qiang
 <liq3ea@gmail.com>, pannengyuan@huawei.com, ganqixin@huawei.com,
 Euler Robot <euler.robot@huawei.com>
References: <20201023061218.2080844-1-kuhn.chenqun@huawei.com>
 <20201023061218.2080844-4-kuhn.chenqun@huawei.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <2e2fdb9c-9563-fc26-7393-554f5efa4364@redhat.com>
Date: Fri, 23 Oct 2020 09:22:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20201023061218.2080844-4-kuhn.chenqun@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/23 01:44:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.107, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Fri, 23 Oct 2020 07:22:15 -0000

On 23/10/2020 08.12, Chen Qun wrote:
> From: Pan Nengyuan <pannengyuan@huawei.com>
> 
> Missing g_error_free in QEMU_Elf_init() error path. Fix that.
> 
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
> Reviewed-by: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
> Reviewed-by: Li Qiang <liq3ea@gmail.com>
> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
> ---
>  contrib/elf2dmp/qemu_elf.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/contrib/elf2dmp/qemu_elf.c b/contrib/elf2dmp/qemu_elf.c
> index 0db7816586..b601b6d7ba 100644
> --- a/contrib/elf2dmp/qemu_elf.c
> +++ b/contrib/elf2dmp/qemu_elf.c
> @@ -126,6 +126,7 @@ int QEMU_Elf_init(QEMU_Elf *qe, const char *filename)
>      qe->gmf = g_mapped_file_new(filename, TRUE, &gerr);
>      if (gerr) {
>          eprintf("Failed to map ELF dump file \'%s\'\n", filename);
> +        g_error_free(gerr);
>          return 1;
>      }
>  
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


