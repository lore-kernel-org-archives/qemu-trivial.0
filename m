Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1X08uU-0000bO-HJ
	for mharc-qemu-trivial@gnu.org; Thu, 26 Jun 2014 08:36:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49678)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1X08uM-0000PH-QZ
	for qemu-trivial@nongnu.org; Thu, 26 Jun 2014 08:36:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1X08uG-0002iy-HW
	for qemu-trivial@nongnu.org; Thu, 26 Jun 2014 08:36:06 -0400
Received: from mail-la0-f52.google.com ([209.85.215.52]:36165)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1X08uG-0002id-Bi
	for qemu-trivial@nongnu.org; Thu, 26 Jun 2014 08:36:00 -0400
Received: by mail-la0-f52.google.com with SMTP id ty20so1794279lab.39
	for <qemu-trivial@nongnu.org>; Thu, 26 Jun 2014 05:35:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=voSxRyOqGLoclTqP9XrDRzShHz16BA3tIkllzmpsYGk=;
	b=cQ2AU2JNz8rpac6Cu5A3ensOd2WmkW7KCOeTaA9eDnei4jJiGA7S2MGlKgLUNOcZHb
	rtZ4xtVMxxmQLyAyJoF5SeAsJVarz1xo37CfnDm6kLCN7rXtPCms8di7B2zvzCc3UOms
	Pj45yCVB6ktXTU32pvGbvi47HKRTjBxUFp2Buow2IorlhfR8ZSX4C0XyVEpB7K958/mg
	AlwVRzBaNtztqhsrO/5KljdfeU+VmE3Q+yakjy8KoQDu4f3FxQSzzoVa3FzlmbaSAlB8
	X0v2qLtqL8vbpjzboeuwfDv8jvCtKHvzlmsiofJLz7lQqR9bbED2ekT//WrHE9qkfix8
	xrqQ==
X-Gm-Message-State: ALoCoQl90F3zh5AqQel/5Hrzh/SnBKMnqv1jl/Xn+5SQm+9vcQiYSyEde6kOuORodx7H0b8LBuiR
X-Received: by 10.152.29.168 with SMTP id l8mr10864575lah.35.1403786159366;
	Thu, 26 Jun 2014 05:35:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.158.228 with HTTP; Thu, 26 Jun 2014 05:35:39 -0700 (PDT)
In-Reply-To: <1402933670-3324-1-git-send-email-peter.maydell@linaro.org>
References: <1402933670-3324-1-git-send-email-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Jun 2014 13:35:39 +0100
Message-ID: <CAFEAcA8q9MAGxD+RE_fC0z4s5Cy6n43ZHmP6Jmq3_Zih-nUecg@mail.gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.52
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Jan Kiszka <jan.kiszka@siemens.com>,
	Patch Tracking <patches@linaro.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] slirp: Honour vlan/stack in
	hostfwd_remove commands
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
X-List-Received-Date: Thu, 26 Jun 2014 12:36:12 -0000

On 16 June 2014 16:47, Peter Maydell <peter.maydell@linaro.org> wrote:
> The hostfwd_add and hostfwd_remove monitor commands allow the user
> to optionally specify a vlan/stack tuple. hostfwd_add honours this,
> but hostfwd_remove does not (it looks up the tuple but then ignores
> the SlirpState it has looked up and always uses the first stack
> in the list anyway). Correct this to honour what the user requested.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  net/slirp.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/net/slirp.c b/net/slirp.c
> index 647039e..c171119 100644
> --- a/net/slirp.c
> +++ b/net/slirp.c
> @@ -345,8 +345,7 @@ void net_slirp_hostfwd_remove(Monitor *mon, const QDict *qdict)
>
>      host_port = atoi(p);
>
> -    err = slirp_remove_hostfwd(QTAILQ_FIRST(&slirp_stacks)->slirp, is_udp,
> -                               host_addr, host_port);
> +    err = slirp_remove_hostfwd(s->slirp, is_udp, host_addr, host_port);
>
>      monitor_printf(mon, "host forwarding rule for %s %s\n", src_str,
>                     err ? "not found" : "removed");
> --
> 1.9.2

Ping! (and cc trivial).

thanks
-- PMM

