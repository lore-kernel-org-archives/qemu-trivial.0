Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UT2bb-0005bm-9C
	for mharc-qemu-trivial@gnu.org; Fri, 19 Apr 2013 00:07:23 -0400
Received: from eggs.gnu.org ([208.118.235.92]:50204)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1UT2bY-0005ZE-Ve
	for qemu-trivial@nongnu.org; Fri, 19 Apr 2013 00:07:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1UT2bX-0006UP-Pe
	for qemu-trivial@nongnu.org; Fri, 19 Apr 2013 00:07:20 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:41729)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1UT2bU-0006Te-RA; Fri, 19 Apr 2013 00:07:16 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	890F9728003E; Fri, 19 Apr 2013 06:07:15 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id 325tCHV5kWLg; Fri, 19 Apr 2013 06:07:13 +0200 (CEST)
Received: from [192.168.178.35] (p54AD8D33.dip0.t-ipconnect.de [84.173.141.51])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	A5434728002C; Fri, 19 Apr 2013 06:07:13 +0200 (CEST)
Message-ID: <5170C2F0.4040808@weilnetz.de>
Date: Fri, 19 Apr 2013 06:07:12 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130329 Thunderbird/17.0.5
MIME-Version: 1.0
To: "Richard W.M. Jones" <rjones@redhat.com>
References: <1366319373-12926-1-git-send-email-rjones@redhat.com>
In-Reply-To: <1366319373-12926-1-git-send-email-rjones@redhat.com>
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] ssh: Remove unnecessary use of strlen
	function.
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
X-List-Received-Date: Fri, 19 Apr 2013 04:07:22 -0000

Am 18.04.2013 23:09, schrieb Richard W.M. Jones:
> From: "Richard W.M. Jones" <rjones@redhat.com>
>
> ---
>  block/ssh.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/block/ssh.c b/block/ssh.c
> index 8f78e2e..7bc008d 100644
> --- a/block/ssh.c
> +++ b/block/ssh.c
> @@ -387,15 +387,13 @@ static int check_host_key(BDRVSSHState *s, const char *host, int port,
>      }
>  
>      /* host_key_check=md5:xx:yy:zz:... */
> -    if (strlen(host_key_check) >= 4 &&
> -        strncmp(host_key_check, "md5:", 4) == 0) {
> +    if (strncmp(host_key_check, "md5:", 4) == 0) {
>          return check_host_key_hash(s, &host_key_check[4],
>                                     LIBSSH2_HOSTKEY_HASH_MD5, 16);
>      }
>  
>      /* host_key_check=sha1:xx:yy:zz:... */
> -    if (strlen(host_key_check) >= 5 &&
> -        strncmp(host_key_check, "sha1:", 5) == 0) {
> +    if (strncmp(host_key_check, "sha1:", 5) == 0) {
>          return check_host_key_hash(s, &host_key_check[5],
>                                     LIBSSH2_HOSTKEY_HASH_SHA1, 20);
>      }


Reviewed-by: Stefan Weil <sw@weilnetz.de>


