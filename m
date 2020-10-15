Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kT2dR-0001wv-0O
	for mharc-qemu-trivial@gnu.org; Thu, 15 Oct 2020 08:45:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kT2dP-0001wc-6C
 for qemu-trivial@nongnu.org; Thu, 15 Oct 2020 08:45:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kT2dN-0001ey-H4
 for qemu-trivial@nongnu.org; Thu, 15 Oct 2020 08:45:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602765928;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ChTchp8+SkWyVexFLXALXfgmfCaFAzluBLaYDJ4kvCQ=;
 b=A3F7L4Q0BPfKQcFd1IBKb5fLuexbrvvpoLzIrq5J5Xj50yuZjKW+zt8Ox+zGPLQX3pJaxN
 T+cYW5ceeWiz506mVu0en/gqAc/XGVSer7XEORb/GfIiP5hKmV48OqG2zN9+Ixxb/mlhqM
 KCuj/mwOgdSLKiECBseHL1yyqrFQF0g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-292-kszUkNxlMMepKXNJExwm7A-1; Thu, 15 Oct 2020 08:45:26 -0400
X-MC-Unique: kszUkNxlMMepKXNJExwm7A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8B3E9803646;
 Thu, 15 Oct 2020 12:45:25 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-163.ams2.redhat.com [10.36.114.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A71460E1C;
 Thu, 15 Oct 2020 12:45:24 +0000 (UTC)
Date: Thu, 15 Oct 2020 14:45:22 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Elena Afanasova <eafanasova@gmail.com>
Cc: mreitz@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
Subject: Re: [PATCH] block/qcow2-cluster: remove dead code
Message-ID: <20201015124522.GJ4610@merkur.fritz.box>
References: <e04b538ddbf6b6612c0c94602740ff78a98812d7.camel@gmail.com>
MIME-Version: 1.0
In-Reply-To: <e04b538ddbf6b6612c0c94602740ff78a98812d7.camel@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/15 02:10:02
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 15 Oct 2020 12:45:31 -0000

Am 15.10.2020 um 14:13 hat Elena Afanasova geschrieben:
> Since handle_dependencies() returns 0 or -EAGAIN the following case can be removed.
> Spotted by PVS-Studio.
> 
> Signed-off-by: Elena Afanasova <eafanasova@gmail.com>
> ---
>  block/qcow2-cluster.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/block/qcow2-cluster.c b/block/qcow2-cluster.c
> index aa87d3e99b..e2e0db0cc9 100644
> --- a/block/qcow2-cluster.c
> +++ b/block/qcow2-cluster.c
> @@ -1806,8 +1806,6 @@ again:
>               * structs before starting over. */
>              assert(*m == NULL);
>              goto again;
> -        } else if (ret < 0) {
> -            return ret;
>          } else if (cur_bytes == 0) {
>              break;
>          } else {

Technically correct, but let's keep it for anyone who will return a
different error code in the future. I think we should always check for
any error even if it is currently not produced.

Kevin


