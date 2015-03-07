Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YUVpO-00073w-N9
	for mharc-qemu-trivial@gnu.org; Sun, 08 Mar 2015 03:40:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52925)
	by lists.gnu.org with esmtp (Exim 4.71) (envelope-from <pl@kamp.de>)
	id 1YULJg-00026T-0p
	for qemu-trivial@nongnu.org; Sat, 07 Mar 2015 15:27:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pl@kamp.de>) id 1YULJW-0003gZ-Sf
	for qemu-trivial@nongnu.org; Sat, 07 Mar 2015 15:27:19 -0500
Received: from mx-v6.kamp.de ([2a02:248:0:51::16]:53983 helo=mx01.kamp.de)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <pl@kamp.de>)
	id 1YULJW-0003gO-J5
	for qemu-trivial@nongnu.org; Sat, 07 Mar 2015 15:27:10 -0500
Received: (qmail 18607 invoked by uid 89); 7 Mar 2015 20:00:26 -0000
Received: from [195.62.97.28] by client-16-kamp (envelope-from <pl@kamp.de>,
	uid 89) with qmail-scanner-2010/03/19-MF 
	(clamdscan: 0.98.6/20160. hbedv: 8.3.28.32/7.11.214.168. spamassassin:
	3.4.0. Clear:RC:1(195.62.97.28):SA:0(-2.0/5.0):. 
	Processed in 9.135728 secs); 07 Mar 2015 20:00:26 -0000
Received: from smtp.kamp.de (HELO submission.kamp.de) ([195.62.97.28])
	by mx01.kamp.de with ESMTPS (DHE-RSA-AES256-SHA encrypted);
	7 Mar 2015 20:00:16 -0000
X-GL_Whitelist: yes
Received: (qmail 30642 invoked from network); 7 Mar 2015 19:59:52 -0000
Received: from ac33.vpn.kamp-intra.net (HELO ?172.20.250.33?)
	(pl@kamp.de@172.20.250.33)
	by submission.kamp.de with ESMTPS (DHE-RSA-AES128-SHA encrypted) ESMTPA;
	7 Mar 2015 19:59:52 -0000
Message-ID: <54FB58D0.3070400@kamp.de>
Date: Sat, 07 Mar 2015 21:00:16 +0100
From: Peter Lieven <pl@kamp.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>, QEMU Trivial <qemu-trivial@nongnu.org>
References: <1425719670-5486-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1425719670-5486-1-git-send-email-sw@weilnetz.de>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a02:248:0:51::16
X-Mailman-Approved-At: Sun, 08 Mar 2015 03:40:45 -0400
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	QEMU Developer <qemu-devel@nongnu.org>,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>
Subject: Re: [Qemu-trivial] [PATCH] iscsi: Fix check for username
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
X-List-Received-Date: Sat, 07 Mar 2015 20:27:21 -0000

Am 07.03.2015 um 10:14 schrieb Stefan Weil:
> The variable user in struct iscsi_url is a character array, not a pointer.
> Therefore its address will never be NULL.
>
> clang reports this error:
>
> block/iscsi.c:1329:20: warning:
>  comparison of array 'iscsi_url->user' not equal to a null pointer
>  is always true [-Wtautological-pointer-compare]
>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>
> This error also exists in libscsi. See my pull request
> https://github.com/sahlberg/libiscsi/pull/146
>
> Cheers
> Stefan
>
>  block/iscsi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/block/iscsi.c b/block/iscsi.c
> index 1fa855a..a2bd70a 100644
> --- a/block/iscsi.c
> +++ b/block/iscsi.c
> @@ -1326,7 +1326,7 @@ static int iscsi_open(BlockDriverState *bs, QDict *options, int flags,
>          goto out;
>      }
>  
> -    if (iscsi_url->user != NULL) {
> +    if (iscsi_url->user[0] != '\0') {
>          ret = iscsi_set_initiator_username_pwd(iscsi, iscsi_url->user,
>                                                iscsi_url->passwd);
>          if (ret != 0) {

Thanks for catching this. Luckily this call is before the parse_chap function. Otherwise
it would have been impossible to specify username and password via config file.

Reviewed-by: Peter Lieven <pl@kamp.de>
Acked-by: Peter Lieven <pl@kamp.de>

