Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jzvxo-0007OI-Ra
	for mharc-qemu-trivial@gnu.org; Mon, 27 Jul 2020 01:46:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jzvxn-0007O8-ST
 for qemu-trivial@nongnu.org; Mon, 27 Jul 2020 01:46:15 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:30283
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jzvxm-0006lK-HS
 for qemu-trivial@nongnu.org; Mon, 27 Jul 2020 01:46:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595828773;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=Eptem89ZkdnZqEqSQLVjZe7xH7w35ZWuqn3Z9TsZH4Q=;
 b=U4l/g7YSs62zJkL+pUDS+7NQMmfn8Re7HCQsko6x/o8GIHwp14TU3OPHQHq0RSocIU2jc9
 5VUiMW1TI6aSJmdUd4VlVbnDkF1NYm2kxqxfRgUy6RINZxz1Zt3bPgCB+cZ9ekT1M+Q8rN
 BQ9tpOacdE/QMbfqqTzNDVsC/gXU1G8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-212-E783xLubNkuoqWQqqRiNGA-1; Mon, 27 Jul 2020 01:46:11 -0400
X-MC-Unique: E783xLubNkuoqWQqqRiNGA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 285651005504;
 Mon, 27 Jul 2020 05:46:10 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-156.ams2.redhat.com [10.36.112.156])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B613310013D0;
 Mon, 27 Jul 2020 05:46:01 +0000 (UTC)
Subject: Re: [PATCH] qemu-options.hx: Fix typo for netdev documentation
To: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>, qemu-devel@nongnu.org,
 Jason Wang <jasowang@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>
References: <20200727045925.29375-1-tianjia.zhang@linux.alibaba.com>
Cc: peter.maydell@linaro.org, pbonzini@redhat.com, mst@redhat.com,
 kraxel@redhat.com
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <d7eab1b6-4e30-2d23-7bec-0afedaeb60d4@redhat.com>
Date: Mon, 27 Jul 2020 07:46:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200727045925.29375-1-tianjia.zhang@linux.alibaba.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/27 01:46:13
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
X-List-Received-Date: Mon, 27 Jul 2020 05:46:16 -0000

On 27/07/2020 06.59, Tianjia Zhang wrote:
> This patch fixes the netdev document description typo in qemu-option.hx.
> 
> Signed-off-by: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
> ---
>  qemu-options.hx | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 708583b4ce..92556ed96d 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -2684,7 +2684,7 @@ SRST
>      disable script execution.
>  
>      If running QEMU as an unprivileged user, use the network helper
> -    helper to configure the TAP interface and attach it to the bridge.
> +    to configure the TAP interface and attach it to the bridge.
>      The default network helper executable is
>      ``/path/to/qemu-bridge-helper`` and the default bridge device is
>      ``br0``.

Reviewed-by: Thomas Huth <thuth@redhat.com>


