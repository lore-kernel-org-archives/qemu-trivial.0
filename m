Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kChLo-0004Ms-7K
	for mharc-qemu-trivial@gnu.org; Mon, 31 Aug 2020 06:47:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kChLn-0004Ky-2E
 for qemu-trivial@nongnu.org; Mon, 31 Aug 2020 06:47:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27005)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kChLl-0006KZ-Gp
 for qemu-trivial@nongnu.org; Mon, 31 Aug 2020 06:47:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598870864;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rJS5bTag1lQG5YOHZC2F4MI9+X59z4vk5vYaeKYGi5w=;
 b=JvdiXodQzaPLc7QAvZvpQFRbZ9lYCaIB1SzesiRqpva8dlns8z3fjEuJ52f5wsJe8JLm9o
 glFbf57nHr51oOtrDsvqSV/S4pWrI1rMvTnTDM8GNu9PsNsoFblqE3bdWdVMuE1GER2nBm
 xrzPRMFP/GoTU2pxWNO43Yrl6iHzJpU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-538-zP-gj1IEMo29YLGPR5aehA-1; Mon, 31 Aug 2020 06:47:42 -0400
X-MC-Unique: zP-gj1IEMo29YLGPR5aehA-1
Received: by mail-wr1-f72.google.com with SMTP id g6so2666795wrv.3
 for <qemu-trivial@nongnu.org>; Mon, 31 Aug 2020 03:47:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=rJS5bTag1lQG5YOHZC2F4MI9+X59z4vk5vYaeKYGi5w=;
 b=h4ZOY22k9K1tETgMi0Z0vcKot5n4DCnbb7sj2zETQ62sTb6j3eEnA0I6ZfzOwEibe7
 wEgBlmhnrsjVrPoIe4mRctW0pJWxce9JRcW5mroVIwLUnAg4m8HSs8dYdI1ZhHEtjWoc
 ErXsxnptwGyovoa0UWLV/fq6tXqktNlfoh8zW2K38LkgV7GHt30oAvXhMJfoCyV33zVQ
 D+/HJn6kR650F7J/hKtg+PvEmR7bZ741bagTDu58zikgOMwloNrrTsGfTvvMuyptowzh
 pp++8YJ12SaoWhZU5v/DVO+8S/UbG1ABu5/DDWkcp9oVbqxxS4//7YvxUCNNAbIRhfH5
 e9pQ==
X-Gm-Message-State: AOAM533djabFNtg1ZfCUoPpTRG6TOTqL6VLQGozdrUwmYBp1kt0B97u1
 Qxg850MAPES7rgTbnptGf9rvlFJmmXfbu3qwhTSMnAQ8and6LETiPWXmHcolc3JluIcSkhuxNA2
 LZ6hKmdZqc7wYSm1kFQ==
X-Received: by 2002:a1c:964b:: with SMTP id y72mr818337wmd.69.1598870861311;
 Mon, 31 Aug 2020 03:47:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwIwNXLvRZnIgiSFi1B//EJeHWSX7nMxpleO7SMuhxTWeye7nWKRmz/78ZYf/+bYDugKlYA8w==
X-Received: by 2002:a1c:964b:: with SMTP id y72mr818315wmd.69.1598870861095;
 Mon, 31 Aug 2020 03:47:41 -0700 (PDT)
Received: from redhat.com ([192.117.173.58])
 by smtp.gmail.com with ESMTPSA id k4sm2540559wrx.51.2020.08.31.03.47.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Aug 2020 03:47:40 -0700 (PDT)
Date: Mon, 31 Aug 2020 06:47:31 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Chen Qun <kuhn.chenqun@huawei.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, pannengyuan@huawei.com,
 zhang.zhanghailiang@huawei.com, Euler Robot <euler.robot@huawei.com>,
 Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 06/11] hw/net/virtio-net:Remove redundant statement in
 virtio_net_rsc_tcp_ctrl_check()
Message-ID: <20200831064717-mutt-send-email-mst@kernel.org>
References: <20200813073712.4001404-1-kuhn.chenqun@huawei.com>
 <20200813073712.4001404-7-kuhn.chenqun@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20200813073712.4001404-7-kuhn.chenqun@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/31 03:02:42
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 31 Aug 2020 10:47:47 -0000

On Thu, Aug 13, 2020 at 03:37:07PM +0800, Chen Qun wrote:
> Clang static code analyzer show warning:
> hw/net/virtio-net.c:2077:5: warning: Value stored to 'tcp_flag' is never read
>     tcp_flag &= VIRTIO_NET_TCP_FLAG;
>     ^           ~~~~~~~~~~~~~~~~~~~
> 
> The 'VIRTIO_NET_TCP_FLAG' is '0x3F'. The last ‘tcp_flag’ assignment statement is
>  the same as that of the first two statements.
> 
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

feel free to merge through the trivial tree.

> ---
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Jason Wang <jasowang@redhat.com>
> ---
>  hw/net/virtio-net.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index a1fe9e9285..cb0d27084c 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -2075,7 +2075,6 @@ static int virtio_net_rsc_tcp_ctrl_check(VirtioNetRscChain *chain,
>      tcp_flag = htons(tcp->th_offset_flags);
>      tcp_hdr = (tcp_flag & VIRTIO_NET_TCP_HDR_LENGTH) >> 10;
>      tcp_flag &= VIRTIO_NET_TCP_FLAG;
> -    tcp_flag = htons(tcp->th_offset_flags) & 0x3F;
>      if (tcp_flag & TH_SYN) {
>          chain->stat.tcp_syn++;
>          return RSC_BYPASS;
> -- 
> 2.23.0


