Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WhJbu-0002tC-Gp
	for mharc-qemu-trivial@gnu.org; Mon, 05 May 2014 10:11:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42758)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1WhJbm-0002g9-Vw
	for qemu-trivial@nongnu.org; Mon, 05 May 2014 10:11:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1WhJbh-0003Nh-2x
	for qemu-trivial@nongnu.org; Mon, 05 May 2014 10:11:06 -0400
Received: from mail-ee0-x236.google.com ([2a00:1450:4013:c00::236]:57376)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1WhJbT-0003B4-LP; Mon, 05 May 2014 10:10:47 -0400
Received: by mail-ee0-f54.google.com with SMTP id b57so3536215eek.41
	for <multiple recipients>; Mon, 05 May 2014 07:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=tjtIcXvXtysMF92VfMJSCEUQRbM+m5WCV4PFL76kgVI=;
	b=XaPjIYd9r7OaZaqKlpxJro631t/DNrXX7Dl8DulnS3UrzF2jgss7zGYOfH2WCY4aQs
	nMhANEkSigVKkDBMeexgRigNpbOkKSZLME+cV35bvL9qv2vNVibKTAABkJK3zPZz3DNZ
	gxYcReFRLeygf94LwydW+J3iX00n3EuKIokUaR+megb70/EJenvCKZxl2xO7EizfDxNT
	NHzrE9DcKlKSQ7TxS7Qh0cLw0NzNaeNwZmC2mbRKktvCdx8O2s+suGRwwHg2jv+/DntO
	FT9mDpvgscrpo3GVxgSMC3mvYiXfB+VfdpfDbZily+u4L2ERwj2QB4DTUcehbQvv9qrV
	cz2A==
X-Received: by 10.14.219.67 with SMTP id l43mr15683587eep.0.1399299046427;
	Mon, 05 May 2014 07:10:46 -0700 (PDT)
Received: from yakj.usersys.redhat.com (net-37-117-141-58.cust.vodafonedsl.it.
	[37.117.141.58])
	by mx.google.com with ESMTPSA id a4sm29953367eep.12.2014.05.05.07.10.43
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 05 May 2014 07:10:44 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <53679BE1.9040401@redhat.com>
Date: Mon, 05 May 2014 16:10:41 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
References: <1399030869-23399-1-git-send-email-mjt@msgid.tls.msk.ru>
In-Reply-To: <1399030869-23399-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Enigmail-Version: 1.6
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4013:c00::236
Cc: qemu-trivial@nongnu.org, Fam Zheng <famz@redhat.com>,
	qemu-stable@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] configure: remove bashism
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 05 May 2014 14:11:13 -0000

Il 02/05/2014 13:41, Michael Tokarev ha scritto:
> Commit e26110cfc67d48 added a check for shacmd to create a hash
> for modules.  This check in configure is using bash construct &>
> to redirect both stdout and stderr, whcih does fun things on some
> shells.  Get rid of it, use standard redirection instead.
>
> Cc: Fam Zheng <famz@redhat.com>
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
>  configure |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/configure b/configure
> index 2fbec59..7442790 100755
> --- a/configure
> +++ b/configure
> @@ -2627,7 +2627,7 @@ done
>  if test "$modules" = yes; then
>      shacmd_probe="sha1sum sha1 shasum"
>      for c in $shacmd_probe; do
> -        if which $c &>/dev/null; then
> +        if which $c >/dev/null 2>&1; then
>              shacmd="$c"
>              break
>          fi
>

Applied, and Cced qemu-stable too.

