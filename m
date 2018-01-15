Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eayZL-0001ow-GX
	for mharc-qemu-trivial@gnu.org; Mon, 15 Jan 2018 01:48:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60319)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1eayZJ-0001n6-GC
	for qemu-trivial@nongnu.org; Mon, 15 Jan 2018 01:48:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1eayZI-0002CL-G5
	for qemu-trivial@nongnu.org; Mon, 15 Jan 2018 01:48:29 -0500
Received: from mx1.redhat.com ([209.132.183.28]:52058)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1eayZE-00029g-7o; Mon, 15 Jan 2018 01:48:24 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 09C73356DA;
	Mon, 15 Jan 2018 06:48:22 +0000 (UTC)
Received: from [10.36.116.134] (ovpn-116-134.ams2.redhat.com [10.36.116.134])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B4E9260C94;
	Mon, 15 Jan 2018 06:48:20 +0000 (UTC)
To: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-devel@nongnu.org
References: <20180115023501.37361-1-aik@ozlabs.ru>
Cc: qemu-trivial@nongnu.org
From: Thomas Huth <thuth@redhat.com>
Message-ID: <7b942fc7-a061-789a-4223-030d234602ca@redhat.com>
Date: Mon, 15 Jan 2018 07:48:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20180115023501.37361-1-aik@ozlabs.ru>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Mon, 15 Jan 2018 06:48:22 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH qemu] configure: Allow
 capstone=git only if git update is not disabled
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
X-List-Received-Date: Mon, 15 Jan 2018 06:48:30 -0000

On 15.01.2018 03:35, Alexey Kardashevskiy wrote:
> Even with --disable-git-update, ./configure tries updating the capstone
> submodule instead of marking it "no"; this disables capstone submodule
> if git update is disabled.
> 
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> ---
>  configure | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/configure b/configure
> index 89bd662..92c21b3 100755
> --- a/configure
> +++ b/configure
> @@ -4502,7 +4502,7 @@ case "$capstone" in
>    "" | yes)
>      if $pkg_config capstone; then
>        capstone=system
> -    elif test -e "${source_path}/.git" ; then
> +    elif test -e "${source_path}/.git" -a $git_update = 'yes' ; then
>        capstone=git
>      elif test -e "${source_path}/capstone/Makefile" ; then
>        capstone=internal
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>

