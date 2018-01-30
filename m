Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1egccr-0006oC-SW
	for mharc-qemu-trivial@gnu.org; Tue, 30 Jan 2018 15:35:29 -0500
Received: from eggs.gnu.org ([208.118.235.92]:47407)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1egcbk-0006TO-Ci
	for qemu-trivial@nongnu.org; Tue, 30 Jan 2018 15:35:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1egcaQ-0007DH-BY
	for qemu-trivial@nongnu.org; Tue, 30 Jan 2018 15:34:20 -0500
Received: from mx1.redhat.com ([209.132.183.28]:56302)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1egcZL-0005Hc-D9; Tue, 30 Jan 2018 15:31:51 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 76F9D6B255;
	Tue, 30 Jan 2018 20:31:50 +0000 (UTC)
Received: from [10.36.116.140] (ovpn-116-140.ams2.redhat.com [10.36.116.140])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9E94360BF3;
	Tue, 30 Jan 2018 20:31:47 +0000 (UTC)
To: Cole Robinson <crobinso@redhat.com>, qemu-devel@nongnu.org
Cc: mdroth@linux.vnet.ibm.com, peter.maydell@linaro.org,
	Markus Armbruster <armbru@redhat.com>,
	"Daniel P. Berrange" <berrange@redhat.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
References: <2a250f8d59f1eedd7728d94a9dae1a6de54d0c14.1517340741.git.crobinso@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <58c4c86f-a9a7-a2bc-4d4f-ce331334abba@redhat.com>
Date: Tue, 30 Jan 2018 21:31:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <2a250f8d59f1eedd7728d94a9dae1a6de54d0c14.1517340741.git.crobinso@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Tue, 30 Jan 2018 20:31:50 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH v3] scripts/make-release: Don't archive
 .git files
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
X-List-Received-Date: Tue, 30 Jan 2018 20:35:27 -0000

On 30.01.2018 20:33, Cole Robinson wrote:
> As was last done in 379e21c25, we don't want .git files for
> submodules here, which we aren't presently doing for capstone and
> keycodemapdb.
> 
> Rather than delete the offending files before archiving, ask tar
> to --exclude=.git
> 
> Signed-off-by: Cole Robinson <crobinso@redhat.com>
> ---
> v2:
>     Use armbru's --exclude suggestion, requires tweaking
>     existing tar options a bit.
> 
> v3:
>     thuth's suggestion to use --exclude for both tar commands
> 
>  scripts/make-release | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/scripts/make-release b/scripts/make-release
> index 3917df7142..04fa9defdc 100755
> --- a/scripts/make-release
> +++ b/scripts/make-release
> @@ -19,11 +19,10 @@ pushd ${destination}
>  git checkout "v${version}"
>  git submodule update --init
>  (cd roms/seabios && git describe --tags --long --dirty > .version)
> -rm -rf .git roms/*/.git dtc/.git pixman/.git

Thanks, this also fixes the dead pixman/.git path :-)

Reviewed-by: Thomas Huth <thuth@redhat.com>

