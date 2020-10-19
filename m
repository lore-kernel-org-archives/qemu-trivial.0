Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kUSXR-0001ty-MZ
	for mharc-qemu-trivial@gnu.org; Mon, 19 Oct 2020 06:37:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kUSXQ-0001sn-Gl
 for qemu-trivial@nongnu.org; Mon, 19 Oct 2020 06:37:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kUSXO-0008Kp-SA
 for qemu-trivial@nongnu.org; Mon, 19 Oct 2020 06:37:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603103830;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IpScQdS6ipA+RQEnXKzSjGfBnzPSwKXZv8ialCCHU0s=;
 b=hbAEWErqhJFQPs9ggCNnuUuF89qZPotju3mLLYlpb66rRtN+0ICI01MGRcGNfYjc7XoRFs
 Ua+zIpx6N/Aal0LjRm65XLf0G3lpA0XIfrPtgQuPGAwM5BoY6TKAJk76s+wbkOvvTSq512
 tWymImTJJ4FDBFn8W3L4oqVlVMWiuYM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-356-bRAWQvTDMIK7uwFfoLs1ZQ-1; Mon, 19 Oct 2020 06:37:06 -0400
X-MC-Unique: bRAWQvTDMIK7uwFfoLs1ZQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3027A802B4C;
 Mon, 19 Oct 2020 10:37:05 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-114-6.ams2.redhat.com [10.36.114.6])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9A09927CC9;
 Mon, 19 Oct 2020 10:37:03 +0000 (UTC)
Subject: Re: [PATCH 5/30] mips tcg: Fix Lesser GPL version number
To: Chetan Pant <chetan4windows@gmail.com>, qemu-trivial@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201014134902.14291-1-chetan4windows@gmail.com>
 <20201016143509.26692-1-chetan4windows@gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <12699878-2d46-d01c-35d4-ed85fbc99dd1@redhat.com>
Date: Mon, 19 Oct 2020 12:37:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20201016143509.26692-1-chetan4windows@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/19 02:32:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Mon, 19 Oct 2020 10:37:12 -0000

On 16/10/2020 16.35, Chetan Pant wrote:
> There is no "version 2" of the "Lesser" General Public License.
> It is either "GPL version 2.0" or "Lesser GPL version 2.1".
> This patch replaces all occurrences of "Lesser GPL version 2" with
> "Lesser GPL version 2.1" in comment section.
> 
> Signed-off-by: Chetan Pant <chetan4windows@gmail.com>
> ---
>  hw/mips/cps.c                    | 2 +-
>  hw/misc/mips_cpc.c               | 2 +-
>  hw/misc/mips_itu.c               | 2 +-
>  include/hw/mips/cps.h            | 2 +-
>  include/hw/misc/mips_cpc.h       | 2 +-
>  include/hw/misc/mips_itu.h       | 2 +-
>  target/mips/cp0_helper.c         | 2 +-
>  target/mips/dsp_helper.c         | 2 +-
>  target/mips/fpu_helper.c         | 2 +-
>  target/mips/gdbstub.c            | 2 +-
>  target/mips/helper.c             | 2 +-
>  target/mips/lmmi_helper.c        | 2 +-
>  target/mips/mips-semi.c          | 2 +-
>  target/mips/msa_helper.c         | 2 +-
>  target/mips/op_helper.c          | 2 +-
>  target/mips/translate.c          | 2 +-
>  target/mips/translate_init.c.inc | 2 +-
>  17 files changed, 17 insertions(+), 17 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


