Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TDbuv-0004co-HP
	for mharc-qemu-trivial@gnu.org; Mon, 17 Sep 2012 10:03:17 -0400
Received: from eggs.gnu.org ([208.118.235.92]:60678)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <don@cloudswitch.com>) id 1TDbuo-0004Rx-KG
	for qemu-trivial@nongnu.org; Mon, 17 Sep 2012 10:03:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <don@cloudswitch.com>) id 1TDbuf-0004eT-9e
	for qemu-trivial@nongnu.org; Mon, 17 Sep 2012 10:03:10 -0400
Received: from hub021-nj-1.exch021.serverdata.net ([206.225.164.216]:17478)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <don@cloudswitch.com>)
	id 1TDbuf-0004e5-6E; Mon, 17 Sep 2012 10:03:01 -0400
Received: from don-760.CloudSwitch.com (131.239.15.22) by
	east.exch021.serverdata.net (10.240.4.31) with Microsoft SMTP Server
	(TLS) id 14.2.309.2; Mon, 17 Sep 2012 07:03:00 -0700
Message-ID: <50572D93.8010701@CloudSwitch.Com>
Date: Mon, 17 Sep 2012 10:02:59 -0400
From: Don Slutz <Don@CloudSwitch.Com>
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:15.0) Gecko/20120907 Thunderbird/15.0.1
MIME-Version: 1.0
To: Don Slutz <Don@CloudSwitch.com>
References: <1347890425-9696-1-git-send-email-Don@CloudSwitch.com>
In-Reply-To: <1347890425-9696-1-git-send-email-Don@CloudSwitch.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Windows 2000 SP2+,
	XP SP1+ (seldom 98)
X-Received-From: 206.225.164.216
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, kvm@vger.kernel.org,
	qemu-trivial@nongnu.org, mtosatti@redhat.com,
	qemu-devel@nongnu.org, blauwirbel@gmail.com, avi@redhat.com,
	anthony@codemonkey.ws, imammedo@redhat.com, afaerber@suse.de
Subject: Re: [Qemu-trivial] [PATCH v2] target-i386: Report on error during
	cpu_x86_register().
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
X-List-Received-Date: Mon, 17 Sep 2012 14:03:15 -0000

On 09/17/12 10:00, Don Slutz wrote:
> Send it to stderr before free of the details.
>
> Signed-off-by: Don Slutz <Don@CloudSwitch.com>
> ---
> v2: Change __FUNCTION__ to __func__
>
>   target-i386/cpu.c |    1 +
>   1 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/target-i386/cpu.c b/target-i386/cpu.c
> index 57c064f..760cca4 100644
> --- a/target-i386/cpu.c
> +++ b/target-i386/cpu.c
> @@ -1352,6 +1352,7 @@ int cpu_x86_register(X86CPU *cpu, const char *cpu_model)
>       }
>       object_property_set_str(OBJECT(cpu), def->model_id, "model-id", &error);
>       if (error_is_set(&error)) {
> +        fprintf(stderr, "%s: %s\n", __func__, error_get_pretty(error));
>           error_free(error);
>           return -1;
>       }
I am having a lot of mistakes this morning.  Please ignore this e-mail.

