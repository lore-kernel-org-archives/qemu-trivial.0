Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ur02O-00050k-Rm
	for mharc-qemu-trivial@gnu.org; Mon, 24 Jun 2013 02:14:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36562)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1Ur02M-0004xS-Kv
	for qemu-trivial@nongnu.org; Mon, 24 Jun 2013 02:14:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1Ur02L-0007Kl-Se
	for qemu-trivial@nongnu.org; Mon, 24 Jun 2013 02:14:02 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44200)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1Ur02J-0007K5-On; Mon, 24 Jun 2013 02:13:59 -0400
Received: from int-mx01.intmail.prod.int.phx2.redhat.com
	(int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r5O6DwLF003896
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 24 Jun 2013 02:13:58 -0400
Received: from rincewind.home.kraxel.org (ovpn-116-31.ams2.redhat.com
	[10.36.116.31])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r5O6Dsmq029471; Mon, 24 Jun 2013 02:13:57 -0400
Message-ID: <51C7E3A2.3050301@redhat.com>
Date: Mon, 24 Jun 2013 08:13:54 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130513 Thunderbird/17.0.6
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>
References: <1371811105-730-1-git-send-email-kraxel@redhat.com>
	<1371811105-730-2-git-send-email-kraxel@redhat.com>
	<51C4985E.1020204@msgid.tls.msk.ru>
In-Reply-To: <51C4985E.1020204@msgid.tls.msk.ru>
X-Enigmail-Version: 1.5.1
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.11
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH 01/13] qemu-socket: zero-initialize
	SocketAddress
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
X-List-Received-Date: Mon, 24 Jun 2013 06:14:03 -0000

On 06/21/13 20:15, Michael Tokarev wrote:
> 21.06.2013 14:38, Gerd Hoffmann wrote:
>> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
>> ---
>>  util/qemu-sockets.c |    2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
>> index fdd8dc4..364bd8c 100644
>> --- a/util/qemu-sockets.c
>> +++ b/util/qemu-sockets.c
>> @@ -855,7 +855,7 @@ SocketAddress *socket_parse(const char *str, Error **errp)
>>  {
>>      SocketAddress *addr = NULL;
>>  
>> -    addr = g_new(SocketAddress, 1);
>> +    addr = g_new0(SocketAddress, 1);
> 
> While at it we can remove the =NULL assignment too, guess, someting like this:
> 
> --- a/util/qemu-sockets.c
> +++ b/util/qemu-sockets.c
> @@ -848,9 +848,7 @@ int unix_nonblocking_connect(const char *path,
> 
>  SocketAddress *socket_parse(const char *str, Error **errp)
>  {
> -    SocketAddress *addr = NULL;
> -
> -    addr = g_new(SocketAddress, 1);
> +    SocketAddress *addr = addr = g_new0(SocketAddress, 1);
>      if (strstart(str, "unix:", NULL)) {
>          if (str[5] == '\0') {
>              error_setg(errp, "invalid Unix socket address");
> 
> Is that okay with you? :)

Yes.

> And not that the original issue is a big issue really, because
> in each case each relevant field is initialized.

Except in the error cases.

cheers,
  Gerd



