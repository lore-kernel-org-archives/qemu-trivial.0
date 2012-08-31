Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T7SD6-0000By-FR
	for mharc-qemu-trivial@gnu.org; Fri, 31 Aug 2012 10:28:36 -0400
Received: from eggs.gnu.org ([208.118.235.92]:51697)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <don@cloudswitch.com>) id 1T7SD4-0000Bk-Iy
	for qemu-trivial@nongnu.org; Fri, 31 Aug 2012 10:28:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <don@cloudswitch.com>) id 1T7SD0-0003jM-FX
	for qemu-trivial@nongnu.org; Fri, 31 Aug 2012 10:28:34 -0400
Received: from hub021-nj-7.exch021.serverdata.net ([206.225.164.223]:29518)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <don@cloudswitch.com>) id 1T7SD0-0003jG-By
	for qemu-trivial@nongnu.org; Fri, 31 Aug 2012 10:28:30 -0400
Received: from don-760.CloudSwitch.com (131.239.15.22) by
	east.exch021.serverdata.net (10.240.4.115) with Microsoft SMTP Server
	(TLS) id 14.2.309.2; Fri, 31 Aug 2012 07:04:13 -0700
Message-ID: <5040C45D.8000106@CloudSwitch.Com>
Date: Fri, 31 Aug 2012 10:04:13 -0400
From: Don Slutz <Don@CloudSwitch.Com>
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:15.0) Gecko/20120824 Thunderbird/15.0
MIME-Version: 1.0
To: Fred Oliveira <foliveira@cloudswitch.com>
References: <1346416208-28004-1-git-send-email-foliveira@cloudswitch.com>
In-Reply-To: <1346416208-28004-1-git-send-email-foliveira@cloudswitch.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Windows 2000 SP2+,
	XP SP1+ (seldom 98)
X-Received-From: 206.225.164.223
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] target-i386: Allow
 tsc-frequency to be larger then 2.147G
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
X-List-Received-Date: Fri, 31 Aug 2012 14:28:35 -0000

On 08/31/12 08:30, Fred Oliveira wrote:
> The check using INT_MAX (2147483647) is wrong in this case.
>
> Signed-off-by: Fred Oliveira <foliveira@cloudswitch.com>
> ---
>   target-i386/cpu.c |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/target-i386/cpu.c b/target-i386/cpu.c
> index 423e009..cbc172e 100644
> --- a/target-i386/cpu.c
> +++ b/target-i386/cpu.c
> @@ -846,7 +846,7 @@ static void x86_cpuid_set_tsc_freq(Object *obj, Visitor *v, void *opaque,
>   {
>       X86CPU *cpu = X86_CPU(obj);
>       const int64_t min = 0;
> -    const int64_t max = INT_MAX;
> +    const int64_t max = INT64_MAX;
>       int64_t value;
>   
>       visit_type_int(v, &value, name, errp);
I think this a *trivial patch. Adding *qemu-trivial@nongnu.org.
    -Don Slutz
**

