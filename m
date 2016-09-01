Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bfUSK-00020A-FF
	for mharc-qemu-trivial@gnu.org; Thu, 01 Sep 2016 12:03:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43917)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1bfUSA-0001nw-IU
	for qemu-trivial@nongnu.org; Thu, 01 Sep 2016 12:03:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1bfUS6-0006JE-MU
	for qemu-trivial@nongnu.org; Thu, 01 Sep 2016 12:02:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52652)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1bfURw-0006Ex-Cf; Thu, 01 Sep 2016 12:02:44 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A5FF189C30;
	Thu,  1 Sep 2016 16:02:42 +0000 (UTC)
Received: from [10.36.112.32] (ovpn-112-32.ams2.redhat.com [10.36.112.32])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u81G2dq4028097
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 1 Sep 2016 12:02:41 -0400
To: Cao jin <caoj.fnst@cn.fujitsu.com>, qemu-devel@nongnu.org
References: <1472696479-3619-1-git-send-email-caoj.fnst@cn.fujitsu.com>
Cc: qemu-trivial@nongnu.org
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <7e141484-4749-b789-5f20-37a3a2f58419@redhat.com>
Date: Thu, 1 Sep 2016 18:02:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1472696479-3619-1-git-send-email-caoj.fnst@cn.fujitsu.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Thu, 01 Sep 2016 16:02:42 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] doc/rcu: fix typo
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 01 Sep 2016 16:03:04 -0000



On 01/09/2016 04:21, Cao jin wrote:
> Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
> ---
>  docs/rcu.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/docs/rcu.txt b/docs/rcu.txt
> index 2f70954..a70b72c 100644
> --- a/docs/rcu.txt
> +++ b/docs/rcu.txt
> @@ -37,7 +37,7 @@ do not matter; as soon as all previous critical sections have finished,
>  there cannot be any readers who hold references to the data structure,
>  and these can now be safely reclaimed (e.g., freed or unref'ed).
>  
> -Here is a picutre:
> +Here is a picture:
>  
>          thread 1                  thread 2                  thread 3
>      -------------------    ------------------------    -------------------
> 

Queued for 2.8, thanks.

Paolo

