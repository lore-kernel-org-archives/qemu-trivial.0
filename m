Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eCoQ3-0004oM-6M
	for mharc-qemu-trivial@gnu.org; Thu, 09 Nov 2017 10:07:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36805)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1eCoPu-0004jb-0s
	for qemu-trivial@nongnu.org; Thu, 09 Nov 2017 10:06:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1eCoPp-0006yk-Mj
	for qemu-trivial@nongnu.org; Thu, 09 Nov 2017 10:06:53 -0500
Received: from mx1.redhat.com ([209.132.183.28]:42224)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>)
	id 1eCoPi-0006wC-Bl; Thu, 09 Nov 2017 10:06:42 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 76D5B6A7C6;
	Thu,  9 Nov 2017 15:06:41 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.53])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B8C4562460;
	Thu,  9 Nov 2017 15:06:40 +0000 (UTC)
Date: Thu, 9 Nov 2017 15:06:38 +0000
From: "Daniel P. Berrange" <berrange@redhat.com>
To: Vicente Jimenez Aguilar <googuy@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Message-ID: <20171109150638.GH18164@redhat.com>
Reply-To: "Daniel P. Berrange" <berrange@redhat.com>
References: <20171109121903.24510-1-googuy@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20171109121903.24510-1-googuy@gmail.com>
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Thu, 09 Nov 2017 15:06:41 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Add missing parameters to
 mon option documentation
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
X-List-Received-Date: Thu, 09 Nov 2017 15:06:59 -0000

On Thu, Nov 09, 2017 at 01:19:03PM +0100, Vicente Jimenez Aguilar wrote:
> Documentation missed 'mon' option's 'pretty' and 'default' parameters
> 
> Signed-off-by: Vicente Jimenez Aguilar <googuy@gmail.com>
> ---
>  qemu-options.hx | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 3728e9b4dd..72cf48a8e5 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -3477,9 +3477,9 @@ Like -qmp but uses pretty JSON formatting.
>  ETEXI
>  
>  DEF("mon", HAS_ARG, QEMU_OPTION_mon, \
> -    "-mon [chardev=]name[,mode=readline|control]\n", QEMU_ARCH_ALL)
> +    "-mon [chardev=]name[,mode=readline|control][,pretty[=on|off]][,default[=on|off]]\n", QEMU_ARCH_ALL)
>  STEXI
> -@item -mon [chardev=]name[,mode=readline|control]
> +@item -mon [chardev=]name[,mode=readline|control][,pretty[=on|off]][,default[=on|off]]

The 'default' option is deprecated and unused, so intentionally not
documented

https://qemu.weilnetz.de/doc/qemu-doc.html#g_t_002dmon-default_003don-_0028since-2_002e4_002e0_0029


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

