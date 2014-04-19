Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WbcNy-0001fc-JW
	for mharc-qemu-trivial@gnu.org; Sat, 19 Apr 2014 17:01:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47171)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1WbcNo-0001Kx-0x
	for qemu-trivial@nongnu.org; Sat, 19 Apr 2014 17:01:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1WbcNe-0003jD-UR
	for qemu-trivial@nongnu.org; Sat, 19 Apr 2014 17:01:07 -0400
Received: from mail-qg0-x230.google.com ([2607:f8b0:400d:c04::230]:53333)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1WbcNM-0003hO-Pe; Sat, 19 Apr 2014 17:00:40 -0400
Received: by mail-qg0-f48.google.com with SMTP id i50so2794570qgf.35
	for <multiple recipients>; Sat, 19 Apr 2014 14:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=BqMlgb/51W62hEJNqwteRB3J99rfWaNsbt9WThzj7RA=;
	b=UwqWClX2ung7v74Z/ews0NaqL11zPFYjHfV6J5uJwoQs6a986whLbp/9EBAHa2gE1v
	m9qrZitjJ/Xz5wLeIdc8kspJ7rdQtCZqfN2H0DRcEbDIU8WMyE4KGk8Rkspv6vzyeTZd
	g0aqHOjzYrbFAxd0zhYiRBh+cwvMyEFAGhzywELNyZ5YIWvnTkDrKEd52ThVmNmyg+2f
	8ETGiqxJfyCWEBFCzrDiFviM6qISXCqJ4SH9PZsb/gGiEkmqMgaoJdDDj/BNWVJ/anxC
	UfzuMc7MjfFQXEshU59djQ1weVmn9G+2ynS13Zoa8GfKXabzlcCc5sxKs0JmH7T/45o2
	+SkA==
X-Received: by 10.140.41.80 with SMTP id y74mr4431668qgy.104.1397941240258;
	Sat, 19 Apr 2014 14:00:40 -0700 (PDT)
Received: from yakj.usersys.redhat.com ([216.127.123.146])
	by mx.google.com with ESMTPSA id a9sm5298167qgf.19.2014.04.19.14.00.38
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 19 Apr 2014 14:00:39 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <5352E3F2.4000209@redhat.com>
Date: Sat, 19 Apr 2014 17:00:34 -0400
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Mike Frysinger <vapier@gentoo.org>, qemu-devel@nongnu.org
References: <1397929197-21234-1-git-send-email-vapier@gentoo.org>
In-Reply-To: <1397929197-21234-1-git-send-email-vapier@gentoo.org>
X-Enigmail-Version: 1.6
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400d:c04::230
Cc: qemu-trivial <qemu-trivial@nongnu.org>, aneesh.kumar@linux.vnet.ibm.com,
	Tim Comer <comer0@gmail.com>
Subject: Re: [Qemu-trivial] [PATCH] virtfs-proxy-helper: fix call to accept
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
X-List-Received-Date: Sat, 19 Apr 2014 21:01:17 -0000

Il 19/04/2014 13:39, Mike Frysinger ha scritto:
> From: Tim Comer <comer0@gmail.com>
>
> The current code calls accept() without initializing the size parameter
> which means the accept call might write too much to the stack.
>
> URL: https://bugs.gentoo.org/486714
> Signed-off-by: Tim Comer <comer0@gmail.com>
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>
> ---
>  fsdev/virtfs-proxy-helper.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/fsdev/virtfs-proxy-helper.c b/fsdev/virtfs-proxy-helper.c
> index bfecb87..cd291d3 100644
> --- a/fsdev/virtfs-proxy-helper.c
> +++ b/fsdev/virtfs-proxy-helper.c
> @@ -760,6 +760,7 @@ static int proxy_socket(const char *path, uid_t uid, gid_t gid)
>          return -1;
>      }
>
> +    size = sizeof(qemu);
>      client = accept(sock, (struct sockaddr *)&qemu, &size);
>      if (client < 0) {
>          do_perror("accept");
>

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

