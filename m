Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kYWZA-000691-81
	for mharc-qemu-trivial@gnu.org; Fri, 30 Oct 2020 11:43:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kYWZ8-000661-Se
 for qemu-trivial@nongnu.org; Fri, 30 Oct 2020 11:43:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kYWZ6-0002UZ-0F
 for qemu-trivial@nongnu.org; Fri, 30 Oct 2020 11:43:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604072622;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OWT52VDkYRyUP9Cm9Pr1EYZaBC+r4AWVMx0HTwT6GFk=;
 b=CRB2QvUh8pIW5mJd8WFAQxFNHw2Q4eUuV4S237AJPfk7KGw2Q/S6R/eb3ic/6I49qRSlEi
 hHPHjIdZDFuhJQrH+GrUJ+o1UeEybJcn0Tj7Zy1kTvCpNrPQyTeLm+52QZF3vlgeMAuCYZ
 px/yqpdCpsFsIqJmfiBE+KjMd2tezMc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-272-60KQrv1hOTSMZ67uxgELtA-1; Fri, 30 Oct 2020 11:43:41 -0400
X-MC-Unique: 60KQrv1hOTSMZ67uxgELtA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7702F1DDFE;
 Fri, 30 Oct 2020 15:43:39 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-113-87.ams2.redhat.com [10.36.113.87])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 873571A340;
 Fri, 30 Oct 2020 15:43:34 +0000 (UTC)
Subject: Re: [PATCH v2 8/8] target/ppc: replaced the TODO with LOG_UNIMP and
 add break for silence warnings
To: Chen Qun <kuhn.chenqun@huawei.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
Cc: zhang.zhanghailiang@huawei.com, ganqixin@huawei.com,
 Euler Robot <euler.robot@huawei.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20201030004046.2191790-1-kuhn.chenqun@huawei.com>
 <20201030004046.2191790-9-kuhn.chenqun@huawei.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <784329cb-a46f-5b22-97a6-aab2568d8dd2@redhat.com>
Date: Fri, 30 Oct 2020 16:43:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20201030004046.2191790-9-kuhn.chenqun@huawei.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/30 01:22:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.253, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
X-List-Received-Date: Fri, 30 Oct 2020 15:43:47 -0000

On 30/10/2020 01.40, Chen Qun wrote:
> When using -Wimplicit-fallthrough in our CFLAGS, the compiler showed warning:
> target/ppc/mmu_helper.c: In function ‘dump_mmu’:
> target/ppc/mmu_helper.c:1351:12: warning: this statement may fall through [-Wimplicit-fallthrough=]
>  1351 |         if (ppc64_v3_radix(env_archcpu(env))) {
>       |            ^
> target/ppc/mmu_helper.c:1358:5: note: here
>  1358 |     default:
>       |     ^~~~~~~
> 
> Use "qemu_log_mask(LOG_UNIMP**)" instead of the TODO comment.
> And add the break statement to fix it.
> 
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
> ---
> v1->v2: replace the TODO by a LOG_UNIMP call and add break statement(Base on Philippe's comments)
> 
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: David Gibson <david@gibson.dropbear.id.au>
> Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  target/ppc/mmu_helper.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
> index 8972714775..12723362b7 100644
> --- a/target/ppc/mmu_helper.c
> +++ b/target/ppc/mmu_helper.c
> @@ -1349,11 +1349,12 @@ void dump_mmu(CPUPPCState *env)
>          break;
>      case POWERPC_MMU_3_00:
>          if (ppc64_v3_radix(env_archcpu(env))) {
> -            /* TODO - Unsupported */
> +            qemu_log_mask(LOG_UNIMP, "%s: the PPC64 MMU unsupported\n",

Maybe add a "is" between "MMU" and "unsupported"?

> +                          __func__);
>          } else {
>              dump_slb(env_archcpu(env));
> -            break;
>          }
> +        break;
>  #endif
>      default:
>          qemu_log_mask(LOG_UNIMP, "%s: unimplemented\n", __func__);
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


