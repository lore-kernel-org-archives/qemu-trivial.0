Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kfdO0-0000Hd-H1
	for mharc-qemu-trivial@gnu.org; Thu, 19 Nov 2020 01:25:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kfdNz-0000GK-6T
 for qemu-trivial@nongnu.org; Thu, 19 Nov 2020 01:25:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kfdNw-0003Ji-5U
 for qemu-trivial@nongnu.org; Thu, 19 Nov 2020 01:25:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605767133;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cHuIDT+ETt8vmZjczhgnL7FJHgEVsd0hjmInHlmg/hs=;
 b=JUa3Yc7zGSN8eMWe91LV7y+M2vVRCW9dgXeHfdisKcP0R5mgI2MfMXVf6IktrWq2fl8Ngj
 zYUCZNlsVoWb8bC7TAd3WToes+jYoRfeIaPzjXhhsy1JcTsm21R0sD07T5wkOUjZICJPOR
 VmCGAzaopCSgCLSwRxsq1WHBFVxxAsE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-374-tYZutqdLMrWpkaacy76iLA-1; Thu, 19 Nov 2020 01:25:30 -0500
X-MC-Unique: tYZutqdLMrWpkaacy76iLA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 246A98144E2;
 Thu, 19 Nov 2020 06:25:29 +0000 (UTC)
Received: from [10.72.13.63] (ovpn-13-63.pek2.redhat.com [10.72.13.63])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7398160636;
 Thu, 19 Nov 2020 06:25:27 +0000 (UTC)
Subject: Re: [PATCH 1/1] /net/tap.c: Fix a memory leak Close fd before
 returning. Buglink: https://bugs.launchpad.net/qemu/+bug/1904486
To: ruc_gongyuanjun@163.com, qemu-trivial@nongnu.org
References: <20201118020703.26987-1-ruc_gongyuanjun@163.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <138eb247-9d6b-3bfb-0b0a-993153168bed@redhat.com>
Date: Thu, 19 Nov 2020 14:25:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201118020703.26987-1-ruc_gongyuanjun@163.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 23:36:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
X-List-Received-Date: Thu, 19 Nov 2020 06:25:39 -0000


On 2020/11/18 上午10:07, ruc_gongyuanjun@163.com wrote:
> From: yuanjungong <ruc_gongyuanjun@163.com>
>
> Signed-off-by: yuanjungong <ruc_gongyuanjun@163.com>
> ---
>   net/tap.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/net/tap.c b/net/tap.c
> index c46ff66..fe95fa7 100644
> --- a/net/tap.c
> +++ b/net/tap.c
> @@ -817,6 +817,7 @@ int net_init_tap(const Netdev *netdev, const char *name,
>           if (ret < 0) {
>               error_setg_errno(errp, -ret, "%s: Can't use file descriptor %d",
>                                name, fd);
> +            close(fd);
>               return -1;
>           }
>   
> @@ -831,6 +832,7 @@ int net_init_tap(const Netdev *netdev, const char *name,
>                            vhostfdname, vnet_hdr, fd, &err);
>           if (err) {
>               error_propagate(errp, err);
> +            close(fd);
>               return -1;
>           }
>       } else if (tap->has_fds) {


Hi:

Please add resend with correct title and commit log for this patch as 
what other patch did.

Thanks



