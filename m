Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1r6X8L-0003b3-CO
	for mharc-qemu-trivial@gnu.org; Fri, 24 Nov 2023 09:26:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>)
 id 1r6U4w-0000W7-OR; Fri, 24 Nov 2023 06:10:35 -0500
Received: from rev.ng ([5.9.113.41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>)
 id 1r6U4u-0006US-Uz; Fri, 24 Nov 2023 06:10:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject
 :Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RTiUCB0mh65O1ToYbUrrgwA7VXWe7X+LMv7xW29d8hg=; b=Yp/HmrRMa30R/47XHqCLi0ZorV
 6YcRxXCyS7VmEhHLpeWNK/1nI9Z5gLwXqZbvWJXq02vAGcY0LnZOTtm4VDuhU9jhDS3JeVcbepeEv
 sO3Y3a8DAcE2H/rO8BbvrEQeqlAtoydk3d6qszPiMVrf/PbyWoCKwMJXLs7zSaqwP3q0=;
Date: Fri, 24 Nov 2023 12:10:09 +0100
From: Anton Johansson <anjo@rev.ng>
To: Samuel Tardieu <sam@rfc1149.net>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, 
 Alessandro Di Federico <ale@rev.ng>
Subject: Re: [PATCH] target/hexagon/idef-parser/prepare: use env to invoke bash
Message-ID: <mq4raa32vxh2b5on5pztsrocu4mqzej3sxhflr3na7lq4anxm5@nygwh4srb2ar>
References: <20231123211506.636533-1-sam@rfc1149.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231123211506.636533-1-sam@rfc1149.net>
Received-SPF: pass client-ip=5.9.113.41; envelope-from=anjo@rev.ng; helo=rev.ng
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 24 Nov 2023 09:26:10 -0500
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 24 Nov 2023 11:10:36 -0000

On 23/11/23, Samuel Tardieu wrote:
> This file is the only one involved in the compilation process which
> still uses the /bin/bash path.
> 
> Signed-off-by: Samuel Tardieu <sam@rfc1149.net>
> ---
>  target/hexagon/idef-parser/prepare | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/hexagon/idef-parser/prepare b/target/hexagon/idef-parser/prepare
> index 72d6fcbd21..cb3622d4f8 100755
> --- a/target/hexagon/idef-parser/prepare
> +++ b/target/hexagon/idef-parser/prepare
> @@ -1,4 +1,4 @@
> -#!/bin/bash
> +#!/usr/bin/env bash
>  
>  #
>  #  Copyright(c) 2019-2021 rev.ng Labs Srl. All Rights Reserved.
> -- 
> 2.42.0
> 
Reviewed-by: Anton Johansson <anjo@rev.ng>

