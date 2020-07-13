Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1juupI-0005FJ-1z
	for mharc-qemu-trivial@gnu.org; Mon, 13 Jul 2020 05:32:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1juupA-0005Cl-KM
 for qemu-trivial@nongnu.org; Mon, 13 Jul 2020 05:32:36 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:36254
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1juup8-0006ql-Lv
 for qemu-trivial@nongnu.org; Mon, 13 Jul 2020 05:32:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594632753;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=P8m46Zt3nFVNG9tZAe85vBK3oMqrPhvYj9ufROfg+kg=;
 b=VjI4RWlUi82VYxZqn2Qr3gBZAxyzBjELTAaHnjNywC0XLexrJnmGe7rPjdkUiNemI1xPki
 tq4zntuH7aGyI6yUhhcrvQVNrC9zDb/BJEfbUKkGFc1HzxAsDXAQPsyYPn0K8Whi1b/Bi9
 wDxIXiV3YdQgaa9wtt8lv04HxELXuYU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-40-IZukKMkbNEecm5RAXJXzMA-1; Mon, 13 Jul 2020 05:32:32 -0400
X-MC-Unique: IZukKMkbNEecm5RAXJXzMA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5605D1902EA2;
 Mon, 13 Jul 2020 09:32:30 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-125.ams2.redhat.com [10.36.112.125])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0A1D178474;
 Mon, 13 Jul 2020 09:32:27 +0000 (UTC)
Subject: Re: [PATCH 03/12] tcg/riscv: Remove superfluous breaks
To: Yi Wang <wang.yi59@zte.com.cn>, qemu-devel@nongnu.org
Cc: Liao Pingfang <liao.pingfang@zte.com.cn>, wang.liang82@zte.com.cn,
 xue.zhihong@zte.com.cn, QEMU Trivial <qemu-trivial@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
References: <1594631044-36284-1-git-send-email-wang.yi59@zte.com.cn>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <1c3fd28f-3191-b1d4-ff51-554ed675a5fb@redhat.com>
Date: Mon, 13 Jul 2020 11:32:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1594631044-36284-1-git-send-email-wang.yi59@zte.com.cn>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=thuth@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/13 03:20:22
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Mon, 13 Jul 2020 09:32:36 -0000

On 13/07/2020 11.04, Yi Wang wrote:
> From: Liao Pingfang <liao.pingfang@zte.com.cn>
> 
> Remove superfluous breaks, as there is a "return" before them.
> 
> Signed-off-by: Liao Pingfang <liao.pingfang@zte.com.cn>
> Signed-off-by: Yi Wang <wang.yi59@zte.com.cn>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org> 
> ---
>  tcg/riscv/tcg-target.inc.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/tcg/riscv/tcg-target.inc.c b/tcg/riscv/tcg-target.inc.c
> index 2bc0ba7..3c11ab8 100644
> --- a/tcg/riscv/tcg-target.inc.c
> +++ b/tcg/riscv/tcg-target.inc.c
> @@ -502,10 +502,8 @@ static bool patch_reloc(tcg_insn_unit *code_ptr, int type,
>          break;
>      case R_RISCV_JAL:
>          return reloc_jimm20(code_ptr, (tcg_insn_unit *)value);
> -        break;
>      case R_RISCV_CALL:
>          return reloc_call(code_ptr, (tcg_insn_unit *)value);
> -        break;
>      default:
>          tcg_abort();
>      }
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


