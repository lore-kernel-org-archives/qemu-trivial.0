Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1a2zXI-0006Vw-LN
	for mharc-qemu-trivial@gnu.org; Sun, 29 Nov 2015 05:48:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50191)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1a2zXG-0006SU-8o
	for qemu-trivial@nongnu.org; Sun, 29 Nov 2015 05:48:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1a2zXF-0001pm-D0
	for qemu-trivial@nongnu.org; Sun, 29 Nov 2015 05:48:50 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:48467)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1a2zXA-0001mU-5R; Sun, 29 Nov 2015 05:48:44 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 7B2E543237;
	Sun, 29 Nov 2015 13:48:43 +0300 (MSK)
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 5AB04A68;
	Sun, 29 Nov 2015 13:48:43 +0300 (MSK)
Message-ID: <565AD80B.50207@msgid.tls.msk.ru>
Date: Sun, 29 Nov 2015 13:48:43 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: Cao jin <caoj.fnst@cn.fujitsu.com>, qemu-devel@nongnu.org
References: <1446709143-19935-1-git-send-email-caoj.fnst@cn.fujitsu.com>
In-Reply-To: <1446709143-19935-1-git-send-email-caoj.fnst@cn.fujitsu.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, afaerber@suse.de
Subject: Re: [Qemu-trivial] [PATCH] Trivial: update comment of struct Object
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
X-List-Received-Date: Sun, 29 Nov 2015 10:48:51 -0000

05.11.2015 10:39, Cao jin wrote:
> it don`t has "GSList *interfaces" anymore

Andreas, should this be applied?  It's been on the list for long already,
and you said I shouldn't apply qom patches...

Thanks,

/mjt

> Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
> ---
>  include/qom/object.h | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/include/qom/object.h b/include/qom/object.h
> index 0bb89d4..e46cc30 100644
> --- a/include/qom/object.h
> +++ b/include/qom/object.h
> @@ -396,9 +396,6 @@ struct ObjectClass
>   * As a result, #Object contains a reference to the objects type as its
>   * first member.  This allows identification of the real type of the object at
>   * run time.
> - *
> - * #Object also contains a list of #Interfaces that this object
> - * implements.
>   */
>  struct Object
>  {
> 


