Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RtMpd-0003gE-L2
	for mharc-qemu-trivial@gnu.org; Fri, 03 Feb 2012 12:21:53 -0500
Received: from eggs.gnu.org ([140.186.70.92]:37064)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1RtMpV-0003AL-OV
	for qemu-trivial@nongnu.org; Fri, 03 Feb 2012 12:21:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1RtMpP-0001HS-OF
	for qemu-trivial@nongnu.org; Fri, 03 Feb 2012 12:21:45 -0500
Received: from mail-pz0-f45.google.com ([209.85.210.45]:65506)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>)
	id 1RtMpF-0001Ew-1K; Fri, 03 Feb 2012 12:21:29 -0500
Received: by dadp14 with SMTP id p14so3714427dad.4
	for <multiple recipients>; Fri, 03 Feb 2012 09:21:27 -0800 (PST)
Received: by 10.68.74.230 with SMTP id x6mr18965593pbv.49.1328289687805;
	Fri, 03 Feb 2012 09:21:27 -0800 (PST)
Received: from [192.168.0.103] (cpe-70-123-132-139.austin.res.rr.com.
	[70.123.132.139])
	by mx.google.com with ESMTPS id r9sm14385285pbi.6.2012.02.03.09.21.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 03 Feb 2012 09:21:26 -0800 (PST)
Message-ID: <4F2C1793.8090907@redhat.com>
Date: Fri, 03 Feb 2012 11:21:23 -0600
From: Anthony Liguori <anthony@codemonkey.ws>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.23) Gecko/20110922 Lightning/1.0b2 Thunderbird/3.1.15
MIME-Version: 1.0
To: Laszlo Ersek <lersek@redhat.com>
References: <m31uqluvwy.fsf@blackfin.pond.sub.org>
	<1327671245-5231-1-git-send-email-lersek@redhat.com>
In-Reply-To: <1327671245-5231-1-git-send-email-lersek@redhat.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.210.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, armbru@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] keep the PID file locked
 for the lifetime of the process
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
X-List-Received-Date: Fri, 03 Feb 2012 17:21:51 -0000

On 01/27/2012 07:34 AM, Laszlo Ersek wrote:
> The lockf() call in qemu_create_pidfile() aims at ensuring mutual
> exclusion. We shouldn't close the pidfile on success (as introduced by
> commit 1bbd1592), because that drops the lock as well [1]:
>
>      "File locks shall be released on first close by the locking process
>      of any file descriptor for the file."
>
> Coverity may complain again about the leaked file descriptor; let's
> worry about that later.
>
> v1->v2:
> - add reference to 1bbd1592
> - explain the intentional fd leak in the source
>
> [1] http://pubs.opengroup.org/onlinepubs/9699919799/functions/lockf.html

Applied.  Thanks.

Regards,

Anthony Liguori

>
> Signed-off-by: Laszlo Ersek<lersek@redhat.com>
> ---
>   os-posix.c |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/os-posix.c b/os-posix.c
> index 5c437ca..e3ed497 100644
> --- a/os-posix.c
> +++ b/os-posix.c
> @@ -348,6 +348,6 @@ int qemu_create_pidfile(const char *filename)
>           return -1;
>       }
>
> -    close(fd);
> +    /* keep pidfile open&  locked forever */
>       return 0;
>   }


