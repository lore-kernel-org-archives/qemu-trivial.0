Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fBhki-0004ET-3k
	for mharc-qemu-trivial@gnu.org; Thu, 26 Apr 2018 10:20:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60010)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fBhkd-0004Ap-Jd
	for qemu-trivial@nongnu.org; Thu, 26 Apr 2018 10:20:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fBhkc-0001UO-LB
	for qemu-trivial@nongnu.org; Thu, 26 Apr 2018 10:19:59 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:37636 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1fBhkU-0001QZ-KL; Thu, 26 Apr 2018 10:19:50 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 08995406C742;
	Thu, 26 Apr 2018 14:19:46 +0000 (UTC)
Received: from [10.36.116.75] (ovpn-116-75.ams2.redhat.com [10.36.116.75])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D73AC2026E03;
	Thu, 26 Apr 2018 14:19:40 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20180426140253.3918-1-peter.maydell@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <4f0eec20-64a6-fb8f-58ae-1fab9ef34f53@redhat.com>
Date: Thu, 26 Apr 2018 16:19:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180426140253.3918-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Thu, 26 Apr 2018 14:19:46 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Thu, 26 Apr 2018 14:19:46 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] vl.c: Don't zero-initialize
 statics for serial_hds
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 26 Apr 2018 14:20:02 -0000

On 26.04.2018 16:02, Peter Maydell wrote:
> checkpatch reminds us that statics shouldn't be zero-initialized:
> 
> ERROR: do not initialise statics to 0 or NULL
> #35: FILE: vl.c:157:
> +static int num_serial_hds = 0;
> 
> ERROR: do not initialise statics to 0 or NULL
> #36: FILE: vl.c:158:
> +static Chardev **serial_hds = NULL;
> 
> I forgot to fix this in 6af2692e86f9fdfb3d; do so now.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> I wouldn't bother with this except that I forgot to fold
> it in when applying the serial-limits patchset.
> 
>  vl.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/vl.c b/vl.c
> index 616956adf1..6d8b869dad 100644
> --- a/vl.c
> +++ b/vl.c
> @@ -154,8 +154,8 @@ QEMUClockType rtc_clock;
>  int vga_interface_type = VGA_NONE;
>  static DisplayOptions dpy;
>  int no_frame;
> -static int num_serial_hds = 0;
> -static Chardev **serial_hds = NULL;
> +static int num_serial_hds;
> +static Chardev **serial_hds;
>  Chardev *parallel_hds[MAX_PARALLEL_PORTS];
>  Chardev *virtcon_hds[MAX_VIRTIO_CONSOLES];
>  Chardev *sclp_hds[MAX_SCLP_CONSOLES];
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>

