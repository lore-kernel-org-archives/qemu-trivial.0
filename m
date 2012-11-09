Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TWjfT-0005Ob-Hf
	for mharc-qemu-trivial@gnu.org; Fri, 09 Nov 2012 03:10:23 -0500
Received: from eggs.gnu.org ([208.118.235.92]:51447)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1TWjfQ-0005GN-NZ
	for qemu-trivial@nongnu.org; Fri, 09 Nov 2012 03:10:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1TWjfK-0002xB-K8
	for qemu-trivial@nongnu.org; Fri, 09 Nov 2012 03:10:20 -0500
Received: from mail-we0-f173.google.com ([74.125.82.173]:52526)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1TWjf9-0002iI-SU; Fri, 09 Nov 2012 03:10:04 -0500
Received: by mail-we0-f173.google.com with SMTP id t11so1582158wey.4
	for <multiple recipients>; Fri, 09 Nov 2012 00:10:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=R0ROn9kK2uYyFj4ZQXnQbdtuArIa+aGsi9sibu2Emzs=;
	b=ucFxkE5TkxY7evgm5QmnZA4tBMB9zxsfJV92927rlOMWKZwV0fcCaoqMvYOgF9jNY0
	P+V+Q1ra5RPuo0PpTcwGsJNjdWbBhcBHfreEGtatLid9lWQr4lWfpAojGpkjJxhEB9w4
	iZfOcJ09oV2GAzUi+oQeLycSEcTpdgit1DbGwxPIgQX+B93nCr2BkFYp2plpPbs5Dtxa
	NqDzPmGIKDUqclh8zUrnXy+APvtLAn45ruLEjceqVo6Hhimf46ohfIGn+CZ+HkaXVIfI
	eEQDt5piYLFBPGlmrC3DcKv9ER+e0F4F4HdhzHjNWT+gStW4WtjGQ1cgrg2EVaFA9OJL
	Uw7w==
Received: by 10.216.135.25 with SMTP id t25mr4195569wei.106.1352448601405;
	Fri, 09 Nov 2012 00:10:01 -0800 (PST)
Received: from yakj.usersys.redhat.com (79.Red-88-2-49.staticIP.rima-tde.net.
	[88.2.49.79])
	by mx.google.com with ESMTPS id gg4sm1268273wib.6.2012.11.09.00.09.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 09 Nov 2012 00:10:00 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <509CBA56.4060803@redhat.com>
Date: Fri, 09 Nov 2012 09:09:58 +0100
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:16.0) Gecko/20121016 Thunderbird/16.0.1
MIME-Version: 1.0
To: Anthony PERARD <anthony.perard@citrix.com>
References: <1352387501-21907-1-git-send-email-anthony.perard@citrix.com>
In-Reply-To: <1352387501-21907-1-git-send-email-anthony.perard@citrix.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 74.125.82.173
Cc: qemu-trivial <qemu-trivial@nongnu.org>, QEMU-devel <qemu-devel@nongnu.org>,
	Luiz Capitulino <lcapitulino@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH] qemu-sockets: Fix parsing of the inet
	option 'to'.
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
X-List-Received-Date: Fri, 09 Nov 2012 08:10:22 -0000

Il 08/11/2012 16:11, Anthony PERARD ha scritto:
> Having a qemu command line argument like "-vnc 127.0.0.1:0,to=99" is broken.
> This have been break with commit 879e45c72da1569e07fbbc6a1aa2a708ea796044.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> 
> ---
>  qemu-sockets.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/qemu-sockets.c b/qemu-sockets.c
> index abcd791..11d3d32 100644
> --- a/qemu-sockets.c
> +++ b/qemu-sockets.c
> @@ -551,8 +551,9 @@ static InetSocketAddress *inet_parse(const char *str, Error **errp)
>      optstr = str + pos;
>      h = strstr(optstr, ",to=");
>      if (h) {
> -        if (1 != sscanf(str, "%d%n", &to, &pos) ||
> -            (str[pos] != '\0' && str[pos] != ',')) {
> +        h += 4;
> +        if (1 != sscanf(h, "%d%n", &to, &pos) ||
> +            (h[pos] != '\0' && h[pos] != ',')) {
>              error_setg(errp, "error parsing to= argument");
>              goto fail;
>          }
> 

I was going to submit this exact same patch.  Thanks.

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

I added qemu-trivial to the Cc list.

Paolo

