Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S1h8O-00070E-D8
	for mharc-qemu-trivial@gnu.org; Sun, 26 Feb 2012 11:39:40 -0500
Received: from eggs.gnu.org ([208.118.235.92]:34125)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1S1h8L-0006zP-B8
	for qemu-trivial@nongnu.org; Sun, 26 Feb 2012 11:39:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1S1h8I-00043s-DH
	for qemu-trivial@nongnu.org; Sun, 26 Feb 2012 11:39:36 -0500
Received: from mail-pz0-f45.google.com ([209.85.210.45]:65353)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1S1h8I-00043d-7I
	for qemu-trivial@nongnu.org; Sun, 26 Feb 2012 11:39:34 -0500
Received: by dadp14 with SMTP id p14so5241628dad.4
	for <qemu-trivial@nongnu.org>; Sun, 26 Feb 2012 08:39:32 -0800 (PST)
Received-SPF: pass (google.com: domain of anthony@codemonkey.ws designates
	10.68.201.196 as permitted sender) client-ip=10.68.201.196; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of anthony@codemonkey.ws
	designates 10.68.201.196 as permitted sender)
	smtp.mail=anthony@codemonkey.ws
Received: from mr.google.com ([10.68.201.196])
	by 10.68.201.196 with SMTP id kc4mr21474212pbc.141.1330274372992
	(num_hops = 1); Sun, 26 Feb 2012 08:39:32 -0800 (PST)
Received: by 10.68.201.196 with SMTP id kc4mr18381405pbc.141.1330274372946;
	Sun, 26 Feb 2012 08:39:32 -0800 (PST)
Received: from [192.168.0.104] (cpe-70-123-132-139.austin.res.rr.com.
	[70.123.132.139])
	by mx.google.com with ESMTPS id y7sm10221624pbp.25.2012.02.26.08.39.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 26 Feb 2012 08:39:31 -0800 (PST)
Message-ID: <4F4A6041.5060102@codemonkey.ws>
Date: Sun, 26 Feb 2012 10:39:29 -0600
From: Anthony Liguori <anthony@codemonkey.ws>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.23) Gecko/20110922 Lightning/1.0b2 Thunderbird/3.1.15
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1330263596-4988-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1330263596-4988-1-git-send-email-sw@weilnetz.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-Gm-Message-State: ALoCoQmOkSBZCRiS2EPFfI7cc/GF2o+v+4+dIg4SIOOcaQ4tOf77hUMgV0jQ0sKYYvbcf4yXs/HP
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.210.45
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Fix spelling in comments
	(iff -> if)
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
X-List-Received-Date: Sun, 26 Feb 2012 16:39:38 -0000

On 02/26/2012 07:39 AM, Stefan Weil wrote:
> Signed-off-by: Stefan Weil<sw@weilnetz.de>
> ---
>   a.out.h                |    2 +-
>   arm-dis.c              |   22 +++++++++++-----------
>   block.c                |    2 +-
>   block/qcow2-refcount.c |    4 ++--
>   hw/alpha_typhoon.c     |    2 +-
>   hw/hid.h               |    2 +-
>   hw/pcnet.c             |    2 +-
>   m68k-dis.c             |    4 ++--
>   memory.h               |    4 ++--
>   monitor.c              |    2 +-
>   net/socket.c           |    2 +-
>   qemu-img.c             |    2 +-
>   tcg/hppa/tcg-target.c  |    6 +++---
>   13 files changed, 28 insertions(+), 28 deletions(-)
>
> diff --git a/a.out.h b/a.out.h
> index 33ca7f7..7ea8d5a 100644
> --- a/a.out.h
> +++ b/a.out.h
> @@ -136,7 +136,7 @@ struct external_scnhdr {
>    */
>   struct external_lineno {
>     union {
> -    host_ulong l_symndx; /* function name symbol index, iff l_lnno 0 */

I don't know if this is the intention but this may be short hand for 'if and 
only if'.  I do use this short hand quite a bit myself.

http://en.wikipedia.org/wiki/If_and_only_if

Regards,

Anthony Liguori

