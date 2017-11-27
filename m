Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eJPB7-0004yl-MC
	for mharc-qemu-trivial@gnu.org; Mon, 27 Nov 2017 14:34:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36996)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1eJPB2-0004xT-Su
	for qemu-trivial@nongnu.org; Mon, 27 Nov 2017 14:34:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1eJPB2-00051d-4C
	for qemu-trivial@nongnu.org; Mon, 27 Nov 2017 14:34:48 -0500
Received: from mx1.redhat.com ([209.132.183.28]:39284)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <jsnow@redhat.com>)
	id 1eJPAx-0004yq-Pv; Mon, 27 Nov 2017 14:34:43 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2DB0D4E4C3;
	Mon, 27 Nov 2017 19:34:42 +0000 (UTC)
Received: from [10.18.17.130] (dhcp-17-130.bos.redhat.com [10.18.17.130])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B2C555D9C6;
	Mon, 27 Nov 2017 19:34:41 +0000 (UTC)
To: Mike Frysinger <vapier@gentoo.org>, qemu-devel@nongnu.org
References: <20171127174944.12362-1-vapier@gentoo.org>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <c0cecdb2-6d20-b229-a92a-110721fc2bbf@redhat.com>
Date: Mon, 27 Nov 2017 14:34:41 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171127174944.12362-1-vapier@gentoo.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Mon, 27 Nov 2017 19:34:42 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] build: fix typo in error
 message
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
X-List-Received-Date: Mon, 27 Nov 2017 19:34:49 -0000



On 11/27/2017 12:49 PM, Mike Frysinger wrote:
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>
> ---
>  scripts/git-submodule.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/git-submodule.sh b/scripts/git-submodule.sh
> index 030617b4ac0c..bc7224a27fe3 100755
> --- a/scripts/git-submodule.sh
> +++ b/scripts/git-submodule.sh
> @@ -24,7 +24,7 @@ error() {
>      echo "Alternatively you may disable automatic GIT submodule checkout"
>      echo "with:"
>      echo
> -    echo " $ ./configure --disable-git-update'"
> +    echo " $ ./configure --disable-git-update"
>      echo
>      echo "and then manually update submodules prior to running make, with:"
>      echo
> 

cc qemu-trivial

Reviewed-by: John Snow <jsnow@redhat.com>

