Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aViMV-0003Gi-Fn
	for mharc-qemu-trivial@gnu.org; Tue, 16 Feb 2016 11:20:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38493)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1aViMS-0003BF-LN
	for qemu-trivial@nongnu.org; Tue, 16 Feb 2016 11:20:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1aViMN-0003Ks-Ke
	for qemu-trivial@nongnu.org; Tue, 16 Feb 2016 11:20:24 -0500
Received: from mail-wm0-x233.google.com ([2a00:1450:400c:c09::233]:38868)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1aViMN-0003Km-4y; Tue, 16 Feb 2016 11:20:19 -0500
Received: by mail-wm0-x233.google.com with SMTP id a4so107896708wme.1;
	Tue, 16 Feb 2016 08:20:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=7PLLv21SJ7Wl1dhOQdxgYdgnLtrZXsekxa7NwlmBB40=;
	b=fApQLy5CQmQhlbIFDKQeTKeUiaRWQWBhBWFOcvwCfdUPpGd+U45CngJKPsBRcsRDMA
	sK3EGNua3YGtJvk9fm3xrMCSKpn6DqM7ITWIzYC3jtl28BfVLGs8QFbdd3spHHkyFGnw
	otUv3V1D+aKvezlAPufA9g2d2vJnz3T81CODfL+QOFzSa+zc3Q86XtbWpFuH7s0uTG2U
	FVR1bKmhDUTsFUaXNuQ1pc8b/fnzVdEUiM37xH/C3Z6UNaeBpINjoOxpmxNTHjtBB3vk
	f7GPUferF5dz6JNBQBz0FRbNnrBSIyyKAr3qmPbjnySP19kh0Zxp99J4dBJctfPYUELl
	cgYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=7PLLv21SJ7Wl1dhOQdxgYdgnLtrZXsekxa7NwlmBB40=;
	b=MjF5cMvN1soldJN6MeN+y0rVGJexnY5rjudEzY/LfGZT0loeCzyg4QE4ldyx06CGXt
	ZSD52TpQFNMT4e+62hlTHJTzlenh+q425GfUofljIIOgzdLJ7gTNUJyYqOkcDSFhKcFK
	6hw3aXOlEVEN8AI1zCXHBjz/nApfefaMv6DBOt21o3+WUWduyuIoKnMUmHr/7EShuKZ3
	CB9MIMuDAi5dg3gE9MVTzPsgNyN6VGBYxZSt+b6+pARtrja4CZ9GgBQusysNDNLCOeqY
	dii0VNwcE8/hX+Sxsk0ZjdhCmVLDCYRzh+1FdVNWrsN63QMv/H9lfKlzaWy4jbXMYR2H
	AJcg==
X-Gm-Message-State: AG10YORsOksHOvCCJLSZuE6tzF+0HsHzBCBhOD3oXbkGgN6DlidmBf/mL0kbxPcUq8vKbA==
X-Received: by 10.28.17.81 with SMTP id 78mr1240588wmr.84.1455639618577;
	Tue, 16 Feb 2016 08:20:18 -0800 (PST)
Received: from [192.168.10.150] (94-39-187-147.adsl-ull.clienti.tiscali.it.
	[94.39.187.147]) by smtp.googlemail.com with ESMTPSA id
	x186sm21201331wmg.19.2016.02.16.08.20.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 16 Feb 2016 08:20:17 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <1455638581-5912-1-git-send-email-peter.maydell@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <56C34C40.2080407@redhat.com>
Date: Tue, 16 Feb 2016 17:20:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.0
MIME-Version: 1.0
In-Reply-To: <1455638581-5912-1-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::233
Cc: qemu-trivial@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
	patches@linaro.org
Subject: Re: [Qemu-trivial] [PATCH] qemu-options.hx: Improve documentation
 of chardev multiplexing mode
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
X-List-Received-Date: Tue, 16 Feb 2016 16:20:25 -0000



On 16/02/2016 17:03, Peter Maydell wrote:
> The current documentation of chardev mux=on is rather brief and opaque;
> expand it to hopefully be a bit more helpful.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> There was some discussion on #qemu yesterday evening about multiplexing,
> and "make the docs a bit less confusing" was one suggestion...
> ---
>  qemu-options.hx | 20 +++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 2f0465e..6b46dd4 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -2162,8 +2162,26 @@ All devices must have an id, which can be any string up to 127 characters long.
>  It is used to uniquely identify this device in other command line directives.
>  
>  A character device may be used in multiplexing mode by multiple front-ends.
> +Specify @option{mux=on} to enable this mode.
> +A multiplexer is a "1:N" device, and here the "1" end is your specified chardev
> +backend, and the "N" end is the various parts of QEMU that can talk to a chardev.
> +If you create a chardev with @option{id=myid} and @option{mux=on}, QEMU will
> +create a multiplexer with your specified ID, and you can then configure multiple
> +front ends to use that chardev ID for their input/output. Up to four different
> +front ends can be connected to a single multiplexed chardev. (Without
> +multiplexing enabled, a chardev can only be used by a single front end.)
> +For instance you could use this to allow a single stdio chardev to be used by
> +two serial ports and the QEMU monitor.
> +
>  The key sequence of @key{Control-a} and @key{c} will rotate the input focus
> -between attached front-ends. Specify @option{mux=on} to enable this mode.
> +of a multiplexed character device between attached front-ends.
> +
> +You can have more than one multiplexer in a system configuration; for instance
> +you could have a TCP port multiplexed between UART 0 and UART 1, and stdio
> +multiplexed between the QEMU monitor and a parallel port.
> +
> +There is currently no support for multiplexing in the other direction
> +(where a single QEMU front end takes input and output from multiple chardevs).
>  
>  Every backend supports the @option{logfile} option, which supplies the path
>  to a file to record all data transmitted via the backend. The @option{logappend}
> 

Very nice, thanks!  I'm queuing this patch.

Paolo

