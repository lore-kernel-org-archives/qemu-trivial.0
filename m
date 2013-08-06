Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V6iEF-0003hH-2T
	for mharc-qemu-trivial@gnu.org; Tue, 06 Aug 2013 10:27:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50007)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <proljc@gmail.com>) id 1V6W0f-0000Hs-S1
	for qemu-trivial@nongnu.org; Mon, 05 Aug 2013 21:24:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <proljc@gmail.com>) id 1V6W0e-0001S7-Ld
	for qemu-trivial@nongnu.org; Mon, 05 Aug 2013 21:24:25 -0400
Received: from mail-wg0-x230.google.com ([2a00:1450:400c:c00::230]:35983)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <proljc@gmail.com>)
	id 1V6W0b-0001P6-Py; Mon, 05 Aug 2013 21:24:21 -0400
Received: by mail-wg0-f48.google.com with SMTP id f12so2977645wgh.3
	for <multiple recipients>; Mon, 05 Aug 2013 18:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=C/8dRYv0Iu7vRdLZrl0tjSBdKBlP7ec33RqZfaYxwTE=;
	b=ks39vo52JmFOrPMjOJSoPLLs+maqxvUP24l3j0tEMvHzcL0Uq5joISwHX//zYbjYYT
	0X568ZVK+jPqVSEw812JWzTehGTe2cnjq8owmjsGMGQO6jiHurtbeqvtZ7GerczJkXmu
	3+5qS/eK7Trf2foeSH1DUlmqyHWeUtUxLXbkcqmYNBdcf/ynxhW4JIGl6VDHsUPqevJZ
	NBGL8MI/QgtJPIIozZ1gpnKlERnwgXci5QjzoxDePpnERqNPTo5VVt1ALAhlLjzI6VWo
	o3qdmcWz3DChJzYJqyYoY2GJtVaPEW/4QswnXto9Cmr40m5JjVr3L7rCF5MRD1w7GGJ4
	JD1A==
MIME-Version: 1.0
X-Received: by 10.194.249.103 with SMTP id yt7mr14889645wjc.80.1375752260660; 
	Mon, 05 Aug 2013 18:24:20 -0700 (PDT)
Received: by 10.194.21.232 with HTTP; Mon, 5 Aug 2013 18:24:20 -0700 (PDT)
In-Reply-To: <1375727067-22126-1-git-send-email-peter.maydell@linaro.org>
References: <1375727067-22126-1-git-send-email-peter.maydell@linaro.org>
Date: Tue, 6 Aug 2013 09:24:20 +0800
Message-ID: <CAJBMM-vUKZLM1sbCJPU7S0X2236R8LUPCgwfxzoR920TtqFzAg@mail.gmail.com>
From: Jia Liu <proljc@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=ISO-8859-1
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c00::230
X-Mailman-Approved-At: Tue, 06 Aug 2013 10:27:14 -0400
Cc: qemu-trivial@nongnu.org, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	patches@linaro.org
Subject: Re: [Qemu-trivial] [PATCH] hw/openrisc/openrisc_sim: Avoid using
 uninitialised variable 'entry'
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
X-List-Received-Date: Tue, 06 Aug 2013 01:24:26 -0000

Hi Peter,

On Tue, Aug 6, 2013 at 2:24 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
> clang warns that cpu_openrisc_load_kernel() can use 'entry' uninitialized:
>
> hw/openrisc/openrisc_sim.c:69:9: error: variable 'entry' is used
>       uninitialized whenever '&&' condition is false [-Werror,-Wsometimes-uninitialized]
>     if (kernel_filename && !qtest_enabled()) {
>         ^~~~~~~~~~~~~~~
> hw/openrisc/openrisc_sim.c:91:19: note: uninitialized use occurs here
>     cpu->env.pc = entry;
>                   ^~~~~
>
> Fix this by not attempting to change the CPU's starting PC unless
> we actually loaded a kernel.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/openrisc/openrisc_sim.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/openrisc/openrisc_sim.c b/hw/openrisc/openrisc_sim.c
> index a08f27c..4595fa9 100644
> --- a/hw/openrisc/openrisc_sim.c
> +++ b/hw/openrisc/openrisc_sim.c
> @@ -86,9 +86,9 @@ static void cpu_openrisc_load_kernel(ram_addr_t ram_size,
>                      kernel_filename);
>              exit(1);
>          }
> -    }
>
> -    cpu->env.pc = entry;
> +        cpu->env.pc = entry;
> +    }
>  }
>
>  static void openrisc_sim_init(QEMUMachineInitArgs *args)

Thank you for using clang test it.

Reviewed-by: Jia Liu <proljc@gmail.com>

> --
> 1.7.9.5
>

Regards,
Jia

