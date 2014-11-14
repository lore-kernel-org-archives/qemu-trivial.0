Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XpCW5-0000T5-21
	for mharc-qemu-trivial@gnu.org; Fri, 14 Nov 2014 03:46:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55524)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1XpCVx-0000Kc-VQ
	for qemu-trivial@nongnu.org; Fri, 14 Nov 2014 03:46:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1XpCVs-0000v6-Fs
	for qemu-trivial@nongnu.org; Fri, 14 Nov 2014 03:45:57 -0500
Received: from mail-wi0-x22d.google.com ([2a00:1450:400c:c05::22d]:49618)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1XpCVh-0000ts-Ba; Fri, 14 Nov 2014 03:45:41 -0500
Received: by mail-wi0-f173.google.com with SMTP id n3so1974451wiv.0
	for <multiple recipients>; Fri, 14 Nov 2014 00:45:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:newsgroups:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=jrCHsdwAII4BkX+oQ5aKweDUzBhpcS7ba/X0wzBjw6I=;
	b=vFxB28xM6VpLUMad+PITqAkB03KBnznWruXcxpbT0nL5valrQX89tg2objC1ZV+zwa
	519ECP1MaNePcJu7/cLV2iB9xDX880+N8yueQLH807oQxMm2Qs6k2DMXwcgxUAzoedKw
	futHJoOY7wtuTmC/lmUyiXgTX7w42oliW8B9zmeeMJHFCui8TfEM1KAD9WI3dDakIWG8
	EEcmkCuWdlPlVU4niqg/9/lM9VHuL64RumLHu8vXkhb7FnOKmnrL8tQDQoO6GuUPseHy
	P+CvVa32HoXoI78//kweBaG/HtuoC2Dg/HEkbjJ2zcG9AVHZ8d7wY8JpmKeM3WANhCoj
	Y5kQ==
X-Received: by 10.180.219.106 with SMTP id pn10mr5544877wic.63.1415954740588; 
	Fri, 14 Nov 2014 00:45:40 -0800 (PST)
Received: from [192.168.10.150] (net-37-117-142-149.cust.vodafonedsl.it.
	[37.117.142.149])
	by mx.google.com with ESMTPSA id fi9sm2506852wib.6.2014.11.14.00.45.38
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 14 Nov 2014 00:45:39 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <5465C130.1090401@redhat.com>
Date: Fri, 14 Nov 2014 09:45:36 +0100
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
Newsgroups: gmane.comp.emulators.qemu
To: zhanghailiang <zhang.zhanghailiang@huawei.com>, 
 qemu-trivial@nongnu.org
References: <1415929163-12184-1-git-send-email-zhang.zhanghailiang@huawei.com>
In-Reply-To: <1415929163-12184-1-git-send-email-zhang.zhanghailiang@huawei.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::22d
Cc: qemu-devel@nongnu.org, stefanha@redhat.com, peter.huangpeng@huawei.com
Subject: Re: [Qemu-trivial] [PATCH] l2tpv3: fix possible double free
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
X-List-Received-Date: Fri, 14 Nov 2014 08:46:03 -0000



On 14/11/2014 02:39, zhanghailiang wrote:
> freeaddrinfo(result) does not assign result = NULL, after frees it.
> There will be a double free when it goes error case.
> It is reported by covertiy.
> 
> Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
> ---
>  net/l2tpv3.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/net/l2tpv3.c b/net/l2tpv3.c
> index 528d95b..f9e0c98 100644
> --- a/net/l2tpv3.c
> +++ b/net/l2tpv3.c
> @@ -661,6 +661,7 @@ int net_init_l2tpv3(const NetClientOptions *opts,
>          fd = -errno;
>          error_report("l2tpv3_open : socket creation failed, errno = %d", -fd);
>          freeaddrinfo(result);
> +        result = NULL;

You can just remove the call to freeaddrinfo().  I made the change and
applied the patch.

Paolo

>          goto outerr;
>      }
>      if (bind(fd, (struct sockaddr *) result->ai_addr, result->ai_addrlen)) {
> 

