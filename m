Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1juuwB-0007om-0G
	for mharc-qemu-trivial@gnu.org; Mon, 13 Jul 2020 05:39:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1juuw9-0007lb-55
 for qemu-trivial@nongnu.org; Mon, 13 Jul 2020 05:39:49 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:24444
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1juuw6-0007zn-Q2
 for qemu-trivial@nongnu.org; Mon, 13 Jul 2020 05:39:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594633186;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=4czGxKsgynDTCYMFklLdXApZQ+orQG/rF8dXapck0Ew=;
 b=HiPKfUrTpKF/4wqyXB5P1OyXyGMmrUzAMt1MEiCCOkyWltJgydp5E12foyt/JQxHnfH+QI
 uLxgMjRhwh4B+Gq4JYfEkgjAvClvB5N7MT53DRA3ap5yZTgTFh6BztJYqENqRZNaDcK2gE
 YQMFIrzb6V89L2aXZk46nAsrqH7m/+I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-360-79XbQlN-O6ikiAcC1XcFvw-1; Mon, 13 Jul 2020 05:39:42 -0400
X-MC-Unique: 79XbQlN-O6ikiAcC1XcFvw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0B4438015CB;
 Mon, 13 Jul 2020 09:39:41 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-125.ams2.redhat.com [10.36.112.125])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5E48527DE7C;
 Mon, 13 Jul 2020 09:39:39 +0000 (UTC)
Subject: Re: [PATCH 12/12] target/cris: Remove superfluous breaks
To: Yi Wang <wang.yi59@zte.com.cn>, qemu-devel@nongnu.org
Cc: Liao Pingfang <liao.pingfang@zte.com.cn>, wang.liang82@zte.com.cn,
 xue.zhihong@zte.com.cn, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <1594631150-36801-1-git-send-email-wang.yi59@zte.com.cn>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <454721ce-1508-dcc0-bf08-2c27fd37854f@redhat.com>
Date: Mon, 13 Jul 2020 11:39:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1594631150-36801-1-git-send-email-wang.yi59@zte.com.cn>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/13 01:36:29
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
X-List-Received-Date: Mon, 13 Jul 2020 09:39:49 -0000

On 13/07/2020 11.05, Yi Wang wrote:
> From: Liao Pingfang <liao.pingfang@zte.com.cn>
> 
> Remove superfluous breaks, as there is a "return" before them.
> 
> Signed-off-by: Liao Pingfang <liao.pingfang@zte.com.cn>
> Signed-off-by: Yi Wang <wang.yi59@zte.com.cn>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/cris/translate.c         | 7 +++----
>  target/cris/translate_v10.inc.c | 2 --
>  2 files changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/target/cris/translate.c b/target/cris/translate.c
> index aaa46b5..64a478b 100644
> --- a/target/cris/translate.c
> +++ b/target/cris/translate.c
> @@ -1178,12 +1178,11 @@ static inline void t_gen_zext(TCGv d, TCGv s, int size)
>  static char memsize_char(int size)
>  {
>      switch (size) {
> -    case 1: return 'b';  break;
> -    case 2: return 'w';  break;
> -    case 4: return 'd';  break;
> +    case 1: return 'b';
> +    case 2: return 'w';
> +    case 4: return 'd';
>      default:
>          return 'x';
> -        break;
>      }
>  }
>  #endif
> diff --git a/target/cris/translate_v10.inc.c b/target/cris/translate_v10.inc.c
> index ae34a0d..7f38fd2 100644
> --- a/target/cris/translate_v10.inc.c
> +++ b/target/cris/translate_v10.inc.c
> @@ -1026,10 +1026,8 @@ static unsigned int dec10_ind(CPUCRISState *env, DisasContext *dc)
>          switch (dc->opcode) {
>              case CRISV10_IND_MOVE_M_R:
>                  return dec10_ind_move_m_r(env, dc, size);
> -                break;
>              case CRISV10_IND_MOVE_R_M:
>                  return dec10_ind_move_r_m(dc, size);
> -                break;
>              case CRISV10_IND_CMP:
>                  LOG_DIS("cmp size=%d op=%d %d\n",  size, dc->src, dc->dst);
>                  cris_cc_mask(dc, CC_MASK_NZVC);
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


