Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eRCl3-0004jt-Vy
	for mharc-qemu-trivial@gnu.org; Tue, 19 Dec 2017 02:56:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40674)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1eRCkz-0004hn-9W
	for qemu-trivial@nongnu.org; Tue, 19 Dec 2017 02:56:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1eRCku-0006PB-5C
	for qemu-trivial@nongnu.org; Tue, 19 Dec 2017 02:56:09 -0500
Received: from mx1.redhat.com ([209.132.183.28]:33942)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1eRCkl-0006Es-Td; Tue, 19 Dec 2017 02:55:56 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E74E085363;
	Tue, 19 Dec 2017 07:55:54 +0000 (UTC)
Received: from [10.36.116.178] (ovpn-116-178.ams2.redhat.com [10.36.116.178])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 63F967FB42;
	Tue, 19 Dec 2017 07:55:52 +0000 (UTC)
To: Mao Zhongyi <maozy.fnst@cn.fujitsu.com>, qemu-devel@nongnu.org
References: <20171219020921.23887-1-maozy.fnst@cn.fujitsu.com>
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <0f40be05-5e06-fae5-a82f-4ce17d29ce13@redhat.com>
Date: Tue, 19 Dec 2017 08:55:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <20171219020921.23887-1-maozy.fnst@cn.fujitsu.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Tue, 19 Dec 2017 07:55:54 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [RESEND PATCH] build: Fix error
 script name in git-submodule
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
X-List-Received-Date: Tue, 19 Dec 2017 07:56:12 -0000

On 19.12.2017 03:09, Mao Zhongyi wrote:
> When I follow the command line prompts to run
> "$ scripts/git-sbumodule.sh update  ui/keycodemapdb dtc capstone"
> 
> this is what I got:
> -bash: ./scripts/git-sbumodule.sh: No such file or directory
> 
> Cc: Daniel P. Berrange <berrange@redhat.com>
> Fixes: f62bbee55d503f639ee9498878ebf42ff4f4299a
> Signed-off-by: Mao Zhongyi <maozy.fnst@cn.fujitsu.com>
> ---
>  scripts/git-submodule.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/git-submodule.sh b/scripts/git-submodule.sh
> index bc7224a..807ca0b 100755
> --- a/scripts/git-submodule.sh
> +++ b/scripts/git-submodule.sh
> @@ -28,7 +28,7 @@ error() {
>      echo
>      echo "and then manually update submodules prior to running make, with:"
>      echo
> -    echo " $ scripts/git-sbumodule.sh update $modules"
> +    echo " $ scripts/git-submodule.sh update $modules"
>      echo
>      exit 1
>  }
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>

