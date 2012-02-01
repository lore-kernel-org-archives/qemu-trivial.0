Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RsiNr-0005fl-1z
	for mharc-qemu-trivial@gnu.org; Wed, 01 Feb 2012 17:10:31 -0500
Received: from eggs.gnu.org ([140.186.70.92]:35078)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1RsiNl-0005Tp-Ho
	for qemu-trivial@nongnu.org; Wed, 01 Feb 2012 17:10:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1RsiNj-000847-ST
	for qemu-trivial@nongnu.org; Wed, 01 Feb 2012 17:10:25 -0500
Received: from mail-pw0-f45.google.com ([209.85.160.45]:47302)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>)
	id 1RsiNg-00083E-P6; Wed, 01 Feb 2012 17:10:20 -0500
Received: by pbaa11 with SMTP id a11so1880865pba.4
	for <multiple recipients>; Wed, 01 Feb 2012 14:10:19 -0800 (PST)
Received: by 10.68.240.235 with SMTP id wd11mr1251316pbc.119.1328134219739;
	Wed, 01 Feb 2012 14:10:19 -0800 (PST)
Received: from [192.168.0.103] (cpe-70-123-132-139.austin.res.rr.com.
	[70.123.132.139])
	by mx.google.com with ESMTPS id a5sm1191581pbh.15.2012.02.01.14.10.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Feb 2012 14:10:17 -0800 (PST)
Message-ID: <4F29B846.3020201@redhat.com>
Date: Wed, 01 Feb 2012 16:10:14 -0600
From: Anthony Liguori <anthony@codemonkey.ws>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.23) Gecko/20110922 Lightning/1.0b2 Thunderbird/3.1.15
MIME-Version: 1.0
To: Michael Roth <mdroth@linux.vnet.ibm.com>
References: <1327108107-16600-1-git-send-email-mdroth@linux.vnet.ibm.com>
In-Reply-To: <1327108107-16600-1-git-send-email-mdroth@linux.vnet.ibm.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.160.45
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] main-loop: Fix SetEvent()
 on uninitialized handle on win32
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
X-List-Received-Date: Wed, 01 Feb 2012 22:10:28 -0000

On 01/20/2012 07:08 PM, Michael Roth wrote:
> The __attribute__((constructor)) init_main_loop() automatically get
> called if qemu-tool.o is linked in. On win32, this leads to
> a qemu_notify_event() call which attempts to SetEvent() on a HANDLE that
> won't be initialized until qemu_init_main_loop() is manually called,
> breaking qemu-tools.o programs on Windows at runtime.
>
> This patch checks for an initialized event handle before attempting to
> set it, which is analoguous to how we deal with an unitialized
> io_thread_fd in the posix implementation.
>
> Signed-off-by: Michael Roth<mdroth@linux.vnet.ibm.com>

Applied.  Thanks.

Regards,

Anthony Liguori

> ---
>   main-loop.c |    5 ++++-
>   1 files changed, 4 insertions(+), 1 deletions(-)
>
> diff --git a/main-loop.c b/main-loop.c
> index 692381c..62d95b9 100644
> --- a/main-loop.c
> +++ b/main-loop.c
> @@ -164,7 +164,7 @@ static int qemu_signal_init(void)
>
>   #else /* _WIN32 */
>
> -HANDLE qemu_event_handle;
> +HANDLE qemu_event_handle = NULL;
>
>   static void dummy_event_handler(void *opaque)
>   {
> @@ -183,6 +183,9 @@ static int qemu_event_init(void)
>
>   void qemu_notify_event(void)
>   {
> +    if (!qemu_event_handle) {
> +        return;
> +    }
>       if (!SetEvent(qemu_event_handle)) {
>           fprintf(stderr, "qemu_notify_event: SetEvent failed: %ld\n",
>                   GetLastError());


