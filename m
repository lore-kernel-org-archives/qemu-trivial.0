Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UmjsM-0005hw-Pl
	for mharc-qemu-trivial@gnu.org; Wed, 12 Jun 2013 08:10:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45675)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UmjsK-0005dJ-4z
	for qemu-trivial@nongnu.org; Wed, 12 Jun 2013 08:10:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UmjsI-0000RR-CY
	for qemu-trivial@nongnu.org; Wed, 12 Jun 2013 08:10:04 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:53964)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Umjs8-0000HU-QH; Wed, 12 Jun 2013 08:09:52 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 7D12541366;
	Wed, 12 Jun 2013 16:09:50 +0400 (MSK)
Message-ID: <51B8650E.7080703@msgid.tls.msk.ru>
Date: Wed, 12 Jun 2013 16:09:50 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:17.0) Gecko/17.0 Icedove/17.0
MIME-Version: 1.0
To: Alon Levy <alevy@redhat.com>
References: <1370377419-31788-1-git-send-email-alevy@redhat.com>
	<1370377419-31788-3-git-send-email-alevy@redhat.com>
In-Reply-To: <1370377419-31788-3-git-send-email-alevy@redhat.com>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH 3/5] libcacard/vscclient: fix leakage of
 socket on error paths
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
X-List-Received-Date: Wed, 12 Jun 2013 12:10:05 -0000

05.06.2013 00:23, Alon Levy wrote:
> --- a/libcacard/vscclient.c
> +++ b/libcacard/vscclient.c
> @@ -759,5 +763,6 @@ main(
>      g_io_channel_unref(channel_socket);
>      g_byte_array_unref(socket_to_send);
>  
> +    closesocket(sock);
>      return 0;
>  }

This one isn't really needed, -- there's no need to close
filedescriptors at the end of main().  I understand the
memory unref/free calls above it, to make valgrind and
glib trackers happy.  But it ofcourse does not hurt.

Besides, in all these error places it'd be really nice
to print the actual cause of the problem too - like
strerror(errno) or something like that.  Unfortunately we
had too many of these already in all parts of the code,
and it really is sometimes difficult to understand WHY
it fails without seeing the actual cause.  I'll send a
separate patch for that.

Thanks, applied to the trivial patches queue.

/mjt

