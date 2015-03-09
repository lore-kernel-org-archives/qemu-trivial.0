Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YV0WV-0002r0-9K
	for mharc-qemu-trivial@gnu.org; Mon, 09 Mar 2015 12:27:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45998)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1YV0WS-0002mc-CT
	for qemu-trivial@nongnu.org; Mon, 09 Mar 2015 12:27:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1YV0WR-00022f-69
	for qemu-trivial@nongnu.org; Mon, 09 Mar 2015 12:27:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57618)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1YV0WO-000206-LZ; Mon, 09 Mar 2015 12:27:12 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t29GR3ih021153
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Mon, 9 Mar 2015 12:27:04 -0400
Received: from [10.36.112.40] (ovpn-112-40.ams2.redhat.com [10.36.112.40])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t29GQvG4026061
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO);
	Mon, 9 Mar 2015 12:27:00 -0400
Message-ID: <54FDC9D1.7080900@redhat.com>
Date: Mon, 09 Mar 2015 17:26:57 +0100
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>, QEMU Trivial <qemu-trivial@nongnu.org>
References: <1425719670-5486-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1425719670-5486-1-git-send-email-sw@weilnetz.de>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
	Peter Lieven <pl@kamp.de>, QEMU Developer <qemu-devel@nongnu.org>,
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
X-List-Received-Date: Mon, 09 Mar 2015 16:27:17 -0000



On 07/03/2015 10:14, Stefan Weil wrote:
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
> 

Applied, thanks.

Paolo

