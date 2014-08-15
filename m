Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XIKlD-0006xu-Gx
	for mharc-qemu-trivial@gnu.org; Fri, 15 Aug 2014 12:53:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47676)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1XIKl3-0006lr-F3
	for qemu-trivial@nongnu.org; Fri, 15 Aug 2014 12:53:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1XIKku-0003rV-DQ
	for qemu-trivial@nongnu.org; Fri, 15 Aug 2014 12:53:41 -0400
Received: from mail-qg0-x235.google.com ([2607:f8b0:400d:c04::235]:51507)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>)
	id 1XIKku-0003rB-8r; Fri, 15 Aug 2014 12:53:32 -0400
Received: by mail-qg0-f53.google.com with SMTP id q107so2330870qgd.26
	for <multiple recipients>; Fri, 15 Aug 2014 09:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=axgyx7v/9lL9zIOjGNbasin0Ekm/x4jHgB2PR5k3RXw=;
	b=fis42KnRmzOMw3sevuT/WMDYZ9OmnTYuJp4LmNQJEC8hKDviL8TQXvJt4a53Qt9wab
	9KHBHOgaCECi5fPnoqmcwtsiaEFhUGrLiJ0+3UhNZapKQmpf6mPkm5YIsDLC9yk5MfY5
	+iBYGzXR7JhX3DfdYAu0dW2PrPmTCyL9VKR6N9beFQTWoxFPkOAlrxD/Kwz5D211aAD7
	w79c1y+i7JZW+gSQDmBIL/5uZmHuDP0GzqJ03uokKQNdzxNiiAX/J63e0oVMhRAmDMLm
	a+yHkcjo+u8hgLKCWpUyxCLp8JxVDsFKbaydx1acIm8b4/XfTWh870X7bkCT8J6HLyev
	C86g==
X-Received: by 10.224.127.133 with SMTP id g5mr24302005qas.67.1408121609517;
	Fri, 15 Aug 2014 09:53:29 -0700 (PDT)
Received: from pike.twiddle.home (166.103.50.123.dsl.dyn.mana.pf.
	[123.50.103.166]) by mx.google.com with ESMTPSA id
	w15sm14815892qay.34.2014.08.15.09.53.23 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 15 Aug 2014 09:53:28 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Message-ID: <53EE3AFF.8020005@twiddle.net>
Date: Fri, 15 Aug 2014 06:53:19 -1000
From: Richard Henderson <rth@twiddle.net>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.7.0
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>, "Michael S. Tsirkin" <mst@redhat.com>,
	zhanghailiang <zhang.zhanghailiang@huawei.com>
References: <1408001361-13580-1-git-send-email-zhang.zhanghailiang@huawei.com>	<1408001361-13580-10-git-send-email-zhang.zhanghailiang@huawei.com>
	<20140814103350.GH31346@redhat.com>
	<53EE212A.60405@msgid.tls.msk.ru>
In-Reply-To: <53EE212A.60405@msgid.tls.msk.ru>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400d:c04::235
Cc: kwolf@redhat.com, lkurusa@redhat.com, qemu-trivial@nongnu.org,
	jan.kiszka@siemens.com, riku.voipio@iki.fi,
	luonengjun@huawei.com, qemu-devel@nongnu.org,
	lcapitulino@redhat.com, stefanha@redhat.com,
	Li Liu <john.liuli@huawei.com>, pbonzini@redhat.com,
	peter.huangpeng@huawei.com, alex.bennee@linaro.org
Subject: Re: [Qemu-trivial] [PATCH v6 09/10] tcg: check return value of
	fopen()
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
X-List-Received-Date: Fri, 15 Aug 2014 16:53:50 -0000

On 08/15/2014 05:03 AM, Michael Tokarev wrote:
>>>      f = fopen("/tmp/op.log", "w");
> 
> Gosh.  So why are we still use fixed filenames in /tmp?????
> Every such use is a potential security holw... :(  Ughm.
> 
> Can't we get rid of this somehow, by requiring a filename
> parameter for example?

It's in code that isn't compiled in by default.

Better than taking a parameter, or doing something else one-off, I think it'd
be best to dump this to the normal log file.  I.e. use qemu_log instead of fprintf.


r~

