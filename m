Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kai8x-0006hZ-NL
	for mharc-qemu-trivial@gnu.org; Thu, 05 Nov 2020 11:29:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kai8t-0006gO-AN
 for qemu-trivial@nongnu.org; Thu, 05 Nov 2020 11:29:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kai8q-0004z1-2s
 for qemu-trivial@nongnu.org; Thu, 05 Nov 2020 11:29:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604593776;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=USM4YM/5tBV9h90W9RU/Dy2Gdz0RQksnwHVlqJeEdz8=;
 b=QRXGFGl/50ziofvFA5cNKe7T+HlfTQwwBCLjlTz748h8BHdbAqAuyFtdZzcU0lu925rBUg
 MtW0MEe9fPR0KRz9Hz/Bp0oMBUAgnVaAoW7dqSY5JOBTuaYQR4gaVJY1gDJAImhT4HN4Bn
 0GexqfWcUSO4se3Dk7Lz/kMLY5cNrNs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-391-XH6fNNp0Oc22AYqCx1XjXg-1; Thu, 05 Nov 2020 11:29:32 -0500
X-MC-Unique: XH6fNNp0Oc22AYqCx1XjXg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 56E428DF0D2;
 Thu,  5 Nov 2020 16:29:31 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-31.ams2.redhat.com
 [10.36.114.31])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EF50676644;
 Thu,  5 Nov 2020 16:29:29 +0000 (UTC)
Subject: Re: [PATCH v4 0/2] Fixes building nfs on msys2/mingw
To: Yonggang Luo <luoyonggang@gmail.com>, qemu-devel@nongnu.org
Cc: Peter Lieven <pl@kamp.de>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, QEMU Trivial <qemu-trivial@nongnu.org>
References: <20201105123116.674-1-luoyonggang@gmail.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <89857a12-ba5f-e57e-bcfa-c0075c113ceb@redhat.com>
Date: Thu, 5 Nov 2020 17:29:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201105123116.674-1-luoyonggang@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/05 01:14:53
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
X-List-Received-Date: Thu, 05 Nov 2020 16:29:46 -0000

On 05.11.20 13:31, Yonggang Luo wrote:
> V3-V4
> Use uint64_t instead of blkcnt_t
> V2-V3
> Revise the commit message of
> * block: enable libnfs on msys2/mingw in cirrus.yml
> 
> V1-V2
> Apply suggestion from  Peter Lieven
> 
> Yonggang Luo (2):
>    block: Fixes nfs compiling error on msys2/mingw
>    block: enable libnfs on msys2/mingw in cirrus.yml
> 
>   .cirrus.yml |  1 +
>   block/nfs.c | 13 ++++++++++++-
>   2 files changed, 13 insertions(+), 1 deletion(-)

Thanks!  Applied to my block branch:

https://git.xanclic.moe/XanClic/qemu/commits/branch/block

Max


