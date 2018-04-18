Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1f8mTK-0002A6-V1
	for mharc-qemu-trivial@gnu.org; Wed, 18 Apr 2018 08:46:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52089)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1f8mTI-00028S-Pk
	for qemu-trivial@nongnu.org; Wed, 18 Apr 2018 08:46:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1f8mTI-0003gD-4T
	for qemu-trivial@nongnu.org; Wed, 18 Apr 2018 08:46:00 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:57820 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cohuck@redhat.com>)
	id 1f8mTC-0003YU-7M; Wed, 18 Apr 2018 08:45:54 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4718281A88C3;
	Wed, 18 Apr 2018 12:45:50 +0000 (UTC)
Received: from gondolin (dhcp-192-222.str.redhat.com [10.33.192.222])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9A4A910F1BED;
	Wed, 18 Apr 2018 12:45:40 +0000 (UTC)
Date: Wed, 18 Apr 2018 14:45:38 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Olaf Hering <olaf@aepfle.de>
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Fam
	Zheng <famz@redhat.com>, Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?=
	<f4bug@amsat.org>,
	"open list:All patches CC here" <qemu-devel@nongnu.org>, 
	Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20180418144538.4aa2f492.cohuck@redhat.com>
In-Reply-To: <20180418123838.3511-1-olaf@aepfle.de>
References: <20180418123838.3511-1-olaf@aepfle.de>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Wed, 18 Apr 2018 12:45:50 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Wed, 18 Apr 2018 12:45:50 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'cohuck@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v1] configure: require
 glib-2.24
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
X-List-Received-Date: Wed, 18 Apr 2018 12:46:01 -0000

On Wed, 18 Apr 2018 14:38:37 +0200
Olaf Hering <olaf@aepfle.de> wrote:

> Since usage of g_realloc_n was introduced, glib-2.22 can not be used anymore.
> Fixes commit 418026ca43 ("util: Introduce vfio helpers")
> 
> Signed-off-by: Olaf Hering <olaf@aepfle.de>
> ---
>  configure | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/configure b/configure
> index 6e9b994f21..81760ef45a 100755
> --- a/configure
> +++ b/configure
> @@ -3369,7 +3369,7 @@ fi
>  if test "$mingw32" = yes; then
>      glib_req_ver=2.30
>  else
> -    glib_req_ver=2.22
> +    glib_req_ver=2.24
>  fi
>  glib_modules=gthread-2.0
>  if test "$modules" = yes; then
> 

Are we ready to give up support for whatever distro is still on 2.22?
(If yes, can we bump to an even newer glib version?) Or should we
rather solve this by adding a g_realloc_n implementation for that case?

