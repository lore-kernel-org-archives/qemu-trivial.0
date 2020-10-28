Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kXlQb-0007Vx-Sa
	for mharc-qemu-trivial@gnu.org; Wed, 28 Oct 2020 09:23:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kXlQY-0007VA-Jk
 for qemu-trivial@nongnu.org; Wed, 28 Oct 2020 09:23:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28332)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kXlQW-0007gB-CC
 for qemu-trivial@nongnu.org; Wed, 28 Oct 2020 09:23:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603891422;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zILwx03j7JdCr1FQsSkt18aoixIpWiuvFRw+lNTEp/0=;
 b=GTo32ZY1PSiuOL23BWXVDMFuzX9prmnKd2B6TGc2FeOmLAcHHLUXe6E7GalPI4ql6z5Xtf
 aqrF0D8dFnhcoKimdf7zlcag3Zpbt0RW5amdRZJeLuvsHfqK205D/yiLb9/do73E8046G1
 c66P7apiQcG/l7oTCrJ+J2ecjcNHvKQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-468-wrZWt9-KP2agnZHEZ_PJpA-1; Wed, 28 Oct 2020 09:23:31 -0400
X-MC-Unique: wrZWt9-KP2agnZHEZ_PJpA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 75952808245;
 Wed, 28 Oct 2020 13:22:29 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-124.ams2.redhat.com [10.36.112.124])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 727D35B4A4;
 Wed, 28 Oct 2020 13:22:27 +0000 (UTC)
Subject: Re: [PATCH 4/9] linux-user/mips/cpu_loop: silence the compiler
 warnings
To: Chen Qun <kuhn.chenqun@huawei.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, zhang.zhanghailiang@huawei.com,
 ganqixin@huawei.com, Euler Robot <euler.robot@huawei.com>
References: <20201028041819.2169003-1-kuhn.chenqun@huawei.com>
 <20201028041819.2169003-5-kuhn.chenqun@huawei.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <15244401-6423-aad2-c44d-30a1de4eeddd@redhat.com>
Date: Wed, 28 Oct 2020 14:22:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20201028041819.2169003-5-kuhn.chenqun@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/28 01:51:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.921, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
X-List-Received-Date: Wed, 28 Oct 2020 13:23:48 -0000

On 28/10/2020 05.18, Chen Qun wrote:
> When using -Wimplicit-fallthrough in our CFLAGS, the compiler showed warning:
> linux-user/mips/cpu_loop.c: In function ‘cpu_loop’:
> linux-user/mips/cpu_loop.c:104:24: warning: this statement may fall through [-Wimplicit-fallthrough=]
>   104 |                     if ((ret = get_user_ual(arg8, sp_reg + 28)) != 0) {
>       |                        ^
> linux-user/mips/cpu_loop.c:107:17: note: here
>   107 |                 case 7:
>       |                 ^~~~
> linux-user/mips/cpu_loop.c:108:24: warning: this statement may fall through [-Wimplicit-fallthrough=]
>   108 |                     if ((ret = get_user_ual(arg7, sp_reg + 24)) != 0) {
>       |                        ^
> linux-user/mips/cpu_loop.c:111:17: note: here
>   111 |                 case 6:
>       |                 ^~~~
> linux-user/mips/cpu_loop.c:112:24: warning: this statement may fall through [-Wimplicit-fallthrough=]
>   112 |                     if ((ret = get_user_ual(arg6, sp_reg + 20)) != 0) {
>       |                        ^
> linux-user/mips/cpu_loop.c:115:17: note: here
>   115 |                 case 5:
>       |                 ^~~~
> 
> Add the corresponding "fall through" comment to fix it.
> 
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
> ---
> Cc: Laurent Vivier <laurent@vivier.eu>
> ---
>  linux-user/mips/cpu_loop.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/linux-user/mips/cpu_loop.c b/linux-user/mips/cpu_loop.c
> index 553e8ca7f5..cfe7ba5c47 100644
> --- a/linux-user/mips/cpu_loop.c
> +++ b/linux-user/mips/cpu_loop.c
> @@ -104,18 +104,22 @@ void cpu_loop(CPUMIPSState *env)
>                      if ((ret = get_user_ual(arg8, sp_reg + 28)) != 0) {
>                          goto done_syscall;
>                      }
> +                    /* fall through */
>                  case 7:
>                      if ((ret = get_user_ual(arg7, sp_reg + 24)) != 0) {
>                          goto done_syscall;
>                      }
> +                    /* fall through */
>                  case 6:
>                      if ((ret = get_user_ual(arg6, sp_reg + 20)) != 0) {
>                          goto done_syscall;
>                      }
> +                    /* fall through */
>                  case 5:
>                      if ((ret = get_user_ual(arg5, sp_reg + 16)) != 0) {
>                          goto done_syscall;
>                      }
> +                    /* fall through */
>                  default:
>                      break;
>                  }

Reviewed-by: Thomas Huth <thuth@redhat.com>



