Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QkeMn-0000Mk-OB
	for mharc-qemu-trivial@gnu.org; Sat, 23 Jul 2011 11:43:49 -0400
Received: from eggs.gnu.org ([140.186.70.92]:50503)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1QkeMk-0000CN-Qr
	for qemu-trivial@nongnu.org; Sat, 23 Jul 2011 11:43:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1QkeMj-0004NY-VS
	for qemu-trivial@nongnu.org; Sat, 23 Jul 2011 11:43:46 -0400
Received: from mail-yi0-f45.google.com ([209.85.218.45]:46385)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>)
	id 1QkeMh-0004NH-VN; Sat, 23 Jul 2011 11:43:44 -0400
Received: by yia25 with SMTP id 25so2016364yia.4
	for <multiple recipients>; Sat, 23 Jul 2011 08:43:43 -0700 (PDT)
Received: by 10.236.200.232 with SMTP id z68mr3453516yhn.218.1311435822651;
	Sat, 23 Jul 2011 08:43:42 -0700 (PDT)
Received: from [192.168.0.100] (cpe-70-123-132-139.austin.res.rr.com
	[70.123.132.139])
	by mx.google.com with ESMTPS id j65sm1822902yhm.68.2011.07.23.08.43.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 23 Jul 2011 08:43:41 -0700 (PDT)
Message-ID: <4E2AEC2C.9090003@codemonkey.ws>
Date: Sat, 23 Jul 2011 10:43:40 -0500
From: Anthony Liguori <anthony@codemonkey.ws>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110516 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: Alexandre Raymond <cerbere@gmail.com>
References: <1311399717-59131-1-git-send-email-cerbere@gmail.com>
In-Reply-To: <1311399717-59131-1-git-send-email-cerbere@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.218.45
Cc: qemu-trivial@nongnu.org, Qemu Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] .gitignore: ignore qemu-ga
	and qapi-generated
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
X-List-Received-Date: Sat, 23 Jul 2011 15:43:47 -0000

On 07/23/2011 12:41 AM, Alexandre Raymond wrote:
> Add a new binary and generation directory to the gitignore file
>
> Signed-off-by: Alexandre Raymond<cerbere@gmail.com>

Applied.  Thanks.

Regards,

Anthony Liguori

> ---
>   .gitignore |    2 ++
>   1 files changed, 2 insertions(+), 0 deletions(-)
>
> diff --git a/.gitignore b/.gitignore
> index 08013fc..54835bc 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -15,6 +15,7 @@ libdis*
>   libhw32
>   libhw64
>   libuser
> +qapi-generated
>   qemu-doc.html
>   qemu-tech.html
>   qemu-doc.info
> @@ -32,6 +33,7 @@ qemu-options.texi
>   qemu-img-cmds.texi
>   qemu-img-cmds.h
>   qemu-io
> +qemu-ga
>   qemu-monitor.texi
>   QMP/qmp-commands.txt
>   .gdbinit


