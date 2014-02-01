Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1W9XCh-00018M-SE
	for mharc-qemu-trivial@gnu.org; Sat, 01 Feb 2014 04:49:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44138)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1W9XCa-0000xC-NQ
	for qemu-trivial@nongnu.org; Sat, 01 Feb 2014 04:49:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1W9XCV-0006nF-BJ
	for qemu-trivial@nongnu.org; Sat, 01 Feb 2014 04:49:28 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:52571)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1W9XCK-0006mR-4n; Sat, 01 Feb 2014 04:49:12 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 664ED40053;
	Sat,  1 Feb 2014 13:49:11 +0400 (MSK)
Message-ID: <52ECC317.5060004@msgid.tls.msk.ru>
Date: Sat, 01 Feb 2014 13:49:11 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20131103 Icedove/17.0.10
MIME-Version: 1.0
To: Amos Kong <akong@redhat.com>
References: <1390467277-16499-1-git-send-email-akong@redhat.com>
In-Reply-To: <1390467277-16499-1-git-send-email-akong@redhat.com>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, eblake@redhat.com, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] qapi: cleanup redundant variable
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
X-List-Received-Date: Sat, 01 Feb 2014 09:49:34 -0000

23.01.2014 12:54, Amos Kong wrote:
> No need to re-append an expr list, it's ok to return schema.exprs
> 
> Signed-off-by: Amos Kong <akong@redhat.com>
> ---
>  scripts/qapi.py | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/scripts/qapi.py b/scripts/qapi.py
> index 7b92689..718f1ad 100644
> --- a/scripts/qapi.py
> +++ b/scripts/qapi.py
> @@ -175,8 +175,6 @@ def parse_schema(fp):
>          print >>sys.stderr, e
>          exit(1)
>  
> -    exprs = []
> -
>      for expr in schema.exprs:
>          if expr.has_key('enum'):
>              add_enum(expr['enum'])
> @@ -185,9 +183,8 @@ def parse_schema(fp):
>              add_enum('%sKind' % expr['union'])
>          elif expr.has_key('type'):
>              add_struct(expr)
> -        exprs.append(expr)
>  
> -    return exprs
> +    return schema.exprs

I don't really know python.  Does it mean that previously,
this function returned a copy of schema.exprs, but now it
returns schema.exprs itself, so a caller can modify it?

Thanks,

/mjt

