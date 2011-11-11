Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ROx3V-0006n8-Vi
	for mharc-qemu-trivial@gnu.org; Fri, 11 Nov 2011 14:46:29 -0500
Received: from eggs.gnu.org ([140.186.70.92]:52524)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1ROx3O-0006Mp-Jz
	for qemu-trivial@nongnu.org; Fri, 11 Nov 2011 14:46:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1ROx3N-0002Dp-6T
	for qemu-trivial@nongnu.org; Fri, 11 Nov 2011 14:46:22 -0500
Received: from mail-iy0-f173.google.com ([209.85.210.173]:35059)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>)
	id 1ROx30-0001is-JR; Fri, 11 Nov 2011 14:45:58 -0500
Received: by mail-iy0-f173.google.com with SMTP id k32so5202243iak.4
	for <multiple recipients>; Fri, 11 Nov 2011 11:45:53 -0800 (PST)
Received: by 10.50.85.129 with SMTP id h1mr14171511igz.47.1321040753174;
	Fri, 11 Nov 2011 11:45:53 -0800 (PST)
Received: from [192.168.0.103] (cpe-70-123-132-139.austin.res.rr.com.
	[70.123.132.139])
	by mx.google.com with ESMTPS id a6sm9478197igc.3.2011.11.11.11.45.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 11 Nov 2011 11:45:52 -0800 (PST)
Message-ID: <4EBD7B6E.70308@codemonkey.ws>
Date: Fri, 11 Nov 2011 13:45:50 -0600
From: Anthony Liguori <anthony@codemonkey.ws>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.21) Gecko/20110831 Lightning/1.0b2 Thunderbird/3.1.13
MIME-Version: 1.0
To: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <andreas.faerber@web.de>
References: <1320939332-31871-1-git-send-email-andreas.faerber@web.de>
In-Reply-To: <1320939332-31871-1-git-send-email-andreas.faerber@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.210.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] vl.c: Fail gracefully if no
	machine is found
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
X-List-Received-Date: Fri, 11 Nov 2011 19:46:28 -0000

On 11/10/2011 09:35 AM, Andreas Färber wrote:
> machine defaults to find_default_machine(),
> then gets overridden via -M and machine_parse().
>
> If no -M is specified and find_default_machine() returns NULL
> (when no machine compiled in), exit with an error.
>
> Avoids a segfault when setting machine->max_cpus.
>
> Signed-off-by: Andreas Färber<andreas.faerber@web.de>

Applied.  Thanks.

Regards,

Anthony Liguori

> ---
>   vl.c |    5 +++++
>   1 files changed, 5 insertions(+), 0 deletions(-)
>
> diff --git a/vl.c b/vl.c
> index f169aac..16fa222 100644
> --- a/vl.c
> +++ b/vl.c
> @@ -3089,6 +3089,11 @@ int main(int argc, char **argv, char **envp)
>           data_dir = CONFIG_QEMU_DATADIR;
>       }
>
> +    if (machine == NULL) {
> +        fprintf(stderr, "No machine found.\n");
> +        exit(1);
> +    }
> +
>       /*
>        * Default to max_cpus = smp_cpus, in case the user doesn't
>        * specify a max_cpus value.


