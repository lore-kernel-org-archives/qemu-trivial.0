Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UUjyY-0007mZ-Pd
	for mharc-qemu-trivial@gnu.org; Tue, 23 Apr 2013 16:38:06 -0400
Received: from eggs.gnu.org ([208.118.235.92]:46741)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1UUjyU-0007g5-PP
	for qemu-trivial@nongnu.org; Tue, 23 Apr 2013 16:38:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1UUjyR-0000c4-Aq
	for qemu-trivial@nongnu.org; Tue, 23 Apr 2013 16:38:02 -0400
Received: from mail-wi0-x22d.google.com ([2a00:1450:400c:c05::22d]:64124)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>)
	id 1UUjyL-0000Xr-H9; Tue, 23 Apr 2013 16:37:53 -0400
Received: by mail-wi0-f173.google.com with SMTP id c10so6620575wiw.0
	for <multiple recipients>; Tue, 23 Apr 2013 13:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=rVGUmXmXxPVxOFmF1OsWOj0SV0wRzDGWx2suVbilpGk=;
	b=UqnZ4L8vvaks8cK2dn4hSN6nFSvw0U0/0bgb2NpGuNxK1NDYOxYabyYZfWWAkym8MJ
	I1BIMD+RTx8Bit47AC83R3KEtwnBEgpDGe/ECijcpUBc8VKYmSYNu3039EBMFzojv/Ov
	7HDvv2y1w4N/Ca91Z7UeLAQNKYl1Nj2p5UhEq9/qCiGAQQfsuw7Zk5UMcCZHyJVvRKe0
	l/67P31/ON5jPuVzkxSwQXXeqAau4mocHiuD/frIPcMAjtqp7ju0xA8+2yZRDup6VZa/
	2IH7cma9GycbLi2X3INzxhzyYzPtX7/0iW3j5UL5L86E3WjEe2HNwyXZdazrgAa1Ss+T
	s68w==
X-Received: by 10.194.219.162 with SMTP id pp2mr64012849wjc.27.1366749471865; 
	Tue, 23 Apr 2013 13:37:51 -0700 (PDT)
Received: from pebble.twiddle.net ([212.183.128.67])
	by mx.google.com with ESMTPSA id ge7sm27751549wic.0.2013.04.23.13.37.49
	for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Tue, 23 Apr 2013 13:37:51 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Message-ID: <5176F118.6050708@twiddle.net>
Date: Tue, 23 Apr 2013 21:37:44 +0100
From: Richard Henderson <rth@twiddle.net>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130402 Thunderbird/17.0.5
MIME-Version: 1.0
To: Gabriel Kerneis <gabriel@kerneis.info>
References: <1366737312-8598-1-git-send-email-gabriel@kerneis.info>
In-Reply-To: <1366737312-8598-1-git-send-email-gabriel@kerneis.info>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::22d
Cc: qemu-trivial@nongnu.org, Alexander Graf <agraf@suse.de>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] s390x: use CONFIG_INT128 to detect
	__uint128_t
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
X-List-Received-Date: Tue, 23 Apr 2013 20:38:05 -0000

On 2013-04-23 18:15, Gabriel Kerneis wrote:
> Target s390x uses ad-hoc macro magic to guess if the compiler
> supports the GCC extension __uint128_t.  This patch uses the
> the dedicated macro CONFIG_INT128 defined by configure instead.
>
> This fixes compilation with the CIL source code analyzer, which
> uses GCC as a preprocessor but does not support __uint128_t.
>
> Signed-off-by: Gabriel Kerneis <gabriel@kerneis.info>

Reviewed-by: Richard Henderson <rth@twiddle.net>


r~


