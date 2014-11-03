Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XlEVj-00080m-KU
	for mharc-qemu-trivial@gnu.org; Mon, 03 Nov 2014 05:05:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41811)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XlEVb-0007oi-Mn
	for qemu-trivial@nongnu.org; Mon, 03 Nov 2014 05:05:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XlEVV-0008Jx-J9
	for qemu-trivial@nongnu.org; Mon, 03 Nov 2014 05:05:11 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:52653)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XlEVJ-00081Q-1m; Mon, 03 Nov 2014 05:04:53 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 5372E404DE;
	Mon,  3 Nov 2014 13:04:52 +0300 (MSK)
Message-ID: <54575344.1080609@msgid.tls.msk.ru>
Date: Mon, 03 Nov 2014 13:04:52 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.2.0
MIME-Version: 1.0
To: zhanghailiang <zhang.zhanghailiang@huawei.com>, 
 qemu-trivial@nongnu.org
References: <1415007872-8228-1-git-send-email-zhang.zhanghailiang@huawei.com>
	<1415007872-8228-6-git-send-email-zhang.zhanghailiang@huawei.com>
In-Reply-To: <1415007872-8228-6-git-send-email-zhang.zhanghailiang@huawei.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: pbonzini@redhat.com, eblake@redhat.com, qemu-devel@nongnu.org,
	peter.huangpeng@huawei.com
Subject: Re: [Qemu-trivial] [PATCH v2 5/5] spice-qemu-char: convert
 qemu_chr_open_spice_vmc to use Error API
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
X-List-Received-Date: Mon, 03 Nov 2014 10:05:18 -0000

03.11.2014 12:44, zhanghailiang wrote:
[]
> --- a/qemu-char.c
> +++ b/qemu-char.c
> @@ -4252,7 +4252,7 @@ ChardevReturn *qmp_chardev_add(const char *id, ChardevBackend *backend,
>  #endif
>  #ifdef CONFIG_SPICE
>      case CHARDEV_BACKEND_KIND_SPICEVMC:
> -        chr = qemu_chr_open_spice_vmc(backend->spicevmc->type);
> +        chr = qemu_chr_open_spice_vmc(backend->spicevmc->type, errp);
>          break;
>      case CHARDEV_BACKEND_KIND_SPICEPORT:
>          chr = qemu_chr_open_spice_port(backend->spiceport->fqdn);

Now this is funny.  Why we have two functions nearby using different
error reporting APIs?  Maybe qemu_chr_open_spice_port() should be
converted to Error API too, at the same time (maybe in the same
patch or in a subsequent patch in the same series)?

Thanks,

/mjt

