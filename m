Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WhExb-0006Iv-7W
	for mharc-qemu-trivial@gnu.org; Mon, 05 May 2014 05:13:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49893)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WhExS-000681-Vj
	for qemu-trivial@nongnu.org; Mon, 05 May 2014 05:13:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WhExM-0004Cg-Eg
	for qemu-trivial@nongnu.org; Mon, 05 May 2014 05:13:10 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:51202)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WhEx9-000478-NH; Mon, 05 May 2014 05:12:51 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 5B65B40661;
	Mon,  5 May 2014 13:12:42 +0400 (MSK)
Message-ID: <5367560A.8010000@msgid.tls.msk.ru>
Date: Mon, 05 May 2014 13:12:42 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.4.0
MIME-Version: 1.0
To: Hani Benhabiles <kroosec@gmail.com>, qemu-devel@nongnu.org
References: <1398725186-8202-1-git-send-email-kroosec@gmail.com>
	<5364AAEE.7000500@msgid.tls.msk.ru>
In-Reply-To: <5364AAEE.7000500@msgid.tls.msk.ru>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org,
	=?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>, lcapitulino@redhat.com
Subject: Re: [Qemu-trivial] [PATCH] qmp: Report path ambiguity error.
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
X-List-Received-Date: Mon, 05 May 2014 09:13:17 -0000

03.05.2014 12:38, Michael Tokarev wrote:
[]
> --- a/qmp.c
> +++ b/qmp.c
> @@ -200,7 +200,9 @@ ObjectPropertyInfoList *qmp_qom_list(const char *path, Error **errp)
> 
>      obj = object_resolve_path(path, &ambiguous);
>      if (obj == NULL) {
> -        error_set(errp, QERR_DEVICE_NOT_FOUND, path);
> +        error_set(errp,
> +                  ambiguous ? "Path '%s' is ambiguous" : QERR_DEVICE_NOT_FOUND,
> +                  path);
>          return NULL;
>      }

I've applied this version.

Thanks,

/mjt

