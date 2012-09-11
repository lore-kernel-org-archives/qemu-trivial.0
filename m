Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TBRE7-0001Gg-Ej
	for mharc-qemu-trivial@gnu.org; Tue, 11 Sep 2012 10:14:07 -0400
Received: from eggs.gnu.org ([208.118.235.92]:51174)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <don@cloudswitch.com>) id 1TBRE0-0001Fk-8e
	for qemu-trivial@nongnu.org; Tue, 11 Sep 2012 10:14:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <don@cloudswitch.com>) id 1TBRDq-0007We-Sy
	for qemu-trivial@nongnu.org; Tue, 11 Sep 2012 10:14:00 -0400
Received: from hub021-nj-8.exch021.serverdata.net ([206.225.164.233]:53916)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <don@cloudswitch.com>)
	id 1TBRDq-0007WS-Ps; Tue, 11 Sep 2012 10:13:50 -0400
Received: from don-760.CloudSwitch.com (131.239.15.22) by
	east.exch021.serverdata.net (10.240.4.118) with Microsoft SMTP Server
	(TLS) id 14.2.309.2; Tue, 11 Sep 2012 07:13:50 -0700
Message-ID: <504F471D.3030701@CloudSwitch.Com>
Date: Tue, 11 Sep 2012 10:13:49 -0400
From: Don Slutz <Don@CloudSwitch.Com>
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:15.0) Gecko/20120824 Thunderbird/15.0
MIME-Version: 1.0
To: Don Slutz <Don@CloudSwitch.com>
References: <1346532470-15859-1-git-send-email-Don@CloudSwitch.com>
	<1346630960-30887-1-git-send-email-Don@CloudSwitch.com>
In-Reply-To: <1346630960-30887-1-git-send-email-Don@CloudSwitch.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Windows XP/2000 (RFC1323+, w+,
	tstamp-)
X-Received-From: 206.225.164.233
Cc: blauwirbel@gmail.com, qemu-trivial@nongnu.org, qemu-devel@nongnu.org
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
X-List-Received-Date: Tue, 11 Sep 2012 14:14:06 -0000

On 09/02/12 20:09, Don Slutz wrote:
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
The (3) patch set in 
http://lists.gnu.org/archive/html/qemu-devel/2012-09/msg01400.html 
includes this change, and so this request is being withdrawn.

