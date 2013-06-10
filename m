Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Um47j-00021n-C7
	for mharc-qemu-trivial@gnu.org; Mon, 10 Jun 2013 11:35:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50444)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Um47d-0001m3-57
	for qemu-trivial@nongnu.org; Mon, 10 Jun 2013 11:35:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Um47b-0006Tk-F6
	for qemu-trivial@nongnu.org; Mon, 10 Jun 2013 11:35:05 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:48564)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Um47T-0006JK-Em; Mon, 10 Jun 2013 11:34:55 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 3D111410E7;
	Mon, 10 Jun 2013 19:34:54 +0400 (MSK)
Message-ID: <51B5F21C.9020700@msgid.tls.msk.ru>
Date: Mon, 10 Jun 2013 19:34:52 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:17.0) Gecko/17.0 Icedove/17.0
MIME-Version: 1.0
To: "Richard W.M. Jones" <rjones@redhat.com>
References: <1370870347-22080-1-git-send-email-rjones@redhat.com>
In-Reply-To: <1370870347-22080-1-git-send-email-rjones@redhat.com>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, kwolf@redhat.com, qemu-devel@nongnu.org,
	stefanha@redhat.com
Subject: Re: [Qemu-trivial] [PATCH] curl: Don't set curl options on the
 handle just before it's going to be deleted.
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
X-List-Received-Date: Mon, 10 Jun 2013 15:35:10 -0000

10.06.2013 17:19, Richard W.M. Jones wrote:
> From: "Richard W.M. Jones" <rjones@redhat.com>
> 
> (Found by Kamil Dudka)
> 
> Signed-off-by: Richard W.M. Jones <rjones@redhat.com>
> ---
>  block/curl.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/block/curl.c b/block/curl.c
> index b634ccf..bf31efe 100644
> --- a/block/curl.c
> +++ b/block/curl.c
> @@ -453,7 +453,6 @@ static int curl_open(BlockDriverState *bs, QDict *options, int flags)
>          goto out;
>      curl_easy_getinfo(state->curl, CURLINFO_CONTENT_LENGTH_DOWNLOAD, &d);
>      curl_easy_setopt(state->curl, CURLOPT_WRITEFUNCTION, (void *)curl_read_cb);
> -    curl_easy_setopt(state->curl, CURLOPT_NOBODY, 0);
>      if (d)
>          s->len = (size_t)d;
>      else if(!s->len)

Adding a bit more context:


    curl_easy_setopt(state->curl, CURLOPT_NOBODY, 1);
    curl_easy_setopt(state->curl, CURLOPT_WRITEFUNCTION, (void *)curl_size_cb);
    if (curl_easy_perform(state->curl))
        goto out;
    curl_easy_getinfo(state->curl, CURLINFO_CONTENT_LENGTH_DOWNLOAD, &d);
    curl_easy_setopt(state->curl, CURLOPT_WRITEFUNCTION, (void *)curl_read_cb);
=>> curl_easy_setopt(state->curl, CURLOPT_NOBODY, 0);
    if (d)
        s->len = (size_t)d;
    else if(!s->len)
        goto out;
    DPRINTF("CURL: Size = %zd\n", s->len);

    curl_clean_state(state);
    curl_easy_cleanup(state->curl);
    state->curl = NULL;

So indeed, the curl object is being removed here a few lines down the code.

But it looks like the previous call to curl_easy_setopt, to set WRITEFUNCTION,
is also not very useful. Should we probably want to remove that too, or don't
remove either of these?

Thanks,

/mjt

